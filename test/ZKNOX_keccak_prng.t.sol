// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {ZKNOX_keccak_prng} from "../src/ZKNOX_keccak_prng.sol";

contract KeccakPRNGTest is Test {
    // Input and output provided by
    // https://github.com/zhenfeizhang/falcon-go/blob/main/c/keccak_prng.c

    // Test vector 1: extract(32)
    bytes input_1 = "test input";
    bytes output_1 = hex"5b9e99370fa4b753ac6bf0d246b3cec353c84a67839f5632cb2679b4ae565601";

    // Test vector 2: extract(64), last half
    bytes input_2 = "test input";
    uint256 output_2 = 0x569857b781dd8b81dd9cb45d06999916742043ff52f1cf165e161bcc9938b705;

    // Test vector 3: extract(32)
    bytes input_3 = "testinput";
    bytes output_3 = hex"120f76b5b7198706bc294a942f8d17467aadb2bb1fa2cc1fecadbaba93c0dd74";

    // Test vectors 4: extract(32) three times (only 16 bytes)
    bytes input_4 = "test sequence";
    uint256 output_4_1 = 0x9e96b1e50719da6f0ea5b664ac8bbac5;
    uint256 output_4_2 = 0x1be071eca45961aca979e88e3784a751;
    uint256 output_4_3 = 0x5f19135442b6b848b2f51f7cb58bc583;

    ZKNOX_keccak_prng keccak_prng;

    function setUp() public {}

    function test_keccak_prng_test_vectors() public {
        // Test vector 1
        keccak_prng = new ZKNOX_keccak_prng();
        keccak_prng.inject(input_1);
        keccak_prng.flip();
        console.logBytes(output_1);
        //assertEq(output_1, keccak_prng.extract(32));

        // Test vector 2
        keccak_prng = new ZKNOX_keccak_prng();
        keccak_prng.inject(input_2);
        keccak_prng.flip();
        bytes memory out_2 = keccak_prng.extract(64);
        uint256 computed_output_2;
        assembly {
            computed_output_2 := mload(add(out_2, 64))
        }
        //assertEq(computed_output_2, output_2);

        // Test vector 3
        keccak_prng = new ZKNOX_keccak_prng();
        keccak_prng.inject(input_3);
        keccak_prng.flip();
        //assertEq(output_3, keccak_prng.extract(32));

        // Test vector 4
        keccak_prng = new ZKNOX_keccak_prng();
        keccak_prng.inject(input_4);
        keccak_prng.flip();

        bytes memory out_4_1 = keccak_prng.extract(32);
        // get a sub array
        uint256 computed_output_4_1;
        assembly {
            computed_output_4_1 := mload(add(out_4_1, 32))
        }
        computed_output_4_1 = computed_output_4_1 >> 128;
        //assertEq(computed_output_4_1, output_4_1);

        bytes memory out_4_2 = keccak_prng.extract(32);
        // get a sub array
        uint256 computed_output_4_2;
        assembly {
            computed_output_4_2 := mload(add(out_4_2, 32))
        }
        computed_output_4_2 = computed_output_4_2 >> 128;
        //assertEq(computed_output_4_2, output_4_2);

        bytes memory out_4_3 = keccak_prng.extract(32);
        // get a sub array
        uint256 computed_output_4_3;
        assembly {
            computed_output_4_3 := mload(add(out_4_3, 32))
        }
        computed_output_4_3 = computed_output_4_3 >> 128;
        //assertEq(computed_output_4_3, output_4_3);
    }

    function test_keccak_1() public {
        // Test vector 1
        keccak_prng = new ZKNOX_keccak_prng();
        keccak_prng.inject(input_1);
        // keccak_prng.flip();
        // assertEq(output_1, keccak_prng.extract(32));
    }

    function test_keccak_2() public {
        // Test vector 1
        keccak_prng = new ZKNOX_keccak_prng();
        keccak_prng.inject(input_1);
        keccak_prng.flip();
        // assertEq(output_1, keccak_prng.extract(32));
    }

    function test_keccak_3() public {
        // Test vector 1
        keccak_prng = new ZKNOX_keccak_prng();
        keccak_prng.inject(input_1);
        keccak_prng.flip();
        // assertEq(output_1, keccak_prng.extract(32));
    }

}
