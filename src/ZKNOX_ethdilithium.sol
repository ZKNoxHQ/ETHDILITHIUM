// Copyright (C) 2026 - ZKNOX
// License: This software is licensed under MIT License
// This Code may be reused including this header, license and copyright notice.
// FILE: ZKNOX_ethdilithium.sol
// Description: Ethereum-compatible Dilithium signature verifier using Keccak-based PRNG
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SSTORE2} from "sstore2/SSTORE2.sol";
import {
    dilithiumCore1Packed,
    dilithiumCore2Packed,
    readPubKeyPacked,
    packPoly
} from "./ZKNOX_dilithium_core_packed.sol";
import {sampleInBallKeccakPrng} from "./ZKNOX_SampleInBall.sol";
import {KeccakPrng, initPrng, refill} from "./ZKNOX_keccak_prng.sol";
import {q, TAU, PubKey, Signature, slice} from "./ZKNOX_dilithium_utils.sol";
import {ISigVerifier} from "InterfaceVerifier/IVerifier.sol";

/**
 * @title ZKNOX_ethdilithium
 * @notice Ethereum-compatible Dilithium post-quantum signature verifier.
 * @dev Uses Keccak-based PRNG instead of SHAKE for final hash generation.
 *      Public keys are stored in dedicated PKContract instances.
 */
contract ZKNOX_ethdilithium is ISigVerifier {
    /**
     * @notice Stores the public key on-chain using SSTORE2.
     * @param pubkey Serialized Dilithium public key.
     * @return ABI-encoded address of the SSTORE2 pointer.
     */
    function setKey(bytes memory pubkey) external returns (bytes memory) {
        address pointer = SSTORE2.write(pubkey);
        return abi.encodePacked(pointer);
    }

    /**
     * @notice Verifies a Dilithium signature with context.
     * @dev Builds the context-encoded message and delegates verification
     *      to the internal verification routine.
     * @param pk ABI-encoded PKContract address.
     * @param m Message to verify.
     * @param signature Dilithium signature.
     * @param ctx Optional context (max 255 bytes).
     * @return True if the signature is valid, false otherwise.
     */
    function verify(bytes memory pk, bytes memory m, bytes memory signature, bytes memory ctx)
        external
        view
        returns (bool)
    {
        require(signature.length == 2420, "invalid signature length");

        // Fetch the public key from the address `pk`
        address pubKeyAddress;
        assembly {
            pubKeyAddress := mload(add(pk, 20))
        }
        PubKey memory publicKey = _readPubKey(pubKeyAddress);

        // Step 1: check ctx length
        if (ctx.length > 255) {
            revert("ctx bytes must have length at most 255");
        }

        // Step 2: mPrime = 0x00 || len(ctx) || ctx || m
        bytes memory mPrime = abi.encodePacked(bytes1(0), bytes1(uint8(ctx.length)), ctx, m);

        // Parse signature
        Signature memory sig =
            Signature({cTilde: slice(signature, 0, 32), z: slice(signature, 32, 2304), h: slice(signature, 2336, 84)});

        // Step 3: delegate to internal verify
        return verifyInternal(publicKey, mPrime, sig);
    }

    /**
     * @notice Verifies a Dilithium signature using the ISigVerifier interface.
     * @dev Compatible with Ethereum-style verification flows.
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

        // Step 1: pk contains the PKContract address (returned by setKey)
        address pkContractAddress;
        assembly {
            pkContractAddress := shr(96, calldataload(pk.offset))
        }

        // Step 2: Get the public key from SSTORE2
        PubKey memory publicKey = _readPubKey(pkContractAddress);

        // mPrime = 0x00 || 0x00 || m
        bytes memory mPrime = abi.encodePacked(bytes1(0), bytes1(0), m);

        // Parse signature
        Signature memory sig =
            Signature({cTilde: slice(signature, 0, 32), z: slice(signature, 32, 2304), h: slice(signature, 2336, 84)});

        // Step 3: delegate to internal verify
        if (verifyInternal(publicKey, mPrime, sig)) {
            return ISigVerifier.verify.selector;
        }
        return 0xFFFFFFFF;
    }

    /**
     * @notice Performs the core Dilithium verification algorithm.
     * @dev Implements NIST Dilithium verification with Keccak-based hashing.
     *      Includes norm checks, NTT transformation, and final hash comparison.
     * @param pk Expanded public key.
     * @param mPrime Context-encoded message.
     * @param signature Parsed Dilithium signature.
     * @return True if the signature is valid, false otherwise.
     */
    function verifyInternal(PubKey memory pk, bytes memory mPrime, Signature memory signature)
        internal
        pure
        returns (bool)
    {
        // FIRST CORE STEP: hint encoding validated (weight <= omega), z decoded
        // packed with its norm checked (ZKNOX_dilithium_core_packed.sol)
        (bool ok, uint256[][] memory z, uint256[4] memory hintMasks) = dilithiumCore1Packed(signature);
        if (!ok) {
            return false;
        }

        // C_NTT: Sample challenge and apply NTT
        uint256[] memory cNtt = packPoly(sampleInBallKeccakPrng(signature.cTilde, TAU, q));

        // SECOND CORE STEP: NTT(c), A.z - c.t1 on the packed layout, inverse
        // NTT, hints, w1 encoding (ZKNOX_dilithium_core_packed.sol)
        bytes memory wPrimeBytes = dilithiumCore2Packed(pk, z, cNtt, hintMasks);

        // FINAL HASH (Keccak-based PRNG)
        KeccakPrng memory prng = initPrng(abi.encodePacked(pk.tr, mPrime));

        bytes32 out1 = prng.pool;

        refill(prng);

        bytes32 out2 = prng.pool;

        prng = initPrng(abi.encodePacked(out1, out2, wPrimeBytes));

        bytes32 finalHash = prng.pool;

        // Compare challenge hashes
        return finalHash == bytes32(signature.cTilde);
    }

    /**
     * @notice Reads a PubKey from an SSTORE2 pointer.
     */
    function _readPubKey(address pointer) internal view returns (PubKey memory) {
        // zero-copy: the polynomials of the blob are used in place (ZKNOX_dilithium_core_packed.sol)
        return readPubKeyPacked(pointer);
    }
}
// end of contract
