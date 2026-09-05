// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Test, console} from "forge-std/Test.sol";
import {F1600Helper} from "./F1600Helper.sol";
import {shake256Fast, shake256Batch, shake256Any, sampleInBallFast} from "../src/ZKNOX_shake_fast.sol";
import {CtxShake, shakeUpdate, shakeDigest} from "../src/ZKNOX_shake.sol";
import {sampleInBallNist} from "../src/ZKNOX_SampleInBall.sol";
import {TAU, q} from "../src/ZKNOX_dilithium_utils.sol";

contract ShakeFastTest is Test {
    address helper;

    function setUp() public {
        helper = F1600Helper.deploy(vm);
    }

    function _ref(bytes memory input, uint256 outLen) internal pure returns (bytes memory) {
        CtxShake memory ctx;
        ctx = shakeUpdate(ctx, input);
        return shakeDigest(ctx, outLen);
    }

    function test_shake256Fast_matches_reference() public view {
        bytes memory a = hex"";
        assertEq(keccak256(shake256Fast(a, 32, helper)), keccak256(_ref(a, 32)));
        for (uint256 len = 1; len < 300; len += 17) {
            bytes memory m = new bytes(len);
            for (uint256 i = 0; i < len; i++) {
                m[i] = bytes1(uint8(i * 31 + len));
            }
            assertEq(keccak256(shake256Fast(m, 32, helper)), keccak256(_ref(m, 32)));
            assertEq(keccak256(shake256Fast(m, 64, helper)), keccak256(_ref(m, 64)));
        }
        // the verifier's shapes: 98 bytes -> 64, 832 bytes -> 32
        bytes memory m98 = new bytes(98);
        bytes memory m832 = new bytes(832);
        for (uint256 i = 0; i < 832; i++) {
            m832[i] = bytes1(uint8(i * 7));
            if (i < 98) m98[i] = bytes1(uint8(i * 13 + 1));
        }
        assertEq(keccak256(shake256Fast(m98, 64, helper)), keccak256(_ref(m98, 64)));
        assertEq(keccak256(shake256Fast(m832, 32, helper)), keccak256(_ref(m832, 32)));
    }

    function test_shake256Batch_matches_reference() public view {
        for (uint256 len = 0; len < 1100; len += 37) {
            bytes memory m = new bytes(len);
            for (uint256 i = 0; i < len; i++) {
                m[i] = bytes1(uint8(i * 31 + len));
            }
            if (len == 800) continue;
            assertEq(keccak256(shake256Batch(m, 32, helper)), keccak256(_ref(m, 32)));
            assertEq(keccak256(shake256Batch(m, 136, helper)), keccak256(_ref(m, 136)));
            assertEq(keccak256(shake256Any(m, 64, helper)), keccak256(_ref(m, 64)));
        }
        // the length the batched path cannot take goes through the block sponge
        bytes memory m800 = new bytes(800);
        for (uint256 i = 0; i < 800; i++) {
            m800[i] = bytes1(uint8(i));
        }
        assertEq(keccak256(shake256Any(m800, 64, helper)), keccak256(_ref(m800, 64)));
    }

    function testFuzz_shake256Any(bytes memory m, uint8 outSel) public view {
        uint256 outLen = outSel % 2 == 0 ? 32 : 64;
        assertEq(keccak256(shake256Any(m, outLen, helper)), keccak256(_ref(m, outLen)));
    }

    function testFuzz_shake256Fast(bytes memory m, uint8 outSel) public view {
        uint256 outLen = outSel % 2 == 0 ? 32 : 64;
        assertEq(keccak256(shake256Fast(m, outLen, helper)), keccak256(_ref(m, outLen)));
    }

    function test_sampleInBallFast_matches_reference() public view {
        bytes memory cTilde = hex"cc501e9f471a004d2d3f60894d12aad3114e8abf62e413a800b7e7987ec5100b";
        uint256[] memory a = sampleInBallFast(cTilde, helper);
        uint256[] memory b = sampleInBallNist(cTilde, TAU, q);
        uint256 nz;
        for (uint256 i = 0; i < 256; i++) {
            uint256 lane = (a[i >> 2] >> (64 * (i & 3))) & 0xffffffffffffffff;
            assertEq(lane, b[i]);
            if (lane != 0) nz++;
        }
        assertEq(nz, TAU);
    }

    function testFuzz_sampleInBallFast(bytes32 seed) public view {
        bytes memory cTilde = abi.encodePacked(seed);
        uint256[] memory a = sampleInBallFast(cTilde, helper);
        uint256[] memory b = sampleInBallNist(cTilde, TAU, q);
        for (uint256 i = 0; i < 256; i++) {
            assertEq((a[i >> 2] >> (64 * (i & 3))) & 0xffffffffffffffff, b[i]);
        }
    }

    function test_gas() public view {
        bytes memory cTilde = hex"cc501e9f471a004d2d3f60894d12aad3114e8abf62e413a800b7e7987ec5100b";
        bytes memory m832 = new bytes(832);
        bytes memory m98 = new bytes(98);
        uint256 g = gasleft();
        sampleInBallFast(cTilde, helper);
        console.log("sampleInBallFast (1 perm)   :", g - gasleft());
        g = gasleft();
        shake256Fast(m98, 64, helper);
        console.log("shake256Fast 98 -> 64 (1 perm):", g - gasleft());
        g = gasleft();
        shake256Fast(m832, 32, helper);
        console.log("shake256Fast 832 -> 32 (7 perm):", g - gasleft());
    }
}
