from .dilithium.default_parameters import Dilithium2 as D
from .shake.shake_wrapper import shake256, shake128
from .utilities.utils import solidity_compact_mat, solidity_compact_vec

# An example of Dilithium.
msg = b"We are ZKNox."

D.set_drbg_seed(b"123456789012345678901234567890123456789012345678")
pk, sk = D.keygen()

# PK
ρ, t1 = D._unpack_pk(pk)
A_hat = D._expand_matrix_from_seed(ρ, _xof=shake128)
tr = D._h(pk, 64, _xof=shake256)

# Compact PK for Solidity
A_hat_compact = A_hat.compact_256(32)
t1_compact = t1.compact_256(32)

XOF = shake256
file = open(
    "../test/ZKNOX_dilithium.t.sol", 'w')
file.write("""
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
//  Code obtained from `generate_test_vectors.py` python file

import {Test, console} from "forge-std/Test.sol";
import {ZKNOX_dilithium} from "../src/ZKNOX_dilithium.sol";
import {PKContract} from "../src/ZKNOX_PKContract.sol";
import {DeployPKContract} from "../script/Deploy_MLDSA_PK.s.sol";
import {Constants} from "./ZKNOX_seed.sol";
import {PythonSigner} from "../src/ZKNOX_PythonSigner.sol";

contract DilithiumTest is Test {
    ZKNOX_dilithium dilithium = new ZKNOX_dilithium();
    PythonSigner pythonSigner = new PythonSigner();

    function testVerify() public {
""")

file.write("// Public key\n")
file.write(solidity_compact_mat(A_hat_compact, 'aHat'))
file.write("bytes memory tr = hex\"{}\";\n".format(tr.hex()))
file.write(solidity_compact_vec(t1_compact, 't1'))

# SIG
sig = D.sign(sk, msg, _xof=XOF)
assert D.verify(pk, msg, sig, _xof=XOF)
file.write("\nbytes memory publicKeyData = abi.encode(abi.encode(aHat), tr, abi.encode(t1));\n")
file.write("PKContract pubKeyContract = new PKContract(publicKeyData);\n")
file.write("bytes memory sig = hex\"{}\";\n".format(sig.hex()))
file.write("""

        // MESSAGE
        bytes memory msgs = "We are ZKNox.";
        uint256 gasStart = gasleft();
        bool ver = dilithium.verify(abi.encodePacked(address(pubKeyContract)), msgs, sig, "");
        uint256 gasUsed = gasStart - gasleft();
        console.log("Gas used:", gasUsed);
        assertTrue(ver);
    }

    function testVerifyShorter() public {
        // Public key contract
        DeployPKContract deployPkContract = new DeployPKContract();
        address mldsaAddress = deployPkContract.run();

        string memory data = "0x1111222233334444111122223333444411112222333344441111222233334444";
        bytes memory dataBytes = hex"1111222233334444111122223333444411112222333344441111222233334444";
        string memory mode = "NIST";
        string memory seedStr = Constants.SEED_POSTQUANTUM_STR;
        (bytes memory cTilde, bytes memory z, bytes memory h) = pythonSigner.sign("pythonref", data, mode, seedStr);
        bytes memory sig = abi.encodePacked(cTilde, z, h);

        // MESSAGE
        uint256 gasStart = gasleft();
        bool ver = dilithium.verify(abi.encodePacked(mldsaAddress), dataBytes, sig, "");
        uint256 gasUsed = gasStart - gasleft();
        console.log("Gas used:", gasUsed);
        assertTrue(ver);
    }
}
""")
file.close()
