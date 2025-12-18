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
import "../src/ZKNOX_dilithium_utils.sol";

contract DilithiumTest is Test {
    ZKNOX_dilithium dilithium = new ZKNOX_dilithium();

    function testVerify() public {
""")

file.write("// Public key\n")
file.write(solidity_compact_mat(A_hat_compact, 'A_hat'))
file.write("bytes memory tr = hex\"{}\";\n".format(tr.hex()))
file.write(solidity_compact_vec(t1_compact, 't1'))

# SIG
sig = D.sign(sk, msg, _xof=XOF)
assert D.verify(pk, msg, sig, _xof=XOF)

file.write("\nPKContract PubKeyContract = new PKContract(A_hat, tr, t1);\n")
file.write("bytes memory sig = hex\"{}\";\n".format(sig.hex()))
file.write("""

        // MESSAGE
        bytes memory msgs = "We are ZKNox.";
        uint256 gasStart = gasleft();
        bool ver = dilithium.verify(abi.encodePacked(address(PubKeyContract)), msgs, sig, "");
        uint256 gasUsed = gasStart - gasleft();
        console.log("Gas used:", gasUsed);
        assertTrue(ver);
    }
}
""")
file.close()
