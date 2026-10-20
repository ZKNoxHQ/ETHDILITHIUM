// SPDX-License-Identifier: MIT
// ML-DSA-65 with the expanded public key in the calldata: the key bytes, what
// the verifier refuses, and what a verification transaction costs.
pragma solidity ^0.8.25;

import {Test, console} from "forge-std/Test.sol";
import {ZKNOX_dilithium65} from "../src/ZKNOX_dilithium65.sol";
import {readPubKeyCalldata65, POLY_BYTES65, KEY_POLYS65, KEY_BYTES65} from "../src/ZKNOX_dilithium65_core_packed.sol";
import {BadPubKeyBlob} from "../src/ZKNOX_dilithium_core_packed.sol";
import {ISigVerifier} from "InterfaceVerifier/IVerifier.sol";
import {F1600Helper} from "./F1600Helper.sol";

/// same signature as the verifier, does nothing: subtracting a call to it
/// removes the caller-side cost of building the 38,112-byte argument, which a
/// transaction pays as calldata and not as execution
contract NullSink65 {
    function verify(bytes calldata, bytes calldata, bytes calldata, bytes calldata) external pure returns (bool) {
        return true;
    }
}

contract Dilithium65KeyTest is Test {
    uint256 constant TX_BASE = 21000;
    uint256 constant CALLDATA_NONZERO = 16;
    uint256 constant CALLDATA_ZERO = 4;

    ZKNOX_dilithium65 verifier;

    function setUp() public {
        verifier = new ZKNOX_dilithium65(F1600Helper.deploy(vm));
    }

    function _kat() internal view returns (bytes memory key, bytes memory m, bytes memory sig) {
        string memory kat = vm.readFile("test/KAT/mldsa65_kat0.json");
        key = vm.parseJsonBytes(kat, ".blob");
        m = vm.parseJsonBytes(kat, ".msg");
        sig = vm.parseJsonBytes(kat, ".sig");
    }

    /// the constants used as assembly literals agree, and the encoder's key matches them
    function test_keyShapeConstants() public view {
        assertEq(KEY_BYTES65, KEY_POLYS65 * POLY_BYTES65 + 96);
        (bytes memory key,,) = _kat();
        assertEq(key.length, KEY_BYTES65);
    }

    /// setKey hands the key back unchanged and writes nothing
    function test_setKeyIsIdentity() public {
        (bytes memory key, bytes memory m, bytes memory sig) = _kat();
        bytes memory pk = verifier.setKey(key);
        assertEq(keccak256(pk), keccak256(key));
        assertTrue(verifier.verify(pk, m, sig, ""));

        vm.expectRevert(ZKNOX_dilithium65.BadKeyLength.selector);
        verifier.setKey(new bytes(KEY_BYTES65 - 1));
        vm.expectRevert(ZKNOX_dilithium65.BadKeyLength.selector);
        verifier.setKey(new bytes(KEY_BYTES65 + 1));
    }

    /// the NIST KAT and the ISigVerifier entry on the hash32 vector
    function test_katAndInterface() public view {
        (bytes memory key, bytes memory m, bytes memory sig) = _kat();
        assertTrue(verifier.verify(key, m, sig, ""));

        string memory v = vm.readFile("test/KAT/mldsa65_vectors.json");
        assertEq(
            verifier.verify(key, vm.parseJsonBytes32(v, ".hash32.hash"), vm.parseJsonBytes(v, ".hash32.sig")),
            ISigVerifier.verify.selector
        );
    }

    /// every ACVP ML-DSA-65 sigVer vector, valid and corrupted, contexts of 0..255 bytes
    function test_acvpVectors() public view {
        string memory file = vm.readFile("test/KAT/mldsa65_vectors.json");
        uint256 count = vm.parseJsonUint(file, ".count");
        for (uint256 i = 0; i < count; i++) {
            string memory at = string.concat(".vectors[", vm.toString(i), "]");
            bool got = verifier.verify(
                vm.parseJsonBytes(file, string.concat(at, ".blob")),
                vm.parseJsonBytes(file, string.concat(at, ".msg")),
                vm.parseJsonBytes(file, string.concat(at, ".sig")),
                vm.parseJsonBytes(file, string.concat(at, ".ctx"))
            );
            assertEq(
                got,
                vm.parseJsonBool(file, string.concat(at, ".valid")),
                vm.parseJsonString(file, string.concat(at, ".name"))
            );
        }
    }

    /// corrupted signature, message and context rejected
    function test_rejects() public view {
        (bytes memory key, bytes memory m, bytes memory sig) = _kat();
        uint256[3] memory positions = [uint256(5), 1000, 3300]; // c~, z, h
        for (uint256 i = 0; i < 3; i++) {
            bytes memory bad = bytes.concat(sig);
            bad[positions[i]] ^= 0x01;
            assertFalse(verifier.verify(key, m, bad, ""));
        }
        bytes memory badMsg = bytes.concat(m);
        badMsg[0] ^= 0x01;
        assertFalse(verifier.verify(key, badMsg, sig, ""));
        // the signature was made with an empty context
        assertFalse(verifier.verify(key, m, sig, hex"00"));
    }

    /// a key of the wrong shape reverts, a well-formed but corrupted one does not verify
    function test_badKeys() public {
        (bytes memory key, bytes memory m, bytes memory sig) = _kat();

        vm.expectRevert(BadPubKeyBlob.selector);
        verifier.verify(new bytes(KEY_BYTES65 - 32), m, sig, "");
        vm.expectRevert(BadPubKeyBlob.selector);
        verifier.verify("", m, sig, "");

        bytes memory bad = bytes.concat(key);
        bad[5000] ^= 0x01;
        assertFalse(verifier.verify(bad, m, sig, ""));
    }

    /// what a verification transaction costs, and what the key weighs in it
    function test_gasPerVerification() public {
        (bytes memory key, bytes memory m, bytes memory sig) = _kat();
        NullSink65 sink = new NullSink65();

        uint256 g = gasleft();
        verifier.verify(key, m, sig, "");
        uint256 raw = g - gasleft();
        g = gasleft();
        sink.verify(key, m, sig, "");
        uint256 execution = raw - (g - gasleft());

        bytes memory cd = abi.encode(key, m, sig, bytes(""));
        uint256 zeros;
        for (uint256 i = 0; i < cd.length; i++) {
            if (cd[i] == 0) zeros++;
        }
        uint256 nonZero = cd.length - zeros;
        uint256 calldataGas = 4 * CALLDATA_NONZERO + nonZero * CALLDATA_NONZERO + zeros * CALLDATA_ZERO;
        uint256 total = TX_BASE + calldataGas + execution;

        // EIP-7623: a token is a zero byte or a quarter of a non-zero one, floor 10 gas each
        uint256 tokens = zeros + 4 * nonZero;
        uint256 floorTotal = TX_BASE + 10 * tokens;

        console.log("calldata bytes", cd.length, "of which zero", zeros);
        console.log("calldata gas", calldataGas, "execution", execution);
        console.log("transaction total", total);
        console.log("EIP-7623 floor", floorTotal);

        assertGt(total, floorTotal, "the EIP-7623 floor must stay below the standard cost");
        // the key is the bulk of the calldata and a quarter of the transaction
        assertGt(calldataGas, 4 * (TX_BASE + 3309 * CALLDATA_NONZERO));
        assertLt(total, 3_000_000);
    }
}
