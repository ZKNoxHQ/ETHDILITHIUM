from .dilithium.default_parameters import Dilithium2 as D
from .keccak_prng.keccak_prng_wrapper import Keccak256PRNG
from .utilities.utils import solidity_compact_mat, solidity_compact_vec

# An example of ETHDilithium.
msg = b"We are ZKNox."

D.set_drbg_seed(b"123456789012345678901234567890123456789012345678")
pk, sk = D.keygen(_xof=Keccak256PRNG, _xof2=Keccak256PRNG)

# PK
A_hat, tr, t1_new = D.pk_for_eth(pk)

# Compact PK for Solidity
A_hat_compact = A_hat.compact_256(32)
t1_new_compact = t1_new.compact_256(32)

XOF = Keccak256PRNG
file = open(
    "../test/ZKNOX_ethdilithium.t.sol", 'w')
file.write("""
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
//  Code obtained from `generate_test_vectors.py` python file

import {Test, console} from "forge-std/Test.sol";
import {ZKNOX_ethdilithium} from "../src/ZKNOX_ethdilithium.sol";
import "../src/ZKNOX_dilithium_utils.sol";

contract ETHDilithiumTest is Test {
    ZKNOX_ethdilithium dilithium = new ZKNOX_ethdilithium();
           
    function testVerify() public {
""")

file.write("// Public key\n")
file.write(solidity_compact_mat(A_hat_compact, 'A_hat'))
file.write("bytes memory tr = hex\"{}\";\n".format(tr.hex()))
file.write(solidity_compact_vec(t1_new_compact, 't1'))

# SIG
sig = D.sign(sk, msg, _xof=XOF, _xof2=XOF)
z_bytes = sig[D.c_tilde_bytes: -(D.k + D.omega)]
h_bytes = sig[-(D.k + D.omega):]
assert D.verify(pk, msg, sig, _xof=XOF, _xof2=XOF)
c_tilde, z, h = D._unpack_sig(sig)

file.write("\n// Signature\n")
file.write("bytes memory c_tilde = hex\"{}\";\n".format(c_tilde.hex()))
file.write("bytes memory z_bytes = hex\"{}\";".format(z_bytes.hex()))
file.write("bytes memory h_bytes = hex\"{}\";".format(h_bytes.hex()))

file.write("""
        // CREATE PK OBJECT
        PubKey memory pk;
        pk.a_hat = A_hat;
        pk.tr = tr;
        pk.t1 = t1;

        // CREATE SIG OBJECT
        Signature memory sig;
        sig.c_tilde = c_tilde;
        sig.z = z_bytes;
        sig.h = h_bytes;

        // MESSAGE
        bytes memory msgs = "We are ZKNox.";
        uint256 gasStart = gasleft();
        bool ver = dilithium.verify(pk, msgs, sig, "");
        uint256 gasUsed = gasStart - gasleft();
        console.log("Gas used:", gasUsed);
        assertTrue(ver);
    }
}
""")
file.close()
