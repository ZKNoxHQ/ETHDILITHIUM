// Copyright (C) 2026 - ZKNOX
// License: This software is licensed under MIT License
// This Code may be reused including this header, license and copyright notice.
// FILE: ZKNOX_dilithium65.sol
// Description: ML-DSA-65 (FIPS 204, security category 3) signature verifier
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SSTORE2} from "sstore2/SSTORE2.sol";
import {dilithiumCore1Packed65, dilithiumCore2Packed65, readPubKeyPacked65} from "./ZKNOX_dilithium65_core_packed.sol";
import {shake256Any, sampleInBallFastTau} from "./ZKNOX_shake_fast.sol";
import {PubKey, Signature} from "./ZKNOX_dilithium_utils.sol";
import {ISigVerifier} from "InterfaceVerifier/IVerifier.sol";

/**
 * @title ZKNOX_dilithium65
 * @notice ML-DSA-65 verifier, same structure as ZKNOX_dilithium (ML-DSA-44):
 *         the public key holds A (6 x 5) and t1 (6) in the NTT domain plus
 *         tr = SHAKE256(pk, 64), read in place from SSTORE2 blobs. The expanded
 *         key (36,864 bytes of words) is above EIP-170, so it is stored as two
 *         halves of 20,160 bytes (rows 0..2 / 3..5 of A with t1[0..2] /
 *         t1[3..5], tr in both, see js/mldsa65.js) and the pk handle is the
 *         two pointer addresses (40 bytes). The signature is
 *         the 3309-byte FIPS 204 encoding c~ (48) || z (3200) || h (61); the
 *         three SHAKE256 calls go through the bound Keccak-f[1600] helper.
 *         Parameters: tau = 49, gamma1 = 2^19, gamma2 = (q-1)/32, omega = 55,
 *         beta = 196 (ZKNOX_dilithium65_utils.sol).
 */
contract ZKNOX_dilithium65 is ISigVerifier {
    /// @notice keccak256 of the expected Keccak-f[1600] helper RUNTIME
    ///         (test/f1600_170.hex, 21,622 bytes, fireblocks-labs/evm-ml-dsa-verifier
    ///         at commit cca262b, as in ZKNoxHQ/ETHFALCON). The binding is by code hash,
    ///         not by address: whoever deploys the verifier cannot pick what
    ///         SHAKE256 means, and the check is repeated on every verify.
    bytes32 internal constant F1600_CODEHASH = 0x4afb4435879cdf8e50474c7aab2bc3a679caed432550ad6dba64f509309a817b;

    /// @notice the bound Keccak-f[1600] helper
    address public immutable f1600Helper;

    /// @notice size of each half of the expanded key blob (fixed shape, see readPubKeyPacked65)
    uint256 internal constant HALF_BYTES = 20160;

    error BadHelper();
    error InvalidSignatureLength();
    error ContextTooLong();
    error BadKeyLength();

    constructor(address helper) {
        if (helper.codehash != F1600_CODEHASH) revert BadHelper();
        f1600Helper = helper;
    }

    /**
     * @notice Stores the given public key on-chain using SSTORE2, one contract
     *         per half.
     * @param pubkey The two halves of the expanded public key, concatenated:
     *        half0 || half1, 2 x 20,160 bytes (js/mldsa65.js encodePublicKeyBlob65).
     * @return pk The two SSTORE2 pointer addresses, packed (40 bytes): the `pk`
     *         argument of verify.
     */
    function setKey(bytes calldata pubkey) external returns (bytes memory pk) {
        if (pubkey.length != 2 * HALF_BYTES) revert BadKeyLength();
        pk = new bytes(40);
        for (uint256 h = 0; h < 2; h++) {
            address pointer = SSTORE2.write(pubkey[h * HALF_BYTES:(h + 1) * HALF_BYTES]);
            assembly {
                mstore(add(add(pk, 32), mul(h, 20)), shl(96, pointer))
            }
        }
    }

    /**
     * @notice Verifies an ML-DSA-65 signature with context (FIPS 204 Alg. 3,
     *         M' = 0x00 || len(ctx) || ctx || M).
     * @param pk The two SSTORE2 pointer addresses of the key halves, packed (setKey's output).
     * @param m The message to verify.
     * @param signature The 3309-byte ML-DSA-65 signature.
     * @param ctx Optional context bytes (max length 255).
     * @return True if the signature is valid, false otherwise.
     * @dev Reverts with InvalidSignatureLength / ContextTooLong (custom errors
     *      rather than the revert strings of ZKNOX_dilithium: EIP-170 room).
     */
    function verify(bytes calldata pk, bytes calldata m, bytes calldata signature, bytes calldata ctx)
        external
        view
        returns (bool)
    {
        if (signature.length != 3309) revert InvalidSignatureLength();
        if (f1600Helper.codehash != F1600_CODEHASH) revert BadHelper();

        PubKey memory publicKey = _readPubKey(pk);

        if (ctx.length > 255) revert ContextTooLong();
        bytes memory mPrime = abi.encodePacked(bytes1(0), bytes1(uint8(ctx.length)), ctx, m);

        return verifyInternal(publicKey, mPrime, _parseSignature(signature));
    }

    /**
     * @notice Verifies an ML-DSA-65 signature (EIP-style interface).
     * @dev Implements ISigVerifier interface. Does not support custom context.
     * @param pk The two SSTORE2 pointer addresses of the key halves, packed (setKey's output).
     * @param m Message hash.
     * @param signature ML-DSA-65 signature.
     * @return Selector on success, 0xFFFFFFFF on failure.
     */
    function verify(bytes calldata pk, bytes32 m, bytes calldata signature) external view returns (bytes4) {
        if (signature.length != 3309) {
            return 0xFFFFFFFF;
        }
        if (f1600Helper.codehash != F1600_CODEHASH) revert BadHelper();

        PubKey memory publicKey = _readPubKey(pk);

        bytes memory mPrime = abi.encodePacked(bytes1(0), bytes1(0), m);

        if (verifyInternal(publicKey, mPrime, _parseSignature(signature))) {
            return ISigVerifier.verify.selector;
        }
        return 0xFFFFFFFF;
    }

    /**
     * @notice Splits the 3309-byte encoding into c~ (48) || z (3200) || h (61).
     */
    function _parseSignature(bytes calldata signature) internal pure returns (Signature memory) {
        return Signature({cTilde: signature[0:48], z: signature[48:3248], h: signature[3248:3309]});
    }

    /**
     * @notice Reads a PubKey from its two SSTORE2 pointers (pk = pointer0 || pointer1, 40 bytes).
     */
    function _readPubKey(bytes calldata pk) internal view returns (PubKey memory) {
        // a short pk reads as zero addresses, which have no code: BadPubKeyBlob
        address pointer0;
        address pointer1;
        assembly {
            pointer0 := shr(96, calldataload(pk.offset))
            pointer1 := shr(96, calldataload(add(pk.offset, 20)))
        }
        // zero-copy: the polynomials of the blobs are used in place (ZKNOX_dilithium65_core_packed.sol)
        return readPubKeyPacked65(pointer0, pointer1);
    }

    /**
     * @notice Performs the core ML-DSA-65 signature verification.
     * @param pk Expanded public key structure (A and t1 in the NTT domain, tr).
     * @param mPrime Encoded message with context.
     * @param signature Parsed signature.
     * @return True if the signature is valid, false otherwise.
     */
    function verifyInternal(PubKey memory pk, bytes memory mPrime, Signature memory signature)
        internal
        view
        returns (bool)
    {
        // FIRST CORE STEP: hint encoding validated (weight <= omega), z decoded
        // packed with its norm checked (ZKNOX_dilithium65_core_packed.sol)
        (bool ok, uint256[][] memory z, uint256[6] memory hintMasks) = dilithiumCore1Packed65(signature);
        if (!ok) {
            return false;
        }

        // C_NTT: SampleInBall with tau = 49 on the 48-byte c~
        uint256[] memory cNtt = sampleInBallFastTau(signature.cTilde, 49, f1600Helper);

        // SECOND CORE STEP: NTT(c), A.z - c.t1 on the packed layout, inverse
        // NTT, hints, w1 encoding (ZKNOX_dilithium65_core_packed.sol)
        bytes memory wPrimeBytes = dilithiumCore2Packed65(pk, z, cNtt, hintMasks);

        // FINAL HASH: mu = SHAKE256(tr || m', 64), c~ = SHAKE256(mu || w1, 48)
        bytes memory mu = shake256Any(abi.encodePacked(pk.tr, mPrime), 64, f1600Helper);
        bytes memory finalHash = shake256Any(abi.encodePacked(mu, wPrimeBytes), 48, f1600Helper);

        return keccak256(finalHash) == keccak256(signature.cTilde);
    }
}
