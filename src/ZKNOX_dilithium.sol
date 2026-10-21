// Copyright (C) 2026 - ZKNOX
// License: This software is licensed under MIT License
// This Code may be reused including this header, license and copyright notice.
// FILE: ZKNOX_dilithium.sol
// Description: ML-DSA-44 verifier following the NIST specification, the
// expanded public key passed in the calldata of every verification
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {
    dilithiumCore1Packed,
    dilithiumCore1PackedCalldata,
    dilithiumCore2Packed,
    dilithiumCore2Calldata,
    checkPubKeyCalldata,
    BadPubKeyBlob,
    KEY_BYTES,
    KEY_POLYS,
    POLY_BYTES
} from "./ZKNOX_dilithium_core_packed.sol";
import {shake256Any, sampleInBallFast} from "./ZKNOX_shake_fast.sol";
import {PubKey, Signature} from "./ZKNOX_dilithium_utils.sol";
import {ISigVerifier} from "InterfaceVerifier/IVerifier.sol";

/**
 * @title ZKNOX_dilithium
 * @notice ML-DSA-44 (FIPS 204, category 2) with the expanded public key passed
 *         in the calldata of every verification, the form of ZKNOX_dilithium65
 *         (DECISIONS.md ADR-007, ADR-010).
 *
 *         This contract holds no state at all. `setKey` checks the length of
 *         the 21,216-byte expanded key and returns it; the caller keeps those
 *         bytes as `pk` and commits to them with keccak256, so the binding of a
 *         key to an account stays in the account. The verifier never trusts the
 *         bytes beyond their shape (checkPubKeyCalldata).
 *
 *         The key layout is the flat one of the ML-DSA-65 verifier: 20
 *         polynomials [32][32 words] (A[i][j] at (4i + j) * 1056, t1[i] at
 *         (16 + i) * 1056) then tr as [64][64 bytes];
 *         pythonref/prepare_pk_for_deployment.py builds it from a seed
 *         (`flat`), encodePubKeyFlat from the three arrays.
 */
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
    error InvalidSignatureLength();
    error ContextTooLong();
    error BadKeyLength();

    constructor(address helper) {
        if (helper.codehash != F1600_CODEHASH) revert BadHelper();
        f1600Helper = helper;
    }

    /**
     * @notice Normalizes a public key: here the expanded key is already its own
     *         handle, so this only checks its length and gives it back.
     * @dev Nothing is written: no storage, no deposit. The caller keeps the
     *      returned bytes and passes them as `pk` to verify; binding them to an
     *      account is the caller's keccak256.
     * @param pubkey The expanded public key, 21,216 bytes.
     * @return pk The same bytes.
     */
    function setKey(bytes calldata pubkey) external pure returns (bytes memory pk) {
        if (pubkey.length != KEY_BYTES) revert BadKeyLength();
        pk = pubkey;
    }

    /**
     * @notice Verifies an ML-DSA-44 signature with context (FIPS 204 Alg. 3,
     *         M' = 0x00 || len(ctx) || ctx || M).
     * @param pk The expanded public key, 21,216 bytes.
     * @param m The message to verify.
     * @param signature The 2420-byte ML-DSA-44 signature.
     * @param ctx Optional context bytes (max length 255).
     * @return True if the signature is valid, false otherwise.
     */
    function verify(bytes calldata pk, bytes calldata m, bytes calldata signature, bytes calldata ctx)
        external
        view
        returns (bool)
    {
        if (signature.length != 2420) revert InvalidSignatureLength();
        if (f1600Helper.codehash != F1600_CODEHASH) revert BadHelper();

        if (!checkPubKeyCalldata(pk)) revert BadPubKeyBlob();

        if (ctx.length > 255) revert ContextTooLong();
        bytes memory mPrime = abi.encodePacked(bytes1(0), bytes1(uint8(ctx.length)), ctx, m);

        return verifyInternal(pk, mPrime, signature);
    }

    /**
     * @notice Verifies an ML-DSA-44 signature (EIP-style interface).
     * @dev Implements ISigVerifier. Does not support custom context.
     * @param pk The expanded public key, 21,216 bytes.
     * @param m Message hash.
     * @param signature ML-DSA-44 signature.
     * @return Selector on success, 0xFFFFFFFF on failure.
     */
    function verify(bytes calldata pk, bytes32 m, bytes calldata signature) external view returns (bytes4) {
        if (signature.length != 2420) {
            return 0xFFFFFFFF;
        }
        if (f1600Helper.codehash != F1600_CODEHASH) revert BadHelper();

        if (!checkPubKeyCalldata(pk)) revert BadPubKeyBlob();

        bytes memory mPrime = abi.encodePacked(bytes1(0), bytes1(0), m);

        if (verifyInternal(pk, mPrime, signature)) {
            return ISigVerifier.verify.selector;
        }
        return 0xFFFFFFFF;
    }

    /**
     * @notice Splits the 2420-byte encoding into c~ (32) || z (2304) || h (84)
     *         (reference form, for the memory path below).
     */
    function _parseSignature(bytes calldata signature) internal pure returns (Signature memory) {
        return Signature({cTilde: signature[0:32], z: signature[32:2336], h: signature[2336:2420]});
    }

    /**
     * @notice Core ML-DSA-44 verification (FIPS 204 Alg. 8) on the key and the
     *         signature left in the calldata (key shape checked by
     *         checkPubKeyCalldata, signature length by the caller): the 21,216
     *         bytes of the key are never copied, the matvec reads A and t1 in
     *         place and tr is sliced for mu; z is decoded in place too
     *         (dilithiumCore1PackedCalldata), only c~ and h are copied.
     */
    function verifyInternal(bytes calldata pk, bytes memory mPrime, bytes calldata signature)
        internal
        view
        returns (bool)
    {
        // FIRST CORE STEP: hint encoding validated (weight <= omega), z decoded
        // packed with its norm checked (ZKNOX_dilithium_core_packed.sol)
        (bool ok, uint256[][] memory z, uint256[4] memory hintMasks) = dilithiumCore1PackedCalldata(signature);
        if (!ok) {
            return false;
        }

        // C_NTT
        uint256[] memory cNtt = sampleInBallFast(signature[0:32], f1600Helper);

        // SECOND CORE STEP: NTT(c), A.z - c.t1 on the packed layout from the
        // calldata key, inverse NTT, hints, w1 encoding
        bytes memory wPrimeBytes = dilithiumCore2Calldata(pk, z, cNtt, hintMasks);

        // FINAL HASH: mu = SHAKE256(tr || m', 64), c~ = SHAKE256(mu || w1, 32)
        bytes memory mu =
            shake256Any(abi.encodePacked(pk[KEY_POLYS * POLY_BYTES + 32:KEY_BYTES], mPrime), 64, f1600Helper);
        bytes32 finalHash = bytes32(shake256Any(abi.encodePacked(mu, wPrimeBytes), 32, f1600Helper));

        return finalHash == bytes32(signature[0:32]);
    }

    /**
     * @notice Core ML-DSA-44 verification (FIPS 204 Alg. 8) on a decoded key
     *         (readPubKeyCalldata / readPubKeyPacked, reference form used by
     *         the tests); the calldata form above is the one the entry points use.
     */
    function verifyInternal(PubKey memory pk, bytes memory mPrime, Signature memory signature)
        internal
        view
        returns (bool)
    {
        (bool ok, uint256[][] memory z, uint256[4] memory hintMasks) = dilithiumCore1Packed(signature);
        if (!ok) {
            return false;
        }

        uint256[] memory cNtt = sampleInBallFast(signature.cTilde, f1600Helper);

        bytes memory wPrimeBytes = dilithiumCore2Packed(pk, z, cNtt, hintMasks);

        bytes memory mu = shake256Any(abi.encodePacked(pk.tr, mPrime), 64, f1600Helper);
        bytes32 finalHash = bytes32(shake256Any(abi.encodePacked(mu, wPrimeBytes), 32, f1600Helper));

        return finalHash == bytes32(signature.cTilde);
    }
}
