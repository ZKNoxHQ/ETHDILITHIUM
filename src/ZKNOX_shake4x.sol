// Copyright (C) 2026 - ZKNOX
// License: This software is licensed under MIT License
// This Code may be reused including this header, license and copyright notice.
// FILE: ZKNOX_shake4x.sol
// Description:
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

// SHAKE4x - 4 parallel SHAKE128/256 instances via SWAR
// Each uint256 word packs 4 independent 64-bit Keccak lanes:
//   bits [63:0]=lane0, [127:64]=lane1, [191:128]=lane2, [255:192]=lane3

uint256 constant _RATE4X = 136;
bool constant _SPONGE4X_ABSORBING = false;
bool constant _SPONGE4X_SQUEEZING = true;
uint256 constant _LANE_MASK = 0xFFFFFFFFFFFFFFFF;

struct CtxShake4x {
    uint256[25] state;
    uint256[25] buf_packed;
    uint256 i;
    bool direction;
}

// ============================================================
//                     PACK / UNPACK HELPERS
// ============================================================

function pack4x(uint64[25] memory s0, uint64[25] memory s1, uint64[25] memory s2, uint64[25] memory s3)
    pure
    returns (uint256[25] memory packed)
{
    for (uint256 w = 0; w < 25; w++) {
        packed[w] = uint256(s0[w]) | (uint256(s1[w]) << 64) | (uint256(s2[w]) << 128) | (uint256(s3[w]) << 192);
    }
}

function unpack4x_lane(uint256[25] memory packed, uint256 lane)
    pure
    returns (uint64[25] memory out)
{
    uint256 shift = lane << 6;
    for (uint256 w = 0; w < 25; w++) {
        out[w] = uint64((packed[w] >> shift) & _LANE_MASK);
    }
}

// ============================================================
//                 f1600_4x - CORE SWAR PERMUTATION
// ============================================================

function f1600_4x(uint256[25] memory state) pure returns (uint256[25] memory) {
    // forgefmt: disable-next-line
    uint256[24] memory _keccakPi = [uint256(10), 7, 11, 17, 18, 3, 5, 16, 8, 21, 24, 4, 15, 23, 19, 13, 12, 2, 20, 14, 22, 9, 6, 1];
    // forgefmt: disable-next-line
    uint64[24] memory _keccakRc = [uint64(0x0000000000000001), 0x0000000000008082,0x800000000000808a,0x8000000080008000,0x000000000000808b, 0x0000000080000001,0x8000000080008081, 0x8000000000008009,0x000000000000008a, 0x0000000000000088,0x0000000080008009, 0x000000008000000a,0x000000008000808b, 0x800000000000008b,0x8000000000008089, 0x8000000000008003,0x8000000000008002, 0x8000000000000080,0x000000000000800a, 0x800000008000000a,0x8000000080008081, 0x8000000000008080, 0x0000000080000001, 0x8000000080008008];
    // forgefmt: disable-next-line
    uint256[24] memory _keccakRho = [uint256(1), 3, 6, 10, 15, 21, 28, 36, 45, 55, 2, 14, 27, 41, 56, 8, 25, 43, 62, 18, 39, 61, 20, 44];

    uint256[5] memory bc;

    assembly ("memory-safe") {
        function rep4(v) -> r {
            r := or(v, or(shl(64, v), or(shl(128, v), shl(192, v))))
        }

        function rol4x64(x, s) -> r {
            let low := sub(shl(s, 1), 1)
            let mask_lo := or(low, or(shl(64, low), or(shl(128, low), shl(192, low))))
            let mask_hi := not(mask_lo)
            r := or(and(shl(s, x), mask_hi), and(shr(sub(64, s), x), mask_lo))
        }

        for { let i := 0 } lt(i, 24) { i := add(i, 1) } {
            let t
            let offset_X

            // THETA STEP 1
            for { offset_X := 0 } lt(offset_X, 160) { offset_X := add(offset_X, 32) } {
                let temp := mload(add(state, offset_X))
                temp := xor(temp, mload(add(state, add(offset_X, 160))))
                temp := xor(temp, mload(add(state, add(offset_X, 320))))
                temp := xor(temp, mload(add(state, add(offset_X, 480))))
                temp := xor(temp, mload(add(state, add(offset_X, 640))))
                mstore(add(bc, offset_X), temp)
            }

            // THETA STEP 2 (unrolled)
            {
                let d0 := xor(mload(add(bc, 128)), rol4x64(mload(add(bc, 32)), 1))
                mstore(state, xor(mload(state), d0))
                mstore(add(state, 160), xor(mload(add(state, 160)), d0))
                mstore(add(state, 320), xor(mload(add(state, 320)), d0))
                mstore(add(state, 480), xor(mload(add(state, 480)), d0))
                mstore(add(state, 640), xor(mload(add(state, 640)), d0))
            }
            {
                let d1 := xor(mload(bc), rol4x64(mload(add(bc, 64)), 1))
                mstore(add(state, 32), xor(mload(add(state, 32)), d1))
                mstore(add(state, 192), xor(mload(add(state, 192)), d1))
                mstore(add(state, 352), xor(mload(add(state, 352)), d1))
                mstore(add(state, 512), xor(mload(add(state, 512)), d1))
                mstore(add(state, 672), xor(mload(add(state, 672)), d1))
            }
            {
                let d2 := xor(mload(add(bc, 32)), rol4x64(mload(add(bc, 96)), 1))
                mstore(add(state, 64), xor(mload(add(state, 64)), d2))
                mstore(add(state, 224), xor(mload(add(state, 224)), d2))
                mstore(add(state, 384), xor(mload(add(state, 384)), d2))
                mstore(add(state, 544), xor(mload(add(state, 544)), d2))
                mstore(add(state, 704), xor(mload(add(state, 704)), d2))
            }
            {
                let d3 := xor(mload(add(bc, 64)), rol4x64(mload(add(bc, 128)), 1))
                mstore(add(state, 96), xor(mload(add(state, 96)), d3))
                mstore(add(state, 256), xor(mload(add(state, 256)), d3))
                mstore(add(state, 416), xor(mload(add(state, 416)), d3))
                mstore(add(state, 576), xor(mload(add(state, 576)), d3))
                mstore(add(state, 736), xor(mload(add(state, 736)), d3))
            }
            {
                let d4 := xor(mload(add(bc, 96)), rol4x64(mload(bc), 1))
                mstore(add(state, 128), xor(mload(add(state, 128)), d4))
                mstore(add(state, 288), xor(mload(add(state, 288)), d4))
                mstore(add(state, 448), xor(mload(add(state, 448)), d4))
                mstore(add(state, 608), xor(mload(add(state, 608)), d4))
                mstore(add(state, 768), xor(mload(add(state, 768)), d4))
            }

            // RHO + PI
            t := mload(add(state, 32))
            for { let x := 0 } lt(x, 768) { x := add(x, 32) } {
                let keccakpix := mload(add(_keccakPi, x))
                let kpix := add(state, shl(5, keccakpix))
                mstore(bc, mload(kpix))
                mstore(kpix, rol4x64(t, mload(add(_keccakRho, x))))
                t := mload(bc)
            }

            // CHI (unrolled) + RC applied ONCE on y=0
            let rc := rep4(mload(add(_keccakRc, shl(5, i))))

            {
                let c0 := mload(state)
                let c1 := mload(add(state, 32))
                let c2 := mload(add(state, 64))
                let c3 := mload(add(state, 96))
                let c4 := mload(add(state, 128))
                mstore(state, xor(xor(c0, and(not(c1), c2)), rc))
                mstore(add(state, 32), xor(c1, and(not(c2), c3)))
                mstore(add(state, 64), xor(c2, and(not(c3), c4)))
                mstore(add(state, 96), xor(c3, and(not(c4), c0)))
                mstore(add(state, 128), xor(c4, and(not(c0), c1)))
            }
            {
                let c0 := mload(add(state, 160))
                let c1 := mload(add(state, 192))
                let c2 := mload(add(state, 224))
                let c3 := mload(add(state, 256))
                let c4 := mload(add(state, 288))
                mstore(add(state, 160), xor(c0, and(not(c1), c2)))
                mstore(add(state, 192), xor(c1, and(not(c2), c3)))
                mstore(add(state, 224), xor(c2, and(not(c3), c4)))
                mstore(add(state, 256), xor(c3, and(not(c4), c0)))
                mstore(add(state, 288), xor(c4, and(not(c0), c1)))
            }
            {
                let c0 := mload(add(state, 320))
                let c1 := mload(add(state, 352))
                let c2 := mload(add(state, 384))
                let c3 := mload(add(state, 416))
                let c4 := mload(add(state, 448))
                mstore(add(state, 320), xor(c0, and(not(c1), c2)))
                mstore(add(state, 352), xor(c1, and(not(c2), c3)))
                mstore(add(state, 384), xor(c2, and(not(c3), c4)))
                mstore(add(state, 416), xor(c3, and(not(c4), c0)))
                mstore(add(state, 448), xor(c4, and(not(c0), c1)))
            }
            {
                let c0 := mload(add(state, 480))
                let c1 := mload(add(state, 512))
                let c2 := mload(add(state, 544))
                let c3 := mload(add(state, 576))
                let c4 := mload(add(state, 608))
                mstore(add(state, 480), xor(c0, and(not(c1), c2)))
                mstore(add(state, 512), xor(c1, and(not(c2), c3)))
                mstore(add(state, 544), xor(c2, and(not(c3), c4)))
                mstore(add(state, 576), xor(c3, and(not(c4), c0)))
                mstore(add(state, 608), xor(c4, and(not(c0), c1)))
            }
            {
                let c0 := mload(add(state, 640))
                let c1 := mload(add(state, 672))
                let c2 := mload(add(state, 704))
                let c3 := mload(add(state, 736))
                let c4 := mload(add(state, 768))
                mstore(add(state, 640), xor(c0, and(not(c1), c2)))
                mstore(add(state, 672), xor(c1, and(not(c2), c3)))
                mstore(add(state, 704), xor(c2, and(not(c3), c4)))
                mstore(add(state, 736), xor(c3, and(not(c4), c0)))
                mstore(add(state, 768), xor(c4, and(not(c0), c1)))
            }
        }
    }
    return state;
}

// ============================================================
//                  SPONGE API (4x parallel)
// ============================================================

function shakePermute4x(uint256[25] memory buf, uint256[25] memory state)
    pure
    returns (uint256[25] memory bufout, uint256[25] memory stateout)
{
    assembly {
        for { let w := 0 } lt(w, 25) { w := add(w, 1) } {
            let off := mul(w, 32)
            let sAddr := add(state, off)
            let bAddr := add(buf, off)
            mstore(sAddr, xor(mload(sAddr), mload(bAddr)))
            mstore(bAddr, 0)
        }
    }
    state = f1600_4x(state);
    return (buf, state);
}

function shake4xInit() pure returns (CtxShake4x memory ctx) {
    ctx.direction = _SPONGE4X_ABSORBING;
    return ctx;
}

// Absorb 4 same-length inputs. Assembly inner loop to avoid stack-too-deep.
// bytes[4] memory inputs: all must have the same length.
function shake4xAbsorb(CtxShake4x memory ctx, bytes[4] memory inputs)
    pure
    returns (CtxShake4x memory)
{
    uint256 todo = inputs[0].length;
    uint256 index = 0;

    unchecked {
        while (todo > 0) {
            uint256 cando = _RATE4X - ctx.i;
            uint256 willabsorb = (cando < todo) ? cando : todo;

            // Assembly inner loop: pack 4 input bytes per position into buf_packed
            assembly {
                // inputs is a fixed-size array of 4 memory pointers
                // inputs layout: ptr to inputs[0] at inputs+0x00, [1] at +0x20, [2] at +0x40, [3] at +0x60
                let p0 := mload(inputs)
                let p1 := mload(add(inputs, 0x20))
                let p2 := mload(add(inputs, 0x40))
                let p3 := mload(add(inputs, 0x60))

                // ctx layout: state at ctx+0x00 (ptr), buf_packed at ctx+0x20 (ptr), i at ctx+0x40
                let bufPtr := mload(add(ctx, 0x20))
                let ctxI := mload(add(ctx, 0x40))

                for { let j := 0 } lt(j, willabsorb) { j := add(j, 1) } {
                    let dataOff := add(index, j)
                    // bytes memory: length at offset 0, data starts at offset 32
                    let b0 := byte(0, mload(add(add(p0, 0x20), dataOff)))
                    let b1 := byte(0, mload(add(add(p1, 0x20), dataOff)))
                    let b2 := byte(0, mload(add(add(p2, 0x20), dataOff)))
                    let b3 := byte(0, mload(add(add(p3, 0x20), dataOff)))

                    let pos := add(ctxI, j)
                    let w := shr(3, pos)
                    let b := shl(3, and(pos, 7))

                    let val := or(
                        or(shl(b, b0), shl(add(b, 64), b1)),
                        or(shl(add(b, 128), b2), shl(add(b, 192), b3))
                    )

                    let bufAddr := add(bufPtr, shl(5, w))
                    mstore(bufAddr, xor(mload(bufAddr), val))
                }
            }

            ctx.i += willabsorb;

            if (ctx.i == _RATE4X) {
                (ctx.buf_packed, ctx.state) = shakePermute4x(ctx.buf_packed, ctx.state);
                ctx.i = 0;
            }
            todo -= willabsorb;
            index += willabsorb;
        }
    }
    return ctx;
}

function shake4xUpdate(CtxShake4x memory ctx, bytes[4] memory inputs)
    pure
    returns (CtxShake4x memory)
{
    if (ctx.direction == _SPONGE4X_SQUEEZING) {
        (ctx.buf_packed, ctx.state) = shakePermute4x(ctx.buf_packed, ctx.state);
    }
    ctx.direction = _SPONGE4X_ABSORBING;
    ctx = shake4xAbsorb(ctx, inputs);
    return ctx;
}

function shake4xPad(CtxShake4x memory ctx) pure returns (CtxShake4x memory) {
    uint256 posI = ctx.i;
    uint256 wI = posI >> 3;
    uint256 bI = (posI & 7) << 3;
    uint256 pad_start = (uint256(0x1f) << bI)
        | (uint256(0x1f) << (bI + 64))
        | (uint256(0x1f) << (bI + 128))
        | (uint256(0x1f) << (bI + 192));
    ctx.buf_packed[wI] ^= pad_start;

    uint256 posEnd = _RATE4X - 1;
    uint256 wEnd = posEnd >> 3;
    uint256 bEnd = (posEnd & 7) << 3;
    uint256 pad_end = (uint256(0x80) << bEnd)
        | (uint256(0x80) << (bEnd + 64))
        | (uint256(0x80) << (bEnd + 128))
        | (uint256(0x80) << (bEnd + 192));
    ctx.buf_packed[wEnd] ^= pad_end;

    (ctx.buf_packed, ctx.state) = shakePermute4x(ctx.buf_packed, ctx.state);
    ctx.i = 0;
    return ctx;
}

// Squeeze n bytes from each of the 4 parallel instances.
// Returns bytes[4] memory outputs.
function shake4xSqueeze(CtxShake4x memory ctx, uint256 n)
    pure
    returns (CtxShake4x memory, bytes[4] memory)
{
    bytes[4] memory outs;
    outs[0] = new bytes(n);
    outs[1] = new bytes(n);
    outs[2] = new bytes(n);
    outs[3] = new bytes(n);

    uint256 tosqueeze = n;
    uint256 offset = 0;

    unchecked {
        while (tosqueeze > 0) {
            uint256 cansqueeze = _RATE4X - ctx.i;
            uint256 willsqueeze = (cansqueeze < tosqueeze) ? cansqueeze : tosqueeze;

            // Assembly inner loop to extract bytes from each lane
            assembly {
                let o0 := mload(outs)
                let o1 := mload(add(outs, 0x20))
                let o2 := mload(add(outs, 0x40))
                let o3 := mload(add(outs, 0x60))

                let statePtr := mload(ctx)
                let ctxI := mload(add(ctx, 0x40))

                for { let j := 0 } lt(j, willsqueeze) { j := add(j, 1) } {
                    let pos := add(ctxI, j)
                    let w := shr(3, pos)
                    let b := shl(3, and(pos, 7))
                    let word := mload(add(statePtr, shl(5, w)))

                    let outOff := add(offset, j)
                    // Write single byte to each output: bytes memory data starts at +32
                    // mstore8 writes 1 byte at the given address
                    mstore8(add(add(o0, 0x20), outOff), and(shr(b, word), 0xFF))
                    mstore8(add(add(o1, 0x20), outOff), and(shr(add(b, 64), word), 0xFF))
                    mstore8(add(add(o2, 0x20), outOff), and(shr(add(b, 128), word), 0xFF))
                    mstore8(add(add(o3, 0x20), outOff), and(shr(add(b, 192), word), 0xFF))
                }
            }

            offset += willsqueeze;
            ctx.i += willsqueeze;
            if (ctx.i == _RATE4X) {
                (ctx.buf_packed, ctx.state) = shakePermute4x(ctx.buf_packed, ctx.state);
                ctx.i = 0;
            }
            tosqueeze -= willsqueeze;
        }
    }

    return (ctx, outs);
}

// One-shot: absorb 4 same-length inputs, produce 4 outputs of size8 bytes.
function shake4xDigest(bytes[4] memory inputs, uint256 size8)
    pure
    returns (bytes[4] memory)
{
    CtxShake4x memory ctx = shake4xInit();
    ctx = shake4xUpdate(ctx, inputs);
    ctx = shake4xPad(ctx);
    bytes[4] memory outs;
    (, outs) = shake4xSqueeze(ctx, size8);
    return outs;
}
