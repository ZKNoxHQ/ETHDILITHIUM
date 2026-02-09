// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "../src/ZKNOX_shake4x.sol";
import "../src/ZKNOX_shake.sol";
import {Test, console} from "forge-std/Test.sol";

contract ZKNOX_Shake4xTest is Test {
    function _scalarDigest(bytes memory input, uint256 size) internal pure returns (bytes memory) {
        CtxShake memory ctx;
        ctx = shakeUpdate(ctx, input);
        return shakeDigest(ctx, size);
    }

    // Deep-copy a uint64[25] to avoid aliasing
    function _copy64(uint64[25] memory src) internal pure returns (uint64[25] memory dst) {
        for (uint256 w = 0; w < 25; w++) {
            dst[w] = src[w];
        }
    }

    // Known f1600(zeros) result — used as constant reference
    // forgefmt: disable-next-line
    function _f1600ZeroRef() internal pure returns (uint64[25] memory) {
        return [
            uint64(0xF1258F7940E1DDE7),
            0x84D5CCF933C0478A,
            0xD598261EA65AA9EE,
            0xBD1547306F80494D,
            0x8B284E056253D057,
            0xFF97A42D7F8E6FD4,
            0x90FEE5A0A44647C4,
            0x8C5BDA0CD6192E76,
            0xAD30A6F71B19059C,
            0x30935AB7D08FFC64,
            0xEB5AA93F2317D635,
            0xA9A6E6260D712103,
            0x81A57C16DBCF555F,
            0x43B831CD0347C826,
            0x01F22F1A11A5569F,
            0x05E5635A21D9AE61,
            0x64BEFEF28CC970F2,
            0x613670957BC46611,
            0xB87C5A554FD00ECB,
            0x8C3EE88A1CCF32C8,
            0x940C7922AE3A2614,
            0x1841F924A2C509E4,
            0x16F53526E70465C2,
            0x75F644E97F30A13B,
            0xEAF1FF7B5CECA249
        ];
    }

    // ================================================================
    //  TEST 1: f1600_4x on 4x zero states
    // ================================================================
    function test_f1600_4x_zero() public pure {
        uint256[25] memory packed;
        packed = f1600_4x(packed);

        uint64[25] memory EXPECTED = _f1600ZeroRef();

        for (uint256 lane = 0; lane < 4; lane++) {
            uint64[25] memory result = unpack4x_lane(packed, lane);
            for (uint256 w = 0; w < 25; w++) {
                assertEq(result[w], EXPECTED[w]);
            }
        }
    }

    // ================================================================
    //  TEST 2: f1600_4x vs scalar — all lanes same non-zero data
    //  Uses deep copies to avoid any memory aliasing
    // ================================================================
    function test_f1600_4x_vs_scalar() public pure {
        // forgefmt: disable-next-line
        uint64[25] memory orig = [
            uint64(0xf2a3a3057654e665),
            0xce044847fc85f48e,
            0xec3bd70f31a2866a,
            0x7bada64d3aa28d05,
            0xdf2d6ae3aa215523,
            0x18b3f802c1c29a3f,
            0x6044c64141c18ca1,
            0x867be8cca2f1a54,
            0x73773b337ce4e5eb,
            0x7b8b093e6cc376c6,
            0x3ed5eb2ef9295a2a,
            0xd6ab08c040f891d2,
            0x329ec3f446ae8bc6,
            0x21ce09a9142a7a7d,
            0xc5d90ada910c2965,
            0xefa939add08954f4,
            0xdfd33eee70e98a5a,
            0x69c21fbc22c1f12a,
            0x99e8f946ed7c1708,
            0xc47ef08b0c9f3f9f,
            0x5a102b80ec0fb414,
            0x52d66d1377cf6219,
            0x3a79068ab1f1288,
            0x17a59fb049fd9130,
            0x9fccb95c262e9e76
        ];

        // Deep copy for scalar (f1600 mutates in-place)
        uint64[25] memory for_scalar = _copy64(orig);

        // Deep copies for pack (avoid 4 aliases to same memory)
        uint64[25] memory c0 = _copy64(orig);
        uint64[25] memory c1 = _copy64(orig);
        uint64[25] memory c2 = _copy64(orig);
        uint64[25] memory c3 = _copy64(orig);

        uint256[25] memory packed = pack4x(c0, c1, c2, c3);
        packed = f1600_4x(packed);

        uint64[25] memory scalar_result = f1600(for_scalar);

        for (uint256 lane = 0; lane < 4; lane++) {
            uint64[25] memory lane_result = unpack4x_lane(packed, lane);
            for (uint256 w = 0; w < 25; w++) {
                assertEq(lane_result[w], scalar_result[w]);
            }
        }
    }

    // ================================================================
    //  TEST 3: Lane independence — 4 different inputs
    //  Compares lane 0 (zeros) against known constant to avoid f1600 aliasing.
    //  Other lanes compared via separate scalar calls with deep copies.
    // ================================================================
    function test_f1600_4x_independence_lane0() public pure {
        uint64[25] memory s0; // zeros
        uint64[25] memory s1;
        uint64[25] memory s2;
        uint64[25] memory s3;
        s1[0] = 0x0000000000000001;
        s2[0] = 0x0000000000000002;
        s2[1] = 0xDEADBEEFCAFEBABE;
        s3[0] = 0xFFFFFFFFFFFFFFFF;
        s3[12] = 0x123456789ABCDEF0;

        uint256[25] memory packed = pack4x(s0, s1, s2, s3);
        packed = f1600_4x(packed);

        // Lane 0 = f1600(zeros) — compare with known constant
        uint64[25] memory expected = _f1600ZeroRef();
        uint64[25] memory r0 = unpack4x_lane(packed, 0);
        for (uint256 w = 0; w < 25; w++) {
            assertEq(r0[w], expected[w]);
        }
    }

    function test_f1600_4x_independence_lane1() public pure {
        uint64[25] memory s0;
        uint64[25] memory s1;
        s1[0] = 0x0000000000000001;
        uint64[25] memory s2;
        s2[0] = 0x0000000000000002;
        s2[1] = 0xDEADBEEFCAFEBABE;
        uint64[25] memory s3;
        s3[0] = 0xFFFFFFFFFFFFFFFF;
        s3[12] = 0x123456789ABCDEF0;

        // Deep copy for scalar
        uint64[25] memory s1_copy = _copy64(s1);

        uint256[25] memory packed = pack4x(s0, s1, s2, s3);
        packed = f1600_4x(packed);

        uint64[25] memory ref = f1600(s1_copy);
        uint64[25] memory r1 = unpack4x_lane(packed, 1);
        for (uint256 w = 0; w < 25; w++) {
            assertEq(r1[w], ref[w]);
        }
    }

    function test_f1600_4x_independence_lane2() public pure {
        uint64[25] memory s0;
        uint64[25] memory s1;
        s1[0] = 0x0000000000000001;
        uint64[25] memory s2;
        s2[0] = 0x0000000000000002;
        s2[1] = 0xDEADBEEFCAFEBABE;
        uint64[25] memory s3;
        s3[0] = 0xFFFFFFFFFFFFFFFF;
        s3[12] = 0x123456789ABCDEF0;

        uint64[25] memory s2_copy = _copy64(s2);

        uint256[25] memory packed = pack4x(s0, s1, s2, s3);
        packed = f1600_4x(packed);

        uint64[25] memory ref = f1600(s2_copy);
        uint64[25] memory r2 = unpack4x_lane(packed, 2);
        for (uint256 w = 0; w < 25; w++) {
            assertEq(r2[w], ref[w]);
        }
    }

    function test_f1600_4x_independence_lane3() public pure {
        uint64[25] memory s0;
        uint64[25] memory s1;
        s1[0] = 0x0000000000000001;
        uint64[25] memory s2;
        s2[0] = 0x0000000000000002;
        s2[1] = 0xDEADBEEFCAFEBABE;
        uint64[25] memory s3;
        s3[0] = 0xFFFFFFFFFFFFFFFF;
        s3[12] = 0x123456789ABCDEF0;

        uint64[25] memory s3_copy = _copy64(s3);

        uint256[25] memory packed = pack4x(s0, s1, s2, s3);
        packed = f1600_4x(packed);

        uint64[25] memory ref = f1600(s3_copy);
        uint64[25] memory r3 = unpack4x_lane(packed, 3);
        for (uint256 w = 0; w < 25; w++) {
            assertEq(r3[w], ref[w]);
        }
    }

    // ================================================================
    //  TEST 4: shake4xDigest — same input on all 4 lanes
    // ================================================================
    function test_shake4xDigest_same_input() public pure {
        bytes memory message =
            hex"B32D95B0B9AAD2A8816DE6D06D1F86008505BD8C14124F6E9A163B5A2ADE55F835D0EC3880EF50700D3B25E42CC0AF050CCD1BE5E555B23087E04D7BF9813622780C7313A1954F8740B6EE2D3F71F768DD417F520482BD3A08D4F222B4EE9DBD015447B33507DD50F3AB4247C5DE9A8ABD62A8DECEA01E3B87C8B927F5B08BEB37674C6F8E380C04";

        bytes memory ref_output = _scalarDigest(message, 512);

        bytes[4] memory inputs = [message, message, message, message];
        bytes[4] memory outs = shake4xDigest(inputs, 512);

        for (uint256 i = 0; i < 512; i++) {
            assertEq(outs[0][i], ref_output[i]);
            assertEq(outs[1][i], ref_output[i]);
            assertEq(outs[2][i], ref_output[i]);
            assertEq(outs[3][i], ref_output[i]);
        }
    }

    // ================================================================
    //  TEST 5: shake4xDigest — different inputs (Dilithium pattern)
    // ================================================================
    function _buildDilithiumInputs() internal pure returns (bytes[4] memory inputs) {
        bytes memory seed = hex"AABBCCDD11223344AABBCCDD11223344AABBCCDD11223344AABBCCDD11223344";
        inputs[0] = abi.encodePacked(seed, uint16(0x0000));
        inputs[1] = abi.encodePacked(seed, uint16(0x0001));
        inputs[2] = abi.encodePacked(seed, uint16(0x0002));
        inputs[3] = abi.encodePacked(seed, uint16(0x0003));
    }

    function test_shake4xDigest_diff_lane0() public pure {
        bytes[4] memory inputs = _buildDilithiumInputs();
        bytes memory ref = _scalarDigest(inputs[0], 256);
        bytes[4] memory outs = shake4xDigest(inputs, 256);
        for (uint256 i = 0; i < 256; i++) {
            assertEq(outs[0][i], ref[i]);
        }
    }

    function test_shake4xDigest_diff_lane1() public pure {
        bytes[4] memory inputs = _buildDilithiumInputs();
        bytes memory ref = _scalarDigest(inputs[1], 256);
        bytes[4] memory outs = shake4xDigest(inputs, 256);
        for (uint256 i = 0; i < 256; i++) {
            assertEq(outs[1][i], ref[i]);
        }
    }

    function test_shake4xDigest_diff_lane2() public pure {
        bytes[4] memory inputs = _buildDilithiumInputs();
        bytes memory ref = _scalarDigest(inputs[2], 256);
        bytes[4] memory outs = shake4xDigest(inputs, 256);
        for (uint256 i = 0; i < 256; i++) {
            assertEq(outs[2][i], ref[i]);
        }
    }

    function test_shake4xDigest_diff_lane3() public pure {
        bytes[4] memory inputs = _buildDilithiumInputs();
        bytes memory ref = _scalarDigest(inputs[3], 256);
        bytes[4] memory outs = shake4xDigest(inputs, 256);
        for (uint256 i = 0; i < 256; i++) {
            assertEq(outs[3][i], ref[i]);
        }
    }

    // ================================================================
    //  TEST 6: Short input (< RATE)
    // ================================================================
    function test_shake4xDigest_short_input() public pure {
        bytes memory short_msg = hex"DEADBEEF";
        bytes memory ref_output = _scalarDigest(short_msg, 64);

        bytes[4] memory inputs = [short_msg, short_msg, short_msg, short_msg];
        bytes[4] memory outs = shake4xDigest(inputs, 64);

        for (uint256 i = 0; i < 64; i++) {
            assertEq(outs[0][i], ref_output[i]);
            assertEq(outs[1][i], ref_output[i]);
            assertEq(outs[2][i], ref_output[i]);
            assertEq(outs[3][i], ref_output[i]);
        }
    }

    // ================================================================
    //  TEST 7: Multi-block squeeze (1200 bytes)
    // ================================================================
    function test_shake4xDigest_long_squeeze() public pure {
        bytes memory msg72 =
            hex"1EED9CBA179A009EC2EC5508773DD305477CA117E6D569E66B5F64C6BC64801CE25A8424CE4A26D575B8A6FB10EAD3FD1992EDDDEEC2EBE7150DC98F63ADC3237EF57B91397AA8A7";

        bytes memory ref_output = _scalarDigest(msg72, 1200);

        bytes[4] memory inputs = [msg72, msg72, msg72, msg72];
        bytes[4] memory outs = shake4xDigest(inputs, 1200);

        for (uint256 i = 0; i < 1200; i++) {
            assertEq(outs[0][i], ref_output[i]);
        }
        for (uint256 i = 0; i < 1200; i += 37) {
            assertEq(outs[1][i], ref_output[i]);
            assertEq(outs[2][i], ref_output[i]);
            assertEq(outs[3][i], ref_output[i]);
        }
    }

    // ================================================================
    //  TEST 8: Pack/Unpack roundtrip
    // ================================================================
    function test_pack_unpack_roundtrip() public pure {
        uint64[25] memory s0;
        uint64[25] memory s1;
        uint64[25] memory s2;
        uint64[25] memory s3;

        s0[0] = 0xAAAAAAAAAAAAAAAA;
        s1[0] = 0xBBBBBBBBBBBBBBBB;
        s2[0] = 0xCCCCCCCCCCCCCCCC;
        s3[0] = 0xDDDDDDDDDDDDDDDD;
        s0[24] = 0x1111111111111111;
        s3[24] = 0x4444444444444444;

        uint256[25] memory packed = pack4x(s0, s1, s2, s3);

        uint64[25] memory r0 = unpack4x_lane(packed, 0);
        uint64[25] memory r1 = unpack4x_lane(packed, 1);
        uint64[25] memory r2 = unpack4x_lane(packed, 2);
        uint64[25] memory r3 = unpack4x_lane(packed, 3);

        for (uint256 w = 0; w < 25; w++) {
            assertEq(r0[w], s0[w]);
            assertEq(r1[w], s1[w]);
            assertEq(r2[w], s2[w]);
            assertEq(r3[w], s3[w]);
        }
    }
}
