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
// expanded. One compact word covers two packed words. The transformed z and c
// are written by the forward kernel in a lane split (even fields at 0 and 64,
// odd fields at 32 and 96, _splitLanes) so that one multiply by the key word
// masked to its even or odd fields yields two products on their lanes (see
// _matvecRowSplit): z lane < 17q, field < q, product < 2^51, lane-local;
// four such products plus the q*2^28 offset minus one c.t1 product stay
// < 4*17q*q + q*2^28 < 7.03e15 < q*2^30 (the offset the inverse transform's
// first pass uses), so no lane ever borrows or carries; the cross-product
// lanes (< 2^54, 2^60 offset) are masked out.
//
// useHintPacked is the FIPS 204 Decompose / UseHint / w1Encode of
// ZKNOX_hint.sol (useHintDilithium) written lane-wise:
//   a1 = floor((r + g2 - 1) / 2g2) (one multiply by ceil(2^48 / 2g2)), then 44 -> 0
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
import {nttFwMontPackedFusedTbSplit, nttInvMontPackedTailTb, _tablesMont} from "./ZKNOX_NTT_dilithium_mont.sol";

error BadPubKeyBlob();
error BadLength();

uint256 constant _LN0 = 0x000000000000000000000000000000000000000000000000ffffffffffffffff;
uint256 constant _LN1 = 0x00000000000000000000000000000000ffffffffffffffff0000000000000000;
uint256 constant _LN2 = 0x0000000000000000ffffffffffffffff00000000000000000000000000000000;
uint256 constant _LN3 = 0xffffffffffffffff000000000000000000000000000000000000000000000000;
// _matvecRowSplit constants: even / odd key fields, even / odd wanted lanes,
// the q*2^28 offset on the wanted lanes with 2^60 on the cross lanes
uint256 constant _ME = 0x00000000000000000000000000000000ffffffff00000000ffffffff;
uint256 constant _MO = 0x000000000000000000000000ffffffff00000000ffffffff00000000;
uint256 constant _ZS1 = 0x000000000000000000000000000000000000000000000000ffffffff00000000;
uint256 constant _ZS3 = 0x00000000000000000000000000000000ffffffff000000000000000000000000;
uint256 constant _LN02 = 0x0000000000000000ffffffffffffffff0000000000000000ffffffffffffffff;
uint256 constant _LN13 = 0xffffffffffffffff0000000000000000ffffffffffffffff0000000000000000;
uint256 constant _OFFE = 0x10000000000000000007fe001000000010000000000000000007fe0010000000;
uint256 constant _OFFO = 0x0007fe001000000010000000000000000007fe00100000001000000000000000;
// the in-word inverse pass folded into the calldata kernel: a 64-bit lane, q*2^30 on lanes 0 and 2
uint256 constant _L64 = 0xffffffffffffffff;
uint256 constant _Q30X2 = 0x0000000000000000001ff800400000000000000000000000001ff80040000000;
// useHintPacked constants (per 64-bit lane)
uint256 constant _RG2M1 = 0x00000000000173ff00000000000173ff00000000000173ff00000000000173ff;
uint256 constant _MDIV = 0x58160582;
uint256 constant _M6X4 = 0x000000000000003f000000000000003f000000000000003f000000000000003f;
uint256 constant _W1MA = 0x000000000000003f000000000000000f0000000000000003000000000000003f;
uint256 constant _W1MB = 0x00000000000000000000000000000030000000000000003c0000000000000000;
uint256 constant _W1KA = 0x0100000000000000400000000000000000100000000000000000040000000000;
uint256 constant _W1KB = 0x0000000000000000000040000000000000000010000000000000000000000000;
uint256 constant _TOP48 = 0xffffffffffff0000000000000000000000000000000000000000000000000000;
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

// One polynomial of the expanded key as it is laid out: a length word of 32,
// then its 32 words, used in place as a uint256[32]. Literals, so that inline
// assembly can use them; test/dilithium_key.t.sol checks they agree.
uint256 constant POLY_BYTES = 1056;
uint256 constant KEY_POLYS = 20; // 16 of A plus 4 of t1
uint256 constant KEY_BYTES = 21216; // KEY_POLYS * POLY_BYTES + 96, tr included

/// @notice The expanded ML-DSA-44 public key in its calldata layout, from its
///         three parts: polynomial f at offset f * POLY_BYTES, f < 16 being
///         A[f / 4][f % 4] and f >= 16 t1[f - 16], each as [32][32 words] (the
///         compact form, eight 32-bit fields per word), then tr as [64][64
///         bytes]. 21,216 bytes. Same layout as the ML-DSA-65 key (k = 6, l = 5
///         there). This is what setKey takes and what every verification
///         carries; off-chain, pythonref/prepare_pk_for_deployment.py (`flat`)
///         builds it.
function encodePubKeyFlat(uint256[][][] memory aHat, bytes memory tr, uint256[][] memory t1)
    pure
    returns (bytes memory key)
{
    if (aHat.length != 4 || t1.length != 4 || tr.length != 64) revert BadLength();
    key = new bytes(KEY_BYTES);
    for (uint256 f = 0; f < KEY_POLYS; f++) {
        uint256[] memory poly = f < 16 ? aHat[f / 4][f % 4] : t1[f - 16];
        if (poly.length != 32) revert BadLength();
        assembly ("memory-safe") {
            mcopy(add(add(key, 32), mul(f, POLY_BYTES)), poly, POLY_BYTES)
        }
    }
    assembly ("memory-safe") {
        let t := add(add(key, 32), mul(KEY_POLYS, POLY_BYTES))
        mstore(t, 64)
        mcopy(add(t, 32), add(tr, 32), 64)
    }
}

/// @notice Read of the expanded public key from the calldata (reference form,
///         used by the tests): copied once into memory and used in place from
///         there. The verifier keeps the key in the calldata instead
///         (checkPubKeyCalldata, then dilithiumCore2Calldata reads A and t1
///         with calldataload). The only shape accepted is that exact length
///         with a length word of 32 before every polynomial and 64 before tr;
///         the bytes are never trusted beyond that.
function readPubKeyCalldata(bytes calldata key) pure returns (PubKey memory pk) {
    uint256[][][] memory aHat = new uint256[][][](4);
    for (uint256 i = 0; i < 4; i++) {
        aHat[i] = new uint256[][](4);
    }
    uint256[][] memory t1 = new uint256[][](4);
    bytes memory tr;
    bool ok = key.length == KEY_BYTES;
    if (ok) {
        assembly ("memory-safe") {
            let base := mload(0x40)
            calldatacopy(base, key.offset, KEY_BYTES)
            mstore(0x40, add(base, KEY_BYTES)) // KEY_BYTES is a multiple of 32
            for { let f := 0 } lt(f, KEY_POLYS) { f := add(f, 1) } {
                let p := add(base, mul(f, POLY_BYTES))
                ok := and(ok, eq(mload(p), 32))
                switch lt(f, 16)
                // A[f / 4][f % 4]
                case 1 {
                    let row := mload(add(aHat, add(32, shl(5, div(f, 4)))))
                    mstore(add(row, add(32, shl(5, mod(f, 4)))), p)
                }
                // t1[f - 16]
                default { mstore(add(t1, add(32, shl(5, sub(f, 16)))), p) }
            }
            // tr: [64][64 bytes], used as a bytes memory object in place
            let t := add(base, mul(KEY_POLYS, POLY_BYTES))
            ok := and(ok, eq(mload(t), 64))
            tr := t
        }
    }
    if (!ok) revert BadPubKeyBlob();
    pk = PubKey({aHat: aHat, tr: tr, t1: t1});
}

/// @notice Shape check of the expanded public key in the calldata, the rule of
///         readPubKeyCalldata without the copy: exactly KEY_BYTES bytes, a
///         length word of 32 before every polynomial and 64 before tr. The
///         verifier reads the key in place after this check
///         (dilithiumCore2Calldata).
function checkPubKeyCalldata(bytes calldata key) pure returns (bool ok) {
    ok = key.length == KEY_BYTES;
    if (ok) {
        assembly ("memory-safe") {
            // the 20 length words of 32, four per iteration, then tr's 64
            let p := key.offset
            let bad := 0
            for { let e := add(p, mul(KEY_POLYS, POLY_BYTES)) } lt(p, e) { p := add(p, mul(4, POLY_BYTES)) } {
                bad := or(
                    bad,
                    or(
                        or(xor(calldataload(p), 32), xor(calldataload(add(p, POLY_BYTES)), 32)),
                        or(
                            xor(calldataload(add(p, mul(2, POLY_BYTES))), 32),
                            xor(calldataload(add(p, mul(3, POLY_BYTES))), 32)
                        )
                    )
                )
            }
            ok := iszero(or(bad, xor(calldataload(p), 64)))
        }
    }
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
        for { let j := kIdx } lt(j, 80) { j := add(j, 32) } {
            let n := sub(80, j)
            let z := mload(add(base, j))
            if lt(n, 32) { z := shr(sub(256, shl(3, n)), z) }
            if z { ok := 0 }
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
    (zp, normOk) = _unpackZPacked(zBytes, true);
}

/// @notice unpackZPacked with LAZY lanes: q + gamma1 - f in (0, 2q), congruent
///         to the canonical z, which is all the forward transform needs (its
///         lazy bounds hold for lanes < 2q; the verifier's stage 1 uses this
///         form, dilithiumCore1Packed).
function unpackZPackedLazy(bytes memory zBytes) pure returns (uint256[][] memory zp, bool normOk) {
    (zp, normOk) = _unpackZPacked(zBytes, false);
}

/// @dev the decoder: `canonical` selects the conditional subtraction of q
function _unpackZPacked(bytes memory zBytes, bool canonical) pure returns (uint256[][] memory zp, bool normOk) {
    if (zBytes.length != 2304) revert BadLength();
    zp = new uint256[][](4);
    for (uint256 i = 0; i < 4; i++) {
        zp[i] = new uint256[](64);
    }
    uint256 good;
    assembly ("memory-safe") {
        good := not(0)
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
                    // the four fields to the four lanes: two multiplies (the field
                    // masks also drop everything above the group)
                    let V := and(or(mul(and(w, _ZME), _ZCE), mul(and(w, _ZMO), _ZCO)), _M18X4)
                    // f >= 79 and f <= 262065: bit 24 of each lane of both (f + 2^24 - lo) and
                    // (2^24 + hi - f) stays set; the lanes' bits 24 are checked once at the end
                    good := and(good, and(add(V, _ZLO), sub(_ZHI, V)))
                    // z = q + gamma1 - f, minus q where that is >= q (canonical only)
                    V := sub(_ZQG1, V)
                    if canonical { V := sub(V, mul(shr(24, and(add(V, _ZCAN), _B24)), 8380417)) }
                    mstore(dst, V)
                }
                {
                    w := shr(72, w)
                    let V := and(or(mul(and(w, _ZME), _ZCE), mul(and(w, _ZMO), _ZCO)), _M18X4)
                    good := and(good, and(add(V, _ZLO), sub(_ZHI, V)))
                    V := sub(_ZQG1, V)
                    if canonical { V := sub(V, mul(shr(24, and(add(V, _ZCAN), _B24)), 8380417)) }
                    mstore(add(dst, 32), V)
                }
            }
        }
    }
    normOk = (good & _B24) == _B24;
}

/// @dev unpackZPackedLazy reading the z bytes in place from the calldata (the
///      verifier's form, dilithiumCore1PackedCalldata): same decoder,
///      calldataload for mload, lazy lanes only
function _unpackZPackedLazyCalldata(bytes calldata zBytes) pure returns (uint256[][] memory zp, bool normOk) {
    if (zBytes.length != 2304) revert BadLength();
    zp = new uint256[][](4);
    for (uint256 i = 0; i < 4; i++) {
        zp[i] = new uint256[](64);
    }
    uint256 good;
    assembly ("memory-safe") {
        good := not(0)
        let src := zBytes.offset
        for { let i := 0 } lt(i, 4) { i := add(i, 1) } {
            let dst := add(mload(add(zp, add(32, shl(5, i)))), 32)
            // 32 pairs of groups per polynomial: 18 bytes read as one word (the
            // last read runs 14 bytes past the region, only the top 18 are used)
            // and byte-reversed once, so that byte k of the stream is bits
            // 8k .. 8k+7: the first group is bits 0..71, the second 72..143
            for { let e := add(dst, 0x800) } lt(dst, e) { dst := add(dst, 64) } {
                let w := calldataload(src)
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
                    // the four fields to the four lanes: two multiplies (the field
                    // masks also drop everything above the group)
                    let V := and(or(mul(and(w, _ZME), _ZCE), mul(and(w, _ZMO), _ZCO)), _M18X4)
                    // f >= 79 and f <= 262065: bit 24 of each lane of both (f + 2^24 - lo) and
                    // (2^24 + hi - f) stays set; the lanes' bits 24 are checked once at the end
                    good := and(good, and(add(V, _ZLO), sub(_ZHI, V)))
                    // z = q + gamma1 - f, lazy (in (0, 2q))
                    V := sub(_ZQG1, V)
                    mstore(dst, V)
                }
                {
                    w := shr(72, w)
                    let V := and(or(mul(and(w, _ZME), _ZCE), mul(and(w, _ZMO), _ZCO)), _M18X4)
                    good := and(good, and(add(V, _ZLO), sub(_ZHI, V)))
                    V := sub(_ZQG1, V)
                    mstore(add(dst, 32), V)
                }
            }
        }
    }
    normOk = (good & _B24) == _B24;
}

/// @notice First stage of the verification on the packed layout: hint
///         encoding validated (and its weight bounded by omega), z decoded
///         packed (lazy lanes in (0, 2q), unpackZPackedLazy) with its norm
///         checked. Replaces dilithiumCore1 + the verifier's z-norm loop;
///         false means reject.
function dilithiumCore1Packed(Signature memory signature)
    pure
    returns (bool ok, uint256[][] memory zp, uint256[4] memory hintMasks)
{
    (bool hOk, uint256 normH, uint256[4] memory masks) = _parseHintBytes(signature.h);
    if (!hOk || normH > 80) return (false, zp, masks);
    bool normOk;
    (zp, normOk) = unpackZPackedLazy(signature.z);
    ok = normOk;
    hintMasks = masks;
}

/// @notice dilithiumCore1Packed on the signature left in the calldata: the
///         hint bytes are parsed from a copy (84 bytes), z is decoded in place
///         (_unpackZPackedLazyCalldata), so the 2,304 bytes are never copied.
/// @param signature the 2420-byte signature, c~ (32) || z (2304) || h (84)
function dilithiumCore1PackedCalldata(bytes calldata signature)
    pure
    returns (bool ok, uint256[][] memory zp, uint256[4] memory hintMasks)
{
    (bool hOk, uint256 normH, uint256[4] memory masks) = _parseHintBytes(signature[2336:2420]);
    if (!hOk || normH > 80) return (false, zp, masks);
    bool normOk;
    (zp, normOk) = _unpackZPackedLazyCalldata(signature[32:2336]);
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

/// @dev Lane split of the four transformed z and of cHat for the matvec
///      kernel: 5 x 128 contiguous words at the returned pointer, polynomial j
///      at zs + j * 0x1000 (j = 4 is cHat). The packed word of coefficients
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
///      ten of a row, see _matvecRowSplit). Shapes are checked by the callers.
function _splitLanes(uint256[][] memory zHat, uint256[] memory cHat) pure returns (uint256 zs) {
    assembly ("memory-safe") {
        zs := mload(0x40)
        mstore(0x40, add(zs, 0x5000))
        let d := zs
        for { let j := 0 } lt(j, 5) { j := add(j, 1) } {
            let src := add(cHat, 32)
            if lt(j, 4) { src := add(mload(add(zHat, add(32, shl(5, j)))), 32) }
            for { let e := add(src, 0x800) } lt(src, e) { src := add(src, 32) } {
                let z := mload(src)
                mstore(d, or(and(z, _LN0), and(shr(64, z), _LN1)))
                mstore(add(d, 32), or(and(shr(32, z), _ZS1), and(shr(96, z), _ZS3)))
                d := add(d, 64)
            }
        }
    }
}

/// @dev acc = A[i][0..3] . zHat[0..3] + q*2^28 - cHat . t1i, packed raw lanes,
///      on the lane split of _splitLanes: per key word (eight coefficients,
///      two accumulator words) 20 multiplies of two products each instead of
///      40, no field extraction on the key side (one mask per multiply, one
///      shift per key word for the upper four fields) and none on the z side.
///      Wanted lanes stay the lanes of the former packed kernel (4 lazy lanes
///      < 17q times fields < q plus q*2^28 < q*2^30, the bound the inverse
///      transform needs); the cross-product lanes carry 2^60 instead of q*2^28
///      so that the c . t1 subtraction never borrows there either (10 cross
///      products < 10 * 17q * q < 2^54), and they are masked out when the even
///      and odd accumulators are merged. Shapes are NOT checked here: the
///      callers guarantee four 32-word key polynomials, a 32-word t1 and the
///      split of four 64-word packed z and a 64-word packed c.
/// @param zs the lane split (_splitLanes): 5 x 128 words, cHat last
/// @param acc the 64-word destination (dilithiumCore2Packed reuses the packed z
///        arrays, dead once their transforms are split)
function _matvecRowSplit(uint256[][] memory aRow, uint256 zs, uint256[] memory t1i, uint256[] memory acc) pure {
    assembly ("memory-safe") {
        // one running key pointer: the row's four polynomials are read at
        // pa + j * 1056 and t1 at pa + dt. The key blob lays them out that way
        // (readPubKeyPacked); a row given otherwise (tests) is first copied
        // into that shape.
        let pa := add(mload(add(aRow, 32)), 32)
        if or(
            or(iszero(eq(mload(add(aRow, 64)), add(pa, 1024))), iszero(eq(mload(add(aRow, 96)), add(pa, 2080)))),
            iszero(eq(mload(add(aRow, 128)), add(pa, 3136)))
        ) {
            let scratch := mload(0x40)
            mstore(0x40, add(scratch, 0x1000))
            for { let j := 0 } lt(j, 4) { j := add(j, 1) } {
                mcopy(add(scratch, mul(j, 1056)), add(mload(add(aRow, add(32, shl(5, j)))), 32), 1024)
            }
            pa := scratch
        }
        let dt := sub(add(t1i, 32), pa)
        let pz := zs
        let pd := add(acc, 32)
        for { let e := add(pd, 0x800) } lt(pd, e) { pd := add(pd, 64) } {
            let a := mload(pa)
            let el := mul(mload(pz), and(a, _ME))
            let ol := mul(mload(add(pz, 32)), and(a, _MO))
            a := shr(128, a)
            let eh := mul(mload(add(pz, 64)), and(a, _ME))
            let oh := mul(mload(add(pz, 96)), and(a, _MO))
            a := mload(add(pa, 1056))
            el := add(el, mul(mload(add(pz, 0x1000)), and(a, _ME)))
            ol := add(ol, mul(mload(add(pz, 0x1020)), and(a, _MO)))
            a := shr(128, a)
            eh := add(eh, mul(mload(add(pz, 0x1040)), and(a, _ME)))
            oh := add(oh, mul(mload(add(pz, 0x1060)), and(a, _MO)))
            a := mload(add(pa, 2112))
            el := add(el, mul(mload(add(pz, 0x2000)), and(a, _ME)))
            ol := add(ol, mul(mload(add(pz, 0x2020)), and(a, _MO)))
            a := shr(128, a)
            eh := add(eh, mul(mload(add(pz, 0x2040)), and(a, _ME)))
            oh := add(oh, mul(mload(add(pz, 0x2060)), and(a, _MO)))
            a := mload(add(pa, 3168))
            el := add(el, mul(mload(add(pz, 0x3000)), and(a, _ME)))
            ol := add(ol, mul(mload(add(pz, 0x3020)), and(a, _MO)))
            a := shr(128, a)
            eh := add(eh, mul(mload(add(pz, 0x3040)), and(a, _ME)))
            oh := add(oh, mul(mload(add(pz, 0x3060)), and(a, _MO)))
            // + q*2^28 (2^60 on the cross lanes) - c . t1
            a := mload(add(pa, dt))
            el := sub(add(el, _OFFE), mul(mload(add(pz, 0x4000)), and(a, _ME)))
            ol := sub(add(ol, _OFFO), mul(mload(add(pz, 0x4020)), and(a, _MO)))
            mstore(pd, or(and(el, _LN02), and(ol, _LN13)))
            a := shr(128, a)
            eh := sub(add(eh, _OFFE), mul(mload(add(pz, 0x4040)), and(a, _ME)))
            oh := sub(add(oh, _OFFO), mul(mload(add(pz, 0x4060)), and(a, _MO)))
            mstore(add(pd, 32), or(and(eh, _LN02), and(oh, _LN13)))
            pa := add(pa, 32)
            pz := add(pz, 128)
        }
    }
}

/// @dev _matvecRowSplit with the in-word pass of the inverse transform folded
///      into the output, exactly as _matvecRowInvCCalldata does for a calldata
///      key (same body, mload for calldataload): the memory-key form
///      (readPubKeyPacked blobs, ZKNOX_ethdilithium), followed by
///      nttInvMontPackedTailTb. Same values as _matvecRowSplit then
///      nttInvMontPackedRawFusedTb.
function _matvecRowInvCSplit(
    uint256[][] memory aRow,
    uint256 zs,
    uint256[] memory t1i,
    uint256[] memory acc,
    uint256 ti
) pure {
    assembly ("memory-safe") {
        // one running key pointer: the row's 4 polynomials are read at
        // pa + j * 1056 and t1 at pa + dt. The key blob lays them out that way
        // (readPubKeyPacked); a row given otherwise (tests) is first copied
        // into that shape.
        let pa := add(mload(add(aRow, 32)), 32)
        if or(
            or(iszero(eq(mload(add(aRow, 64)), add(pa, 1024))), iszero(eq(mload(add(aRow, 96)), add(pa, 2080)))),
            iszero(eq(mload(add(aRow, 128)), add(pa, 3136)))
        ) {
            let scratch := mload(0x40)
            mstore(0x40, add(scratch, 0x1080))
            for { let j := 0 } lt(j, 4) { j := add(j, 1) } {
                mcopy(add(scratch, mul(j, 1056)), add(mload(add(aRow, add(32, shl(5, j)))), 32), 1024)
            }
            pa := scratch
        }
        let dt := sub(add(t1i, 32), pa)
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
                let a := mload(pa)
                let el := mul(mload(pz), and(a, _ME))
                let ol := mul(mload(add(pz, 0x20)), and(a, _MO))
                a := shr(128, a)
                let eh := mul(mload(add(pz, 0x40)), and(a, _ME))
                let oh := mul(mload(add(pz, 0x60)), and(a, _MO))
                a := mload(add(pa, 1056))
                el := add(el, mul(mload(add(pz, 0x1000)), and(a, _ME)))
                ol := add(ol, mul(mload(add(pz, 0x1020)), and(a, _MO)))
                a := shr(128, a)
                eh := add(eh, mul(mload(add(pz, 0x1040)), and(a, _ME)))
                oh := add(oh, mul(mload(add(pz, 0x1060)), and(a, _MO)))
                a := mload(add(pa, 2112))
                el := add(el, mul(mload(add(pz, 0x2000)), and(a, _ME)))
                ol := add(ol, mul(mload(add(pz, 0x2020)), and(a, _MO)))
                a := shr(128, a)
                eh := add(eh, mul(mload(add(pz, 0x2040)), and(a, _ME)))
                oh := add(oh, mul(mload(add(pz, 0x2060)), and(a, _MO)))
                a := mload(add(pa, 3168))
                el := add(el, mul(mload(add(pz, 0x3000)), and(a, _ME)))
                ol := add(ol, mul(mload(add(pz, 0x3020)), and(a, _MO)))
                a := shr(128, a)
                eh := add(eh, mul(mload(add(pz, 0x3040)), and(a, _ME)))
                oh := add(oh, mul(mload(add(pz, 0x3060)), and(a, _MO)))
                // + q*2^28 (2^60 on the cross lanes) - c . t1
                a := mload(add(pa, dt))
                el := sub(add(el, _OFFE), mul(mload(add(pz, 0x4000)), and(a, _ME)))
                ol := sub(add(ol, _OFFO), mul(mload(add(pz, 0x4020)), and(a, _MO)))
                a := shr(128, a)
                eh := sub(add(eh, _OFFE), mul(mload(add(pz, 0x4040)), and(a, _ME)))
                oh := sub(add(oh, _OFFO), mul(mload(add(pz, 0x4060)), and(a, _MO)))
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
                let a := mload(add(pa, 32))
                let el := mul(mload(add(pz, 0x80)), and(a, _ME))
                let ol := mul(mload(add(pz, 0xa0)), and(a, _MO))
                a := shr(128, a)
                let eh := mul(mload(add(pz, 0xc0)), and(a, _ME))
                let oh := mul(mload(add(pz, 0xe0)), and(a, _MO))
                a := mload(add(pa, 1088))
                el := add(el, mul(mload(add(pz, 0x1080)), and(a, _ME)))
                ol := add(ol, mul(mload(add(pz, 0x10a0)), and(a, _MO)))
                a := shr(128, a)
                eh := add(eh, mul(mload(add(pz, 0x10c0)), and(a, _ME)))
                oh := add(oh, mul(mload(add(pz, 0x10e0)), and(a, _MO)))
                a := mload(add(pa, 2144))
                el := add(el, mul(mload(add(pz, 0x2080)), and(a, _ME)))
                ol := add(ol, mul(mload(add(pz, 0x20a0)), and(a, _MO)))
                a := shr(128, a)
                eh := add(eh, mul(mload(add(pz, 0x20c0)), and(a, _ME)))
                oh := add(oh, mul(mload(add(pz, 0x20e0)), and(a, _MO)))
                a := mload(add(pa, 3200))
                el := add(el, mul(mload(add(pz, 0x3080)), and(a, _ME)))
                ol := add(ol, mul(mload(add(pz, 0x30a0)), and(a, _MO)))
                a := shr(128, a)
                eh := add(eh, mul(mload(add(pz, 0x30c0)), and(a, _ME)))
                oh := add(oh, mul(mload(add(pz, 0x30e0)), and(a, _MO)))
                // + q*2^28 (2^60 on the cross lanes) - c . t1
                a := mload(add(add(pa, dt), 32))
                el := sub(add(el, _OFFE), mul(mload(add(pz, 0x4080)), and(a, _ME)))
                ol := sub(add(ol, _OFFO), mul(mload(add(pz, 0x40a0)), and(a, _MO)))
                a := shr(128, a)
                eh := sub(add(eh, _OFFE), mul(mload(add(pz, 0x40c0)), and(a, _ME)))
                oh := sub(add(oh, _OFFO), mul(mload(add(pz, 0x40e0)), and(a, _MO)))
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

/// @dev _matvecRowSplit reading the key row in place from the calldata (the
///      four A[i][j] are POLY_BYTES apart in the key, checkPubKeyCalldata has
///      validated the shape), with the in-word pass of the inverse transform
///      (t = 1, 2, the first block of nttInvMontPackedRawFusedTb) folded into
///      the output: the two accumulators of a word hold its four raw lanes
///      (lanes 0, 2 in the even one, 1, 3 in the odd one), so the pass takes
///      them from the stack instead of a stored word, forming the lane sums and
///      offset differences on both halves at once, and the rest of the inverse
///      transform (nttInvMontPackedTailTb) starts from the written words. Its
///      four results are produced in place: a twiddle moved to bit 64 (bit
///      128) with the modulus q << 64 (q << 128, q << 192) makes mulmod /
///      addmod deliver the lane where it goes, so the word is three `or`. Two
///      key words (four output words) per loop body: the t = 1 twiddles are
///      one table word, the t = 2 ones the top half of an unaligned load
///      (_TW_MONT). Same values as the row kernel followed by the full inverse
///      kernel.
/// @param aRowCd calldata offset of the first word of A[i][0]
/// @param t1Cd calldata offset of the first word of t1[i]
/// @param acc the 64-word destination (dilithiumCore2Calldata reuses the
///        packed z arrays, dead once their transforms are split)
/// @param ti the inverse twiddle table (_tablesMont)
function _matvecRowInvCCalldata(uint256 aRowCd, uint256 zs, uint256 t1Cd, uint256[] memory acc, uint256 ti) pure {
    assembly ("memory-safe") {
        // one running key pointer: A[i][j] at pa + j * POLY_BYTES, t1 at pa + dt
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
                // + q*2^28 (2^60 on the cross lanes) - c . t1
                a := calldataload(add(pa, dt))
                el := sub(add(el, _OFFE), mul(mload(add(pz, 0x4000)), and(a, _ME)))
                ol := sub(add(ol, _OFFO), mul(mload(add(pz, 0x4020)), and(a, _MO)))
                a := shr(128, a)
                eh := sub(add(eh, _OFFE), mul(mload(add(pz, 0x4040)), and(a, _ME)))
                oh := sub(add(oh, _OFFO), mul(mload(add(pz, 0x4060)), and(a, _MO)))
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
                // + q*2^28 (2^60 on the cross lanes) - c . t1
                a := calldataload(add(add(pa, dt), 32))
                el := sub(add(el, _OFFE), mul(mload(add(pz, 0x4080)), and(a, _ME)))
                ol := sub(add(ol, _OFFO), mul(mload(add(pz, 0x40a0)), and(a, _MO)))
                a := shr(128, a)
                eh := sub(add(eh, _OFFE), mul(mload(add(pz, 0x40c0)), and(a, _ME)))
                oh := sub(add(oh, _OFFO), mul(mload(add(pz, 0x40e0)), and(a, _MO)))
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

/// @dev acc = A[i][0..3] . zHat[0..3] + q*2^28 - cHat . t1i, packed raw lanes,
///      from the packed operands (reference form, used by the tests): one lane
///      split then the split kernel. dilithiumCore2Packed splits once for the
///      four rows instead.
function _matvecRowPacked(uint256[][] memory aRow, uint256[][] memory zHat, uint256[] memory cHat, uint256[] memory t1i)
    pure
    returns (uint256[] memory acc)
{
    if (aRow[0].length != 32 || aRow[1].length != 32 || aRow[2].length != 32 || aRow[3].length != 32) {
        revert BadLength();
    }
    if (t1i.length != 32 || cHat.length != 64 || zHat[0].length != 64 || zHat[1].length != 64) revert BadLength();
    if (zHat[2].length != 64 || zHat[3].length != 64) revert BadLength();
    acc = new uint256[](64);
    _matvecRowSplit(aRow, _splitLanes(zHat, cHat), t1i, acc);
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
///         6 bits per coefficient): 768 bytes, the same bytes as the scalar
///         useHintDilithium (ZKNOX_dilithium_core.sol).
///         Per lane, a1 = floor((r + gamma2 - 1) / (2 gamma2)) is one multiply
///         by ceil(2^48 / (2 gamma2)) and a shift (exact for every r < q, lane
///         products < 2^54), then 44 -> 0. The four 6-bit values of a word go
///         to their three little-endian bytes (stored big-endian at the top of
///         the word) by two multiplies: the lanes are first masked into the
///         bits that stay inside one byte (c0, the low 2 bits of c1, the low 4
///         bits of c2, c3: _W1MA) and the bits that move to the next byte (the
///         high 4 bits of c1, the high 2 bits of c2: _W1MB), and each part is
///         multiplied by a constant whose other copies all land below the kept
///         bits (_W1KA, _W1KB; the second word of a pair uses the same
///         constants shifted by 24 bits). Checked at random against the
///         shift-and-mask form (pythonref-free model, see VERSION.md). Two
///         words per iteration, one 6-byte store.
/// @param masks hint masks, bit j of masks[i] = h[i][j] (_hintMasksFromBytes / _hintMasks)
/// @param w 4 packed polynomials, canonical lanes
function useHintPacked(uint256[4] memory masks, uint256[][] memory w) pure returns (bytes memory hint) {
    // 768 bytes of output; each pair of words' six bytes are written by one
    // 32-byte store whose 26 trailing zero bytes are overwritten by the next
    // pairs, so the buffer carries 32 spare bytes and is trimmed
    hint = new bytes(800);
    assembly ("memory-safe") {
        mstore(hint, 768)
    }
    for (uint256 i = 0; i < 4; i++) {
        uint256[] memory wi = w[i];
        if (wi.length != 64) revert BadLength();
        uint256 hm = masks[i];
        assembly ("memory-safe") {
            // UseHint on the hinted lanes of one word, lane-parallel (FIPS 204
            // Alg. 40: +1 where a0 > 0, -1 elsewhere, mod 44); at most 80 of
            // the 1,024 coefficients carry a hint, so it runs only for the
            // pairs that need it
            function adj(T, r, hb) -> U {
                // D = r + 2g2 - a1 * 2g2 ; a0 > 0 <=> 2g2 < D <= 2g2 + (q-1)/2
                let D := sub(add(r, _R2G2), mul(T, 190464))
                let pos := and(shr(40, and(add(D, _C1), _R2_40)), shr(40, and(sub(_C2, D), _R2_40)))
                // the hint bits spread to full-lane masks
                let H := mul(and(mul(hb, _SPREADH), _R1), 0xffffffffffffffff)
                U := add(T, and(H, add(pos, mul(sub(_R1, pos), 43))))
                U := sub(U, mul(shr(8, and(add(U, _R212), _R256)), 44))
            }
            let p := add(wi, 32)
            let o := add(add(hint, 32), mul(i, 192))
            for { let pe := add(p, 0x800) } lt(p, pe) { p := add(p, 64) } {
                let r0 := mload(p)
                let r1 := mload(add(p, 32))
                // a1 = floor((r + gamma2 - 1) / (2 gamma2)), then 44 -> 0
                let T0 := and(shr(48, mul(add(r0, _RG2M1), _MDIV)), _M6X4)
                T0 := sub(T0, mul(shr(8, and(add(T0, _R212), _R256)), 44))
                let T1 := and(shr(48, mul(add(r1, _RG2M1), _MDIV)), _M6X4)
                T1 := sub(T1, mul(shr(8, and(add(T1, _R212), _R256)), 44))
                // hint bits of the eight coefficients (the mask is consumed 8 bits per
                // pair); only the words that carry one are adjusted
                if and(hm, 255) {
                    if and(hm, 15) { T0 := adj(T0, r0, and(hm, 15)) }
                    if and(hm, 240) { T1 := adj(T1, r1, and(shr(4, hm), 15)) }
                }
                hm := shr(8, hm)
                // the eight 6-bit values to six bytes at the top of the word
                mstore(
                    o,
                    and(
                        or(
                            or(mul(and(T0, _W1MA), _W1KA), mul(and(T0, _W1MB), _W1KB)),
                            or(mul(and(T1, _W1MA), shr(24, _W1KA)), mul(and(T1, _W1MB), shr(24, _W1KB)))
                        ),
                        _TOP48
                    )
                )
                o := add(o, 6)
            }
        }
    }
}

/// @notice Second stage of the verification on the packed layout: w1 bytes of
///         UseHint(h, A.z - c.t1) for the challenge hash. Same output as
///         dilithiumCore2(pk, z, nttFw(c), unpackH(hBytes), expandVec(pk.t1)).
/// @param pk public key, A and t1 in their stored compact form (NTT domain)
/// @param zp response vector, PACKED with lanes < 2q (unpackZPacked or its lazy form); used as scratch
///        (left in the state of the first two forward passes)
/// @param c challenge polynomial, PACKED canonical (sampleInBallFast, or
///        packPoly of an expanded one); used as scratch likewise
/// @param hintMasks the four hint masks (dilithiumCore1Packed / _parseHintBytes)
function dilithiumCore2Packed(PubKey memory pk, uint256[][] memory zp, uint256[] memory c, uint256[4] memory hintMasks)
    pure
    returns (bytes memory wPrimeBytes)
{
    // the twiddle tables are copied from code once for the nine transforms
    (uint256 tb, uint256 ti) = _tablesMont();
    if (c.length != 64 || zp.length != 4) revert BadLength();
    // the five forward transforms write their last pass straight into the lane
    // split of the matvec kernel (5 x 128 words, cHat last), no split pass
    uint256 zs;
    assembly ("memory-safe") {
        zs := mload(0x40)
        mstore(0x40, add(zs, 0x5000))
    }
    for (uint256 j = 0; j < 4; j++) {
        if (zp[j].length != 64) revert BadLength();
        nttFwMontPackedFusedTbSplit(zp[j], tb, zs + (j << 12));
    }
    nttFwMontPackedFusedTbSplit(c, tb, zs + 0x4000);
    // the four rows land in the packed z arrays, dead since the split
    uint256[][] memory w = zp;
    for (uint256 i = 0; i < 4; i++) {
        uint256[][] memory aRow = pk.aHat[i];
        if (aRow[0].length != 32 || aRow[1].length != 32 || aRow[2].length != 32 || aRow[3].length != 32) {
            revert BadLength();
        }
        if (pk.t1[i].length != 32) revert BadLength();
        _matvecRowInvCSplit(aRow, zs, pk.t1[i], w[i], ti);
        nttInvMontPackedTailTb(w[i], ti);
    }
    wPrimeBytes = useHintPacked(hintMasks, w);
}

/// @notice dilithiumCore2Packed on the expanded public key left in the
///         calldata (checkPubKeyCalldata first): no copy of the 21,216 bytes,
///         the matvec rows read A and t1 in place.
/// @param key the expanded public key (KEY_BYTES bytes, shape checked by the caller)
function dilithiumCore2Calldata(
    bytes calldata key,
    uint256[][] memory zp,
    uint256[] memory c,
    uint256[4] memory hintMasks
) pure returns (bytes memory wPrimeBytes) {
    (uint256 tb, uint256 ti) = _tablesMont();
    if (c.length != 64 || zp.length != 4) revert BadLength();
    uint256 zs;
    assembly ("memory-safe") {
        zs := mload(0x40)
        mstore(0x40, add(zs, 0x5000))
    }
    for (uint256 j = 0; j < 4; j++) {
        if (zp[j].length != 64) revert BadLength();
        nttFwMontPackedFusedTbSplit(zp[j], tb, zs + (j << 12));
    }
    nttFwMontPackedFusedTbSplit(c, tb, zs + 0x4000);
    // the four rows land in the packed z arrays, dead since the split
    uint256[][] memory w = zp;
    uint256 aRow;
    uint256 t1;
    assembly ("memory-safe") {
        aRow := add(key.offset, 32)
        t1 := add(key.offset, add(mul(16, POLY_BYTES), 32))
    }
    for (uint256 i = 0; i < 4; i++) {
        _matvecRowInvCCalldata(aRow, zs, t1, w[i], ti);
        nttInvMontPackedTailTb(w[i], ti);
        unchecked {
            aRow += 4 * POLY_BYTES;
            t1 += POLY_BYTES;
        }
    }
    wPrimeBytes = useHintPacked(hintMasks, w);
}
