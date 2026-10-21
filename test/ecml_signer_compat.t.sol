// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Test, console} from "forge-std/Test.sol";
import {ZKNOX_dilithium65} from "../src/ZKNOX_dilithium65.sol";
import {F1600Helper} from "./F1600Helper.sol";
import {ISigVerifier} from "InterfaceVerifier/IVerifier.sol";

/// ML-DSA-65 signatures produced by the ECML-Signer Ledger app (release ELF
/// build/nanos2/bin/app.elf of ZKNoxHQ/ecml-signer, run under speculos) through
/// HYBRID_SIGN_HASH (0x16) and SIGN_TX_MLDSA (0x08), P2 = ML-DSA-65.
/// test/KAT/ecml_device_vectors.json: the 32-byte digest the device signed,
/// its 1952-byte public key, that key expanded by js/mldsa65.js
/// (publicKeyToBlob65), and the 3309-byte signature.
contract EcmlSignerCompatTest is Test {
    ZKNOX_dilithium65 dilithium;

    function setUp() public {
        dilithium = new ZKNOX_dilithium65(F1600Helper.deploy(vm));
    }

    function _json() internal view returns (string memory) {
        return vm.readFile("test/KAT/ecml_device_vectors.json");
    }

    function _f(uint256 i, string memory f) internal pure returns (string memory) {
        return string.concat(".vectors[", vm.toString(i), "].", f);
    }

    function testDeviceSignaturesVerify() public view {
        string memory json = _json();
        uint256 n = vm.parseJsonUint(json, ".count");
        assertGt(n, 0);
        for (uint256 i = 0; i < n; i++) {
            string memory flow = vm.parseJsonString(json, _f(i, "flow"));
            bytes32 h = vm.parseJsonBytes32(json, _f(i, "hash"));
            bytes memory blob = vm.parseJsonBytes(json, _f(i, "blob"));
            bytes memory sig = vm.parseJsonBytes(json, _f(i, "sig"));
            bytes memory pk = dilithium.setKey(blob);

            // ISigVerifier entry, what the PQ accounts call
            uint256 g = gasleft();
            bytes4 r = dilithium.verify(pk, h, sig);
            g -= gasleft();
            assertEq(r, ISigVerifier.verify.selector, flow);
            console.log(flow, "verify(pk, bytes32, sig) gas:", g);

            // pure FIPS 204 entry with an explicit empty context, same M'
            assertTrue(dilithium.verify(pk, abi.encodePacked(h), sig, ""), flow);
        }
    }

    function testDeviceSignaturesRejectTampering() public view {
        string memory json = _json();
        uint256 n = vm.parseJsonUint(json, ".count");
        for (uint256 i = 0; i < n; i++) {
            string memory flow = vm.parseJsonString(json, _f(i, "flow"));
            bytes32 h = vm.parseJsonBytes32(json, _f(i, "hash"));
            bytes memory blob = vm.parseJsonBytes(json, _f(i, "blob"));
            bytes memory sig = vm.parseJsonBytes(json, _f(i, "sig"));
            bytes memory pk = dilithium.setKey(blob);

            // other digest
            assertEq(dilithium.verify(pk, h ^ bytes32(uint256(1)), sig), bytes4(0xFFFFFFFF), flow);
            // a non-empty context changes M'
            assertFalse(dilithium.verify(pk, abi.encodePacked(h), sig, hex"00"), flow);
            // c~, z, h each flipped
            uint16[3] memory at = [uint16(0), uint16(1000), uint16(3300)];
            for (uint256 k = 0; k < 3; k++) {
                bytes memory s = bytes.concat(sig);
                s[at[k]] = s[at[k]] ^ 0x01;
                bytes4 rr;
                try dilithium.verify(pk, h, s) returns (bytes4 x) {
                    rr = x;
                } catch {
                    rr = 0xFFFFFFFF;
                }
                assertEq(rr, bytes4(0xFFFFFFFF), flow);
            }
            // the digest of another device vector
            if (n > 1) {
                uint256 j = (i + 1) % n;
                bytes32 hj = vm.parseJsonBytes32(json, _f(j, "hash"));
                if (hj != h) {
                    assertEq(dilithium.verify(pk, hj, sig), bytes4(0xFFFFFFFF), flow);
                }
            }
        }
    }
}
