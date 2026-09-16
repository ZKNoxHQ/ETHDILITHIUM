// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Test, console} from "forge-std/Test.sol";
import {ZKNOX_dilithium65} from "../src/ZKNOX_dilithium65.sol";
import {F1600Helper} from "./F1600Helper.sol";
import {SSTORE2} from "sstore2/SSTORE2.sol";
import {ISigVerifier} from "InterfaceVerifier/IVerifier.sol";

/// NIST vectors through ZKNOX_dilithium65, from test/KAT/mldsa65_vectors.json
/// (written by js/gen_test_vectors65.js):
///   - the ACVP ML-DSA-65 sigVer vectors, external interface, pure mode:
///     contexts of 0..255 bytes, messages up to 8 KB, valid signatures and
///     signatures corrupted in z, in the hints, in the commitment c~, and
///     modified messages, each with NIST's expected verdict;
///   - the first counts of PQCsignKAT_Dilithium3.rsp (NIST reference
///     implementation, deterministic signing, empty context).
/// Every public key is expanded to its on-chain blob by js/mldsa65.js.
contract Dilithium65VectorsTest is Test {
    ZKNOX_dilithium65 dilithium;

    function setUp() public {
        dilithium = new ZKNOX_dilithium65(F1600Helper.deploy(vm));
    }

    /// the file is a few MB: kept in memory, never in storage
    function _json() internal view returns (string memory) {
        return vm.readFile("test/KAT/mldsa65_vectors.json");
    }

    function _field(uint256 i, string memory f) internal pure returns (string memory) {
        return string.concat(".vectors[", vm.toString(i), "].", f);
    }

    function testNistVectors() public {
        string memory json = _json();
        uint256 n = vm.parseJsonUint(json, ".count");
        uint256 valid;
        uint256 rejected;
        for (uint256 i = 0; i < n; i++) {
            string memory name = vm.parseJsonString(json, _field(i, "name"));
            bytes memory blob = vm.parseJsonBytes(json, _field(i, "blob"));
            bytes memory m = vm.parseJsonBytes(json, _field(i, "msg"));
            bytes memory ctx = vm.parseJsonBytes(json, _field(i, "ctx"));
            bytes memory sig = vm.parseJsonBytes(json, _field(i, "sig"));
            bool expected = vm.parseJsonBool(json, _field(i, "valid"));

            bytes memory pk = dilithium.setKey(blob);
            bool got = dilithium.verify(pk, m, sig, ctx);
            if (got != expected) {
                console.log("MISMATCH:", name);
            }
            assertEq(got, expected, name);
            if (expected) valid++;
            else rejected++;
        }
        console.log("vectors:", n, "valid:", valid);
        console.log("rejected as expected:", rejected);
        assertGt(valid, 0);
        assertGt(rejected, 0);
    }

    /// the 32-byte-message interface (ISigVerifier.verify(pk, hash, sig)): a
    /// deterministic signature of a 32-byte hash with an empty context, made
    /// by js/gen_test_vectors65.js with the secret key of .rsp count 0
    /// (`.hash32` of the JSON), checked against that count's public key.
    function testInterfaceSelector() public {
        string memory json = _json();
        uint256 n = vm.parseJsonUint(json, ".count");
        // the .rsp vectors sit after the ACVP ones; find the first one
        uint256 idx = type(uint256).max;
        for (uint256 i = 0; i < n; i++) {
            if (vm.parseJsonUint(json, _field(i, "tcId")) == 0) {
                idx = i;
                break;
            }
        }
        require(idx != type(uint256).max, "rsp count 0 missing");
        bytes memory blob = vm.parseJsonBytes(json, _field(idx, "blob"));
        bytes memory pk = dilithium.setKey(blob);
        bytes memory sig = vm.parseJsonBytes(json, ".hash32.sig");
        bytes32 h = vm.parseJsonBytes32(json, ".hash32.hash");
        assertEq(dilithium.verify(pk, h, sig), ISigVerifier.verify.selector);
        // wrong hash
        assertEq(dilithium.verify(pk, ~h, sig), bytes4(0xFFFFFFFF));
        // wrong length
        bytes memory short = new bytes(3308);
        assertEq(dilithium.verify(pk, h, short), bytes4(0xFFFFFFFF));
    }
}
