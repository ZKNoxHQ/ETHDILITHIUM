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
//   - matvec: five columns. Lane bound: 5 lazy lanes (< 16q) times fields
//     (< q) plus the q*2^28 offset < 80 q^2 + q*2^28 < 7.87e15 < q*2^30, the
//     offset the inverse transform's first pass applies, so no lane ever
//     borrows or carries (ML-DSA-44: 64 q^2 + q*2^28);
//   - hints: 61 bytes (omega = 55, k = 6), six masks;
//   - w1: gamma2 = (q-1)/32, m = (q-1)/(2 gamma2) = 16, so Decompose is
//       a1 = ((((r + 127) >> 7) * 1025 + 2^21) >> 22) & 15
//     (the & 15 folds 16 -> 0), a0 > 0 <=> 2 gamma2 < D <= 2 gamma2 + (q-1)/2
//     with D = r + 2 gamma2 - a1 * 2 gamma2, UseHint adds 1 or 15 mod 16 on the
//     (rare) hinted lanes, and w1Encode packs four 4-bit values per word
//     (two bytes). Checked
//     exhaustively against FIPS 204 Alg. 36 / 40 for every r in [0, q) and
//     both hint values (pythonref-free model: see VERSION.md).
pragma solidity ^0.8.25;

import {q, PubKey, Signature} from "./ZKNOX_dilithium_utils.sol";
import {nttFwMontPackedFusedTb, nttInvMontPackedRawFusedTb, _tablesMont} from "./ZKNOX_NTT_dilithium_mont.sol";
import {BadPubKeyBlob, BadLength} from "./ZKNOX_dilithium_core_packed.sol";

uint256 constant _LN0 = 0x000000000000000000000000000000000000000000000000ffffffffffffffff;
uint256 constant _LN1 = 0x00000000000000000000000000000000ffffffffffffffff0000000000000000;
uint256 constant _LN2 = 0x0000000000000000ffffffffffffffff00000000000000000000000000000000;
uint256 constant _LN3 = 0xffffffffffffffff000000000000000000000000000000000000000000000000;
uint256 constant _KQ28 = 0x0007fe00100000000007fe00100000000007fe00100000000007fe0010000000;
// useHintPacked65 constants (per 64-bit lane)
uint256 constant _R127 = 0x000000000000007f000000000000007f000000000000007f000000000000007f;
uint256 constant _M17 = 0x000000000001ffff000000000001ffff000000000001ffff000000000001ffff;
uint256 constant _R2_21 = 0x0000000000200000000000000020000000000000002000000000000000200000;
uint256 constant _M4X4 = 0x000000000000000f000000000000000f000000000000000f000000000000000f;
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

/// @notice Zero-copy read of the public key from its two SSTORE2 blobs. The
///         expanded ML-DSA-65 key (30 + 6 polynomials, 36,864 bytes of words)
///         does not fit in one EIP-170 contract (24,576 bytes), so it is split
///         in two halves of the same shape, each
///           abi.encode(bytes abi.encode(uint256[3][5][32] aHatRows), bytes tr,
///                      bytes abi.encode(uint256[3][32] t1Polys))
///         (20,160 bytes): pointer 0 holds rows 0..2 of A and t1[0..2],
///         pointer 1 rows 3..5 and t1[3..5]; tr (64 bytes) is in both, the
///         first one is used. Same in-place use of the [32][32 words]
///         polynomials as readPubKeyPacked (ZKNOX_dilithium_core_packed.sol);
///         a half of another shape or a truncated one reverts.
function readPubKeyPacked65(address pointer0, address pointer1) view returns (PubKey memory pk) {
    uint256[][][] memory aHat = new uint256[][][](6);
    for (uint256 i = 0; i < 6; i++) {
        aHat[i] = new uint256[][](5);
    }
    uint256[][] memory t1 = new uint256[][](6);
    bytes memory tr;
    bool ok = true;
    // one loop body for the two halves (h = 0: rows 0..2, h = 1: rows 3..5)
    for (uint256 h = 0; h < 2; h++) {
        address pointer = h == 0 ? pointer0 : pointer1;
        // the blob is the pointer's code minus its STOP prefix, copied once
        bytes memory blob;
        assembly ("memory-safe") {
            let size := extcodesize(pointer)
            if iszero(size) { size := 1 }
            blob := mload(0x40)
            let len := sub(size, 1)
            mstore(blob, len)
            extcodecopy(pointer, add(blob, 32), 1, len)
            mstore(0x40, add(add(blob, 32), and(add(len, 31), not(31))))
        }
        bytes memory trh;
        assembly ("memory-safe") {
            let base := add(blob, 32)
            let end := add(base, mload(blob))
            // a pointer p is a valid [32][32 words] polynomial iff it lies in the blob
            function poly(p, e) -> r {
                r := and(and(lt(p, e), iszero(gt(add(p, 1056), e))), eq(mload(p), 32))
            }
            // outer tuple: three offsets
            let aEnc := add(base, mload(base))
            let trEnc := add(base, mload(add(base, 32)))
            let t1Enc := add(base, mload(add(base, 64)))
            ok := and(ok, and(lt(aEnc, end), and(lt(trEnc, end), lt(t1Enc, end))))
            if ok {
                let rowBase := mul(h, 3)
                // aHat rows: [len][0x20][3][off_i x3][rows...], each row [5][off_j x5][polys]
                let arr := add(add(aEnc, 32), mload(add(aEnc, 32)))
                ok := and(ok, and(lt(arr, end), eq(mload(arr), 3)))
                for { let i := 0 } and(ok, lt(i, 3)) { i := add(i, 1) } {
                    let row := add(add(arr, 32), mload(add(arr, add(32, shl(5, i)))))
                    ok := and(ok, and(lt(row, end), eq(mload(row), 5)))
                    let rowArr := mload(add(aHat, add(32, shl(5, add(rowBase, i)))))
                    for { let j := 0 } and(ok, lt(j, 5)) { j := add(j, 1) } {
                        let p := add(add(row, 32), mload(add(row, add(32, shl(5, j)))))
                        ok := and(ok, poly(p, end))
                        mstore(add(rowArr, add(32, shl(5, j))), p)
                    }
                }
                // t1 polys: [len][0x20][3][off_i x3][polys]
                let tarr := add(add(t1Enc, 32), mload(add(t1Enc, 32)))
                ok := and(ok, and(lt(tarr, end), eq(mload(tarr), 3)))
                for { let i := 0 } and(ok, lt(i, 3)) { i := add(i, 1) } {
                    let p := add(add(tarr, 32), mload(add(tarr, add(32, shl(5, i)))))
                    ok := and(ok, poly(p, end))
                    mstore(add(t1, add(32, shl(5, add(rowBase, i)))), p)
                }
                // tr: [64][64 bytes], used as a bytes memory object in place
                ok := and(ok, and(eq(mload(trEnc), 64), iszero(lt(end, add(trEnc, 96)))))
                trh := trEnc
            }
        }
        if (h == 0) tr = trh;
    }
    if (!ok) revert BadPubKeyBlob();
    pk = PubKey({aHat: aHat, tr: tr, t1: t1});
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
            let prev := 0
            let m := 0
            for { let j := kIdx } lt(j, omegaVal) { j := add(j, 1) } {
                let idx := byte(0, mload(add(base, j)))
                if and(gt(j, kIdx), iszero(gt(idx, prev))) { ok := 0 }
                prev := idx
                m := or(m, shl(idx, 1))
            }
            mstore(add(masks, shl(5, i)), m)
            kIdx := omegaVal
        }
        for { let j := kIdx } lt(j, 55) { j := add(j, 1) } {
            if byte(0, mload(add(base, j))) { ok := 0 }
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
    if (zBytes.length != 3200) revert BadLength();
    zp = new uint256[][](5);
    for (uint256 i = 0; i < 5; i++) {
        zp[i] = new uint256[](64);
    }
    uint256 bad;
    assembly ("memory-safe") {
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
                    let V := and(w, 0xffffffffffffffffffff)
                    // the four fields to the four lanes: two multiplies
                    V := and(or(mul(and(V, _ZME65), _ZCE65), mul(and(V, _ZMO65), _ZCO65)), _M20X4)
                    // f >= 197 and f <= 1048379, bit 24 of each lane; a clear bit is a failure
                    bad := or(bad, or(xor(and(add(V, _ZLO65), _B24), _B24), xor(and(sub(_ZHI65, V), _B24), _B24)))
                    // z = q + gamma1 - f, minus q where that is >= q
                    V := sub(_ZQG1_65, V)
                    mstore(dst, sub(V, mul(shr(24, and(add(V, _ZCAN), _B24)), 8380417)))
                }
                {
                    let V := and(shr(80, w), 0xffffffffffffffffffff)
                    dst := add(dst, 32)
                    // the four fields to the four lanes: two multiplies
                    V := and(or(mul(and(V, _ZME65), _ZCE65), mul(and(V, _ZMO65), _ZCO65)), _M20X4)
                    // f >= 197 and f <= 1048379, bit 24 of each lane; a clear bit is a failure
                    bad := or(bad, or(xor(and(add(V, _ZLO65), _B24), _B24), xor(and(sub(_ZHI65, V), _B24), _B24)))
                    // z = q + gamma1 - f, minus q where that is >= q
                    V := sub(_ZQG1_65, V)
                    mstore(dst, sub(V, mul(shr(24, and(add(V, _ZCAN), _B24)), 8380417)))
                    dst := sub(dst, 32)
                }
            }
        }
    }
    normOk = bad == 0;
}

/// @notice First stage of the ML-DSA-65 verification on the packed layout:
///         hint encoding validated (and its weight bounded by omega = 55), z
///         decoded packed with its norm checked; false means reject.
function dilithiumCore1Packed65(Signature memory signature)
    pure
    returns (bool ok, uint256[][] memory zp, uint256[6] memory hintMasks)
{
    // the weight bound (<= omega = 55) is enforced by the parser on every cumulative count
    (bool hOk,, uint256[6] memory masks) = _parseHintBytes65(signature.h);
    if (!hOk) return (false, zp, masks);
    bool normOk;
    (zp, normOk) = unpackZPacked65(signature.z);
    ok = normOk;
    hintMasks = masks;
}

/// @dev acc = A[i][0..4] . zHat[0..4] + q*2^28 - cHat . t1i, packed raw lanes,
///      one pass: every z word is loaded once per row and each accumulator
///      word is written once (thirteen pointers, the IR pipeline handles them).
///      Shapes are NOT checked here (EIP-170 room): the callers guarantee five
///      32-word key polynomials (readPubKeyPacked65 validates every polynomial
///      of the blobs), five 64-word packed z (unpackZPacked65), a 32-word t1
///      and a 64-word packed c; the reads below never leave those.
function _matvecRowPacked65(
    uint256[][] memory aRow,
    uint256[][] memory zHat,
    uint256[] memory cHat,
    uint256[] memory t1i
) pure returns (uint256[] memory acc) {
    acc = new uint256[](64);
    assembly ("memory-safe") {
        let pa0 := add(mload(add(aRow, 32)), 32)
        let pa1 := add(mload(add(aRow, 64)), 32)
        let pa2 := add(mload(add(aRow, 96)), 32)
        let pa3 := add(mload(add(aRow, 128)), 32)
        let pa4 := add(mload(add(aRow, 160)), 32)
        let pz0 := add(mload(add(zHat, 32)), 32)
        let pz1 := add(mload(add(zHat, 64)), 32)
        let pz2 := add(mload(add(zHat, 96)), 32)
        let pz3 := add(mload(add(zHat, 128)), 32)
        let pz4 := add(mload(add(zHat, 160)), 32)
        let pcw := add(cHat, 32)
        let pt := add(t1i, 32)
        let pd := add(acc, 32)
        for { let e := add(pd, 0x800) } lt(pd, e) { pd := add(pd, 64) } {
            let a0 := mload(pa0)
            let a1 := mload(pa1)
            let a2 := mload(pa2)
            let a3 := mload(pa3)
            let a4 := mload(pa4)
            let t := mload(pt)
            {
                let z0 := mload(pz0)
                let z1 := mload(pz1)
                let z2 := mload(pz2)
                let z3 := mload(pz3)
                let z4 := mload(pz4)
                let cw := mload(pcw)
                let s :=
                    add(
                        add(
                            add(
                                mul(and(z0, _LN0), and(a0, 0xffffffff)),
                                mul(and(z0, _LN1), and(shr(32, a0), 0xffffffff))
                            ),
                            add(
                                mul(and(z0, _LN2), and(shr(64, a0), 0xffffffff)),
                                mul(and(z0, _LN3), and(shr(96, a0), 0xffffffff))
                            )
                        ),
                        add(
                            add(
                                mul(and(z1, _LN0), and(a1, 0xffffffff)),
                                mul(and(z1, _LN1), and(shr(32, a1), 0xffffffff))
                            ),
                            add(
                                mul(and(z1, _LN2), and(shr(64, a1), 0xffffffff)),
                                mul(and(z1, _LN3), and(shr(96, a1), 0xffffffff))
                            )
                        )
                    )
                s := add(
                    s,
                    add(
                        add(
                            add(
                                mul(and(z2, _LN0), and(a2, 0xffffffff)),
                                mul(and(z2, _LN1), and(shr(32, a2), 0xffffffff))
                            ),
                            add(
                                mul(and(z2, _LN2), and(shr(64, a2), 0xffffffff)),
                                mul(and(z2, _LN3), and(shr(96, a2), 0xffffffff))
                            )
                        ),
                        add(
                            add(
                                mul(and(z3, _LN0), and(a3, 0xffffffff)),
                                mul(and(z3, _LN1), and(shr(32, a3), 0xffffffff))
                            ),
                            add(
                                mul(and(z3, _LN2), and(shr(64, a3), 0xffffffff)),
                                mul(and(z3, _LN3), and(shr(96, a3), 0xffffffff))
                            )
                        )
                    )
                )
                s := add(
                    s,
                    add(
                        add(mul(and(z4, _LN0), and(a4, 0xffffffff)), mul(and(z4, _LN1), and(shr(32, a4), 0xffffffff))),
                        add(
                            mul(and(z4, _LN2), and(shr(64, a4), 0xffffffff)),
                            mul(and(z4, _LN3), and(shr(96, a4), 0xffffffff))
                        )
                    )
                )
                s := sub(
                    add(s, _KQ28),
                    add(
                        add(mul(and(cw, _LN0), and(t, 0xffffffff)), mul(and(cw, _LN1), and(shr(32, t), 0xffffffff))),
                        add(
                            mul(and(cw, _LN2), and(shr(64, t), 0xffffffff)),
                            mul(and(cw, _LN3), and(shr(96, t), 0xffffffff))
                        )
                    )
                )
                mstore(pd, s)
            }
            {
                let z0 := mload(add(pz0, 32))
                let z1 := mload(add(pz1, 32))
                let z2 := mload(add(pz2, 32))
                let z3 := mload(add(pz3, 32))
                let z4 := mload(add(pz4, 32))
                let cw := mload(add(pcw, 32))
                let s :=
                    add(
                        add(
                            add(
                                mul(and(z0, _LN0), and(shr(128, a0), 0xffffffff)),
                                mul(and(z0, _LN1), and(shr(160, a0), 0xffffffff))
                            ),
                            add(
                                mul(and(z0, _LN2), and(shr(192, a0), 0xffffffff)),
                                mul(and(z0, _LN3), and(shr(224, a0), 0xffffffff))
                            )
                        ),
                        add(
                            add(
                                mul(and(z1, _LN0), and(shr(128, a1), 0xffffffff)),
                                mul(and(z1, _LN1), and(shr(160, a1), 0xffffffff))
                            ),
                            add(
                                mul(and(z1, _LN2), and(shr(192, a1), 0xffffffff)),
                                mul(and(z1, _LN3), and(shr(224, a1), 0xffffffff))
                            )
                        )
                    )
                s := add(
                    s,
                    add(
                        add(
                            add(
                                mul(and(z2, _LN0), and(shr(128, a2), 0xffffffff)),
                                mul(and(z2, _LN1), and(shr(160, a2), 0xffffffff))
                            ),
                            add(
                                mul(and(z2, _LN2), and(shr(192, a2), 0xffffffff)),
                                mul(and(z2, _LN3), and(shr(224, a2), 0xffffffff))
                            )
                        ),
                        add(
                            add(
                                mul(and(z3, _LN0), and(shr(128, a3), 0xffffffff)),
                                mul(and(z3, _LN1), and(shr(160, a3), 0xffffffff))
                            ),
                            add(
                                mul(and(z3, _LN2), and(shr(192, a3), 0xffffffff)),
                                mul(and(z3, _LN3), and(shr(224, a3), 0xffffffff))
                            )
                        )
                    )
                )
                s := add(
                    s,
                    add(
                        add(
                            mul(and(z4, _LN0), and(shr(128, a4), 0xffffffff)),
                            mul(and(z4, _LN1), and(shr(160, a4), 0xffffffff))
                        ),
                        add(
                            mul(and(z4, _LN2), and(shr(192, a4), 0xffffffff)),
                            mul(and(z4, _LN3), and(shr(224, a4), 0xffffffff))
                        )
                    )
                )
                s := sub(
                    add(s, _KQ28),
                    add(
                        add(
                            mul(and(cw, _LN0), and(shr(128, t), 0xffffffff)),
                            mul(and(cw, _LN1), and(shr(160, t), 0xffffffff))
                        ),
                        add(
                            mul(and(cw, _LN2), and(shr(192, t), 0xffffffff)),
                            mul(and(cw, _LN3), and(shr(224, t), 0xffffffff))
                        )
                    )
                )
                mstore(add(pd, 32), s)
            }
            pa0 := add(pa0, 32)
            pa1 := add(pa1, 32)
            pa2 := add(pa2, 32)
            pa3 := add(pa3, 32)
            pa4 := add(pa4, 32)
            pt := add(pt, 32)
            pz0 := add(pz0, 64)
            pz1 := add(pz1, 64)
            pz2 := add(pz2, 64)
            pz3 := add(pz3, 64)
            pz4 := add(pz4, 64)
            pcw := add(pcw, 64)
        }
    }
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
/// @param masks hint masks, bit j of masks[i] = h[i][j] (_hintMasksFromBytes65 / _hintMasks65)
/// @param w 6 packed polynomials, canonical lanes
function useHintPacked65(uint256[6] memory masks, uint256[][] memory w) pure returns (bytes memory hint) {
    // 768 bytes of output; each word's two bytes are written by one 32-byte
    // store whose 30 trailing zero bytes are overwritten by the next words, so
    // the buffer carries 32 spare bytes and is trimmed
    hint = new bytes(800);
    assembly ("memory-safe") {
        mstore(hint, 768)
    }
    for (uint256 i = 0; i < 6; i++) {
        uint256[] memory wi = w[i];
        if (wi.length != 64) revert BadLength();
        uint256 hm = masks[i];
        assembly ("memory-safe") {
            let p := add(wi, 32)
            let o := add(add(hint, 32), shl(7, i))
            for { let pe := add(p, 0x800) } lt(p, pe) { p := add(p, 32) } {
                let r := mload(p)
                // a1 = ((((r + 127) >> 7) * 1025 + 2^21) >> 22) & 15
                let T := and(shr(7, add(r, _R127)), _M17)
                T := and(shr(22, add(mul(T, 1025), _R2_21)), _M4X4)
                // hint bits of the four coefficients (the mask is consumed 4 bits per
                // word): at most 55 of the 1,536 coefficients carry one, so the hinted
                // lanes are adjusted one at a time as scalars (FIPS 204 Alg. 40:
                // +1 where a0 > 0, -1 elsewhere, mod 16), no lane-parallel constants
                let hb := and(hm, 15)
                hm := shr(4, hm)
                for { let sh := 0 } hb { sh := add(sh, 64) } {
                    if and(hb, 1) {
                        let a1 := and(shr(sh, T), 15)
                        // D = r + 2g2 - a1 * 2g2 ; a0 > 0 <=> 2g2 < D <= 2g2 + (q-1)/2
                        let D := sub(add(and(shr(sh, r), 0xffffffff), 523776), mul(a1, 523776))
                        let adj := 15
                        if and(gt(D, 523776), lt(D, 4713985)) { adj := 1 }
                        T := or(and(T, not(shl(sh, 15))), shl(sh, and(add(a1, adj), 15)))
                    }
                    hb := shr(1, hb)
                }
                // four 4-bit values to 16 bits (little-endian coefficient order), the
                // two bytes reordered big-endian and stored at the top of the word
                T := and(or(or(T, shr(60, T)), or(shr(120, T), shr(180, T))), 0xffff)
                mstore(o, shl(240, or(shl(8, and(T, 0xff)), shr(8, T))))
                o := add(o, 2)
            }
        }
    }
}

/// @notice Second stage of the ML-DSA-65 verification on the packed layout:
///         w1 bytes of UseHint(h, A.z - c.t1) for the challenge hash.
/// @param pk public key, A (6 x 5) and t1 (6) in their stored compact form (NTT domain)
/// @param zp response vector, 5 PACKED canonical polynomials (unpackZPacked65); transformed IN PLACE
/// @param c challenge polynomial, PACKED canonical (sampleInBallFastTau(., 49, .), or
///        packPoly of an expanded one); transformed IN PLACE
/// @param hintMasks the six hint masks (dilithiumCore1Packed65 / _parseHintBytes65)
function dilithiumCore2Packed65(
    PubKey memory pk,
    uint256[][] memory zp,
    uint256[] memory c,
    uint256[6] memory hintMasks
) pure returns (bytes memory wPrimeBytes) {
    // the twiddle tables are copied from code once for the twelve transforms
    (uint256 tb, uint256 ti) = _tablesMont();
    uint256[][] memory zHat = zp;
    for (uint256 j = 0; j < 5; j++) {
        nttFwMontPackedFusedTb(zp[j], tb);
    }
    uint256[] memory cHat = nttFwMontPackedFusedTb(c, tb);
    uint256[][] memory w = new uint256[][](6);
    for (uint256 i = 0; i < 6; i++) {
        w[i] = nttInvMontPackedRawFusedTb(_matvecRowPacked65(pk.aHat[i], zHat, cHat, pk.t1[i]), ti);
    }
    wPrimeBytes = useHintPacked65(hintMasks, w);
}
