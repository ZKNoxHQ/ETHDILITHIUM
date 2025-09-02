// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./ZKNOX_shake.sol";

// SampleInBall as specified in Dilithium
function sampleInBallNIST(bytes memory c_tilde, uint256 tau, uint256 q) pure returns (uint256[] memory c) {
    ctx_shake memory ctx;
    ctx = shake_update(ctx, c_tilde);
    bytes memory sign_bytes = shake_digest(ctx, 8);
    uint256 sign_int = 0;
    for (uint256 i = 0; i < 8; i++) {
        sign_int |= uint256(uint8(sign_bytes[i])) << (8 * i);
    }

    // Now set tau values of c to be ±1
    c = new uint256[](256);
    uint256 j;
    bytes memory bytes_j;
    for (uint256 i = 256 - tau; i < 256; i++) {
        // Rejects values until a value j <= i is found
        while (true) {
            (ctx, bytes_j) = shake_squeeze(ctx, 1);
            j = uint256(uint8(bytes_j[0]));
            if (j <= i) {
                break;
            }
        }
        c[i] = c[j];
        if (sign_int & 1 == 1) {
            c[j] = q - 1;
        } else {
            c[j] = 1;
        }
        sign_int >>= 1;
    }
}

// SampleInBall with KeccakPRNG
struct KeccakPRNG {
    bytes32 state; // keccak256(c_tilde)
    uint64 counter; // block counter
    uint256 pool; // current 32-byte block as uint256
    uint8 remaining; // remaining bytes in pool [0..32]
}

// Initialize PRNG with keccak256(c_tilde).
function initPRNG(bytes memory c_tilde) pure returns (KeccakPRNG memory prng) {
    prng.state = keccak256(c_tilde);
    // Preload first block to make the first 32 bytes available immediately
    bytes32 blk = keccak256(abi.encodePacked(prng.state, uint64(0)));
    prng.pool = uint256(blk);
    prng.remaining = 32;
    prng.counter = 1;
}

// Pull next 32-byte block into the pool.
function refill(KeccakPRNG memory prng) pure {
    bytes32 blk = keccak256(abi.encodePacked(prng.state, prng.counter));
    prng.pool = uint256(blk);
    prng.remaining = 32;
    unchecked {
        prng.counter += 1;
    }
    assembly {
        // write-back struct (since prng is memory)
        mstore(prng, mload(prng)) // no-op to silence "unused" in some toolchains
    }
}

// Get one random byte (little-endian consumption from pool).
function nextByte(KeccakPRNG memory prng) pure returns (uint8 b) {
    if (prng.remaining == 0) {
        bytes32 blk = keccak256(abi.encodePacked(prng.state, prng.counter));
        prng.pool = uint256(blk);
        prng.remaining = 32;
        unchecked {
            prng.counter += 1;
        }
    }
    b = uint8(prng.pool >> 248); // top 8 bits
    prng.pool <<= 8; // shift left so next MSB moves into place

    unchecked {
        prng.remaining -= 1;
    }
    assembly {
        mstore(prng, mload(prng))
    } // write-back
}

function sampleInBallKeccakPRNG(bytes memory c_tilde, uint256 tau, uint256 q) pure returns (uint256[] memory c) {
    KeccakPRNG memory prng = initPRNG(c_tilde);

    // sign_int: 64 bits, little-endian (matches your SHAKE version)
    uint64 sign_int = 0;
    for (uint256 k = 0; k < 8; k++) {
        sign_int |= uint64(nextByte(prng)) << (8 * k);
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
        if ((sign_int & 1) == 1) {
            c[j] = q - 1; // -1 mod q
        } else {
            c[j] = 1;
        }
        sign_int >>= 1;
    }
}
