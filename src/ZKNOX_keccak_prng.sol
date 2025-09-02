// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {console} from "forge-std/Test.sol";

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

function KeccakPRNGGetWords(bytes memory input, uint256 n) pure returns (bytes32[] memory output) {
    output = new bytes32[](n);
    bytes32 state;

    // Initial state
    state = keccak256(input);

    uint64 counter = 0;
    uint256 i = 0;
    while (i < n) {
        output[i] = keccak256(abi.encodePacked(state, counter));
        i += 1;
        counter += 1;
    }
}
