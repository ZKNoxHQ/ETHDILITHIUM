// SPDX-License-Identifier: MIT
// Portions Copyright (c) 2026 Fireblocks Ltd. — MIT
// from fireblocks-labs/evm-ml-dsa-verifier @ cca262b, src/FastKeccak170.sol
// Copyright (C) 2026 - ZKNOX (sampleInBallFast)
// FILE: ZKNOX_shake_fast.sol
//
// SHAKE256 on an external Keccak-f[1600] helper contract, as in
// ZKNoxHQ/ETHFALCON (ZKNOX_shake_fast.sol). The sponge glue
// (_xorBlockFast170 / _squeezeBlockFast170 / _absorbFast170 / shake256Fast)
// is taken verbatim from fireblocks-labs/evm-ml-dsa-verifier (MIT),
// src/FastKeccak170.sol. The permutation itself is NOT Solidity: it is a
// 21,622-byte fully-unrolled raw-runtime helper contract
// (test/f1600_170.hex, helpers/f1600_170.hex in that repository) reached by
// STATICCALL, with the 25-lane state passed in and out in place; the verifier
// binds it by EXTCODEHASH (see ZKNOX_dilithium.sol).
//
// sampleInBallFast is SampleInBall (FIPS 204 Alg. 29) on that sponge: same
// byte stream as sampleInBallNist (ZKNOX_SampleInBall.sol), read out of the
// squeezed blocks instead of a byte-at-a-time squeeze.
pragma solidity ^0.8.25;

error HelperCallFailed();
error BatchUnsupported();

uint256 constant _M64_170 = 0xffffffffffffffff;
// _packBallCodes: 1 + 2^72 + 2^144 + 2^216, 0xff per lane, 1 per lane
uint256 constant _BALLK = 0x0000000001000000000000000001000000000000000001000000000000000001;
uint256 constant _BALLFF = 0x00000000000000ff00000000000000ff00000000000000ff00000000000000ff;
uint256 constant _BALL1 = 0x0000000000000001000000000000000100000000000000010000000000000001;
uint256 constant _RATE_FAST = 136;

/// @notice Keccak-f[1600] permutation, in place on `st` (25 words, lane i = x + 5*y).
function f1600Fast170(uint256[25] memory st, address helper) view {
    bool ok;
    assembly ("memory-safe") {
        ok := staticcall(gas(), helper, st, 800, st, 800)
        ok := and(ok, eq(returndatasize(), 800))
    }
    if (!ok) revert HelperCallFailed();
}

/// @dev XOR one 136-byte rate block at memory `ptr` into the sponge state (lanes 0..16).
function _xorBlockFast170(uint256[25] memory st, uint256 ptr) pure {
    assembly ("memory-safe") {
        function grev(w) -> v {
            let a := and(w, 0xff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00)
            v := or(shr(8, a), shl(8, xor(w, a)))
            a := and(v, 0xffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000)
            v := or(shr(16, a), shl(16, xor(v, a)))
            a := and(v, 0xffffffff00000000ffffffff00000000ffffffff00000000ffffffff00000000)
            v := or(shr(32, a), shl(32, xor(v, a)))
        }
        let v := grev(mload(ptr))
        mstore(st, xor(mload(st), shr(192, v)))
        mstore(add(st, 32), xor(mload(add(st, 32)), and(shr(128, v), _M64_170)))
        mstore(add(st, 64), xor(mload(add(st, 64)), and(shr(64, v), _M64_170)))
        mstore(add(st, 96), xor(mload(add(st, 96)), and(v, _M64_170)))
        v := grev(mload(add(ptr, 32)))
        mstore(add(st, 128), xor(mload(add(st, 128)), shr(192, v)))
        mstore(add(st, 160), xor(mload(add(st, 160)), and(shr(128, v), _M64_170)))
        mstore(add(st, 192), xor(mload(add(st, 192)), and(shr(64, v), _M64_170)))
        mstore(add(st, 224), xor(mload(add(st, 224)), and(v, _M64_170)))
        v := grev(mload(add(ptr, 64)))
        mstore(add(st, 256), xor(mload(add(st, 256)), shr(192, v)))
        mstore(add(st, 288), xor(mload(add(st, 288)), and(shr(128, v), _M64_170)))
        mstore(add(st, 320), xor(mload(add(st, 320)), and(shr(64, v), _M64_170)))
        mstore(add(st, 352), xor(mload(add(st, 352)), and(v, _M64_170)))
        v := grev(mload(add(ptr, 96)))
        mstore(add(st, 384), xor(mload(add(st, 384)), shr(192, v)))
        mstore(add(st, 416), xor(mload(add(st, 416)), and(shr(128, v), _M64_170)))
        mstore(add(st, 448), xor(mload(add(st, 448)), and(shr(64, v), _M64_170)))
        mstore(add(st, 480), xor(mload(add(st, 480)), and(v, _M64_170)))
        v := grev(mload(add(ptr, 104)))
        mstore(add(st, 512), xor(mload(add(st, 512)), and(v, _M64_170)))
    }
}

/// @dev Write one full 136-byte squeeze block from the state to memory at `outPtr`.
function _squeezeBlockFast170(uint256[25] memory st, uint256 outPtr) pure {
    assembly ("memory-safe") {
        function grev(w) -> v {
            v := or(
                and(shl(8, w), 0xff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00),
                and(shr(8, w), 0x00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff)
            )
            v := or(
                and(shl(16, v), 0xffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000),
                and(shr(16, v), 0x0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff)
            )
            v := or(
                and(shl(32, v), 0xffffffff00000000ffffffff00000000ffffffff00000000ffffffff00000000),
                and(shr(32, v), 0x00000000ffffffff00000000ffffffff00000000ffffffff00000000ffffffff)
            )
        }
        mstore(
            outPtr,
            grev(
                or(
                    or(or(shl(192, mload(st)), shl(128, mload(add(st, 32)))), shl(64, mload(add(st, 64)))),
                    mload(add(st, 96))
                )
            )
        )
        mstore(
            add(outPtr, 32),
            grev(
                or(
                    or(or(shl(192, mload(add(st, 128))), shl(128, mload(add(st, 160)))), shl(64, mload(add(st, 192)))),
                    mload(add(st, 224))
                )
            )
        )
        mstore(
            add(outPtr, 64),
            grev(
                or(
                    or(or(shl(192, mload(add(st, 256))), shl(128, mload(add(st, 288)))), shl(64, mload(add(st, 320)))),
                    mload(add(st, 352))
                )
            )
        )
        mstore(
            add(outPtr, 96),
            grev(
                or(
                    or(or(shl(192, mload(add(st, 384))), shl(128, mload(add(st, 416)))), shl(64, mload(add(st, 448)))),
                    mload(add(st, 480))
                )
            )
        )
        mstore(
            add(outPtr, 104),
            grev(
                or(
                    or(or(shl(192, mload(add(st, 416))), shl(128, mload(add(st, 448)))), shl(64, mload(add(st, 480)))),
                    mload(add(st, 512))
                )
            )
        )
    }
}

/// @dev Absorb `input` with FIPS 202 1111 + pad10*1 padding and run the final permutation.
///      Leaves `st` ready for the first squeeze block.
function _absorbFast170(uint256[25] memory st, bytes memory input, address helper) view {
    uint256 ptr;
    uint256 len = input.length;
    assembly ("memory-safe") {
        ptr := add(input, 32)
    }
    unchecked {
        uint256 nFull = len / 136;
        for (uint256 i = 0; i < nFull; ++i) {
            _xorBlockFast170(st, ptr);
            f1600Fast170(st, helper);
            ptr += 136;
        }
        uint256 rem = len - nFull * 136;
        bytes memory last = new bytes(136);
        assembly ("memory-safe") {
            let dst := add(last, 32)
            mcopy(dst, ptr, rem)
            mstore8(add(dst, rem), 0x1f)
            mstore(add(dst, 104), xor(mload(add(dst, 104)), 0x80))
            ptr := dst
        }
        _xorBlockFast170(st, ptr);
        f1600Fast170(st, helper);
    }
}

/// @notice Minimal SHAKE256 over the external helper. Same contract as shake256().
function shake256Fast(bytes memory input, uint256 outLen, address helper) view returns (bytes memory output) {
    uint256[25] memory st;
    _absorbFast170(st, input, helper);
    unchecked {
        uint256 nOut = outLen == 0 ? 1 : (outLen + 135) / 136;
        output = new bytes(nOut * 136);
        uint256 outPtr;
        assembly ("memory-safe") {
            outPtr := add(output, 32)
            mstore(output, outLen)
        }
        uint256 done = 0;
        while (true) {
            _squeezeBlockFast170(st, outPtr + done);
            done += 136;
            if (done >= outLen) break;
            f1600Fast170(st, helper);
        }
    }
}

/// @notice One-call SHAKE256 via the helper's batched entry point (from
///         fireblocks-labs/evm-ml-dsa-verifier, shake256Batch170, MIT). The
///         whole sponge (padding, absorb, one permutation per 136-byte block,
///         first squeeze block) runs inside the helper: one STATICCALL instead
///         of one per block, no caller-side absorb glue. outLen <= 136; an
///         input of exactly 800 bytes is dispatched by the helper as a raw
///         permutation, so callers must use shake256Fast for that length.
///         Fails closed on a short or failed return.
function shake256Batch(bytes memory input, uint256 outLen, address helper) view returns (bytes memory output) {
    if (outLen > 136) revert BatchUnsupported();
    if (input.length == 800) revert BatchUnsupported();
    bool ok;
    assembly ("memory-safe") {
        output := mload(0x40)
        mstore(output, outLen)
        mstore(0x40, add(add(output, 0x20), and(add(outLen, 31), not(31))))
        ok := staticcall(gas(), helper, add(input, 32), mload(input), add(output, 32), outLen)
        ok := and(ok, eq(returndatasize(), 136))
    }
    if (!ok) revert HelperCallFailed();
}

/// @notice SHAKE256 of any input: the batched entry point when the input
///         length allows it, the block-by-block sponge otherwise.
function shake256Any(bytes memory input, uint256 outLen, address helper) view returns (bytes memory) {
    if (input.length != 800 && outLen <= 136) return shake256Batch(input, outLen, helper);
    return shake256Fast(input, outLen, helper);
}

/// @notice SampleInBall (FIPS 204 Alg. 29, tau = 39) over the helper-backed
///         SHAKE256, output PACKED (64 words of four 64-bit lanes, coefficient
///         4w + j in lane j of word w): exactly 39 coefficients in {1, q - 1},
///         the rest 0. Same polynomial as sampleInBallNist(cTilde, 39, q):
///         sampleInBallFastTau with tau = 39 (expected 8 + 44 bytes of the
///         first block; the second block is squeezed only if the first is
///         exhausted).
function sampleInBallFast(bytes memory cTilde, address helper) view returns (uint256[] memory c) {
    return sampleInBallFastTau(cTilde, 39, helper);
}

/// @dev the 256 coefficient codes of SampleInBall (0, 1 for +1, 2 for -1), one
///      byte each at `codes`, to the packed layout at `c` (64 words): lane
///      j of word w = coefficient 4w + j, 2 -> q - 1. The four codes of a word
///      are spread to their lanes by one multiply (the other copies of the
///      bytes land on bytes that are masked out, see the 44-byte-lane argument
///      in VERSION.md), then 2 -> 2 + (q - 3).
function _packBallCodes(uint256 codes, uint256[] memory c) pure {
    assembly ("memory-safe") {
        let d := add(c, 32)
        for { let e := add(d, 0x800) } lt(d, e) { d := add(d, 64) } {
            // the top seven bytes of the word at codes: c[4w] at bits 48..55 down to c[4w + 3] at 24..31
            let v := and(shr(48, mul(shr(200, mload(codes)), _BALLK)), _BALLFF)
            mstore(d, add(v, mul(and(shr(1, v), _BALL1), 8380414)))
            v := and(shr(48, mul(shr(200, mload(add(codes, 4))), _BALLK)), _BALLFF)
            mstore(add(d, 32), add(v, mul(and(shr(1, v), _BALL1), 8380414)))
            codes := add(codes, 8)
        }
    }
}

/// @notice SampleInBall (FIPS 204 Alg. 29) for any tau over the helper-backed
///         SHAKE256, output PACKED (64 words of four 64-bit lanes, coefficient
///         4w + j in lane j of word w): exactly tau coefficients in {1, q - 1},
///         the rest 0. Same polynomial as sampleInBallNist(cTilde, tau, q) and
///         the same byte stream as sampleInBallFast: the first 8 squeezed bytes
///         are the signs (little-endian), then one byte per draw, rejected
///         while > i. ML-DSA-65 uses tau = 49 on a 48-byte c~ (expected
///         8 + 56 bytes of the first block); the second block is squeezed only
///         if the first is exhausted. tau <= 64 (the sign word has 64 bits).
///         The draws run on a 256-byte scratch of coefficient codes (0, 1, 2
///         for -1: one byte read and two mstore8 per draw), packed once at the end.
function sampleInBallFastTau(bytes memory cTilde, uint256 tau, address helper) view returns (uint256[] memory c) {
    if (tau > 64) revert BatchUnsupported();
    // the first 136 squeezed bytes in one batched call (c~ is 32..64 bytes, never 800)
    bytes memory blk = shake256Batch(cTilde, 136, helper);
    c = new uint256[](64);
    uint256 codes;
    uint256 i;
    uint256 pos;
    uint256 signs;
    assembly ("memory-safe") {
        // the draws of one squeezed block, one loop over its bytes: returns
        // where it stopped (i < 256 iff the block ran out)
        function draws(blkPtr, cd, i0, pos0, signs0) -> i1, pos1, signs1 {
            i1 := i0
            pos1 := pos0
            signs1 := signs0
            for {} lt(pos1, 136) {} {
                let j := byte(0, mload(add(blkPtr, pos1)))
                pos1 := add(pos1, 1)
                // rejected while > i
                if gt(j, i1) { continue }
                // c[i] := c[j], c[j] := +-1
                mstore8(add(cd, i1), byte(0, mload(add(cd, j))))
                mstore8(add(cd, j), add(1, and(signs1, 1)))
                signs1 := shr(1, signs1)
                i1 := add(i1, 1)
                if eq(i1, 256) { break }
            }
        }
        // 256 zero bytes of codes
        codes := mload(0x40)
        mstore(0x40, add(codes, 256))
        calldatacopy(codes, calldatasize(), 256)
        let blkPtr := add(blk, 32)
        // sign bits: the first 8 bytes, little-endian
        for { let b := 0 } lt(b, 8) { b := add(b, 1) } {
            signs := or(signs, shl(shl(3, b), byte(0, mload(add(blkPtr, b)))))
        }
        i, pos, signs := draws(blkPtr, codes, sub(256, tau), 8, signs)
    }
    if (i < 256) {
        // first block exhausted (probability ~2^-40 for tau = 39, ~2^-30 for
        // tau = 49): rebuild the sponge state incrementally and continue with
        // the next blocks
        uint256[25] memory st;
        _absorbFast170(st, cTilde, helper);
        uint256 blkPtr;
        assembly ("memory-safe") {
            blkPtr := add(blk, 32)
        }
        for (; i < 256; i++) {
            uint256 j;
            while (true) {
                if (pos == 136) {
                    f1600Fast170(st, helper);
                    _squeezeBlockFast170(st, blkPtr);
                    pos = 0;
                }
                assembly ("memory-safe") {
                    j := byte(0, mload(add(blkPtr, pos)))
                }
                pos++;
                if (j <= i) break;
            }
            assembly ("memory-safe") {
                mstore8(add(codes, i), byte(0, mload(add(codes, j))))
                mstore8(add(codes, j), add(1, and(signs, 1)))
                signs := shr(1, signs)
            }
        }
    }
    _packBallCodes(codes, c);
}
