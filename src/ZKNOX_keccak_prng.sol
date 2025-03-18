// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {console} from "forge-std/Test.sol";

function KeccakPRNG(bytes memory input, uint256 n) pure returns (bytes32 [] memory output) {
    output = new bytes32[](n);
    bytes32 state;

    // Initial state
    state = keccak256(input);

    uint64 counter = 0;
    uint256 i = 0;
    while (i < n) {
        output[i] = keccak256(abi.encodePacked(state, counter));
        i+=1;
        counter += 1;
    }
}

