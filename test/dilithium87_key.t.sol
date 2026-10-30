// SPDX-License-Identifier: MIT
// ML-DSA-87 with the expanded public key in the calldata: the key bytes, what
// the verifier refuses, and what a verification transaction costs.
pragma solidity ^0.8.25;

import {Test, console} from "forge-std/Test.sol";
import {ZKNOX_dilithium87} from "../src/ZKNOX_dilithium87.sol";
import {POLY_BYTES87, KEY_POLYS87, KEY_BYTES87} from "../src/ZKNOX_dilithium87_core_packed.sol";
import {BadPubKeyBlob} from "../src/ZKNOX_dilithium_core_packed.sol";
import {ISigVerifier} from "InterfaceVerifier/IVerifier.sol";
import {F1600Helper} from "./F1600Helper.sol";

/// same signature as the verifier, does nothing: subtracting a call to it
/// removes the caller-side cost of building the 67,680-byte argument, which a
/// transaction pays as calldata and not as execution
contract NullSink87 {
    function verify(bytes calldata, bytes calldata, bytes calldata, bytes calldata) external pure returns (bool) {
        return true;
    }
}

contract Dilithium87KeyTest is Test {
    uint256 constant TX_BASE = 21000;
    uint256 constant CALLDATA_NONZERO = 16;
    uint256 constant CALLDATA_ZERO = 4;
    // code deposit per byte today and with EIP-8037, and the EIP-7825 transaction cap
    uint256 constant DEPOSIT_NOW = 200;
    uint256 constant DEPOSIT_8037 = 1530;
    uint256 constant TX_CAP = 1 << 24;
    // EIP-170
    uint256 constant MAX_CODE = 24576;

    ZKNOX_dilithium87 verifier;

    function setUp() public {
        verifier = new ZKNOX_dilithium87(F1600Helper.deploy(vm));
    }

    function _kat() internal view returns (bytes memory key, bytes memory m, bytes memory sig) {
        string memory kat = vm.readFile("test/KAT/mldsa87_kat0.json");
        key = vm.parseJsonBytes(kat, ".blob");
        m = vm.parseJsonBytes(kat, ".msg");
        sig = vm.parseJsonBytes(kat, ".sig");
    }

    /// the constants used as assembly literals agree, and the encoder's key matches them
    function test_keyShapeConstants() public view {
        assertEq(KEY_BYTES87, KEY_POLYS87 * POLY_BYTES87 + 96);
        assertEq(KEY_POLYS87, 8 * 7 + 8);
        (bytes memory key,,) = _kat();
        assertEq(key.length, KEY_BYTES87);
    }

    /// setKey hands the key back unchanged and writes nothing
    function test_setKeyIsIdentity() public {
        (bytes memory key, bytes memory m, bytes memory sig) = _kat();
        bytes memory pk = verifier.setKey(key);
        assertEq(keccak256(pk), keccak256(key));
        assertTrue(verifier.verify(pk, m, sig, ""));

        vm.expectRevert(ZKNOX_dilithium87.BadKeyLength.selector);
        verifier.setKey(new bytes(KEY_BYTES87 - 1));
        vm.expectRevert(ZKNOX_dilithium87.BadKeyLength.selector);
        verifier.setKey(new bytes(KEY_BYTES87 + 1));
    }

    /// the NIST KAT and the ISigVerifier entry on the hash32 vector
    function test_katAndInterface() public view {
        (bytes memory key, bytes memory m, bytes memory sig) = _kat();
        assertTrue(verifier.verify(key, m, sig, ""));

        string memory v = vm.readFile("test/KAT/mldsa87_vectors.json");
        assertEq(
            verifier.verify(key, vm.parseJsonBytes32(v, ".hash32.hash"), vm.parseJsonBytes(v, ".hash32.sig")),
            ISigVerifier.verify.selector
        );
    }

    /// corrupted signature, message and context rejected; wrong signature
    /// length and context length revert
    function test_rejects() public {
        (bytes memory key, bytes memory m, bytes memory sig) = _kat();
        uint256[5] memory positions = [uint256(5), 63, 1000, 4543, 4600]; // c~ (2), z (2), h
        for (uint256 i = 0; i < positions.length; i++) {
            bytes memory bad = bytes.concat(sig);
            bad[positions[i]] ^= 0x01;
            assertFalse(verifier.verify(key, m, bad, ""));
        }
        bytes memory badMsg = bytes.concat(m);
        badMsg[0] ^= 0x01;
        assertFalse(verifier.verify(key, badMsg, sig, ""));
        // the signature was made with an empty context
        assertFalse(verifier.verify(key, m, sig, hex"00"));

        vm.expectRevert(ZKNOX_dilithium87.InvalidSignatureLength.selector);
        verifier.verify(key, m, bytes.concat(sig, hex"00"), "");
        vm.expectRevert(ZKNOX_dilithium87.ContextTooLong.selector);
        verifier.verify(key, m, sig, new bytes(256));
    }

    /// a key of the wrong shape reverts, a well-formed but corrupted one does not verify
    function test_badKeys() public {
        (bytes memory key, bytes memory m, bytes memory sig) = _kat();

        vm.expectRevert(BadPubKeyBlob.selector);
        verifier.verify(new bytes(KEY_BYTES87 - 32), m, sig, "");
        vm.expectRevert(BadPubKeyBlob.selector);
        verifier.verify("", m, sig, "");
        // the ML-DSA-65 key length is not accepted either
        vm.expectRevert(BadPubKeyBlob.selector);
        verifier.verify(new bytes(38112), m, sig, "");

        // a byte of A, of t1 and of tr: well formed, another key
        uint256[3] memory at = [uint256(5000), 56 * POLY_BYTES87 + 100, KEY_BYTES87 - 1];
        for (uint256 i = 0; i < 3; i++) {
            bytes memory bad = bytes.concat(key);
            bad[at[i]] ^= 0x01;
            assertFalse(verifier.verify(bad, m, sig, ""));
        }
    }

    /// what a verification transaction costs, what the key weighs in it, and
    /// what the SSTORE2 alternative would cost to install (ADR-012)
    function test_gasPerVerification() public {
        (bytes memory key, bytes memory m, bytes memory sig) = _kat();
        NullSink87 sink = new NullSink87();

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

        // the key alone in the calldata
        uint256 keyZeros;
        for (uint256 i = 0; i < key.length; i++) {
            if (key[i] == 0) keyZeros++;
        }
        uint256 keyGas = (key.length - keyZeros) * CALLDATA_NONZERO + keyZeros * CALLDATA_ZERO;

        console.log("calldata bytes", cd.length, "of which zero", zeros);
        console.log("calldata gas", calldataGas, "execution", execution);
        console.log("calldata gas of the key", keyGas);
        console.log("transaction total", total);
        console.log("EIP-7623 floor", floorTotal);
        console.log("SSTORE2 code deposit of the key, today", KEY_BYTES87 * DEPOSIT_NOW);
        console.log("SSTORE2 code deposit of the key, EIP-8037", KEY_BYTES87 * DEPOSIT_8037);
        console.log("break-even (verifications per key), today", KEY_BYTES87 * DEPOSIT_NOW / keyGas);
        console.log("break-even (verifications per key), EIP-8037", KEY_BYTES87 * DEPOSIT_8037 / keyGas);

        assertGt(total, floorTotal, "the EIP-7623 floor must stay below the standard cost");
        // the key is the bulk of the calldata
        assertGt(keyGas, 2 * (calldataGas - keyGas));
        // one transaction, far under the EIP-7825 cap and the 128 KB transaction size of geth
        assertLt(total, 4_000_000);
        assertLt(cd.length + 4, 128 * 1024);
        // the SSTORE2 alternative: more than two EIP-170 contracts, and after
        // EIP-8037 more than six transactions at the cap for the deposit alone
        assertGt(KEY_BYTES87, 2 * MAX_CODE);
        assertGt(KEY_BYTES87 * DEPOSIT_8037, 6 * TX_CAP);
    }
}
