// SPDX-License-Identifier: MIT
// ML-DSA-44 with the expanded public key in the calldata: the key bytes, what
// the verifier refuses, and what a verification transaction costs (the form
// of test/dilithium65_key.t.sol, DECISIONS.md ADR-010).
pragma solidity ^0.8.25;

import {Test, console} from "forge-std/Test.sol";
import {ZKNOX_dilithium} from "../src/ZKNOX_dilithium.sol";
import {
    readPubKeyCalldata,
    readPubKeyPacked,
    checkPubKeyCalldata,
    encodePubKeyFlat,
    BadPubKeyBlob,
    POLY_BYTES,
    KEY_POLYS,
    KEY_BYTES
} from "../src/ZKNOX_dilithium_core_packed.sol";
import {PubKey} from "../src/ZKNOX_dilithium_utils.sol";
import {ISigVerifier} from "InterfaceVerifier/IVerifier.sol";
import {DeployPKContract} from "../script/Deploy_MLDSA_PK.s.sol";
import {PythonSigner} from "../src/ZKNOX_PythonSigner.sol";
import {Constants} from "./seed.sol";
import {F1600Helper} from "./F1600Helper.sol";

/// same signature as the verifier, does nothing: subtracting a call to it
/// removes the caller-side cost of building the 21,216-byte argument, which a
/// transaction pays as calldata and not as execution
contract NullSink {
    function verify(bytes calldata, bytes calldata, bytes calldata, bytes calldata) external pure returns (bool) {
        return true;
    }
}

/// external wrappers so that the calldata readers see calldata and vm.expectRevert observes their reverts
contract PkReader {
    function read(bytes calldata key) external pure returns (PubKey memory) {
        return readPubKeyCalldata(key);
    }

    function check(bytes calldata key) external pure returns (bool) {
        return checkPubKeyCalldata(key);
    }
}

contract DilithiumKeyTest is Test {
    uint256 constant TX_BASE = 21000;
    uint256 constant CALLDATA_NONZERO = 16;
    uint256 constant CALLDATA_ZERO = 4;

    ZKNOX_dilithium verifier;
    DeployPKContract dep;
    PythonSigner pythonSigner = new PythonSigner();

    function setUp() public {
        verifier = new ZKNOX_dilithium(F1600Helper.deploy(vm));
        dep = new DeployPKContract();
    }

    /// the example key as the verifier takes it, a signature of the python
    /// signer on a 32-byte message (NIST mode, empty context)
    function _vector() internal returns (bytes memory key, bytes memory m, bytes memory sig) {
        key = dep.flatKey();
        m = hex"1111222233334444111122223333444411112222333344441111222233334444";
        (bytes memory cTilde, bytes memory z, bytes memory h) = pythonSigner.sign(
            "pythonref",
            "0x1111222233334444111122223333444411112222333344441111222233334444",
            "NIST",
            Constants.SEED_POSTQUANTUM_STR
        );
        sig = abi.encodePacked(cTilde, z, h);
    }

    /// the constants used as assembly literals agree, and the encoder's key matches them
    function test_keyShapeConstants() public view {
        assertEq(KEY_BYTES, KEY_POLYS * POLY_BYTES + 96);
        assertEq(KEY_POLYS, 16 + 4);
        assertEq(dep.flatKey().length, KEY_BYTES);
    }

    /// the flat key decodes to the same polynomials and tr as the ABI blob of
    /// the SSTORE2 form (readPubKeyPacked, the form ZKNOX_ethdilithium keeps)
    function test_flatKeyMatchesBlob() public {
        bytes memory key = dep.flatKey();
        PubKey memory a = new PkReader().read(key);
        PubKey memory b = readPubKeyPacked(dep.run());
        assertEq(keccak256(a.tr), keccak256(b.tr));
        for (uint256 i = 0; i < 4; i++) {
            assertEq(keccak256(abi.encodePacked(a.t1[i])), keccak256(abi.encodePacked(b.t1[i])));
            for (uint256 j = 0; j < 4; j++) {
                assertEq(keccak256(abi.encodePacked(a.aHat[i][j])), keccak256(abi.encodePacked(b.aHat[i][j])));
            }
        }
        // and the encoder is the inverse of the reader
        assertEq(keccak256(encodePubKeyFlat(a.aHat, a.tr, a.t1)), keccak256(key));
        assertTrue(new PkReader().check(key));
    }

    /// setKey hands the key back unchanged and writes nothing
    function test_setKeyIsIdentity() public {
        (bytes memory key, bytes memory m, bytes memory sig) = _vector();
        bytes memory pk = verifier.setKey(key);
        assertEq(keccak256(pk), keccak256(key));
        assertTrue(verifier.verify(pk, m, sig, ""));

        vm.expectRevert(ZKNOX_dilithium.BadKeyLength.selector);
        verifier.setKey(new bytes(KEY_BYTES - 1));
        vm.expectRevert(ZKNOX_dilithium.BadKeyLength.selector);
        verifier.setKey(new bytes(KEY_BYTES + 1));
    }

    /// the context entry and the ISigVerifier entry on the same vector
    function test_vectorAndInterface() public {
        (bytes memory key, bytes memory m, bytes memory sig) = _vector();
        assertTrue(verifier.verify(key, m, sig, ""));
        assertEq(verifier.verify(key, bytes32(m), sig), ISigVerifier.verify.selector);
        // a signature of the wrong length is refused by the interface entry, reverted by the other
        bytes memory short = new bytes(2419);
        assertEq(verifier.verify(key, bytes32(m), short), bytes4(0xFFFFFFFF));
        vm.expectRevert(ZKNOX_dilithium.InvalidSignatureLength.selector);
        verifier.verify(key, m, short, "");
    }

    /// corrupted signature, message and context rejected
    function test_rejects() public {
        (bytes memory key, bytes memory m, bytes memory sig) = _vector();
        uint256[3] memory positions = [uint256(5), 1000, 2400]; // c~, z, h
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
        vm.expectRevert(ZKNOX_dilithium.ContextTooLong.selector);
        verifier.verify(key, m, sig, new bytes(256));
    }

    /// a key of the wrong shape reverts, a well-formed but corrupted one does not verify
    function test_badKeys() public {
        (bytes memory key, bytes memory m, bytes memory sig) = _vector();

        vm.expectRevert(BadPubKeyBlob.selector);
        verifier.verify(new bytes(KEY_BYTES - 32), m, sig, "");
        vm.expectRevert(BadPubKeyBlob.selector);
        verifier.verify("", m, sig, "");

        // a length word that is not 32 (polynomial 7) or not 64 (tr)
        PkReader reader = new PkReader();
        bytes memory bad = bytes.concat(key);
        bad[7 * POLY_BYTES + 31] = 0x21;
        vm.expectRevert(BadPubKeyBlob.selector);
        verifier.verify(bad, m, sig, "");
        assertFalse(reader.check(bad));
        vm.expectRevert(BadPubKeyBlob.selector);
        reader.read(bad);
        bad = bytes.concat(key);
        bad[KEY_POLYS * POLY_BYTES + 31] = 0x41;
        vm.expectRevert(BadPubKeyBlob.selector);
        verifier.verify(bad, m, sig, "");

        // a coefficient of A, of t1, a byte of tr
        uint256[3] memory positions = [uint256(5000), 16 * POLY_BYTES + 100, KEY_BYTES - 10];
        for (uint256 i = 0; i < 3; i++) {
            bad = bytes.concat(key);
            bad[positions[i]] ^= 0x01;
            assertFalse(verifier.verify(bad, m, sig, ""));
        }
    }

    /// what a verification transaction costs, and what the key weighs in it
    function test_gasPerVerification() public {
        (bytes memory key, bytes memory m, bytes memory sig) = _vector();
        NullSink sink = new NullSink();

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
        assertLt(total, 2_000_000);
    }
}
