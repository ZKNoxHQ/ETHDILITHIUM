// SPDX-License-Identifier: MIT
// Copyright (C) 2026 - ZKNOX
// License: This software is licensed under MIT License
// This Code may be reused including this header, license and copyright notice.
// FILE: ZKNOX_dilithium_core_packed.sol
// Description: second stage of the verification (A.z - c.t1, inverse NTT,
// hints, w1 encoding) on the packed 4x64-bit-lane layout.
//
//   zHat_j = nttFwMontPacked(z_j)          lazy lanes < 17q
//   cHat   = nttFwMontPacked(c)
//   acc_i  = sum_j A_ij o zHat_j + q*2^28 - cHat o t1_i      raw lanes < q*2^30
//   w_i    = nttInvMontPackedRaw(acc_i)     canonical lanes
//   w1     = useHintPacked(h, w)            768 bytes, FIPS 204 w1Encode
//
// The public key is consumed in its stored form: A_ij and t1_i as 32 words of
// eight 32-bit fields (coefficient 8m+f in field f of word m), nothing is
// expanded. One compact word covers two packed words. Lane products are
// mul(and(z, lane_k), field_k): z lane < 17q, field < q, product < 2^51,
// lane-local; four such products plus the q*2^28 offset minus one c.t1
// product stay < 4*17q*q + q*2^28 < 7.03e15 < q*2^30 (the offset the inverse
// transform's first pass uses), so no lane ever borrows or carries.
//
// useHintPacked is the FIPS 204 Decompose / UseHint / w1Encode of
// ZKNOX_hint.sol (useHintDilithium) written lane-wise:
//   a1 = ((r + 127) >> 7) * 11275 + 2^23 >> 24, then 44 -> 0
//   D  = r + 2g2 - a1 * 2g2   (a0 = D - 2g2, never negative as an unsigned)
//   a0 > 0  <=>  2g2 < D <= 2g2 + (q-1)/2
//   h = 1: a1 <- a1 + (a0 > 0 ? 1 : 43) mod 44
// verified exhaustively against useHintDilithium's arithmetic for every r in
// [0, q) and both hint values (pythonref/ntt_mont/README / test below).
//
// Packed layout and fused passes after fireblocks-labs/evm-ml-dsa-verifier
// (MIT, cca262b); the kernels are ZKNOX's. See DECISIONS.md.
pragma solidity ^0.8.25;

import {q, PubKey, Signature} from "./ZKNOX_dilithium_utils.sol";
import {
    nttFwMontPackedFused as nttFwMontPackedInPlace,
    nttInvMontPackedRawFused as nttInvMontPackedRaw
} from "./ZKNOX_NTT_dilithium_mont.sol";

error BadPubKeyBlob();
error BadLength();

uint256 constant _LN0 = 0x000000000000000000000000000000000000000000000000ffffffffffffffff;
uint256 constant _LN1 = 0x00000000000000000000000000000000ffffffffffffffff0000000000000000;
uint256 constant _LN2 = 0x0000000000000000ffffffffffffffff00000000000000000000000000000000;
uint256 constant _LN3 = 0xffffffffffffffff000000000000000000000000000000000000000000000000;
uint256 constant _KQ28 = 0x0007fe00100000000007fe00100000000007fe00100000000007fe0010000000;
// useHintPacked constants (per 64-bit lane)
uint256 constant _R127 = 0x000000000000007f000000000000007f000000000000007f000000000000007f;
uint256 constant _M17 = 0x000000000001ffff000000000001ffff000000000001ffff000000000001ffff;
uint256 constant _R2_23 = 0x0000000000800000000000000080000000000000008000000000000000800000;
uint256 constant _M8 = 0x00000000000000ff00000000000000ff00000000000000ff00000000000000ff;
uint256 constant _R212 = 0x00000000000000d400000000000000d400000000000000d400000000000000d4;
uint256 constant _R256 = 0x0000000000000100000000000000010000000000000001000000000000000100;
uint256 constant _R2G2 = 0x000000000002e800000000000002e800000000000002e800000000000002e800;
uint256 constant _C1 = 0x000000fffffd17ff000000fffffd17ff000000fffffd17ff000000fffffd17ff;
uint256 constant _C2 = 0x000001000042d800000001000042d800000001000042d800000001000042d800;
uint256 constant _R2_40 = 0x0000010000000000000001000000000000000100000000000000010000000000;
uint256 constant _R1 = 0x0000000000000001000000000000000100000000000000010000000000000001;
// unpackZPacked constants (per 64-bit lane): fields f of 18 bits, z = gamma1 - f mod q,
// accepted iff f in [beta + 1, 2 gamma1 - beta - 1] = [79, 262065]
uint256 constant _M18 = 0x3ffff;
uint256 constant _M18X4 = 0x000000000003ffff000000000003ffff000000000003ffff000000000003ffff;
// even fields (0, 2) and odd fields (1, 3) of the 72-bit group, and the two
// multipliers that move field k to lane k (the other copies land above bit
// 17 of a lane and are masked away)
uint256 constant _ZME = 0x000000000000000000000000000000000000000000000000003ffff00003ffff;
uint256 constant _ZMO = 0x0000000000000000000000000000000000000000000000ffffc0000ffffc0000;
uint256 constant _ZCE = 0x0000000000000000000000000000000000000000100000000000000000000001;
uint256 constant _ZCO = 0x0000000000000000000000000000040000000000000000000000400000000000;
uint256 constant _B24 = 0x0000000001000000000000000100000000000000010000000000000001000000;
uint256 constant _ZLO = 0x0000000000ffffb10000000000ffffb10000000000ffffb10000000000ffffb1;
uint256 constant _ZHI = 0x000000000103ffb1000000000103ffb1000000000103ffb1000000000103ffb1;
uint256 constant _ZQG1 = 0x000000000081e001000000000081e001000000000081e001000000000081e001;
uint256 constant _ZCAN = 0x0000000000801fff0000000000801fff0000000000801fff0000000000801fff;
uint256 constant _SPREADH = 0x0000000000000000200000000000000040000000000000008000000000000001;

/// @notice Zero-copy read of the SSTORE2 public key blob: abi.encode(bytes
///         abi.encode(uint256[][][] aHat), bytes tr, bytes abi.encode(uint256[][] t1)).
///         Every polynomial in the blob is encoded as [32][32 words], which is
///         exactly the memory form of a `uint256[]` of length 32, so the
///         returned PubKey points INTO the blob instead of decoding it: 20
///         pointer stores instead of an abi.decode of 640 words through nested
///         dynamic arrays. The offsets and lengths are checked as they are read
///         (fixed shape: 4 x 4 x 32, 4 x 32, tr of 64 bytes); a blob of any other
///         shape reverts, as the abi.decode did.
function readPubKeyPacked(address pointer) view returns (PubKey memory pk) {
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
    uint256[][][] memory aHat = new uint256[][][](4);
    for (uint256 i = 0; i < 4; i++) {
        aHat[i] = new uint256[][](4);
    }
    uint256[][] memory t1 = new uint256[][](4);
    bytes memory tr;
    bool ok = true;
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
            // aHat: [len][0x20][4][off_i x4][rows...]
            let arr := add(add(aEnc, 32), mload(add(aEnc, 32)))
            ok := and(ok, and(lt(arr, end), eq(mload(arr), 4)))
            for { let i := 0 } and(ok, lt(i, 4)) { i := add(i, 1) } {
                let row := add(add(arr, 32), mload(add(arr, add(32, shl(5, i)))))
                ok := and(ok, and(lt(row, end), eq(mload(row), 4)))
                let rowArr := mload(add(aHat, add(32, shl(5, i))))
                for { let j := 0 } and(ok, lt(j, 4)) { j := add(j, 1) } {
                    let p := add(add(row, 32), mload(add(row, add(32, shl(5, j)))))
                    ok := and(ok, poly(p, end))
                    mstore(add(rowArr, add(32, shl(5, j))), p)
                }
            }
            // t1: [len][0x20][4][off_i x4][polys]
            let tarr := add(add(t1Enc, 32), mload(add(t1Enc, 32)))
            ok := and(ok, and(lt(tarr, end), eq(mload(tarr), 4)))
            for { let i := 0 } and(ok, lt(i, 4)) { i := add(i, 1) } {
                let p := add(add(tarr, 32), mload(add(tarr, add(32, shl(5, i)))))
                ok := and(ok, poly(p, end))
                mstore(add(t1, add(32, shl(5, i))), p)
            }
            // tr: [64][64 bytes], used as a bytes memory object in place
            ok := and(ok, and(eq(mload(trEnc), 64), iszero(lt(end, add(trEnc, 96)))))
            tr := trEnc
        }
    }
    if (!ok) revert BadPubKeyBlob();
    pk = PubKey({aHat: aHat, tr: tr, t1: t1});
}

/// @dev the 84-byte HintBitUnpack encoding (FIPS 204 Alg. 21) in one scan:
///      validity (per-polynomial cumulative counts non-decreasing and <= omega,
///      indices strictly increasing inside a polynomial, unused index bytes
///      zero), total weight, and the four 256-bit hint masks (bit j of mask i =
///      h[i][j]). At most 84 iterations, no 0/1 arrays.
function _parseHintBytes(bytes memory hBytes) pure returns (bool ok, uint256 count, uint256[4] memory masks) {
    if (hBytes.length != 84) return (false, 0, masks);
    assembly ("memory-safe") {
        let base := add(hBytes, 32)
        let kIdx := 0
        ok := 1
        for { let i := 0 } lt(i, 4) { i := add(i, 1) } {
            let omegaVal := byte(0, mload(add(base, add(80, i))))
            if or(lt(omegaVal, kIdx), gt(omegaVal, 80)) { ok := 0 }
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
        for { let j := kIdx } lt(j, 80) { j := add(j, 1) } {
            if byte(0, mload(add(base, j))) { ok := 0 }
        }
        count := kIdx
    }
}

/// @dev validation only (reference form for the tests)
function _checkHintBytes(bytes memory hBytes) pure returns (bool ok, uint256 count) {
    (ok, count,) = _parseHintBytes(hBytes);
}

/// @dev the four masks straight from a VALIDATED encoding (reference form for the tests)
function _hintMasksFromBytes(bytes memory hBytes) pure returns (uint256[4] memory masks) {
    (,, masks) = _parseHintBytes(hBytes);
}

/// @notice Decode of the 2304-byte z region straight into the packed layout,
///         with the strict norm check ||z||inf < gamma1 - beta (FIPS 204 Alg. 3).
///         Note: the previous verifier loop rejected only ||z||inf > gamma1 - beta,
///         one value looser than the standard; a conforming signer never emits
///         |z_i| = gamma1 - beta, so valid signatures are unaffected.
///         Four coefficients of 18 bits (little-endian bit packing) are one
///         9-byte group and one packed word; the group is read as one word,
///         its 72 bits reassembled little-endian, split into four lanes, then
///         canonicalised and range-checked four lanes at a time.
/// @return zp 4 packed polynomials, canonical lanes (same values as unpackZ)
/// @return normOk true iff every coefficient satisfies the strict bound
function unpackZPacked(bytes memory zBytes) pure returns (uint256[][] memory zp, bool normOk) {
    if (zBytes.length != 2304) revert BadLength();
    zp = new uint256[][](4);
    for (uint256 i = 0; i < 4; i++) {
        zp[i] = new uint256[](64);
    }
    uint256 bad;
    assembly ("memory-safe") {
        let src := add(zBytes, 32)
        for { let i := 0 } lt(i, 4) { i := add(i, 1) } {
            let dst := add(mload(add(zp, add(32, shl(5, i)))), 32)
            // 32 pairs of groups per polynomial: 18 bytes read as one word (the
            // last read runs 14 bytes past the region, only the top 18 are used)
            // and byte-reversed once, so that byte k of the stream is bits
            // 8k .. 8k+7: the first group is bits 0..71, the second 72..143
            for { let e := add(dst, 0x800) } lt(dst, e) { dst := add(dst, 64) } {
                let w := mload(src)
                src := add(src, 18)
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
                    let V := and(w, 0xffffffffffffffffff)
                    // the four fields to the four lanes: two multiplies
                    V := and(or(mul(and(V, _ZME), _ZCE), mul(and(V, _ZMO), _ZCO)), _M18X4)
                    // f >= 79 and f <= 262065, bit 24 of each lane; a clear bit is a failure
                    bad := or(bad, or(xor(and(add(V, _ZLO), _B24), _B24), xor(and(sub(_ZHI, V), _B24), _B24)))
                    // z = q + gamma1 - f, minus q where that is >= q
                    V := sub(_ZQG1, V)
                    mstore(dst, sub(V, mul(shr(24, and(add(V, _ZCAN), _B24)), 8380417)))
                }
                {
                    let V := and(shr(72, w), 0xffffffffffffffffff)
                    dst := add(dst, 32)
                    // the four fields to the four lanes: two multiplies
                    V := and(or(mul(and(V, _ZME), _ZCE), mul(and(V, _ZMO), _ZCO)), _M18X4)
                    // f >= 79 and f <= 262065, bit 24 of each lane; a clear bit is a failure
                    bad := or(bad, or(xor(and(add(V, _ZLO), _B24), _B24), xor(and(sub(_ZHI, V), _B24), _B24)))
                    // z = q + gamma1 - f, minus q where that is >= q
                    V := sub(_ZQG1, V)
                    mstore(dst, sub(V, mul(shr(24, and(add(V, _ZCAN), _B24)), 8380417)))
                    dst := sub(dst, 32)
                }
            }
        }
    }
    normOk = bad == 0;
}

/// @notice First stage of the verification on the packed layout: hint
///         encoding validated (and its weight bounded by omega), z decoded
///         packed with its norm checked. Replaces dilithiumCore1 + the
///         verifier's z-norm loop; false means reject.
function dilithiumCore1Packed(Signature memory signature)
    pure
    returns (bool ok, uint256[][] memory zp, uint256[4] memory hintMasks)
{
    (bool hOk, uint256 normH, uint256[4] memory masks) = _parseHintBytes(signature.h);
    if (!hOk || normH > 80) return (false, zp, masks);
    bool normOk;
    (zp, normOk) = unpackZPacked(signature.z);
    ok = normOk;
    hintMasks = masks;
}

/// @notice 256 coefficients, one per word (< 2^64), to the packed layout.
function packPoly(uint256[] memory a) pure returns (uint256[] memory A) {
    if (a.length != 256) revert BadLength();
    A = new uint256[](64);
    assembly ("memory-safe") {
        let p := add(a, 32)
        let d := add(A, 32)
        for { let e := add(d, 0x800) } lt(d, e) { d := add(d, 32) } {
            mstore(
                d,
                or(
                    or(mload(p), shl(64, mload(add(p, 32)))),
                    or(shl(128, mload(add(p, 64))), shl(192, mload(add(p, 96))))
                )
            )
            p := add(p, 128)
        }
    }
}

/// @dev acc = A[i][0..3] . zHat[0..3] + q*2^28 - cHat . t1i, packed raw lanes,
///      one pass: every z word is loaded once per row and each accumulator
///      word is written once (the IR pipeline handles the eleven pointers).
function _matvecRowPacked(
    uint256[][] memory aRow,
    uint256[][] memory zHat,
    uint256[] memory cHat,
    uint256[] memory t1i
) pure returns (uint256[] memory acc) {
    if (aRow[0].length != 32 || aRow[1].length != 32 || aRow[2].length != 32 || aRow[3].length != 32) revert BadLength();
    if (t1i.length != 32 || cHat.length != 64 || zHat[0].length != 64 || zHat[1].length != 64) revert BadLength();
    if (zHat[2].length != 64 || zHat[3].length != 64) revert BadLength();
    acc = new uint256[](64);
    assembly ("memory-safe") {
        let pa0 := add(mload(add(aRow, 32)), 32)
        let pa1 := add(mload(add(aRow, 64)), 32)
        let pa2 := add(mload(add(aRow, 96)), 32)
        let pa3 := add(mload(add(aRow, 128)), 32)
        let pz0 := add(mload(add(zHat, 32)), 32)
        let pz1 := add(mload(add(zHat, 64)), 32)
        let pz2 := add(mload(add(zHat, 96)), 32)
        let pz3 := add(mload(add(zHat, 128)), 32)
        let pcw := add(cHat, 32)
        let pt := add(t1i, 32)
        let pd := add(acc, 32)
        for { let e := add(pd, 0x800) } lt(pd, e) { pd := add(pd, 64) } {
            let a0 := mload(pa0)
            let a1 := mload(pa1)
            let a2 := mload(pa2)
            let a3 := mload(pa3)
            let t := mload(pt)
            {
                let z0 := mload(pz0)
                let z1 := mload(pz1)
                let z2 := mload(pz2)
                let z3 := mload(pz3)
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
            pt := add(pt, 32)
            pz0 := add(pz0, 64)
            pz1 := add(pz1, 64)
            pz2 := add(pz2, 64)
            pz3 := add(pz3, 64)
            pcw := add(pcw, 64)
        }
    }
}

/// @dev four 256-bit hint masks (bit j of mask i = h[i][j]) from the expanded
///      0/1 hint arrays of unpackH (reference form, used by the tests)
function _hintMasks(uint256[][] memory h) pure returns (uint256[4] memory masks) {
    if (h.length != 4) revert BadLength();
    for (uint256 i = 0; i < 4; i++) {
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

/// @notice w1Encode(UseHint(h, w)), FIPS 204, ML-DSA-44 (gamma2 = (q-1)/88,
///         6 bits per coefficient): same 768 bytes as useHintDilithium.
/// @param masks hint masks, bit j of masks[i] = h[i][j] (_hintMasksFromBytes / _hintMasks)
/// @param w 4 packed polynomials, canonical lanes
function useHintPacked(uint256[4] memory masks, uint256[][] memory w) pure returns (bytes memory hint) {
    // 768 bytes of output; each word's three bytes are written by one 32-byte
    // store whose 29 trailing zero bytes are overwritten by the next words, so
    // the buffer carries 32 spare bytes and is trimmed
    hint = new bytes(800);
    assembly ("memory-safe") {
        mstore(hint, 768)
    }
    for (uint256 i = 0; i < 4; i++) {
        uint256[] memory wi = w[i];
        if (wi.length != 64) revert BadLength();
        uint256 hm = masks[i];
        assembly ("memory-safe") {
            let p := add(wi, 32)
            let o := add(add(hint, 32), mul(i, 192))
            for { let pe := add(p, 0x800) } lt(p, pe) { p := add(p, 32) } {
                let r := mload(p)
                // a1 = ((r + 127) >> 7) * 11275 + 2^23 >> 24
                let T := and(shr(7, add(r, _R127)), _M17)
                T := and(shr(24, add(mul(T, 11275), _R2_23)), _M8)
                // 44 -> 0
                T := sub(T, mul(shr(8, and(add(T, _R212), _R256)), 44))
                // hint bits of the four coefficients (the mask is consumed 4 bits per
                // word): at most 80 of the 1,024 coefficients carry one, so the sign
                // test and the adjustment run only for the words that need them
                let hb := and(hm, 15)
                hm := shr(4, hm)
                if hb {
                    // D = r + 2g2 - a1 * 2g2 ; a0 > 0 <=> 2g2 < D <= 2g2 + (q-1)/2
                    let D := sub(add(r, _R2G2), mul(T, 190464))
                    let pos := and(shr(40, and(add(D, _C1), _R2_40)), shr(40, and(sub(_C2, D), _R2_40)))
                    // the hint bits spread to full-lane masks
                    let H := mul(and(mul(hb, _SPREADH), _R1), 0xffffffffffffffff)
                    T := add(T, and(H, add(pos, mul(sub(_R1, pos), 43))))
                    T := sub(T, mul(shr(8, and(add(T, _R212), _R256)), 44))
                }
                // four 6-bit values to 24 bits (little-endian coefficient order), the
                // three bytes reordered big-endian and stored at the top of the word
                T := and(or(or(T, shr(58, T)), or(shr(116, T), shr(174, T))), 0xffffff)
                mstore(o, shl(232, or(or(shl(16, and(T, 0xff)), and(T, 0xff00)), shr(16, T))))
                o := add(o, 3)
            }
        }
    }
}

/// @notice Second stage of the verification on the packed layout: w1 bytes of
///         UseHint(h, A.z - c.t1) for the challenge hash. Same output as
///         dilithiumCore2(pk, z, nttFw(c), unpackH(hBytes), expandVec(pk.t1)).
/// @param pk public key, A and t1 in their stored compact form (NTT domain)
/// @param zp response vector, PACKED canonical (unpackZPacked); transformed IN PLACE
/// @param c challenge polynomial, PACKED canonical (sampleInBallFast, or
///        packPoly of an expanded one); transformed IN PLACE
/// @param hintMasks the four hint masks (dilithiumCore1Packed / _parseHintBytes)
function dilithiumCore2Packed(PubKey memory pk, uint256[][] memory zp, uint256[] memory c, uint256[4] memory hintMasks)
    pure
    returns (bytes memory wPrimeBytes)
{
    uint256[][] memory zHat = zp;
    for (uint256 j = 0; j < 4; j++) {
        nttFwMontPackedInPlace(zp[j]);
    }
    uint256[] memory cHat = nttFwMontPackedInPlace(c);
    uint256[][] memory w = new uint256[][](4);
    for (uint256 i = 0; i < 4; i++) {
        w[i] = nttInvMontPackedRaw(_matvecRowPacked(pk.aHat[i], zHat, cHat, pk.t1[i]));
    }
    wPrimeBytes = useHintPacked(hintMasks, w);
}
