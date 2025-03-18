// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {console} from "forge-std/Test.sol";

function H(bytes memory input, uint256 n) pure returns (bytes32 [] memory output) {
    // H is KeccakPRNG
    output = new bytes32[](n);
    bytes32 state;
    bytes32 buffer;

    // Initial state
    // state = keccak256(abi.encodePacked(msgHash, salt));
    state = keccak256(input);
    uint256 j;

    uint64 counter = 0;
    uint256 i = 0;
    while (i < n) {
        // updating buffer = keccak(state||counter)
        output[i] = keccak256(abi.encodePacked(state, counter));
        i+=1;
        counter += 1;
    }
}

