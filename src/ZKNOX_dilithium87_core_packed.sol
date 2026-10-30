// SPDX-License-Identifier: MIT
// Copyright (C) 2026 - ZKNOX
// License: This software is licensed under MIT License
// This Code may be reused including this header, license and copyright notice.
// FILE: ZKNOX_dilithium87_core_packed.sol
// Description: ML-DSA-87 (FIPS 204, k = 8, l = 7) verification stages on the
// packed 4x64-bit-lane layout of ZKNOX_dilithium_core_packed.sol.
//
//   zHat_j = nttFwMontPacked(z_j)          j < 7, lazy lanes < 17q
//   cHat   = nttFwMontPacked(c)
//   acc_i  = sum_j A_ij o zHat_j + q*2^28 - cHat o t1_i      i < 8, raw lanes
//   w_i    = nttInvMontPackedRaw(acc_i)     canonical lanes
//   w1     = useHintPacked87(h, w)          1024 bytes, FIPS 204 w1Encode
//
// ML-DSA-87 has the gamma1 and gamma2 of ML-DSA-65, so the z decoder (20-bit
// fields), the lane split, the matvec masks and offsets and the whole UseHint /
// w1Encode kernel are those of ZKNOX_dilithium65_core_packed.sol, whose
// constants are imported. What changes:
//   - z: seven polynomials (4480 bytes), bound beta = 120, i.e.
//     f in [121, 1048455] (||z||inf < gamma1 - beta = 524168, FIPS 204 Alg. 3);
//   - key: 56 polynomials of A plus 8 of t1, 67,680 bytes with tr;
//   - matvec: seven columns. Lane bound: 7 lazy lanes (< 17q) times fields
//     (< q) plus the q*2^28 offset < 119 q^2 + q*2^28 < 1.061e16, ABOVE
//     q*2^30 = 8.998e15, the offset the inverse transform's first pass of
//     ML-DSA-44 / -65 applies (68 q^2 + q*2^28 and 85 q^2 + q*2^28 fit under
//     it, 119 q^2 + q*2^28 does not). The folded first pass of this file
//     (_matvecRowInvCCalldata87) therefore uses q*2^31 for the lane
//     differences and q*2^32 for the differences of the lane sums (sums
//     < 2.13e16 < q*2^32 = 3.6e16, everything < 2^56 inside a 64-bit lane);
//     the reduction after it is mod q, so the rest of the inverse transform
//     (nttInvMontPackedTailTb) is unchanged. The memory reference path, which
//     feeds the shared nttInvMontPackedRawFusedTb (q*2^30 offset), reduces the
//     rows mod q first (dilithiumCore2Packed87). Cross-product lanes: 14
//     products added to their 2^60 offset and 2 subtracted, each sum < 2^55,
//     so they neither wrap nor borrow (< 2^61 in a 64-bit lane);
//   - hints: 83 bytes (omega = 75, k = 8), eight masks;
//   - w1: eight polynomials, 1024 bytes;
//   - c~: 64 bytes, tau = 60 (sampleInBallFastTau, ZKNOX_shake_fast.sol).
pragma solidity ^0.8.25;

import {PubKey, Signature} from "./ZKNOX_dilithium_utils.sol";
import {
    nttFwMontPackedFusedTbSplit,
    nttInvMontPackedRawFusedTb,
    nttInvMontPackedTailTb,
    _tablesMont
} from "./ZKNOX_NTT_dilithium_mont.sol";
import {BadPubKeyBlob, BadLength} from "./ZKNOX_dilithium_core_packed.sol";
import {
    _L64,
    _LN0,
    _LN1,
    _ZS1,
    _ZS3,
    _ME,
    _MO,
    _LN02,
    _LN13,
    _OFFE,
    _OFFO,
    _RG2M1_65,
    _MDIV65,
    _M4X4,
    _W1K65,
    _R2G2_65,
    _C1_65,
    _C2_65,
    _R2_40_65,
    _R1_65,
    _R15_65,
    _SPREADH65,
    _TOP64,
    _M20X4,
    _ZME65,
    _ZMO65,
    _ZCE65,
    _ZCO65,
    _B24,
    _ZQG1_65,
    _ZCAN
} from "./ZKNOX_dilithium65_core_packed.sol";

// q*2^31 on lanes 0 and 2: the offset of the lane differences in the folded
// first inverse pass (raw lanes < 1.061e16 < q*2^31 = 1.800e16)
uint256 constant _Q31X2 = 0x0000000000000000003ff000800000000000000000000000003ff00080000000;
// unpackZPacked87 bounds (per 64-bit lane): accepted iff f in
// [beta + 1, 2 gamma1 - beta - 1] = [121, 1048455], i.e. bit 24 of both
// f + 2^24 - 121 and 2^24 + 1048455 - f stays set
uint256 constant _ZLO87 = 0x0000000000ffff870000000000ffff870000000000ffff870000000000ffff87;
uint256 constant _ZHI87 = 0x00000000010fff8700000000010fff8700000000010fff8700000000010fff87;

// One polynomial of the expanded key as it is laid out: a length word of 32,
// then its 32 words, used in place as a uint256[32]
// (ZKNOX_dilithium_core_packed.sol). Literals, so that inline assembly can use
// them; test/dilithium87_key.t.sol checks they agree.
uint256 constant POLY_BYTES87 = 1056;
uint256 constant KEY_POLYS87 = 64; // 56 of A plus 8 of t1
uint256 constant KEY_BYTES87 = 67680; // KEY_POLYS87 * POLY_BYTES87 + 96, tr included

/// @notice Read of the expanded public key from the calldata. Nothing is stored
///         on chain: the caller passes the key on every verification and binds
///         it to an account with keccak256 (DECISIONS.md ADR-007, ADR-012).
///
///         The key is one flat run of 67,680 bytes: polynomial f at offset
///         f * POLY_BYTES87, f < 56 being A[f / 7][f % 7] and f >= 56
///         t1[f - 56], then tr as [64][64 bytes]. This reference form (used by
///         the tests) copies it once into memory and uses it in place from
///         there; the verifier keeps the key in the calldata instead
///         (checkPubKeyCalldata87, then dilithiumCore2Calldata87 reads A and
///         t1 with calldataload). The only shape accepted is that exact length
///         with a length word of 32 before every polynomial and 64 before tr;
///         the bytes are never trusted beyond that.
function readPubKeyCalldata87(bytes calldata key) pure returns (PubKey memory pk) {
    uint256[][][] memory aHat = new uint256[][][](8);
    for (uint256 i = 0; i < 8; i++) {
        aHat[i] = new uint256[][](7);
    }
    uint256[][] memory t1 = new uint256[][](8);
    bytes memory tr;
    bool ok = key.length == KEY_BYTES87;
    if (ok) {
        assembly ("memory-safe") {
            let base := mload(0x40)
            calldatacopy(base, key.offset, KEY_BYTES87)
            mstore(0x40, add(base, KEY_BYTES87)) // KEY_BYTES87 is a multiple of 32
            for { let f := 0 } lt(f, KEY_POLYS87) { f := add(f, 1) } {
                let p := add(base, mul(f, POLY_BYTES87))
                ok := and(ok, eq(mload(p), 32))
                switch lt(f, 56)
                // A[f / 7][f % 7]
                case 1 {
                    let row := mload(add(aHat, add(32, shl(5, div(f, 7)))))
                    mstore(add(row, add(32, shl(5, mod(f, 7)))), p)
                }
                // t1[f - 56]
                default { mstore(add(t1, add(32, shl(5, sub(f, 56)))), p) }
            }
            // tr: [64][64 bytes], used as a bytes memory object in place
            let t := add(base, mul(KEY_POLYS87, POLY_BYTES87))
            ok := and(ok, eq(mload(t), 64))
            tr := t
        }
    }
    if (!ok) revert BadPubKeyBlob();
    pk = PubKey({aHat: aHat, tr: tr, t1: t1});
}

/// @notice Shape check of the expanded public key in the calldata, the rule of
///         readPubKeyCalldata87 without the copy: exactly KEY_BYTES87 bytes, a
///         length word of 32 before every polynomial and 64 before tr. The
///         calldata path of the verifier (dilithiumCore2Calldata87) reads the
///         key in place after this check.
function checkPubKeyCalldata87(bytes calldata key) pure returns (bool ok) {
    ok = key.length == KEY_BYTES87;
    if (ok) {
        assembly ("memory-safe") {
            // the 64 length words of 32, four per iteration, then tr's 64
            let p := key.offset
            let bad := 0
            for { let e := add(p, mul(KEY_POLYS87, POLY_BYTES87)) } lt(p, e) { p := add(p, mul(4, POLY_BYTES87)) } {
                bad := or(
                    bad,
                    or(
                        or(xor(calldataload(p), 32), xor(calldataload(add(p, POLY_BYTES87)), 32)),
                        or(
                            xor(calldataload(add(p, mul(2, POLY_BYTES87))), 32),
                            xor(calldataload(add(p, mul(3, POLY_BYTES87))), 32)
                        )
                    )
                )
            }
            ok := iszero(or(bad, xor(calldataload(p), 64)))
        }
    }
}

/// @dev the 83-byte HintBitUnpack encoding (FIPS 204 Alg. 21, omega = 75,
///      k = 8) in one scan: validity (per-polynomial cumulative counts
///      non-decreasing and <= omega, indices strictly increasing inside a
///      polynomial, unused index bytes zero), total weight, and the eight
///      256-bit hint masks (bit j of mask i = h[i][j]).
function _parseHintBytes87(bytes memory hBytes) pure returns (bool ok, uint256 count, uint256[8] memory masks) {
    if (hBytes.length != 83) return (false, 0, masks);
    assembly ("memory-safe") {
        let base := add(hBytes, 32)
        let kIdx := 0
        ok := 1
        for { let i := 0 } lt(i, 8) { i := add(i, 1) } {
            let omegaVal := byte(0, mload(add(base, add(75, i))))
            if or(lt(omegaVal, kIdx), gt(omegaVal, 75)) { ok := 0 }
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
        for { let j := kIdx } lt(j, 75) { j := add(j, 32) } {
            let n := sub(75, j)
            let z := mload(add(base, j))
            if lt(n, 32) { z := shr(sub(256, shl(3, n)), z) }
            if z { ok := 0 }
        }
        count := kIdx
    }
}

/// @dev validation only (reference form for the tests)
function _checkHintBytes87(bytes memory hBytes) pure returns (bool ok, uint256 count) {
    (ok, count,) = _parseHintBytes87(hBytes);
}

/// @dev the eight masks straight from a VALIDATED encoding (reference form for the tests)
function _hintMasksFromBytes87(bytes memory hBytes) pure returns (uint256[8] memory masks) {
    (,, masks) = _parseHintBytes87(hBytes);
}

/// @notice Decode of the 4480-byte z region (seven polynomials of 20-bit
///         fields, little-endian bit packing) straight into the packed layout,
///         with the strict norm check ||z||inf < gamma1 - beta (FIPS 204 Alg. 3).
///         The decoder of unpackZPacked65 (four fields per 10-byte group and
///         packed word, two groups read as one byte-reversed word, split into
///         lanes by two multiplies) with the ML-DSA-87 bounds.
/// @return zp 7 packed polynomials, canonical lanes (same values as unpackZ87)
/// @return normOk true iff every coefficient satisfies the strict bound
function unpackZPacked87(bytes memory zBytes) pure returns (uint256[][] memory zp, bool normOk) {
    (zp, normOk) = _unpackZPacked87(zBytes, true);
}

/// @notice unpackZPacked87 with LAZY lanes: q + gamma1 - f in (0, 2q), congruent
///         to the canonical z, which is all the forward transform needs (its
///         lazy bounds hold for lanes < 2q; the verifier's stage 1 uses this
///         form, dilithiumCore1Packed87).
function unpackZPackedLazy87(bytes memory zBytes) pure returns (uint256[][] memory zp, bool normOk) {
    (zp, normOk) = _unpackZPacked87(zBytes, false);
}

/// @dev the decoder: `canonical` selects the conditional subtraction of q
function _unpackZPacked87(bytes memory zBytes, bool canonical) pure returns (uint256[][] memory zp, bool normOk) {
    if (zBytes.length != 4480) revert BadLength();
    zp = new uint256[][](7);
    for (uint256 i = 0; i < 7; i++) {
        zp[i] = new uint256[](64);
    }
    uint256 good;
    assembly ("memory-safe") {
        good := not(0)
        let src := add(zBytes, 32)
        for { let i := 0 } lt(i, 7) { i := add(i, 1) } {
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
                    // f >= 121 and f <= 1048455: bit 24 of each lane of both (f + 2^24 - lo) and
                    // (2^24 + hi - f) stays set; the lanes' bits 24 are checked once at the end
                    good := and(good, and(add(V, _ZLO87), sub(_ZHI87, V)))
                    // z = q + gamma1 - f, minus q where that is >= q (canonical only)
                    V := sub(_ZQG1_65, V)
                    if canonical { V := sub(V, mul(shr(24, and(add(V, _ZCAN), _B24)), 8380417)) }
                    mstore(dst, V)
                }
                {
                    w := shr(80, w)
                    let V := and(or(mul(and(w, _ZME65), _ZCE65), mul(and(w, _ZMO65), _ZCO65)), _M20X4)
                    good := and(good, and(add(V, _ZLO87), sub(_ZHI87, V)))
                    V := sub(_ZQG1_65, V)
                    if canonical { V := sub(V, mul(shr(24, and(add(V, _ZCAN), _B24)), 8380417)) }
                    mstore(add(dst, 32), V)
                }
            }
        }
    }
    normOk = (good & _B24) == _B24;
}

/// @dev unpackZPackedLazy87 reading the z bytes in place from the calldata (the
///      verifier's form, dilithiumCore1PackedCalldata87): same decoder,
///      calldataload for mload, lazy lanes only
function _unpackZPackedLazyCalldata87(bytes calldata zBytes) pure returns (uint256[][] memory zp, bool normOk) {
    if (zBytes.length != 4480) revert BadLength();
    zp = new uint256[][](7);
    for (uint256 i = 0; i < 7; i++) {
        zp[i] = new uint256[](64);
    }
    uint256 good;
    assembly ("memory-safe") {
        good := not(0)
        let src := zBytes.offset
        for { let i := 0 } lt(i, 7) { i := add(i, 1) } {
            let dst := add(mload(add(zp, add(32, shl(5, i)))), 32)
            // 32 pairs of groups per polynomial: 20 bytes read as one word (the
            // last read runs 12 bytes past the region into the hints, only the
            // top 20 are used) and byte-reversed once
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
                    let V := and(or(mul(and(w, _ZME65), _ZCE65), mul(and(w, _ZMO65), _ZCO65)), _M20X4)
                    // f >= 121 and f <= 1048455, checked on the lanes' bits 24 at the end
                    good := and(good, and(add(V, _ZLO87), sub(_ZHI87, V)))
                    // z = q + gamma1 - f, lazy (in (0, 2q))
                    V := sub(_ZQG1_65, V)
                    mstore(dst, V)
                }
                {
                    w := shr(80, w)
                    let V := and(or(mul(and(w, _ZME65), _ZCE65), mul(and(w, _ZMO65), _ZCO65)), _M20X4)
                    good := and(good, and(add(V, _ZLO87), sub(_ZHI87, V)))
                    V := sub(_ZQG1_65, V)
                    mstore(add(dst, 32), V)
                }
            }
        }
    }
    normOk = (good & _B24) == _B24;
}

/// @notice First stage of the ML-DSA-87 verification on the packed layout:
///         hint encoding validated (and its weight bounded by omega = 75), z
///         decoded packed (lazy lanes in (0, 2q), unpackZPackedLazy87) with its
///         norm checked; false means reject.
function dilithiumCore1Packed87(Signature memory signature)
    pure
    returns (bool ok, uint256[][] memory zp, uint256[8] memory hintMasks)
{
    // the weight bound (<= omega = 75) is enforced by the parser on every cumulative count
    (bool hOk,, uint256[8] memory masks) = _parseHintBytes87(signature.h);
    if (!hOk) return (false, zp, masks);
    bool normOk;
    (zp, normOk) = unpackZPackedLazy87(signature.z);
    ok = normOk;
    hintMasks = masks;
}

/// @notice dilithiumCore1Packed87 on the signature left in the calldata: the
///         hint bytes are parsed from a copy (83 bytes), z is decoded in place
///         (_unpackZPackedLazyCalldata87), so the 4,480 bytes are never copied.
/// @param signature the 4627-byte signature, c~ (64) || z (4480) || h (83)
function dilithiumCore1PackedCalldata87(bytes calldata signature)
    pure
    returns (bool ok, uint256[][] memory zp, uint256[8] memory hintMasks)
{
    // the weight bound (<= omega = 75) is enforced by the parser on every cumulative count
    (bool hOk,, uint256[8] memory masks) = _parseHintBytes87(signature[4544:4627]);
    if (!hOk) return (false, zp, masks);
    bool normOk;
    (zp, normOk) = _unpackZPackedLazyCalldata87(signature[64:4544]);
    ok = normOk;
    hintMasks = masks;
}

/// @dev Lane split of the seven transformed z and of cHat for the matvec
///      kernel: 8 x 128 contiguous words at the returned pointer, polynomial j
///      at zs + j * 0x1000 (j = 7 is cHat), each packed word of coefficients
///      4m..4m+3 split into an even word (c0 at 0, c2 at 64) and an odd word
///      (c1 at 32, c3 at 96) as in _splitLanes65. Reference form (tests and
///      the memory path); the verifier's forward transforms write the split
///      directly (nttFwMontPackedFusedTbSplit). Shapes are NOT checked:
///      callers pass seven 64-word packed polynomials and a 64-word cHat.
function _splitLanes87(uint256[][] memory zHat, uint256[] memory cHat) pure returns (uint256 zs) {
    assembly ("memory-safe") {
        zs := mload(0x40)
        mstore(0x40, add(zs, 0x8000))
        let d := zs
        for { let j := 0 } lt(j, 8) { j := add(j, 1) } {
            let src := add(cHat, 32)
            if lt(j, 7) { src := add(mload(add(zHat, add(32, shl(5, j)))), 32) }
            for { let e := add(src, 0x800) } lt(src, e) { src := add(src, 32) } {
                let z := mload(src)
                mstore(d, or(and(z, _LN0), and(shr(64, z), _LN1)))
                mstore(add(d, 32), or(and(shr(32, z), _ZS1), and(shr(96, z), _ZS3)))
                d := add(d, 64)
            }
        }
    }
}

/// @dev acc = A[i][0..6] . zHat[0..6] + q*2^28 - cHat . t1i, packed RAW lanes,
///      on the lane split of _splitLanes87 (the kernel of _matvecRowSplit65
///      with seven columns). Wanted lanes < 7 * 17q * q + q*2^28 < 1.061e16:
///      NOT under the q*2^30 that nttInvMontPackedRawFusedTb assumes (see the
///      file header); dilithiumCore2Packed87 reduces them first, the verifier
///      uses the folded kernel (_matvecRowInvCCalldata87) instead. The
///      cross-product lanes carry 2^60 so that the c . t1 subtraction never
///      borrows (14 cross products added, 2 subtracted, both sums < 2^55),
///      masked out on the merge. The key row is addressed through its array
///      of pointers at every column (reference code: fewer live variables
///      than seven running pointers). Shapes are NOT checked: seven 32-word
///      key polynomials, a 32-word t1 and the split of seven 64-word packed z
///      and a packed c.
/// @param zs the lane split (_splitLanes87): 8 x 128 words, cHat last
function _matvecRowSplit87(uint256[][] memory aRow, uint256 zs, uint256[] memory t1i)
    pure
    returns (uint256[] memory acc)
{
    acc = new uint256[](64);
    assembly ("memory-safe") {
        // word offset inside a key polynomial (data starts 32 bytes in)
        let off := 32
        let pz := zs
        let pd := add(acc, 32)
        for { let e := add(pd, 0x800) } lt(pd, e) { pd := add(pd, 64) } {
            let a := mload(add(mload(add(aRow, 32)), off))
            let el := mul(mload(pz), and(a, _ME))
            let ol := mul(mload(add(pz, 0x20)), and(a, _MO))
            a := shr(128, a)
            let eh := mul(mload(add(pz, 0x40)), and(a, _ME))
            let oh := mul(mload(add(pz, 0x60)), and(a, _MO))
            a := mload(add(mload(add(aRow, 64)), off))
            el := add(el, mul(mload(add(pz, 0x1000)), and(a, _ME)))
            ol := add(ol, mul(mload(add(pz, 0x1020)), and(a, _MO)))
            a := shr(128, a)
            eh := add(eh, mul(mload(add(pz, 0x1040)), and(a, _ME)))
            oh := add(oh, mul(mload(add(pz, 0x1060)), and(a, _MO)))
            a := mload(add(mload(add(aRow, 96)), off))
            el := add(el, mul(mload(add(pz, 0x2000)), and(a, _ME)))
            ol := add(ol, mul(mload(add(pz, 0x2020)), and(a, _MO)))
            a := shr(128, a)
            eh := add(eh, mul(mload(add(pz, 0x2040)), and(a, _ME)))
            oh := add(oh, mul(mload(add(pz, 0x2060)), and(a, _MO)))
            a := mload(add(mload(add(aRow, 128)), off))
            el := add(el, mul(mload(add(pz, 0x3000)), and(a, _ME)))
            ol := add(ol, mul(mload(add(pz, 0x3020)), and(a, _MO)))
            a := shr(128, a)
            eh := add(eh, mul(mload(add(pz, 0x3040)), and(a, _ME)))
            oh := add(oh, mul(mload(add(pz, 0x3060)), and(a, _MO)))
            a := mload(add(mload(add(aRow, 160)), off))
            el := add(el, mul(mload(add(pz, 0x4000)), and(a, _ME)))
            ol := add(ol, mul(mload(add(pz, 0x4020)), and(a, _MO)))
            a := shr(128, a)
            eh := add(eh, mul(mload(add(pz, 0x4040)), and(a, _ME)))
            oh := add(oh, mul(mload(add(pz, 0x4060)), and(a, _MO)))
            a := mload(add(mload(add(aRow, 192)), off))
            el := add(el, mul(mload(add(pz, 0x5000)), and(a, _ME)))
            ol := add(ol, mul(mload(add(pz, 0x5020)), and(a, _MO)))
            a := shr(128, a)
            eh := add(eh, mul(mload(add(pz, 0x5040)), and(a, _ME)))
            oh := add(oh, mul(mload(add(pz, 0x5060)), and(a, _MO)))
            a := mload(add(mload(add(aRow, 224)), off))
            el := add(el, mul(mload(add(pz, 0x6000)), and(a, _ME)))
            ol := add(ol, mul(mload(add(pz, 0x6020)), and(a, _MO)))
            a := shr(128, a)
            eh := add(eh, mul(mload(add(pz, 0x6040)), and(a, _ME)))
            oh := add(oh, mul(mload(add(pz, 0x6060)), and(a, _MO)))
            // + q*2^28 (2^60 on the cross lanes) - c . t1
            a := mload(add(t1i, off))
            el := sub(add(el, _OFFE), mul(mload(add(pz, 0x7000)), and(a, _ME)))
            ol := sub(add(ol, _OFFO), mul(mload(add(pz, 0x7020)), and(a, _MO)))
            mstore(pd, or(and(el, _LN02), and(ol, _LN13)))
            a := shr(128, a)
            eh := sub(add(eh, _OFFE), mul(mload(add(pz, 0x7040)), and(a, _ME)))
            oh := sub(add(oh, _OFFO), mul(mload(add(pz, 0x7060)), and(a, _MO)))
            mstore(add(pd, 32), or(and(eh, _LN02), and(oh, _LN13)))
            off := add(off, 32)
            pz := add(pz, 128)
        }
    }
}

/// @dev _matvecRowSplit87 reading the key row in place from the calldata (the
///      seven A[i][j] are POLY_BYTES87 apart in the key, checkPubKeyCalldata87
///      has validated the shape), with the in-word pass of the inverse
///      transform (t = 1, 2, the first block of nttInvMontPackedRawFusedTb)
///      folded into the output, as _matvecRowInvCCalldata65: the two
///      accumulators of a word hold its four raw lanes, the pass forms the lane
///      sums and offset differences on both halves at once, its four results
///      are produced in place (twiddles at bit 64 / 128, moduli q << 64,
///      q << 128, q << 192), and the rest of the inverse transform
///      (nttInvMontPackedTailTb) starts from the written words. Two key words
///      (four output words) per loop body.
///      Seven columns push the raw lanes above q*2^30 (file header), so the
///      offsets are q*2^31 for the lane differences (_Q31X2) and q*2^32 for the
///      differences of the lane sums; the outputs are reduced mod q as in the
///      ML-DSA-65 kernel, so the tail is shared. Same values as the row kernel
///      followed by the full inverse transform of the reduced row
///      (test/dilithium87_core_packed.t.sol, saturated and random rows).
/// @param aRowCd calldata offset of the first word of A[i][0]
/// @param t1Cd calldata offset of the first word of t1[i]
/// @param acc the 64-word destination (dilithiumCore2Calldata87 reuses the
///        packed z and c arrays, dead once their transforms are split)
/// @param ti the inverse twiddle table (_tablesMont)
function _matvecRowInvCCalldata87(uint256 aRowCd, uint256 zs, uint256 t1Cd, uint256[] memory acc, uint256 ti) pure {
    assembly ("memory-safe") {
        // one running key pointer: A[i][j] at pa + j * POLY_BYTES87, t1 at pa + dt
        let pa := aRowCd
        let dt := sub(t1Cd, aRowCd)
        let pz := zs
        let pd := add(acc, 32)
        // t = 2 twiddles psirev[64 + 4k .. 4k + 3] of the body's four words: the top
        // 128 bits of the 32 bytes at byte 16k of the section (_TW_MONT); t = 1
        // twiddles psirev[128 + 8k .. 8k + 7], one table word per body
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
                a := calldataload(add(pa, 5280))
                el := add(el, mul(mload(add(pz, 0x5000)), and(a, _ME)))
                ol := add(ol, mul(mload(add(pz, 0x5020)), and(a, _MO)))
                a := shr(128, a)
                eh := add(eh, mul(mload(add(pz, 0x5040)), and(a, _ME)))
                oh := add(oh, mul(mload(add(pz, 0x5060)), and(a, _MO)))
                a := calldataload(add(pa, 6336))
                el := add(el, mul(mload(add(pz, 0x6000)), and(a, _ME)))
                ol := add(ol, mul(mload(add(pz, 0x6020)), and(a, _MO)))
                a := shr(128, a)
                eh := add(eh, mul(mload(add(pz, 0x6040)), and(a, _ME)))
                oh := add(oh, mul(mload(add(pz, 0x6060)), and(a, _MO)))
                // + q*2^28 (2^60 on the cross lanes) - c . t1
                a := calldataload(add(pa, dt))
                el := sub(add(el, _OFFE), mul(mload(add(pz, 0x7000)), and(a, _ME)))
                ol := sub(add(ol, _OFFO), mul(mload(add(pz, 0x7020)), and(a, _MO)))
                a := shr(128, a)
                eh := sub(add(eh, _OFFE), mul(mload(add(pz, 0x7040)), and(a, _ME)))
                oh := sub(add(oh, _OFFO), mul(mload(add(pz, 0x7060)), and(a, _MO)))
                {
                    let o := and(shr(64, ol), _LN02)
                    let e := and(el, _LN02)
                    let s := add(e, o)
                    e := sub(add(e, _Q31X2), o)
                    // the t = 1 products land on lane 1 (twiddles at bit 64, modulus q << 64)
                    let d0 :=
                        mulmod(and(e, _L64), and(shl(64, w1), 0xffffffff0000000000000000), 154591407629964779425103872)
                    let d1 :=
                        mulmod(shr(128, e), and(shl(32, w1), 0xffffffff0000000000000000), 154591407629964779425103872)
                    o := and(s, _L64)
                    s := shr(128, s)
                    // the t = 2 twiddle at bit 128: lane 2 from the sums (modulus q << 128), lane 3
                    // from the lane-1 differences (modulus q << 192); sums < 2^55, offset q*2^32
                    e := and(w2, 0xffffffff00000000000000000000000000000000)
                    mstore(
                        pd,
                        or(
                            or(addmod(o, s, 8380417), addmod(d0, d1, 154591407629964779425103872)),
                            or(
                                mulmod(
                                    sub(add(o, 35993616941842432), s),
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
                    e := sub(add(e, _Q31X2), o)
                    // the t = 1 products land on lane 1 (twiddles at bit 64, modulus q << 64)
                    let d0 := mulmod(and(e, _L64), and(w1, 0xffffffff0000000000000000), 154591407629964779425103872)
                    let d1 :=
                        mulmod(shr(128, e), and(shr(32, w1), 0xffffffff0000000000000000), 154591407629964779425103872)
                    o := and(s, _L64)
                    s := shr(128, s)
                    // the t = 2 twiddle at bit 128: lane 2 from the sums (modulus q << 128), lane 3
                    // from the lane-1 differences (modulus q << 192); sums < 2^55, offset q*2^32
                    e := and(shr(32, w2), 0xffffffff00000000000000000000000000000000)
                    mstore(
                        add(pd, 32),
                        or(
                            or(addmod(o, s, 8380417), addmod(d0, d1, 154591407629964779425103872)),
                            or(
                                mulmod(
                                    sub(add(o, 35993616941842432), s),
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
                a := calldataload(add(pa, 5312))
                el := add(el, mul(mload(add(pz, 0x5080)), and(a, _ME)))
                ol := add(ol, mul(mload(add(pz, 0x50a0)), and(a, _MO)))
                a := shr(128, a)
                eh := add(eh, mul(mload(add(pz, 0x50c0)), and(a, _ME)))
                oh := add(oh, mul(mload(add(pz, 0x50e0)), and(a, _MO)))
                a := calldataload(add(pa, 6368))
                el := add(el, mul(mload(add(pz, 0x6080)), and(a, _ME)))
                ol := add(ol, mul(mload(add(pz, 0x60a0)), and(a, _MO)))
                a := shr(128, a)
                eh := add(eh, mul(mload(add(pz, 0x60c0)), and(a, _ME)))
                oh := add(oh, mul(mload(add(pz, 0x60e0)), and(a, _MO)))
                // + q*2^28 (2^60 on the cross lanes) - c . t1
                a := calldataload(add(add(pa, dt), 32))
                el := sub(add(el, _OFFE), mul(mload(add(pz, 0x7080)), and(a, _ME)))
                ol := sub(add(ol, _OFFO), mul(mload(add(pz, 0x70a0)), and(a, _MO)))
                a := shr(128, a)
                eh := sub(add(eh, _OFFE), mul(mload(add(pz, 0x70c0)), and(a, _ME)))
                oh := sub(add(oh, _OFFO), mul(mload(add(pz, 0x70e0)), and(a, _MO)))
                {
                    let o := and(shr(64, ol), _LN02)
                    let e := and(el, _LN02)
                    let s := add(e, o)
                    e := sub(add(e, _Q31X2), o)
                    // the t = 1 products land on lane 1 (twiddles at bit 64, modulus q << 64)
                    let d0 :=
                        mulmod(and(e, _L64), and(shr(64, w1), 0xffffffff0000000000000000), 154591407629964779425103872)
                    let d1 :=
                        mulmod(shr(128, e), and(shr(96, w1), 0xffffffff0000000000000000), 154591407629964779425103872)
                    o := and(s, _L64)
                    s := shr(128, s)
                    // the t = 2 twiddle at bit 128: lane 2 from the sums (modulus q << 128), lane 3
                    // from the lane-1 differences (modulus q << 192); sums < 2^55, offset q*2^32
                    e := and(shr(64, w2), 0xffffffff00000000000000000000000000000000)
                    mstore(
                        add(pd, 64),
                        or(
                            or(addmod(o, s, 8380417), addmod(d0, d1, 154591407629964779425103872)),
                            or(
                                mulmod(
                                    sub(add(o, 35993616941842432), s),
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
                    e := sub(add(e, _Q31X2), o)
                    // the t = 1 products land on lane 1 (twiddles at bit 64, modulus q << 64)
                    let d0 :=
                        mulmod(and(e, _L64), and(shr(128, w1), 0xffffffff0000000000000000), 154591407629964779425103872)
                    let d1 :=
                        mulmod(shr(128, e), and(shr(160, w1), 0xffffffff0000000000000000), 154591407629964779425103872)
                    o := and(s, _L64)
                    s := shr(128, s)
                    // the t = 2 twiddle at bit 128: lane 2 from the sums (modulus q << 128), lane 3
                    // from the lane-1 differences (modulus q << 192); sums < 2^55, offset q*2^32
                    e := and(shr(96, w2), 0xffffffff00000000000000000000000000000000)
                    mstore(
                        add(pd, 96),
                        or(
                            or(addmod(o, s, 8380417), addmod(d0, d1, 154591407629964779425103872)),
                            or(
                                mulmod(
                                    sub(add(o, 35993616941842432), s),
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

/// @dev acc = A[i][0..6] . zHat[0..6] + q*2^28 - cHat . t1i, packed raw lanes,
///      from the packed operands (reference form, used by the tests): one lane
///      split then the split kernel.
function _matvecRowPacked87(
    uint256[][] memory aRow,
    uint256[][] memory zHat,
    uint256[] memory cHat,
    uint256[] memory t1i
) pure returns (uint256[] memory acc) {
    acc = _matvecRowSplit87(aRow, _splitLanes87(zHat, cHat), t1i);
}

/// @dev every lane of a packed polynomial reduced mod q, in place (reference
///      path only: brings the raw rows of _matvecRowSplit87 under the q*2^30
///      input bound of nttInvMontPackedRawFusedTb)
function _reduceLanes87(uint256[] memory a) pure returns (uint256[] memory) {
    assembly ("memory-safe") {
        let p := add(a, 32)
        for { let e := add(p, shl(5, mload(a))) } lt(p, e) { p := add(p, 32) } {
            let w := mload(p)
            mstore(
                p,
                or(
                    or(mod(and(w, _L64), 8380417), shl(64, mod(and(shr(64, w), _L64), 8380417))),
                    or(shl(128, mod(and(shr(128, w), _L64), 8380417)), shl(192, mod(shr(192, w), 8380417)))
                )
            )
        }
    }
    return a;
}

/// @dev eight 256-bit hint masks (bit j of mask i = h[i][j]) from the expanded
///      0/1 hint arrays of unpackH87 (reference form, used by the tests)
function _hintMasks87(uint256[][] memory h) pure returns (uint256[8] memory masks) {
    if (h.length != 8) revert BadLength();
    for (uint256 i = 0; i < 8; i++) {
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

/// @notice w1Encode(UseHint(h, w)), FIPS 204, ML-DSA-87 (gamma2 = (q-1)/32,
///         4 bits per coefficient): 1024 bytes, the same bytes as the scalar
///         useHintDilithium87 (ZKNOX_dilithium87_core.sol). The kernel of
///         useHintPacked65 (same gamma2) over eight polynomials: per lane
///         a1 = floor((r + gamma2 - 1) / (2 gamma2)) mod 16 by one multiply and
///         a shift, the four 4-bit values of a word to their two big-endian
///         bytes by one multiply, four words per iteration, one 8-byte store.
/// @param masks hint masks, bit j of masks[i] = h[i][j] (_hintMasksFromBytes87 / _hintMasks87)
/// @param w 8 packed polynomials, canonical lanes
function useHintPacked87(uint256[8] memory masks, uint256[][] memory w) pure returns (bytes memory hint) {
    // 1024 bytes of output; each group of four words' eight bytes are written by
    // one 32-byte store whose 24 trailing zero bytes are overwritten by the next
    // groups, so the buffer carries 32 spare bytes and is trimmed
    hint = new bytes(1056);
    assembly ("memory-safe") {
        mstore(hint, 1024)
    }
    for (uint256 i = 0; i < 8; i++) {
        uint256[] memory wi = w[i];
        if (wi.length != 64) revert BadLength();
        uint256 hm = masks[i];
        assembly ("memory-safe") {
            // UseHint on the hinted lanes of one word, lane-parallel (FIPS 204
            // Alg. 40: +1 where a0 > 0, -1 elsewhere, mod 16, the mod being the
            // 4-bit lane mask); at most 75 of the 2,048 coefficients carry a
            // hint, so it runs only for the words that need it
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

/// @notice Second stage of the ML-DSA-87 verification on the packed layout,
///         reference form on a decoded key (readPubKeyCalldata87): w1 bytes of
///         UseHint(h, A.z - c.t1) for the challenge hash. The rows of the
///         seven-column kernel are reduced mod q before the shared inverse
///         transform (file header); the verifier uses dilithiumCore2Calldata87.
/// @param pk public key, A (8 x 7) and t1 (8) in their stored compact form (NTT domain)
/// @param zp response vector, 7 PACKED polynomials with lanes < 2q (unpackZPacked87
///        or its lazy form); used as scratch
/// @param c challenge polynomial, PACKED canonical (sampleInBallFastTau(., 60, .), or
///        packPoly of an expanded one); used as scratch likewise
/// @param hintMasks the eight hint masks (dilithiumCore1Packed87 / _parseHintBytes87)
function dilithiumCore2Packed87(
    PubKey memory pk,
    uint256[][] memory zp,
    uint256[] memory c,
    uint256[8] memory hintMasks
) pure returns (bytes memory wPrimeBytes) {
    (uint256 tb, uint256 ti) = _tablesMont();
    uint256 zs;
    assembly ("memory-safe") {
        zs := mload(0x40)
        mstore(0x40, add(zs, 0x8000))
    }
    for (uint256 j = 0; j < 7; j++) {
        nttFwMontPackedFusedTbSplit(zp[j], tb, zs + (j << 12));
    }
    nttFwMontPackedFusedTbSplit(c, tb, zs + 0x7000);
    uint256[][] memory w = new uint256[][](8);
    for (uint256 i = 0; i < 8; i++) {
        w[i] = nttInvMontPackedRawFusedTb(_reduceLanes87(_matvecRowSplit87(pk.aHat[i], zs, pk.t1[i])), ti);
    }
    wPrimeBytes = useHintPacked87(hintMasks, w);
}

/// @notice Second stage on the expanded public key left in the calldata
///         (checkPubKeyCalldata87 first): no copy of the 67,680 bytes, the
///         matvec rows read A and t1 in place, with the first inverse pass
///         folded in (_matvecRowInvCCalldata87).
/// @param key the expanded public key (KEY_BYTES87 bytes, shape checked by the caller)
function dilithiumCore2Calldata87(
    bytes calldata key,
    uint256[][] memory zp,
    uint256[] memory c,
    uint256[8] memory hintMasks
) pure returns (bytes memory wPrimeBytes) {
    (uint256 tb, uint256 ti) = _tablesMont();
    uint256 zs;
    assembly ("memory-safe") {
        zs := mload(0x40)
        mstore(0x40, add(zs, 0x8000))
    }
    for (uint256 j = 0; j < 7; j++) {
        nttFwMontPackedFusedTbSplit(zp[j], tb, zs + (j << 12));
    }
    nttFwMontPackedFusedTbSplit(c, tb, zs + 0x7000);
    // the eight rows land in the seven packed z arrays and the c array, dead
    // since the split (l + 1 = k = 8)
    uint256[][] memory w = new uint256[][](8);
    for (uint256 i = 0; i < 7; i++) {
        w[i] = zp[i];
    }
    w[7] = c;
    uint256 aRow;
    uint256 t1;
    assembly ("memory-safe") {
        aRow := add(key.offset, 32)
        t1 := add(key.offset, add(mul(56, POLY_BYTES87), 32))
    }
    for (uint256 i = 0; i < 8; i++) {
        _matvecRowInvCCalldata87(aRow, zs, t1, w[i], ti);
        nttInvMontPackedTailTb(w[i], ti);
        unchecked {
            aRow += 7 * POLY_BYTES87;
            t1 += POLY_BYTES87;
        }
    }
    wPrimeBytes = useHintPacked87(hintMasks, w);
}
