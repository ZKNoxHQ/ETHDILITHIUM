from .dilithium.default_parameters import Dilithium2 as D
from .shake.shake_wrapper import shake256, shake128
from .tests.test_dilithium import parse_kat_data
from dilithium_py.drbg.aes256_ctr_drbg import AES256_CTR_DRBG

entropy_input = bytes([i for i in range(48)])
drbg = AES256_CTR_DRBG(entropy_input)

with open(f"assets/PQCsignKAT_Dilithium2.rsp") as f:
    # extract data from KAT
    kat_data = f.read()
    parsed_data = parse_kat_data(kat_data)

count = 0  # for count in range(100):
data = parsed_data[count]

seed = drbg.random_bytes(48)

msg_len = data["mlen"]
msg = drbg.random_bytes(msg_len)

D.set_drbg_seed(seed)
pk, sk = D.keygen()

# Check that the signature matches
sm_KAT = data["sm"]
sig_KAT = sm_KAT[:-msg_len]

# PK
ρ, t1 = D._unpack_pk(pk)
A_hat = D._expand_matrix_from_seed(ρ, _xof=shake128)
tr = D._h(pk, 64, _xof=shake256)

# Compact PK for Solidity
A_hat_compact = A_hat.compact_256(32)
t1_compact = t1.compact_256(32)


def solidity_compact_elt(h, name):
    out = "uint256[] memory {} = new uint256[](32);".format(name)
    for (i, coeff) in enumerate(h):
        out += '{}[{}] = uint256(0x00{:x});'.format(name, i, coeff)
    return out+"\n"


def solidity_compact_vec(h, name):
    n = len(h)
    out = 'uint256[][] memory {} = new uint256[][]({});\n'.format(name, n)
    out += "for (uint256 i = 0 ; i < 4 ; i ++) {\n"
    out += "\t{}[i] = new uint256[](32);\n".format(name)
    out += "}\n"

    for (i, a) in enumerate(h):
        for (j, b) in enumerate(a[0]):  # len(a) = 1...
            out += "{}[{}][{}] = uint256(0x00{:x});".format(name, i, j, b)
    return out+"\n"


def solidity_compact_mat(h, name):
    n, m = len(h), len(h[0])
    out = 'uint256[][][] memory {} = new uint256[][][]({});\n'.format(name, n)
    out += "for (uint256 i = 0 ; i < {} ; i++) {{\n".format(n)
    out += "\t{}[i] = new uint256[][]({});\n".format(name, m)
    out += "\tfor (uint256 j = 0 ; j < {}; j++) {{\n".format(m)
    out += "\t\t{}[i][j] = new uint256[](32);\n".format(name)
    out += "\t}\n"
    out += "}\n"
    for (i, a) in enumerate(h):
        for (j, b) in enumerate(a):
            for (k, c) in enumerate(b):
                out += "{}[{}][{}][{}] = uint256(0x00{:x});".format(
                    name, i, j, k, c)
    return out+"\n"


XOF = shake256
file = open(
    "../test/ZKNOX_dilithiumKATS.t.sol", 'w')
file.write("""
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
//  Code obtained from `generate_test_vectors.py` python file

import {Test, console} from "forge-std/Test.sol";
import {ZKNOX_dilithium} from "../src/ZKNOX_dilithium.sol";
import "../src/ZKNOX_dilithium_utils.sol";
import "../src/ZKNOX_dilithium_deploy.sol";

contract KATDilithiumTest is Test {
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
z_bytes = sig[D.c_tilde_bytes: -(D.k + D.omega)]
h_bytes = sig[-(D.k + D.omega):]
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
        """)
file.write("bytes memory msgs = hex\"{}\";\n".format(msg.hex()))
file.write("""
        uint256 gasStart = gasleft();
        bool ver = dilithium.verify(pk, msgs, sig, "");
        uint256 gasUsed = gasStart - gasleft();
        console.log("Gas used:", gasUsed);
        assertTrue(ver);
    }
}
""")
file.close()
