// Copyright (C) 2026 - ZKNOX
// License: This software is licensed under MIT License
// This Code may be reused including this header, license and copyright notice.
// FILE: ZKNOX_dilithium.sol
// Description: Dilithium Signature verifier following NIST specification
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SSTORE2} from "sstore2/SSTORE2.sol";
import {dilithiumCore1Packed, dilithiumCore2Packed, readPubKeyPacked} from "./ZKNOX_dilithium_core_packed.sol";
import {shake256Any, sampleInBallFast} from "./ZKNOX_shake_fast.sol";
import {q, TAU, PubKey, Signature, slice} from "./ZKNOX_dilithium_utils.sol";
import {ISigVerifier} from "InterfaceVerifier/IVerifier.sol";

contract ZKNOX_dilithium is ISigVerifier {
    /// @notice keccak256 of the expected Keccak-f[1600] helper RUNTIME
    ///         (test/f1600_170.hex, 21,622 bytes, fireblocks-labs/evm-ml-dsa-verifier
    ///         at commit cca262b, as in ZKNoxHQ/ETHFALCON). The binding is by code hash,
    ///         not by address: whoever deploys the verifier cannot pick what
    ///         SHAKE256 means, and the check is repeated on every verify.
    bytes32 internal constant F1600_CODEHASH = 0x4afb4435879cdf8e50474c7aab2bc3a679caed432550ad6dba64f509309a817b;

    /// @notice the bound Keccak-f[1600] helper
    address public immutable f1600Helper;

    error BadHelper();

    constructor(address helper) {
        if (helper.codehash != F1600_CODEHASH) revert BadHelper();
        f1600Helper = helper;
    }

    /**
     * @notice Stores the given public key on-chain using SSTORE2.
     * @param pubkey The serialized Dilithium public key.
     * @return The ABI-encoded address of the SSTORE2 pointer.
     */
    function setKey(bytes memory pubkey) external returns (bytes memory) {
        address pointer = SSTORE2.write(pubkey);
        return abi.encodePacked(pointer);
    }

    /**
     * @notice Verifies a Dilithium signature with context.
     * @dev Compatible with context-aware Dilithium verification.
     *      Extracts the public key contract address from `pk`.
     * @param pk ABI-encoded address of the PKContract.
     * @param m The message to verify.
     * @param signature The Dilithium signature.
     * @param ctx Optional context bytes (max length 255).
     * @return True if the signature is valid, false otherwise.
     */
    function verify(bytes memory pk, bytes memory m, bytes memory signature, bytes memory ctx)
        external
        view
        returns (bool)
    {
        require(signature.length == 2420, "invalid signature length");
        if (f1600Helper.codehash != F1600_CODEHASH) revert BadHelper();

        address pubKeyAddress;
        assembly {
            pubKeyAddress := mload(add(pk, 20))
        }
        PubKey memory publicKey = _readPubKey(pubKeyAddress);

        if (ctx.length > 255) {
            revert("ctx bytes must have length at most 255");
        }
        bytes memory mPrime = abi.encodePacked(bytes1(0), bytes1(uint8(ctx.length)), ctx, m);

        Signature memory sig =
            Signature({cTilde: slice(signature, 0, 32), z: slice(signature, 32, 2304), h: slice(signature, 2336, 84)});

        return verifyInternal(publicKey, mPrime, sig);
    }

    /**
     * @notice Verifies a Dilithium signature (EIP-style interface).
     * @dev Implements ISigVerifier interface.
     *      Does not support custom context.
     * @param pk Encoded PKContract address.
     * @param m Message hash.
     * @param signature Dilithium signature.
     * @return Selector on success, 0xFFFFFFFF on failure.
     */
    function verify(bytes calldata pk, bytes32 m, bytes calldata signature) external view returns (bytes4) {
        if (signature.length != 2420) {
            return 0xFFFFFFFF;
        }
        if (f1600Helper.codehash != F1600_CODEHASH) revert BadHelper();

        address pkContractAddress;
        assembly {
            pkContractAddress := shr(96, calldataload(pk.offset))
        }

        PubKey memory publicKey = _readPubKey(pkContractAddress);

        bytes memory mPrime = abi.encodePacked(bytes1(0), bytes1(0), m);

        Signature memory sig =
            Signature({cTilde: slice(signature, 0, 32), z: slice(signature, 32, 2304), h: slice(signature, 2336, 84)});

        if (verifyInternal(publicKey, mPrime, sig)) {
            return ISigVerifier.verify.selector;
        }
        return 0xFFFFFFFF;
    }

    /**
     * @notice Reads a PubKey from an SSTORE2 pointer.
     */
    function _readPubKey(address pointer) internal view returns (PubKey memory) {
        // zero-copy: the polynomials of the blob are used in place (ZKNOX_dilithium_core_packed.sol)
        return readPubKeyPacked(pointer);
    }

    /**
     * @notice Performs the core Dilithium signature verification.
     * @dev Implements the full NIST Dilithium verification algorithm.
     *      Uses optimized assembly routines for gas efficiency.
     * @param pk Expanded public key structure.
     * @param mPrime Encoded message with context.
     * @param signature Parsed Dilithium signature.
     * @return True if the signature is valid, false otherwise.
     */
    function verifyInternal(PubKey memory pk, bytes memory mPrime, Signature memory signature)
        internal
        view
        returns (bool)
    {
        // FIRST CORE STEP: hint encoding validated (weight <= omega), z decoded
        // packed with its norm checked (ZKNOX_dilithium_core_packed.sol)
        (bool ok, uint256[][] memory z, uint256[4] memory hintMasks) = dilithiumCore1Packed(signature);
        if (!ok) {
            return false;
        }

        // C_NTT
        uint256[] memory cNtt = sampleInBallFast(signature.cTilde, f1600Helper);

        // SECOND CORE STEP: NTT(c), A.z - c.t1 on the packed layout, inverse
        // NTT, hints, w1 encoding (ZKNOX_dilithium_core_packed.sol)
        bytes memory wPrimeBytes = dilithiumCore2Packed(pk, z, cNtt, hintMasks);

        // FINAL HASH: mu = SHAKE256(tr || m', 64), c~ = SHAKE256(mu || w1, 32)
        bytes memory mu = shake256Any(abi.encodePacked(pk.tr, mPrime), 64, f1600Helper);
        bytes32 finalHash = bytes32(shake256Any(abi.encodePacked(mu, wPrimeBytes), 32, f1600Helper));

        return finalHash == bytes32(signature.cTilde);
    }
}
