// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {CtxShake, shakeUpdate, shakeDigest, shakeSqueeze} from "./ZKNOX_shake.sol";
import {KeccakPrng, initPrng, nextByte} from "./ZKNOX_keccak_prng.sol";

// SampleInBall as specified in Dilithium
function sampleInBallNist(bytes memory cTilde, uint256 tau, uint256 q) pure returns (uint256[] memory c) {
    CtxShake memory ctx;
    ctx = shakeUpdate(ctx, cTilde);
    bytes memory signBytes = shakeDigest(ctx, 8);
    uint256 signInt = 0;
    for (uint256 i = 0; i < 8; i++) {
        signInt |= uint256(uint8(signBytes[i])) << (8 * i);
    }

    // Now set tau values of c to be ±1
    c = new uint256[](256);
    uint256 j;
    bytes memory bytesJ;
    for (uint256 i = 256 - tau; i < 256; i++) {
        // Rejects values until a value j <= i is found
        while (true) {
            (ctx, bytesJ) = shakeSqueeze(ctx, 1);
            j = uint256(uint8(bytesJ[0]));
            if (j <= i) {
                break;
            }
        }
        c[i] = c[j];
        if (signInt & 1 == 1) {
            c[j] = q - 1;
        } else {
            c[j] = 1;
        }
        signInt >>= 1;
    }
}

// SampleInBall with KeccakPrng
function sampleInBallKeccakPrng(bytes memory cTilde, uint256 tau, uint256 q) pure returns (uint256[] memory c) {
    KeccakPrng memory prng = initPrng(cTilde);

    // signInt: 64 bits, little-endian (matches your SHAKE version)
    uint64 signInt = 0;
    for (uint256 k = 0; k < 8; k++) {
        // casting to 'uint64' is safe because 0 <= k < 8 so 8*k < 64 has maximum 6<64 bits
        // forge-lint: disable-next-line(unsafe-typecast)
        signInt |= uint64(nextByte(prng)) << uint64(8 * k);
    }

    uint256 j;
    c = new uint256[](256);
    // i runs from 256 - tau .. 255 inclusive
    for (uint256 i = 256 - tau; i < 256; i++) {
        // Rejection sample j in [0..i] from a byte
        while (true) {
            uint8 r = nextByte(prng);
            if (r <= i) {
                j = uint256(r);
                break;
            }
        }
        // Fisher-Yates style swap/placement
        c[i] = c[j];
        if ((signInt & 1) == 1) {
            c[j] = q - 1; // -1 mod q
        } else {
            c[j] = 1;
        }
        signInt >>= 1;
    }
}
