// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

struct KeccakPrng {
    bytes32 state; // keccak256(input)
    uint64 counter; // block counter
    bytes32 pool; // current 32-byte block
    uint8 remaining; // remaining bytes in pool [0..32]
}

function initPrng(bytes memory input) pure returns (KeccakPrng memory prng) {
    prng.state = keccak256(input);
    bytes32 state = prng.state;
    uint64 counter = 0;
    bytes32 blk;
    assembly {
        let ptr := mload(0x40)
        mstore(ptr, state)
        mstore(add(ptr, 32), shl(192, counter)) // shift left 24 bytes (256-64)
        blk := keccak256(ptr, 40)
    }
    prng.pool = blk;
    prng.remaining = 32;
    prng.counter = 1;
}

// Pull next 32-byte block into the pool.
function refill(KeccakPrng memory prng) pure {
    bytes32 state = prng.state;
    uint64 counter = prng.counter;
    bytes32 blk;
    assembly {
        let ptr := mload(0x40)
        mstore(ptr, state)
        mstore(add(ptr, 32), shl(192, counter)) // shift left 24 bytes (256-64)
        blk := keccak256(ptr, 40)
    }
    prng.pool = blk;
    prng.remaining = 32;
    unchecked {
        prng.counter += 1;
    }
    assembly {
        mstore(prng, mload(prng))
    }
}

// Get one random byte (little-endian consumption from pool).
function nextByte(KeccakPrng memory prng) pure returns (uint8 b) {
    if (prng.remaining == 0) {
        bytes32 state = prng.state;
        uint64 counter = prng.counter;
        bytes32 blk;
        assembly {
            let ptr := mload(0x40)
            mstore(ptr, state)
            mstore(add(ptr, 32), shl(192, counter)) // shift left 24 bytes (256-64)
            blk := keccak256(ptr, 40)
        }
        prng.pool = blk;
        prng.remaining = 32;
        unchecked {
            prng.counter += 1;
        }
    }
    uint256 poolInt = uint256(prng.pool);
    // casting to 'uint8' is safe because poolInt is 256-bit long and so the input is 256-248 = 8-bit long
    // forge-lint: disable-next-line(unsafe-typecast)
    b = uint8(poolInt >> 248);
    prng.pool = bytes32(poolInt << 8);

    unchecked {
        prng.remaining -= 1;
    }
    assembly {
        mstore(prng, mload(prng))
    }
}
