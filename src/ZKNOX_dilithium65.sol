// Copyright (C) 2026 - ZKNOX
// License: This software is licensed under MIT License
// This Code may be reused including this header, license and copyright notice.
// FILE: ZKNOX_dilithium65.sol
// Description: ML-DSA-65 verifier taking the expanded public key in the calldata
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {
    dilithiumCore1Packed65,
    dilithiumCore2Packed65,
    readPubKeyCalldata65,
    KEY_BYTES65
} from "./ZKNOX_dilithium65_core_packed.sol";
import {shake256Any, sampleInBallFastTau} from "./ZKNOX_shake_fast.sol";
import {PubKey, Signature} from "./ZKNOX_dilithium_utils.sol";
import {ISigVerifier} from "InterfaceVerifier/IVerifier.sol";

/**
 * @title ZKNOX_dilithium65
 * @notice ML-DSA-65 (FIPS 204, category 3) with the expanded public key passed
 *         in the calldata of every verification (DECISIONS.md ADR-007).
 *
 *         This contract holds no state at all. `setKey` checks the length of
 *         the 38,112-byte expanded key and returns it; the caller keeps those
 *         bytes as `pk` and commits to them with keccak256, so the binding of a
 *         key to an account stays in the account. The verifier never trusts the
 *         bytes beyond their shape (readPubKeyCalldata65).
 *
 *         A verification costs about 1.55M of execution plus some 538k of
 *         calldata for the key and the signature, and there is nothing to
 *         install per key. An SSTORE2 key would cost 8.5M to deposit today and
 *         about 59.2M once EIP-8037 prices code deposit at 1,530 gas/byte, for
 *         a break-even near 17 verifications per key today and 122 after
 *         (ADR-007, test/dilithium65_key.t.sol).
 *
 *         The ECML-Signer Ledger app (ZKNoxHQ/ecml-signer) signs a 32-byte hash
 *         in pure mode with an empty context, which is what
 *         verify(pk, bytes32, sig) checks; its 1952-byte public key becomes `pk`
 *         through js/mldsa65.js publicKeyToBlob65 (test/ecml_signer_compat.t.sol).
 */
contract ZKNOX_dilithium65 is ISigVerifier {
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
     * @param pubkey The expanded public key, 38,112 bytes
     *        (js/mldsa65.js publicKeyToBlob65).
     * @return pk The same bytes.
     */
    function setKey(bytes calldata pubkey) external pure returns (bytes memory pk) {
        if (pubkey.length != KEY_BYTES65) revert BadKeyLength();
        pk = pubkey;
    }

    /**
     * @notice Verifies an ML-DSA-65 signature with context (FIPS 204 Alg. 3,
     *         M' = 0x00 || len(ctx) || ctx || M).
     * @param pk The expanded public key, 38,112 bytes.
     * @param m The message to verify.
     * @param signature The 3309-byte ML-DSA-65 signature.
     * @param ctx Optional context bytes (max length 255).
     */
    function verify(bytes calldata pk, bytes calldata m, bytes calldata signature, bytes calldata ctx)
        external
        view
        returns (bool)
    {
        if (signature.length != 3309) revert InvalidSignatureLength();
        if (f1600Helper.codehash != F1600_CODEHASH) revert BadHelper();

        PubKey memory publicKey = readPubKeyCalldata65(pk);

        if (ctx.length > 255) revert ContextTooLong();
        bytes memory mPrime = abi.encodePacked(bytes1(0), bytes1(uint8(ctx.length)), ctx, m);

        return verifyInternal(publicKey, mPrime, _parseSignature(signature));
    }

    /**
     * @notice Verifies an ML-DSA-65 signature (EIP-style interface).
     * @dev Implements ISigVerifier. Does not support custom context.
     * @param pk The expanded public key, 38,112 bytes.
     * @param m Message hash.
     * @param signature ML-DSA-65 signature.
     * @return Selector on success, 0xFFFFFFFF on failure.
     */
    function verify(bytes calldata pk, bytes32 m, bytes calldata signature) external view returns (bytes4) {
        if (signature.length != 3309) {
            return 0xFFFFFFFF;
        }
        if (f1600Helper.codehash != F1600_CODEHASH) revert BadHelper();

        PubKey memory publicKey = readPubKeyCalldata65(pk);

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
     * @notice Core ML-DSA-65 verification (FIPS 204 Alg. 8) on the decoded key.
     */
    function verifyInternal(PubKey memory pk, bytes memory mPrime, Signature memory signature)
        internal
        view
        returns (bool)
    {
        (bool ok, uint256[][] memory z, uint256[6] memory hintMasks) = dilithiumCore1Packed65(signature);
        if (!ok) {
            return false;
        }

        uint256[] memory cNtt = sampleInBallFastTau(signature.cTilde, 49, f1600Helper);

        bytes memory wPrimeBytes = dilithiumCore2Packed65(pk, z, cNtt, hintMasks);

        bytes memory mu = shake256Any(abi.encodePacked(pk.tr, mPrime), 64, f1600Helper);
        bytes memory finalHash = shake256Any(abi.encodePacked(mu, wPrimeBytes), 48, f1600Helper);

        return keccak256(finalHash) == keccak256(signature.cTilde);
    }
}
