from .dilithium.default_parameters import Dilithium2 as D
from .keccak_prng.keccak_prng_wrapper import Keccak256PRNG


def solidity_poly(h, name):
    out = "uint256[256] memory {} = [uint256({})".format(name, h[0])
    for (i, coeff) in enumerate(h):
        if i > 0:
            out += ",{}".format(coeff % D.M.ring.q)
    return out+"];\n"


XOF = Keccak256PRNG
file = open(
    "../test/ZKNOX_SampleInBall.t.sol", 'w')
file.write("""
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
//  Code obtained from `generate_sample_in_ball_test_vectors.py` python file

import {ZKNOX_ethdilithium} from "../src/ZKNOX_ethdilithium.sol";
import "../src/ZKNOX_dilithium_utils.sol";
import "../src/ZKNOX_SampleInBall.sol";

contract SampleInBallTest is Test {
""")

c_tilde = bytes.fromhex(
    "cc501e9f471a004d2d3f60894d12aad3114e8abf62e413a800b7e7987ec5100b")
tau = 39
# C NIST
c_nist = D.R.sample_in_ball(c_tilde, tau)

file.write("""
function testSampleInBallNIST() public {{
        bytes memory c_tilde = hex"{}";
        // forgefmt: disable-next-line\n""".format(c_tilde.hex()))
file.write(solidity_poly(c_nist, 'expected_c'))
file.write("""
        uint256 tau = 39;
        uint256 q = 8380417;
        uint256[] memory c = sampleInBallNIST(c_tilde, tau, q);
        for (uint256 i = 0; i < 256; i++) {
            assertEq(c[i], expected_c[i]);
        }
    }\n""")

# C KeccakPRNG
c_keccak_prng = D.R.sample_in_ball(c_tilde, tau, _xof=Keccak256PRNG)
file.write("""
function testSampleInBallKeccakPRNG() public {{
        bytes memory c_tilde = hex"{}";
        // forgefmt: disable-next-line\n""".format(c_tilde.hex()))
file.write(solidity_poly(c_keccak_prng, 'expected_c'))
file.write("""
        uint256 tau = 39;
        uint256 q = 8380417;
        uint256[] memory c = sampleInBallKeccakPRNG(c_tilde, tau, q);
        for (uint256 i = 0; i < 256; i++) {
            assertEq(c[i], expected_c[i]);
        }
    }\n""")

file.write("}\n")
file.close()
