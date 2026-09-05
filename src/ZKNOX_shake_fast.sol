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
///         the rest 0. Same polynomial as sampleInBallNist(cTilde, 39, q): the
///         first 8 squeezed bytes are the signs (little-endian), then one byte
///         per draw, rejected while > i. Expected 8 + 44 bytes: the second block
///         is squeezed only if the first is exhausted.
function sampleInBallFast(bytes memory cTilde, address helper) view returns (uint256[] memory c) {
    // the first 136 squeezed bytes in one batched call (c~ is 32 bytes, never 800)
    bytes memory blk = shake256Batch(cTilde, 136, helper);
    c = new uint256[](64);
    uint256 i;
    uint256 pos;
    uint256 signs;
    assembly ("memory-safe") {
        let blkPtr := add(blk, 32)
        // sign bits: the first 8 bytes, little-endian
        for { let b := 0 } lt(b, 8) { b := add(b, 1) } {
            signs := or(signs, shl(shl(3, b), byte(0, mload(add(blkPtr, b)))))
        }
        pos := 8
        let base := add(c, 32)
        for { i := 217 } lt(i, 256) { i := add(i, 1) } {
            // draw bytes until one is <= i; leave to the fallback if the block runs out
            let j := 256
            for {} and(gt(j, i), lt(pos, 136)) {} {
                j := byte(0, mload(add(blkPtr, pos)))
                pos := add(pos, 1)
            }
            if gt(j, i) { break }
            // lane j -> lane i, then lane j := +-1
            let pj := add(base, shl(5, shr(2, j)))
            let shj := shl(6, and(j, 3))
            let vj := and(shr(shj, mload(pj)), 0xffffffffffffffff)
            let pi := add(base, shl(5, shr(2, i)))
            let shi := shl(6, and(i, 3))
            mstore(pi, or(and(mload(pi), not(shl(shi, 0xffffffffffffffff))), shl(shi, vj)))
            let v := 1
            if and(signs, 1) { v := 8380416 }
            mstore(pj, or(and(mload(pj), not(shl(shj, 0xffffffffffffffff))), shl(shj, v)))
            signs := shr(1, signs)
        }
    }
    if (i < 256) {
        // first block exhausted (probability ~2^-40): rebuild the sponge state
        // incrementally and continue with the next blocks
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
                let base := add(c, 32)
                let pj := add(base, shl(5, shr(2, j)))
                let shj := shl(6, and(j, 3))
                let vj := and(shr(shj, mload(pj)), 0xffffffffffffffff)
                let pi := add(base, shl(5, shr(2, i)))
                let shi := shl(6, and(i, 3))
                mstore(pi, or(and(mload(pi), not(shl(shi, 0xffffffffffffffff))), shl(shi, vj)))
                let v := 1
                if and(signs, 1) { v := 8380416 }
                mstore(pj, or(and(mload(pj), not(shl(shj, 0xffffffffffffffff))), shl(shj, v)))
                signs := shr(1, signs)
            }
        }
    }
}
