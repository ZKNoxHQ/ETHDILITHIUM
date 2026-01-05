from .dilithium.default_parameters import Dilithium2 as D
from .shake.shake_wrapper import shake256, shake128
from .tests.test_dilithium import parse_kat_data
from dilithium_py.drbg.aes256_ctr_drbg import AES256_CTR_DRBG
from .utilities.utils import solidity_compact_mat, solidity_compact_vec

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


XOF = shake256
file = open(
    "../test/ZKNOX_dilithiumKATS.t.sol", 'w')
file.write("""
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
//  Code obtained from `generate_test_vectors.py` python file

import {Test, console} from "forge-std/Test.sol";
import {ZKNOX_dilithium} from "../src/ZKNOX_dilithium.sol";
import {PKContract} from "../src/ZKNOX_PKContract.sol";

contract KATDilithiumTest is Test {
    ZKNOX_dilithium dilithium = new ZKNOX_dilithium();

    function testVerify() public {
""")

file.write("// Public key\n")
file.write("// pubkey = {}\n".format(pk.hex()))
file.write(solidity_compact_mat(A_hat_compact, 'aHat'))
file.write("bytes memory tr = hex\"{}\";\n".format(tr.hex()))
file.write(solidity_compact_vec(t1_compact, 't1'))
file.write("PKContract pubKeyContract = new PKContract(aHat, tr, t1);\n")

# SIG
sig = D.sign(sk, msg, _xof=XOF)
assert D.verify(pk, msg, sig, _xof=XOF)

file.write("bytes memory sig = hex\"{}\";\n".format(sig.hex()))
file.write("""
        // MESSAGE
        """)
file.write("bytes memory msgs = hex\"{}\";\n".format(msg.hex()))
file.write("""
        uint256 gasStart = gasleft();
        bool ver = dilithium.verify(abi.encodePacked(address(pubKeyContract)), msgs, sig, "");
        uint256 gasUsed = gasStart - gasleft();
        console.log("Gas used:", gasUsed);
        assertTrue(ver);
    }
}
""")
file.close()
