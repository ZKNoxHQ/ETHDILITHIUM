// Copyright (C) 2026 - ZKNOX
// License: This software is licensed under MIT License
// This Code may be reused including this header, license and copyright notice.
// FILE: ZKNOX_dilithium87.sol
// Description: ML-DSA-87 verifier taking the expanded public key in the calldata
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {
    dilithiumCore1Packed87,
    dilithiumCore1PackedCalldata87,
    dilithiumCore2Packed87,
    dilithiumCore2Calldata87,
    checkPubKeyCalldata87,
    KEY_BYTES87,
    KEY_POLYS87,
    POLY_BYTES87
} from "./ZKNOX_dilithium87_core_packed.sol";
import {BadPubKeyBlob} from "./ZKNOX_dilithium_core_packed.sol";
import {shake256Any, sampleInBallFastTau} from "./ZKNOX_shake_fast.sol";
import {PubKey, Signature} from "./ZKNOX_dilithium_utils.sol";
import {ISigVerifier} from "InterfaceVerifier/IVerifier.sol";

/**
 * @title ZKNOX_dilithium87
 * @notice ML-DSA-87 (FIPS 204, category 5) with the expanded public key passed
 *         in the calldata of every verification, the form of ZKNOX_dilithium65
 *         (DECISIONS.md ADR-007, ADR-012).
 *
 *         This contract holds no state at all. `setKey` checks the length of
 *         the 67,680-byte expanded key and returns it; the caller keeps those
 *         bytes as `pk` and commits to them with keccak256, so the binding of a
 *         key to an account stays in the account. The verifier never trusts the
 *         bytes beyond their shape (checkPubKeyCalldata87).
 *
 *         The key in the calldata is the only form offered: an SSTORE2 copy of
 *         the 67,680 bytes would pay 13.5M of code deposit alone today
 *         (200 gas/byte) and 103.6M once EIP-8037 prices it at 1,530 gas/byte,
 *         over at least three contracts (EIP-170) and, after EIP-8037, at least
 *         seven transactions to stay under the EIP-7825 cap of 2^24 (ADR-012).
 *
 *         Signatures come from js/mldsa87.js (or any FIPS 204 ML-DSA-87
 *         signer); its 2592-byte public key becomes `pk` through
 *         publicKeyToBlob87.
 */
contract ZKNOX_dilithium87 is ISigVerifier {
    /// @notice keccak256 of the expected Keccak-f[1600] helper RUNTIME, as in
    ///         ZKNOX_dilithium (test/f1600_170.hex, fireblocks-labs at cca262b).
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
     * @param pubkey The expanded public key, 67,680 bytes
     *        (js/mldsa87.js publicKeyToBlob87).
     * @return pk The same bytes.
     */
    function setKey(bytes calldata pubkey) external pure returns (bytes memory pk) {
        if (pubkey.length != KEY_BYTES87) revert BadKeyLength();
        pk = pubkey;
    }

    /**
     * @notice Verifies an ML-DSA-87 signature with context (FIPS 204 Alg. 3,
     *         M' = 0x00 || len(ctx) || ctx || M).
     * @param pk The expanded public key, 67,680 bytes.
     * @param m The message to verify.
     * @param signature The 4627-byte ML-DSA-87 signature.
     * @param ctx Optional context bytes (max length 255).
     */
    function verify(bytes calldata pk, bytes calldata m, bytes calldata signature, bytes calldata ctx)
        external
        view
        returns (bool)
    {
        if (signature.length != 4627) revert InvalidSignatureLength();
        if (f1600Helper.codehash != F1600_CODEHASH) revert BadHelper();

        if (!checkPubKeyCalldata87(pk)) revert BadPubKeyBlob();

        if (ctx.length > 255) revert ContextTooLong();
        bytes memory mPrime = abi.encodePacked(bytes1(0), bytes1(uint8(ctx.length)), ctx, m);

        return verifyInternal(pk, mPrime, signature);
    }

    /**
     * @notice Verifies an ML-DSA-87 signature (EIP-style interface).
     * @dev Implements ISigVerifier. Does not support custom context.
     * @param pk The expanded public key, 67,680 bytes.
     * @param m Message hash.
     * @param signature ML-DSA-87 signature.
     * @return Selector on success, 0xFFFFFFFF on failure.
     */
    function verify(bytes calldata pk, bytes32 m, bytes calldata signature) external view returns (bytes4) {
        if (signature.length != 4627) {
            return 0xFFFFFFFF;
        }
        if (f1600Helper.codehash != F1600_CODEHASH) revert BadHelper();

        if (!checkPubKeyCalldata87(pk)) revert BadPubKeyBlob();

        bytes memory mPrime = abi.encodePacked(bytes1(0), bytes1(0), m);

        if (verifyInternal(pk, mPrime, signature)) {
            return ISigVerifier.verify.selector;
        }
        return 0xFFFFFFFF;
    }

    /**
     * @notice Splits the 4627-byte encoding into c~ (64) || z (4480) || h (83)
     *         (reference form, for the memory path below).
     */
    function _parseSignature(bytes calldata signature) internal pure returns (Signature memory) {
        return Signature({cTilde: signature[0:64], z: signature[64:4544], h: signature[4544:4627]});
    }

    /**
     * @notice Core ML-DSA-87 verification (FIPS 204 Alg. 8) on the key and the
     *         signature left in the calldata (key shape checked by
     *         checkPubKeyCalldata87, signature length by the caller): the
     *         67,680 bytes of the key are never copied, the matvec reads A and
     *         t1 in place and tr is sliced for mu; z is decoded in place too
     *         (dilithiumCore1PackedCalldata87), only c~ and h are copied.
     */
    function verifyInternal(bytes calldata pk, bytes memory mPrime, bytes calldata signature)
        internal
        view
        returns (bool)
    {
        (bool ok, uint256[][] memory z, uint256[8] memory hintMasks) = dilithiumCore1PackedCalldata87(signature);
        if (!ok) {
            return false;
        }

        uint256[] memory cNtt = sampleInBallFastTau(signature[0:64], 60, f1600Helper);

        bytes memory wPrimeBytes = dilithiumCore2Calldata87(pk, z, cNtt, hintMasks);

        bytes memory mu =
            shake256Any(abi.encodePacked(pk[KEY_POLYS87 * POLY_BYTES87 + 32:KEY_BYTES87], mPrime), 64, f1600Helper);
        bytes memory finalHash = shake256Any(abi.encodePacked(mu, wPrimeBytes), 64, f1600Helper);

        return keccak256(finalHash) == keccak256(signature[0:64]);
    }

    /**
     * @notice Core ML-DSA-87 verification (FIPS 204 Alg. 8) on a decoded key
     *         (readPubKeyCalldata87); the calldata form above is the one the
     *         entry points use.
     */
    function verifyInternal(PubKey memory pk, bytes memory mPrime, Signature memory signature)
        internal
        view
        returns (bool)
    {
        (bool ok, uint256[][] memory z, uint256[8] memory hintMasks) = dilithiumCore1Packed87(signature);
        if (!ok) {
            return false;
        }

        uint256[] memory cNtt = sampleInBallFastTau(signature.cTilde, 60, f1600Helper);

        bytes memory wPrimeBytes = dilithiumCore2Packed87(pk, z, cNtt, hintMasks);

        bytes memory mu = shake256Any(abi.encodePacked(pk.tr, mPrime), 64, f1600Helper);
        bytes memory finalHash = shake256Any(abi.encodePacked(mu, wPrimeBytes), 64, f1600Helper);

        return keccak256(finalHash) == keccak256(signature.cTilde);
    }
}
