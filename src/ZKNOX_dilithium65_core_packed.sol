// SPDX-License-Identifier: MIT
// Copyright (C) 2026 - ZKNOX
// License: This software is licensed under MIT License
// This Code may be reused including this header, license and copyright notice.
// FILE: ZKNOX_dilithium65_core_packed.sol
// Description: ML-DSA-65 (FIPS 204, k = 6, l = 5) verification stages on the
// packed 4x64-bit-lane layout of ZKNOX_dilithium_core_packed.sol.
//
//   zHat_j = nttFwMontPacked(z_j)          j < 5, lazy lanes < 16q
//   cHat   = nttFwMontPacked(c)
//   acc_i  = sum_j A_ij o zHat_j + q*2^28 - cHat o t1_i      i < 6, raw lanes
//   w_i    = nttInvMontPackedRaw(acc_i)     canonical lanes
//   w1     = useHintPacked65(h, w)          768 bytes, FIPS 204 w1Encode
//
// What changes against ML-DSA-44 (everything else is shared: NTT kernels,
// key blob format, SHAKE glue):
//   - z: five polynomials of 20-bit fields (gamma1 = 2^19), one 10-byte
//     group per packed word, bound beta < f < 2 gamma1 - beta, i.e.
//     f in [197, 1048379] (||z||inf < gamma1 - beta = 524092, FIPS 204 Alg. 3);
//   - matvec: five columns, on the lane split of z and c (_matvecRowSplit65;
//     the key rows read from the calldata by _matvecRowCalldata65). Lane
//     bound: 5 lazy lanes (< 17q) times fields (< q) plus the q*2^28 offset
//     < 85 q^2 + q*2^28 < 8.23e15 < q*2^30, the offset the inverse
//     transform's first pass applies, so no lane ever borrows or carries
//     (ML-DSA-44: 68 q^2 + q*2^28); the cross-product lanes (< 2^54, 2^60
//     offset) are masked out;
//   - hints: 61 bytes (omega = 55, k = 6), six masks;
//   - w1: gamma2 = (q-1)/32, m = (q-1)/(2 gamma2) = 16, so Decompose is
//       a1 = floor((r + gamma2 - 1) / (2 gamma2)) & 15
//     (one multiply by ceil(2^48 / (2 gamma2)), the & 15 folds 16 -> 0),
//     a0 > 0 <=> 2 gamma2 < D <= 2 gamma2 + (q-1)/2
//     with D = r + 2 gamma2 - a1 * 2 gamma2, UseHint adds 1 or 15 mod 16 on the
//     (rare) hinted lanes, and w1Encode packs four 4-bit values per word
//     (two bytes). Checked
//     exhaustively against FIPS 204 Alg. 36 / 40 for every r in [0, q) and
//     both hint values (pythonref-free model: see VERSION.md).
pragma solidity ^0.8.25;

import {q, PubKey, Signature} from "./ZKNOX_dilithium_utils.sol";
import {
    nttFwMontPackedFusedTbSplit,
    nttInvMontPackedRawFusedTb,
    nttInvMontPackedTailTb,
    _tablesMont
} from "./ZKNOX_NTT_dilithium_mont.sol";
import {BadPubKeyBlob, BadLength} from "./ZKNOX_dilithium_core_packed.sol";

uint256 constant _L64 = 0xffffffffffffffff;
// q*2^30 on lanes 0 and 2
uint256 constant _Q30X2 = 0x0000000000000000001ff800400000000000000000000000001ff80040000000;
uint256 constant _LN0 = 0x000000000000000000000000000000000000000000000000ffffffffffffffff;
uint256 constant _LN1 = 0x00000000000000000000000000000000ffffffffffffffff0000000000000000;
uint256 constant _LN2 = 0x0000000000000000ffffffffffffffff00000000000000000000000000000000;
uint256 constant _LN3 = 0xffffffffffffffff000000000000000000000000000000000000000000000000;
// _matvecRowSplit65 constants: even / odd key fields, even / odd wanted lanes,
// the q*2^28 offset on the wanted lanes with 2^60 on the cross lanes
uint256 constant _ME = 0x00000000000000000000000000000000ffffffff00000000ffffffff;
uint256 constant _MO = 0x000000000000000000000000ffffffff00000000ffffffff00000000;
uint256 constant _ZS1 = 0x000000000000000000000000000000000000000000000000ffffffff00000000;
uint256 constant _ZS3 = 0x00000000000000000000000000000000ffffffff000000000000000000000000;
uint256 constant _LN02 = 0x0000000000000000ffffffffffffffff0000000000000000ffffffffffffffff;
uint256 constant _LN13 = 0xffffffffffffffff0000000000000000ffffffffffffffff0000000000000000;
uint256 constant _OFFE = 0x10000000000000000007fe001000000010000000000000000007fe0010000000;
uint256 constant _OFFO = 0x0007fe001000000010000000000000000007fe00100000001000000000000000;
// useHintPacked65 constants (per 64-bit lane): gamma2 - 1 = 261887, ceil(2^48 / (2 gamma2)),
// the 4-bit lane mask, the packing multiplier and the top-32-bit mask
uint256 constant _RG2M1_65 = 0x000000000003feff000000000003feff000000000003feff000000000003feff;
uint256 constant _MDIV65 = 0x20080201;
uint256 constant _M4X4 = 0x000000000000000f000000000000000f000000000000000f000000000000000f;
uint256 constant _W1K65 = 0x0100000000000000100000000000000000010000000000000010000000000000;
uint256 constant _R2G2_65 = 0x000000000007fe00000000000007fe00000000000007fe00000000000007fe00;
uint256 constant _C1_65 = 0x000000fffff801ff000000fffff801ff000000fffff801ff000000fffff801ff;
uint256 constant _C2_65 = 0x000001000047ee00000001000047ee00000001000047ee00000001000047ee00;
uint256 constant _R2_40_65 = 0x0000010000000000000001000000000000000100000000000000010000000000;
uint256 constant _R1_65 = 0x0000000000000001000000000000000100000000000000010000000000000001;
uint256 constant _R15_65 = 0x000000000000000f000000000000000f000000000000000f000000000000000f;
uint256 constant _SPREADH65 = 0x0000000000000000200000000000000040000000000000008000000000000001;
uint256 constant _TOP64 = 0xffffffffffffffff000000000000000000000000000000000000000000000000;
// unpackZPacked65 constants (per 64-bit lane): fields f of 20 bits, z = gamma1 - f mod q,
// accepted iff f in [beta + 1, 2 gamma1 - beta - 1] = [197, 1048379]
uint256 constant _M20X4 = 0x00000000000fffff00000000000fffff00000000000fffff00000000000fffff;
// even fields (0, 2) and odd fields (1, 3) of the 80-bit group, and the two
// multipliers that move field k to lane k (the other copies land above bit
// 19 of a lane and are masked away)
uint256 constant _ZME65 = 0x0000000000000000000000000000000000000000000000000fffff00000fffff;
uint256 constant _ZMO65 = 0x000000000000000000000000000000000000000000000fffff00000fffff00000;
uint256 constant _ZCE65 = 0x0000000000000000000000000000000000000000010000000000000000000001;
uint256 constant _ZCO65 = 0x0000000000000000000000000000001000000000000000000000100000000000;
uint256 constant _B24 = 0x0000000001000000000000000100000000000000010000000000000001000000;
uint256 constant _ZLO65 = 0x0000000000ffff3b0000000000ffff3b0000000000ffff3b0000000000ffff3b;
uint256 constant _ZHI65 = 0x00000000010fff3b00000000010fff3b00000000010fff3b00000000010fff3b;
uint256 constant _ZQG1_65 = 0x000000000087e001000000000087e001000000000087e001000000000087e001;
uint256 constant _ZCAN = 0x0000000000801fff0000000000801fff0000000000801fff0000000000801fff;

// One polynomial of the expanded key as it is laid out: a length word of 32,
// then its 32 words, used in place as a uint256[32]
// (ZKNOX_dilithium_core_packed.sol). Literals, so that inline assembly can use
// them; test/dilithium65_key.t.sol checks they agree.
uint256 constant POLY_BYTES65 = 1056;
uint256 constant KEY_POLYS65 = 36; // 30 of A plus 6 of t1
uint256 constant KEY_BYTES65 = 38112; // KEY_POLYS65 * POLY_BYTES65 + 96, tr included

/// @notice Read of the expanded public key from the calldata. Nothing is stored
///         on chain: the caller passes the key on every verification and binds
///         it to an account with keccak256 (DECISIONS.md ADR-007).
///
///         The key is one flat run of 38,112 bytes: polynomial f at offset
///         f * POLY_BYTES65, f < 30 being A[f / 5][f % 5] and f >= 30
///         t1[f - 30], then tr as [64][64 bytes]. This reference form (used by
///         the tests) copies it once into memory and uses it in place from
///         there; the verifier keeps the key in the calldata instead
///         (checkPubKeyCalldata65, then dilithiumCore2Calldata65 reads A and
///         t1 with calldataload). The only shape accepted is that exact length
///         with a length word of 32 before every polynomial and 64 before tr;
///         the bytes are never trusted beyond that.
function readPubKeyCalldata65(bytes calldata key) pure returns (PubKey memory pk) {
    uint256[][][] memory aHat = new uint256[][][](6);
    for (uint256 i = 0; i < 6; i++) {
        aHat[i] = new uint256[][](5);
    }
    uint256[][] memory t1 = new uint256[][](6);
    bytes memory tr;
    bool ok = key.length == KEY_BYTES65;
    if (ok) {
        assembly ("memory-safe") {
            let base := mload(0x40)
            calldatacopy(base, key.offset, KEY_BYTES65)
            mstore(0x40, add(base, KEY_BYTES65)) // KEY_BYTES65 is a multiple of 32
            for { let f := 0 } lt(f, KEY_POLYS65) { f := add(f, 1) } {
                let p := add(base, mul(f, POLY_BYTES65))
                ok := and(ok, eq(mload(p), 32))
                switch lt(f, 30)
                // A[f / 5][f % 5]
                case 1 {
                    let row := mload(add(aHat, add(32, shl(5, div(f, 5)))))
                    mstore(add(row, add(32, shl(5, mod(f, 5)))), p)
                }
                // t1[f - 30]
                default { mstore(add(t1, add(32, shl(5, sub(f, 30)))), p) }
            }
            // tr: [64][64 bytes], used as a bytes memory object in place
            let t := add(base, mul(KEY_POLYS65, POLY_BYTES65))
            ok := and(ok, eq(mload(t), 64))
            tr := t
        }
    }
    if (!ok) revert BadPubKeyBlob();
    pk = PubKey({aHat: aHat, tr: tr, t1: t1});
}

/// @notice Shape check of the expanded public key in the calldata, the rule of
///         readPubKeyCalldata65 without the copy: exactly KEY_BYTES65 bytes, a
///         length word of 32 before every polynomial and 64 before tr. The
///         calldata path of the verifier (dilithiumCore2Calldata65) reads the
///         key in place after this check.
function checkPubKeyCalldata65(bytes calldata key) pure returns (bool ok) {
    ok = key.length == KEY_BYTES65;
    if (ok) {
        assembly ("memory-safe") {
            // the 36 length words of 32, four per iteration, then tr's 64
            let p := key.offset
            let bad := 0
            for { let e := add(p, mul(KEY_POLYS65, POLY_BYTES65)) } lt(p, e) { p := add(p, mul(4, POLY_BYTES65)) } {
                bad := or(
                    bad,
                    or(
                        or(xor(calldataload(p), 32), xor(calldataload(add(p, POLY_BYTES65)), 32)),
                        or(
                            xor(calldataload(add(p, mul(2, POLY_BYTES65))), 32),
                            xor(calldataload(add(p, mul(3, POLY_BYTES65))), 32)
                        )
                    )
                )
            }
            ok := iszero(or(bad, xor(calldataload(p), 64)))
        }
    }
}

/// @dev the 61-byte HintBitUnpack encoding (FIPS 204 Alg. 21, omega = 55,
///      k = 6) in one scan: validity (per-polynomial cumulative counts
///      non-decreasing and <= omega, indices strictly increasing inside a
///      polynomial, unused index bytes zero), total weight, and the six
///      256-bit hint masks (bit j of mask i = h[i][j]).
function _parseHintBytes65(bytes memory hBytes) pure returns (bool ok, uint256 count, uint256[6] memory masks) {
    if (hBytes.length != 61) return (false, 0, masks);
    assembly ("memory-safe") {
        let base := add(hBytes, 32)
        let kIdx := 0
        ok := 1
        for { let i := 0 } lt(i, 6) { i := add(i, 1) } {
            let omegaVal := byte(0, mload(add(base, add(55, i))))
            if or(lt(omegaVal, kIdx), gt(omegaVal, 55)) { ok := 0 }
            let m := 0
            for { let j := kIdx } lt(j, omegaVal) { j := add(j, 1) } {
                // strictly increasing indices: each new bit lies above all the previous ones
                let b := shl(byte(0, mload(add(base, j))), 1)
                ok := and(ok, gt(b, m))
                m := or(m, b)
            }
            mstore(add(masks, shl(5, i)), m)
            kIdx := omegaVal
        }
        // the unused index bytes are zero: a word at a time, the last one trimmed
        for { let j := kIdx } lt(j, 55) { j := add(j, 32) } {
            let n := sub(55, j)
            let z := mload(add(base, j))
            if lt(n, 32) { z := shr(sub(256, shl(3, n)), z) }
            if z { ok := 0 }
        }
        count := kIdx
    }
}

/// @dev validation only (reference form for the tests)
function _checkHintBytes65(bytes memory hBytes) pure returns (bool ok, uint256 count) {
    (ok, count,) = _parseHintBytes65(hBytes);
}

/// @dev the six masks straight from a VALIDATED encoding (reference form for the tests)
function _hintMasksFromBytes65(bytes memory hBytes) pure returns (uint256[6] memory masks) {
    (,, masks) = _parseHintBytes65(hBytes);
}

/// @notice Decode of the 3200-byte z region (five polynomials of 20-bit
///         fields, little-endian bit packing) straight into the packed layout,
///         with the strict norm check ||z||inf < gamma1 - beta (FIPS 204 Alg. 3).
///         Four fields are one 10-byte group and one packed word; two groups
///         (20 bytes) are read as one word, byte-reversed once, split into
///         lanes by two multiplies, then canonicalised and range-checked four
///         lanes at a time.
/// @return zp 5 packed polynomials, canonical lanes (same values as unpackZ65)
/// @return normOk true iff every coefficient satisfies the strict bound
function unpackZPacked65(bytes memory zBytes) pure returns (uint256[][] memory zp, bool normOk) {
    (zp, normOk) = _unpackZPacked65(zBytes, true);
}

/// @notice unpackZPacked65 with LAZY lanes: q + gamma1 - f in (0, 2q), congruent
///         to the canonical z, which is all the forward transform needs (its
///         lazy bounds hold for lanes < 2q; the verifier's stage 1 uses this
///         form, dilithiumCore1Packed65).
function unpackZPackedLazy65(bytes memory zBytes) pure returns (uint256[][] memory zp, bool normOk) {
    (zp, normOk) = _unpackZPacked65(zBytes, false);
}

/// @dev the decoder: `canonical` selects the conditional subtraction of q
function _unpackZPacked65(bytes memory zBytes, bool canonical) pure returns (uint256[][] memory zp, bool normOk) {
    if (zBytes.length != 3200) revert BadLength();
    zp = new uint256[][](5);
    for (uint256 i = 0; i < 5; i++) {
        zp[i] = new uint256[](64);
    }
    uint256 good;
    assembly ("memory-safe") {
        good := not(0)
        let src := add(zBytes, 32)
        for { let i := 0 } lt(i, 5) { i := add(i, 1) } {
            let dst := add(mload(add(zp, add(32, shl(5, i)))), 32)
            // 32 pairs of groups per polynomial: 20 bytes read as one word (the
            // last read runs 12 bytes past the region, only the top 20 are used)
            // and byte-reversed once, so that byte k of the stream is bits
            // 8k .. 8k+7: the first group is bits 0..79, the second 80..159
            for { let e := add(dst, 0x800) } lt(dst, e) { dst := add(dst, 64) } {
                let w := mload(src)
                src := add(src, 20)
                w := or(
                    shr(8, and(w, 0xff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00)),
                    shl(8, and(w, 0x00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff))
                )
                w := or(
                    shr(16, and(w, 0xffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000)),
                    shl(16, and(w, 0x0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff))
                )
                w := or(
                    shr(32, and(w, 0xffffffff00000000ffffffff00000000ffffffff00000000ffffffff00000000)),
                    shl(32, and(w, 0x00000000ffffffff00000000ffffffff00000000ffffffff00000000ffffffff))
                )
                w := or(
                    shr(64, and(w, 0xffffffffffffffff0000000000000000ffffffffffffffff0000000000000000)),
                    shl(64, and(w, 0x0000000000000000ffffffffffffffff0000000000000000ffffffffffffffff))
                )
                w := or(shr(128, w), shl(128, w))
                {
                    // the four fields to the four lanes: two multiplies (the field
                    // masks also drop everything above the group)
                    let V := and(or(mul(and(w, _ZME65), _ZCE65), mul(and(w, _ZMO65), _ZCO65)), _M20X4)
                    // f >= 197 and f <= 1048379: bit 24 of each lane of both (f + 2^24 - lo) and
                    // (2^24 + hi - f) stays set; the lanes' bits 24 are checked once at the end
                    good := and(good, and(add(V, _ZLO65), sub(_ZHI65, V)))
                    // z = q + gamma1 - f, minus q where that is >= q (canonical only)
                    V := sub(_ZQG1_65, V)
                    if canonical { V := sub(V, mul(shr(24, and(add(V, _ZCAN), _B24)), 8380417)) }
                    mstore(dst, V)
                }
                {
                    w := shr(80, w)
                    let V := and(or(mul(and(w, _ZME65), _ZCE65), mul(and(w, _ZMO65), _ZCO65)), _M20X4)
                    good := and(good, and(add(V, _ZLO65), sub(_ZHI65, V)))
                    V := sub(_ZQG1_65, V)
                    if canonical { V := sub(V, mul(shr(24, and(add(V, _ZCAN), _B24)), 8380417)) }
                    mstore(add(dst, 32), V)
                }
            }
        }
    }
    normOk = (good & _B24) == _B24;
}

/// @dev unpackZPackedLazy65 reading the z bytes in place from the calldata (the
///      verifier's form, dilithiumCore1PackedCalldata65): same decoder,
///      calldataload for mload, lazy lanes only
function _unpackZPackedLazyCalldata65(bytes calldata zBytes) pure returns (uint256[][] memory zp, bool normOk) {
    if (zBytes.length != 3200) revert BadLength();
    zp = new uint256[][](5);
    for (uint256 i = 0; i < 5; i++) {
        zp[i] = new uint256[](64);
    }
    uint256 good;
    assembly ("memory-safe") {
        good := not(0)
        let src := zBytes.offset
        for { let i := 0 } lt(i, 5) { i := add(i, 1) } {
            let dst := add(mload(add(zp, add(32, shl(5, i)))), 32)
            // 32 pairs of groups per polynomial: 20 bytes read as one word (the
            // last read runs 12 bytes past the region, only the top 20 are used)
            // and byte-reversed once, so that byte k of the stream is bits
            // 8k .. 8k+7: the first group is bits 0..79, the second 80..159
            for { let e := add(dst, 0x800) } lt(dst, e) { dst := add(dst, 64) } {
                let w := calldataload(src)
                src := add(src, 20)
                w := or(
                    shr(8, and(w, 0xff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00)),
                    shl(8, and(w, 0x00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff))
                )
                w := or(
                    shr(16, and(w, 0xffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000)),
                    shl(16, and(w, 0x0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff))
                )
                w := or(
                    shr(32, and(w, 0xffffffff00000000ffffffff00000000ffffffff00000000ffffffff00000000)),
                    shl(32, and(w, 0x00000000ffffffff00000000ffffffff00000000ffffffff00000000ffffffff))
                )
                w := or(
                    shr(64, and(w, 0xffffffffffffffff0000000000000000ffffffffffffffff0000000000000000)),
                    shl(64, and(w, 0x0000000000000000ffffffffffffffff0000000000000000ffffffffffffffff))
                )
                w := or(shr(128, w), shl(128, w))
                {
                    // the four fields to the four lanes: two multiplies (the field
                    // masks also drop everything above the group)
                    let V := and(or(mul(and(w, _ZME65), _ZCE65), mul(and(w, _ZMO65), _ZCO65)), _M20X4)
                    // f >= 197 and f <= 1048379: bit 24 of each lane of both (f + 2^24 - lo) and
                    // (2^24 + hi - f) stays set; the lanes' bits 24 are checked once at the end
                    good := and(good, and(add(V, _ZLO65), sub(_ZHI65, V)))
                    // z = q + gamma1 - f, lazy (in (0, 2q))
                    V := sub(_ZQG1_65, V)
                    mstore(dst, V)
                }
                {
                    w := shr(80, w)
                    let V := and(or(mul(and(w, _ZME65), _ZCE65), mul(and(w, _ZMO65), _ZCO65)), _M20X4)
                    good := and(good, and(add(V, _ZLO65), sub(_ZHI65, V)))
                    V := sub(_ZQG1_65, V)
                    mstore(add(dst, 32), V)
                }
            }
        }
    }
    normOk = (good & _B24) == _B24;
}

/// @notice First stage of the ML-DSA-65 verification on the packed layout:
///         hint encoding validated (and its weight bounded by omega = 55), z
///         decoded packed (lazy lanes in (0, 2q), unpackZPackedLazy65) with its
///         norm checked; false means reject.
function dilithiumCore1Packed65(Signature memory signature)
    pure
    returns (bool ok, uint256[][] memory zp, uint256[6] memory hintMasks)
{
    // the weight bound (<= omega = 55) is enforced by the parser on every cumulative count
    (bool hOk,, uint256[6] memory masks) = _parseHintBytes65(signature.h);
    if (!hOk) return (false, zp, masks);
    bool normOk;
    (zp, normOk) = unpackZPackedLazy65(signature.z);
    ok = normOk;
    hintMasks = masks;
}

/// @notice dilithiumCore1Packed65 on the signature left in the calldata: the
///         hint bytes are parsed from a copy (61 bytes), z is decoded in place
///         (_unpackZPackedLazyCalldata65), so the 3,200 bytes are never copied.
/// @param signature the 3309-byte signature, c~ (48) || z (3200) || h (61)
function dilithiumCore1PackedCalldata65(bytes calldata signature)
    pure
    returns (bool ok, uint256[][] memory zp, uint256[6] memory hintMasks)
{
    // the weight bound (<= omega = 55) is enforced by the parser on every cumulative count
    (bool hOk,, uint256[6] memory masks) = _parseHintBytes65(signature[3248:3309]);
    if (!hOk) return (false, zp, masks);
    bool normOk;
    (zp, normOk) = _unpackZPackedLazyCalldata65(signature[48:3248]);
    ok = normOk;
    hintMasks = masks;
}

/// @dev Lane split of the five transformed z and of cHat for the matvec
///      kernel: 6 x 128 contiguous words at the returned pointer, polynomial j
///      at zs + j * 0x1000 (j = 5 is cHat). The packed word of coefficients
///      4m..4m+3 (lanes at 0, 64, 128, 192) becomes two words,
///        even: c0 at 0,  c2 at 64        odd: c1 at 32, c3 at 96
///      stored at 2m and 2m + 1. Against a key word (eight 32-bit fields f_k at
///      32k) masked to its even fields (f0 at 0, f2 at 64) or odd fields (f1 at
///      32, f3 at 96), one multiply then gives two wanted products on 64-bit
///      lanes and two cross products on other lanes:
///        even * even: c0 f0 at 0, c2 f2 at 128, c0 f2 and c2 f0 at 64
///        odd  * odd : c1 f1 at 64, c3 f3 at 192, c1 f3 and c3 f1 at 128
///      so an even accumulator keeps lanes 0 and 2, an odd one lanes 1 and 3,
///      and the other lanes only ever collect cross products (< 2^54 for the
///      twelve of a row, see _matvecRowSplit65). Shapes are NOT checked (EIP-170
///      room): callers pass five 64-word packed polynomials and a 64-word cHat.
function _splitLanes65(uint256[][] memory zHat, uint256[] memory cHat) pure returns (uint256 zs) {
    assembly ("memory-safe") {
        zs := mload(0x40)
        mstore(0x40, add(zs, 0x6000))
        let d := zs
        for { let j := 0 } lt(j, 6) { j := add(j, 1) } {
            let src := add(cHat, 32)
            if lt(j, 5) { src := add(mload(add(zHat, add(32, shl(5, j)))), 32) }
            for { let e := add(src, 0x800) } lt(src, e) { src := add(src, 32) } {
                let z := mload(src)
                mstore(d, or(and(z, _LN0), and(shr(64, z), _LN1)))
                mstore(add(d, 32), or(and(shr(32, z), _ZS1), and(shr(96, z), _ZS3)))
                d := add(d, 64)
            }
        }
    }
}

/// @dev acc = A[i][0..4] . zHat[0..4] + q*2^28 - cHat . t1i, packed raw lanes,
///      on the lane split of _splitLanes65: per key word (eight coefficients,
///      two accumulator words) 24 multiplies of two products each instead of
///      48, no field extraction on the key side (one mask per multiply, one
///      shift per key word for the upper four fields) and none on the z side.
///      Wanted lanes stay the lanes of the packed kernel (5 lazy lanes < 17q
///      times fields < q plus q*2^28 < q*2^30, the bound the inverse transform
///      needs); the cross-product lanes carry 2^60 instead of q*2^28 so that
///      the c . t1 subtraction never borrows there either (12 cross products
///      < 12 * 17q * q < 2^54), and they are masked out when the even and odd
///      accumulators are merged. Shapes are NOT checked (EIP-170 room): the
///      callers guarantee five 32-word key polynomials (readPubKeyCalldata65
///      validates every polynomial of the key), a 32-word t1 and the split of
///      five 64-word packed z and a 64-word packed c; the reads never leave those.
/// @param zs the lane split (_splitLanes65): 6 x 128 words, cHat last
function _matvecRowSplit65(uint256[][] memory aRow, uint256 zs, uint256[] memory t1i)
    pure
    returns (uint256[] memory acc)
{
    acc = new uint256[](64);
    assembly ("memory-safe") {
        let pa0 := add(mload(add(aRow, 32)), 32)
        let pa1 := add(mload(add(aRow, 64)), 32)
        let pa2 := add(mload(add(aRow, 96)), 32)
        let pa3 := add(mload(add(aRow, 128)), 32)
        let pa4 := add(mload(add(aRow, 160)), 32)
        let pt := add(t1i, 32)
        let pz := zs
        let pd := add(acc, 32)
        for { let e := add(pd, 0x800) } lt(pd, e) { pd := add(pd, 64) } {
            let a := mload(pa0)
            let el := mul(mload(pz), and(a, _ME))
            let ol := mul(mload(add(pz, 32)), and(a, _MO))
            a := shr(128, a)
            let eh := mul(mload(add(pz, 64)), and(a, _ME))
            let oh := mul(mload(add(pz, 96)), and(a, _MO))
            a := mload(pa1)
            el := add(el, mul(mload(add(pz, 0x1000)), and(a, _ME)))
            ol := add(ol, mul(mload(add(pz, 0x1020)), and(a, _MO)))
            a := shr(128, a)
            eh := add(eh, mul(mload(add(pz, 0x1040)), and(a, _ME)))
            oh := add(oh, mul(mload(add(pz, 0x1060)), and(a, _MO)))
            a := mload(pa2)
            el := add(el, mul(mload(add(pz, 0x2000)), and(a, _ME)))
            ol := add(ol, mul(mload(add(pz, 0x2020)), and(a, _MO)))
            a := shr(128, a)
            eh := add(eh, mul(mload(add(pz, 0x2040)), and(a, _ME)))
            oh := add(oh, mul(mload(add(pz, 0x2060)), and(a, _MO)))
            a := mload(pa3)
            el := add(el, mul(mload(add(pz, 0x3000)), and(a, _ME)))
            ol := add(ol, mul(mload(add(pz, 0x3020)), and(a, _MO)))
            a := shr(128, a)
            eh := add(eh, mul(mload(add(pz, 0x3040)), and(a, _ME)))
            oh := add(oh, mul(mload(add(pz, 0x3060)), and(a, _MO)))
            a := mload(pa4)
            el := add(el, mul(mload(add(pz, 0x4000)), and(a, _ME)))
            ol := add(ol, mul(mload(add(pz, 0x4020)), and(a, _MO)))
            a := shr(128, a)
            eh := add(eh, mul(mload(add(pz, 0x4040)), and(a, _ME)))
            oh := add(oh, mul(mload(add(pz, 0x4060)), and(a, _MO)))
            // + q*2^28 (2^60 on the cross lanes) - c . t1
            a := mload(pt)
            el := sub(add(el, _OFFE), mul(mload(add(pz, 0x5000)), and(a, _ME)))
            ol := sub(add(ol, _OFFO), mul(mload(add(pz, 0x5020)), and(a, _MO)))
            mstore(pd, or(and(el, _LN02), and(ol, _LN13)))
            a := shr(128, a)
            eh := sub(add(eh, _OFFE), mul(mload(add(pz, 0x5040)), and(a, _ME)))
            oh := sub(add(oh, _OFFO), mul(mload(add(pz, 0x5060)), and(a, _MO)))
            mstore(add(pd, 32), or(and(eh, _LN02), and(oh, _LN13)))
            pa0 := add(pa0, 32)
            pa1 := add(pa1, 32)
            pa2 := add(pa2, 32)
            pa3 := add(pa3, 32)
            pa4 := add(pa4, 32)
            pt := add(pt, 32)
            pz := add(pz, 128)
        }
    }
}

/// @dev _matvecRowSplit65 reading the key row in place from the calldata (the
///      five A[i][j] are POLY_BYTES65 apart in the key, checkPubKeyCalldata65
///      has validated the shape), with the in-word pass of the inverse
///      transform (t = 1, 2, the first block of nttInvMontPackedRawFusedTb)
///      folded into the output: the two accumulators of a word hold its four
///      raw lanes (lanes 0, 2 in the even one, 1, 3 in the odd one), so the
///      pass takes them from the stack instead of a stored word, forming the
///      lane sums and offset differences on both halves at once, and the rest
///      of the inverse transform (nttInvMontPackedTailTb) starts from the
///      written words. Its four results are produced in place: a twiddle
///      moved to bit 64 (bit 128) with the modulus q << 64 (q << 128,
///      q << 192) makes mulmod / addmod deliver the lane where it goes, so the
///      word is three `or`. Two key words (four output words) per loop body:
///      the t = 1 twiddles are one table word, the t = 2 ones the top half of
///      an unaligned load (_TW_MONT). Same values as the row kernel followed by
///      the full inverse kernel.
/// @param aRowCd calldata offset of the first word of A[i][0]
/// @param t1Cd calldata offset of the first word of t1[i]
/// @param acc the 64-word destination (dilithiumCore2Calldata65 reuses the
///        packed z and c arrays, dead once their transforms are split)
/// @param ti the inverse twiddle table (_tablesMont)
function _matvecRowInvCCalldata65(uint256 aRowCd, uint256 zs, uint256 t1Cd, uint256[] memory acc, uint256 ti) pure {
    assembly ("memory-safe") {
        // one running key pointer: A[i][j] at pa + j * POLY_BYTES65, t1 at pa + dt
        let pa := aRowCd
        let dt := sub(t1Cd, aRowCd)
        let pz := zs
        let pd := add(acc, 32)
        // t = 2 twiddles psirev[64 + 4k .. 4k + 3] of the body's four words: the top
        // 128 bits of the 32 bytes at byte 16k of the section (its words have their
        // halves swapped for this, _TW_MONT); t = 1 twiddles psirev[128 + 8k .. 8k + 7],
        // one table word per body
        let tw0 := add(ti, 256)
        let tw1 := add(ti, 512)
        // 16 bodies of 2 key words: the end of the destination bounds the loop
        for { let end := add(pd, 0x800) } lt(pd, end) {} {
            let w2 := mload(tw0)
            tw0 := add(tw0, 16)
            let w1 := mload(tw1)
            tw1 := add(tw1, 32)
            // key word 2k + 0 of body k: output words 4k + 0 (el, ol) and 4k + 1 (eh, oh)
            {
                let a := calldataload(pa)
                let el := mul(mload(pz), and(a, _ME))
                let ol := mul(mload(add(pz, 0x20)), and(a, _MO))
                a := shr(128, a)
                let eh := mul(mload(add(pz, 0x40)), and(a, _ME))
                let oh := mul(mload(add(pz, 0x60)), and(a, _MO))
                a := calldataload(add(pa, 1056))
                el := add(el, mul(mload(add(pz, 0x1000)), and(a, _ME)))
                ol := add(ol, mul(mload(add(pz, 0x1020)), and(a, _MO)))
                a := shr(128, a)
                eh := add(eh, mul(mload(add(pz, 0x1040)), and(a, _ME)))
                oh := add(oh, mul(mload(add(pz, 0x1060)), and(a, _MO)))
                a := calldataload(add(pa, 2112))
                el := add(el, mul(mload(add(pz, 0x2000)), and(a, _ME)))
                ol := add(ol, mul(mload(add(pz, 0x2020)), and(a, _MO)))
                a := shr(128, a)
                eh := add(eh, mul(mload(add(pz, 0x2040)), and(a, _ME)))
                oh := add(oh, mul(mload(add(pz, 0x2060)), and(a, _MO)))
                a := calldataload(add(pa, 3168))
                el := add(el, mul(mload(add(pz, 0x3000)), and(a, _ME)))
                ol := add(ol, mul(mload(add(pz, 0x3020)), and(a, _MO)))
                a := shr(128, a)
                eh := add(eh, mul(mload(add(pz, 0x3040)), and(a, _ME)))
                oh := add(oh, mul(mload(add(pz, 0x3060)), and(a, _MO)))
                a := calldataload(add(pa, 4224))
                el := add(el, mul(mload(add(pz, 0x4000)), and(a, _ME)))
                ol := add(ol, mul(mload(add(pz, 0x4020)), and(a, _MO)))
                a := shr(128, a)
                eh := add(eh, mul(mload(add(pz, 0x4040)), and(a, _ME)))
                oh := add(oh, mul(mload(add(pz, 0x4060)), and(a, _MO)))
                // + q*2^28 (2^60 on the cross lanes) - c . t1
                a := calldataload(add(pa, dt))
                el := sub(add(el, _OFFE), mul(mload(add(pz, 0x5000)), and(a, _ME)))
                ol := sub(add(ol, _OFFO), mul(mload(add(pz, 0x5020)), and(a, _MO)))
                a := shr(128, a)
                eh := sub(add(eh, _OFFE), mul(mload(add(pz, 0x5040)), and(a, _ME)))
                oh := sub(add(oh, _OFFO), mul(mload(add(pz, 0x5060)), and(a, _MO)))
                {
                    let o := and(shr(64, ol), _LN02)
                    let e := and(el, _LN02)
                    let s := add(e, o)
                    e := sub(add(e, _Q30X2), o)
                    // the t = 1 products land on lane 1 (twiddles at bit 64, modulus q << 64)
                    let d0 :=
                        mulmod(and(e, _L64), and(shl(64, w1), 0xffffffff0000000000000000), 154591407629964779425103872)
                    let d1 :=
                        mulmod(shr(128, e), and(shl(32, w1), 0xffffffff0000000000000000), 154591407629964779425103872)
                    o := and(s, _L64)
                    s := shr(128, s)
                    // the t = 2 twiddle at bit 128: lane 2 from the sums (modulus q << 128), lane 3
                    // from the lane-1 differences (modulus q << 192)
                    e := and(w2, 0xffffffff00000000000000000000000000000000)
                    mstore(
                        pd,
                        or(
                            or(addmod(o, s, 8380417), addmod(d0, d1, 154591407629964779425103872)),
                            or(
                                mulmod(
                                    sub(add(o, 17996808470921216), s),
                                    e,
                                    2851708132544470355162343437489516659345457152
                                ),
                                mulmod(
                                    sub(add(d0, 154591407629964779425103872), d1),
                                    e,
                                    52604730093964041046822434890669722163833253306828950720460357632
                                )
                            )
                        )
                    )
                }
                {
                    let o := and(shr(64, oh), _LN02)
                    let e := and(eh, _LN02)
                    let s := add(e, o)
                    e := sub(add(e, _Q30X2), o)
                    // the t = 1 products land on lane 1 (twiddles at bit 64, modulus q << 64)
                    let d0 := mulmod(and(e, _L64), and(w1, 0xffffffff0000000000000000), 154591407629964779425103872)
                    let d1 :=
                        mulmod(shr(128, e), and(shr(32, w1), 0xffffffff0000000000000000), 154591407629964779425103872)
                    o := and(s, _L64)
                    s := shr(128, s)
                    // the t = 2 twiddle at bit 128: lane 2 from the sums (modulus q << 128), lane 3
                    // from the lane-1 differences (modulus q << 192)
                    e := and(shr(32, w2), 0xffffffff00000000000000000000000000000000)
                    mstore(
                        add(pd, 32),
                        or(
                            or(addmod(o, s, 8380417), addmod(d0, d1, 154591407629964779425103872)),
                            or(
                                mulmod(
                                    sub(add(o, 17996808470921216), s),
                                    e,
                                    2851708132544470355162343437489516659345457152
                                ),
                                mulmod(
                                    sub(add(d0, 154591407629964779425103872), d1),
                                    e,
                                    52604730093964041046822434890669722163833253306828950720460357632
                                )
                            )
                        )
                    )
                }
            }
            // key word 2k + 1 of body k: output words 4k + 2 (el, ol) and 4k + 3 (eh, oh)
            {
                let a := calldataload(add(pa, 32))
                let el := mul(mload(add(pz, 0x80)), and(a, _ME))
                let ol := mul(mload(add(pz, 0xa0)), and(a, _MO))
                a := shr(128, a)
                let eh := mul(mload(add(pz, 0xc0)), and(a, _ME))
                let oh := mul(mload(add(pz, 0xe0)), and(a, _MO))
                a := calldataload(add(pa, 1088))
                el := add(el, mul(mload(add(pz, 0x1080)), and(a, _ME)))
                ol := add(ol, mul(mload(add(pz, 0x10a0)), and(a, _MO)))
                a := shr(128, a)
                eh := add(eh, mul(mload(add(pz, 0x10c0)), and(a, _ME)))
                oh := add(oh, mul(mload(add(pz, 0x10e0)), and(a, _MO)))
                a := calldataload(add(pa, 2144))
                el := add(el, mul(mload(add(pz, 0x2080)), and(a, _ME)))
                ol := add(ol, mul(mload(add(pz, 0x20a0)), and(a, _MO)))
                a := shr(128, a)
                eh := add(eh, mul(mload(add(pz, 0x20c0)), and(a, _ME)))
                oh := add(oh, mul(mload(add(pz, 0x20e0)), and(a, _MO)))
                a := calldataload(add(pa, 3200))
                el := add(el, mul(mload(add(pz, 0x3080)), and(a, _ME)))
                ol := add(ol, mul(mload(add(pz, 0x30a0)), and(a, _MO)))
                a := shr(128, a)
                eh := add(eh, mul(mload(add(pz, 0x30c0)), and(a, _ME)))
                oh := add(oh, mul(mload(add(pz, 0x30e0)), and(a, _MO)))
                a := calldataload(add(pa, 4256))
                el := add(el, mul(mload(add(pz, 0x4080)), and(a, _ME)))
                ol := add(ol, mul(mload(add(pz, 0x40a0)), and(a, _MO)))
                a := shr(128, a)
                eh := add(eh, mul(mload(add(pz, 0x40c0)), and(a, _ME)))
                oh := add(oh, mul(mload(add(pz, 0x40e0)), and(a, _MO)))
                // + q*2^28 (2^60 on the cross lanes) - c . t1
                a := calldataload(add(add(pa, dt), 32))
                el := sub(add(el, _OFFE), mul(mload(add(pz, 0x5080)), and(a, _ME)))
                ol := sub(add(ol, _OFFO), mul(mload(add(pz, 0x50a0)), and(a, _MO)))
                a := shr(128, a)
                eh := sub(add(eh, _OFFE), mul(mload(add(pz, 0x50c0)), and(a, _ME)))
                oh := sub(add(oh, _OFFO), mul(mload(add(pz, 0x50e0)), and(a, _MO)))
                {
                    let o := and(shr(64, ol), _LN02)
                    let e := and(el, _LN02)
                    let s := add(e, o)
                    e := sub(add(e, _Q30X2), o)
                    // the t = 1 products land on lane 1 (twiddles at bit 64, modulus q << 64)
                    let d0 :=
                        mulmod(and(e, _L64), and(shr(64, w1), 0xffffffff0000000000000000), 154591407629964779425103872)
                    let d1 :=
                        mulmod(shr(128, e), and(shr(96, w1), 0xffffffff0000000000000000), 154591407629964779425103872)
                    o := and(s, _L64)
                    s := shr(128, s)
                    // the t = 2 twiddle at bit 128: lane 2 from the sums (modulus q << 128), lane 3
                    // from the lane-1 differences (modulus q << 192)
                    e := and(shr(64, w2), 0xffffffff00000000000000000000000000000000)
                    mstore(
                        add(pd, 64),
                        or(
                            or(addmod(o, s, 8380417), addmod(d0, d1, 154591407629964779425103872)),
                            or(
                                mulmod(
                                    sub(add(o, 17996808470921216), s),
                                    e,
                                    2851708132544470355162343437489516659345457152
                                ),
                                mulmod(
                                    sub(add(d0, 154591407629964779425103872), d1),
                                    e,
                                    52604730093964041046822434890669722163833253306828950720460357632
                                )
                            )
                        )
                    )
                }
                {
                    let o := and(shr(64, oh), _LN02)
                    let e := and(eh, _LN02)
                    let s := add(e, o)
                    e := sub(add(e, _Q30X2), o)
                    // the t = 1 products land on lane 1 (twiddles at bit 64, modulus q << 64)
                    let d0 :=
                        mulmod(and(e, _L64), and(shr(128, w1), 0xffffffff0000000000000000), 154591407629964779425103872)
                    let d1 :=
                        mulmod(shr(128, e), and(shr(160, w1), 0xffffffff0000000000000000), 154591407629964779425103872)
                    o := and(s, _L64)
                    s := shr(128, s)
                    // the t = 2 twiddle at bit 128: lane 2 from the sums (modulus q << 128), lane 3
                    // from the lane-1 differences (modulus q << 192)
                    e := and(shr(96, w2), 0xffffffff00000000000000000000000000000000)
                    mstore(
                        add(pd, 96),
                        or(
                            or(addmod(o, s, 8380417), addmod(d0, d1, 154591407629964779425103872)),
                            or(
                                mulmod(
                                    sub(add(o, 17996808470921216), s),
                                    e,
                                    2851708132544470355162343437489516659345457152
                                ),
                                mulmod(
                                    sub(add(d0, 154591407629964779425103872), d1),
                                    e,
                                    52604730093964041046822434890669722163833253306828950720460357632
                                )
                            )
                        )
                    )
                }
            }
            pa := add(pa, 64)
            pz := add(pz, 256)
            pd := add(pd, 128)
        }
    }
}

/// @dev acc = A[i][0..4] . zHat[0..4] + q*2^28 - cHat . t1i, packed raw lanes,
///      from the packed operands (reference form, used by the tests): one lane
///      split then the split kernel. dilithiumCore2Packed65 splits once for the
///      six rows instead.
function _matvecRowPacked65(
    uint256[][] memory aRow,
    uint256[][] memory zHat,
    uint256[] memory cHat,
    uint256[] memory t1i
) pure returns (uint256[] memory acc) {
    acc = _matvecRowSplit65(aRow, _splitLanes65(zHat, cHat), t1i);
}

/// @dev six 256-bit hint masks (bit j of mask i = h[i][j]) from the expanded
///      0/1 hint arrays of unpackH65 (reference form, used by the tests)
function _hintMasks65(uint256[][] memory h) pure returns (uint256[6] memory masks) {
    if (h.length != 6) revert BadLength();
    for (uint256 i = 0; i < 6; i++) {
        uint256[] memory hi = h[i];
        if (hi.length != 256) revert BadLength();
        uint256 m;
        assembly ("memory-safe") {
            let p := add(hi, 32)
            for { let j := 0 } lt(j, 256) { j := add(j, 1) } {
                m := or(m, shl(j, and(mload(add(p, shl(5, j))), 1)))
            }
        }
        masks[i] = m;
    }
}

/// @notice w1Encode(UseHint(h, w)), FIPS 204, ML-DSA-65 (gamma2 = (q-1)/32,
///         4 bits per coefficient): 768 bytes, the same bytes as the scalar
///         useHintDilithium65 (ZKNOX_dilithium65_core.sol).
///         Per lane, a1 = floor((r + gamma2 - 1) / (2 gamma2)) mod 16 is one
///         multiply by ceil(2^48 / (2 gamma2)) and a shift (exact for every
///         r < q, lane products < 2^53), and the four 4-bit values of a word
///         go to their two big-endian bytes by one multiply whose other copies
///         all land below the kept bits (the packing constant _W1K65 moves lane
///         k to bits 248, 252, 240, 244; the next words of a group of four use
///         the same constant shifted by 16, 32 and 48 bits, their copies all
///         staying below bit 192). Both are checked exhaustively / at random
///         against the shift-and-mask forms (pythonref-free model, see
///         VERSION.md). Four words per iteration, one 8-byte store.
/// @param masks hint masks, bit j of masks[i] = h[i][j] (_hintMasksFromBytes65 / _hintMasks65)
/// @param w 6 packed polynomials, canonical lanes
function useHintPacked65(uint256[6] memory masks, uint256[][] memory w) pure returns (bytes memory hint) {
    // 768 bytes of output; each group of four words' eight bytes are written by
    // one 32-byte store whose 24 trailing zero bytes are overwritten by the next
    // groups, so the buffer carries 32 spare bytes and is trimmed
    hint = new bytes(800);
    assembly ("memory-safe") {
        mstore(hint, 768)
    }
    for (uint256 i = 0; i < 6; i++) {
        uint256[] memory wi = w[i];
        if (wi.length != 64) revert BadLength();
        uint256 hm = masks[i];
        assembly ("memory-safe") {
            // UseHint on the hinted lanes of one word, lane-parallel (FIPS 204
            // Alg. 40: +1 where a0 > 0, -1 elsewhere, mod 16, the mod being the
            // 4-bit lane mask); at most 55 of the 1,536 coefficients carry a
            // hint, so it runs only for the pairs that need it
            function adj(T, r, hb) -> U {
                // D = r + 2g2 - a1 * 2g2 in [g2, 3g2]; a0 > 0 <=> 2g2 < D <= 2g2 + (q-1)/2
                let D := sub(add(r, _R2G2_65), mul(T, 523776))
                let pos := and(shr(40, and(add(D, _C1_65), _R2_40_65)), shr(40, and(sub(_C2_65, D), _R2_40_65)))
                // the hint bits spread to full-lane masks; +1 where pos, +15 elsewhere
                let H := mul(and(mul(hb, _SPREADH65), _R1_65), 0xffffffffffffffff)
                U := and(add(T, and(H, sub(_R15_65, mul(pos, 14)))), _M4X4)
            }
            let p := add(wi, 32)
            let o := add(add(hint, 32), shl(7, i))
            for { let pe := add(p, 0x800) } lt(p, pe) { p := add(p, 128) } {
                let r0 := mload(p)
                let r1 := mload(add(p, 32))
                let r2 := mload(add(p, 64))
                let r3 := mload(add(p, 96))
                // a1 = floor((r + gamma2 - 1) / (2 gamma2)) & 15 (the & 15 folds 16 -> 0)
                let T0 := and(shr(48, mul(add(r0, _RG2M1_65), _MDIV65)), _M4X4)
                let T1 := and(shr(48, mul(add(r1, _RG2M1_65), _MDIV65)), _M4X4)
                let T2 := and(shr(48, mul(add(r2, _RG2M1_65), _MDIV65)), _M4X4)
                let T3 := and(shr(48, mul(add(r3, _RG2M1_65), _MDIV65)), _M4X4)
                // hint bits of the sixteen coefficients (the mask is consumed 16 bits
                // per group of four words); only the words that carry one are adjusted
                if and(hm, 0xffff) {
                    if and(hm, 15) { T0 := adj(T0, r0, and(hm, 15)) }
                    if and(hm, 240) { T1 := adj(T1, r1, and(shr(4, hm), 15)) }
                    if and(hm, 0xf00) { T2 := adj(T2, r2, and(shr(8, hm), 15)) }
                    if and(hm, 0xf000) { T3 := adj(T3, r3, and(shr(12, hm), 15)) }
                }
                hm := shr(16, hm)
                // the sixteen 4-bit values to eight big-endian bytes at the top of the word
                mstore(
                    o,
                    and(
                        or(
                            or(mul(T0, _W1K65), mul(T1, shr(16, _W1K65))),
                            or(mul(T2, shr(32, _W1K65)), mul(T3, shr(48, _W1K65)))
                        ),
                        _TOP64
                    )
                )
                o := add(o, 8)
            }
        }
    }
}

/// @notice Second stage of the ML-DSA-65 verification on the packed layout:
///         w1 bytes of UseHint(h, A.z - c.t1) for the challenge hash.
/// @param pk public key, A (6 x 5) and t1 (6) in their stored compact form (NTT domain)
/// @param zp response vector, 5 PACKED polynomials with lanes < 2q (unpackZPacked65
///        or its lazy form); used as scratch (left in the state of the first two
///        forward passes)
/// @param c challenge polynomial, PACKED canonical (sampleInBallFastTau(., 49, .), or
///        packPoly of an expanded one); used as scratch likewise
/// @param hintMasks the six hint masks (dilithiumCore1Packed65 / _parseHintBytes65)
function dilithiumCore2Packed65(
    PubKey memory pk,
    uint256[][] memory zp,
    uint256[] memory c,
    uint256[6] memory hintMasks
) pure returns (bytes memory wPrimeBytes) {
    // the twiddle tables are copied from code once for the twelve transforms
    (uint256 tb, uint256 ti) = _tablesMont();
    // the six forward transforms write their last pass straight into the lane
    // split of the matvec kernel (6 x 128 words, cHat last), no split pass
    uint256 zs;
    assembly ("memory-safe") {
        zs := mload(0x40)
        mstore(0x40, add(zs, 0x6000))
    }
    for (uint256 j = 0; j < 5; j++) {
        nttFwMontPackedFusedTbSplit(zp[j], tb, zs + (j << 12));
    }
    nttFwMontPackedFusedTbSplit(c, tb, zs + 0x5000);
    uint256[][] memory w = new uint256[][](6);
    for (uint256 i = 0; i < 6; i++) {
        w[i] = nttInvMontPackedRawFusedTb(_matvecRowSplit65(pk.aHat[i], zs, pk.t1[i]), ti);
    }
    wPrimeBytes = useHintPacked65(hintMasks, w);
}

/// @notice dilithiumCore2Packed65 on the expanded public key left in the
///         calldata (checkPubKeyCalldata65 first): no copy of the 38,112
///         bytes, the matvec rows read A and t1 in place.
/// @param key the expanded public key (KEY_BYTES65 bytes, shape checked by the caller)
function dilithiumCore2Calldata65(
    bytes calldata key,
    uint256[][] memory zp,
    uint256[] memory c,
    uint256[6] memory hintMasks
) pure returns (bytes memory wPrimeBytes) {
    (uint256 tb, uint256 ti) = _tablesMont();
    uint256 zs;
    assembly ("memory-safe") {
        zs := mload(0x40)
        mstore(0x40, add(zs, 0x6000))
    }
    for (uint256 j = 0; j < 5; j++) {
        nttFwMontPackedFusedTbSplit(zp[j], tb, zs + (j << 12));
    }
    nttFwMontPackedFusedTbSplit(c, tb, zs + 0x5000);
    // the six rows land in the packed z and c arrays, dead since the split
    uint256[][] memory w = new uint256[][](6);
    for (uint256 i = 0; i < 5; i++) {
        w[i] = zp[i];
    }
    w[5] = c;
    uint256 aRow;
    uint256 t1;
    assembly ("memory-safe") {
        aRow := add(key.offset, 32)
        t1 := add(key.offset, add(mul(30, POLY_BYTES65), 32))
    }
    for (uint256 i = 0; i < 6; i++) {
        _matvecRowInvCCalldata65(aRow, zs, t1, w[i], ti);
        nttInvMontPackedTailTb(w[i], ti);
        unchecked {
            aRow += 5 * POLY_BYTES65;
            t1 += POLY_BYTES65;
        }
    }
    wPrimeBytes = useHintPacked65(hintMasks, w);
}
