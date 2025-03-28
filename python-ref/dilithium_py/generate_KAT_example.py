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
tr = D._h(pk, 32, _xof=shake256)

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
import {ZKNOX_Expand, ZKNOX_Expand_Vec, ZKNOX_Expand_Mat, ZKNOX_Compact} from "../src/ZKNOX_dilithium_utils.sol";
import {ZKNOX_dilithium} from "../src/ZKNOX_dilithium.sol";
import {ZKNOX_NTT} from "../src/ZKNOX_NTT.sol";
import "../src/ZKNOX_dilithium_utils.sol";

contract ETHDilithiumTest is Test {
    ZKNOX_dilithium dilithium;

    //exemple of stateless initialisation, no external contract provided
    ZKNOX_NTT ntt = new ZKNOX_NTT(address(0), address(0), 8380417, 8347681); // q = 8380417, n = 256, inv_mod(n,q) = 8347681
    // forgefmt: disable-next-line
    uint256[512] psi_rev = [uint256(1), 4808194, 3765607, 3761513, 5178923, 5496691, 5234739, 5178987, 7778734, 3542485, 2682288, 2129892, 3764867, 7375178, 557458, 7159240, 5010068, 4317364, 2663378, 6705802, 4855975, 7946292, 676590, 7044481, 5152541, 1714295, 2453983, 1460718, 7737789, 4795319, 2815639, 2283733, 3602218, 3182878, 2740543, 4793971, 5269599, 2101410, 3704823, 1159875, 394148, 928749, 1095468, 4874037, 2071829, 4361428, 3241972, 2156050, 3415069, 1759347, 7562881, 4805951, 3756790, 6444618, 6663429, 4430364, 5483103, 3192354, 556856, 3870317, 2917338, 1853806, 3345963, 1858416, 3073009, 1277625, 5744944, 3852015, 4183372, 5157610, 5258977, 8106357, 2508980, 2028118, 1937570, 4564692, 2811291, 5396636, 7270901, 4158088, 1528066, 482649, 1148858, 5418153, 7814814, 169688, 2462444, 5046034, 4213992, 4892034, 1987814, 5183169, 1736313, 235407, 5130263, 3258457, 5801164, 1787943, 5989328, 6125690, 3482206, 4197502, 7080401, 6018354, 7062739, 2461387, 3035980, 621164, 3901472, 7153756, 2925816, 3374250, 1356448, 5604662, 2683270, 5601629, 4912752, 2312838, 7727142, 7921254, 348812, 8052569, 1011223, 6026202, 4561790, 6458164, 6143691, 1744507, 1753, 6444997, 5720892, 6924527, 2660408, 6600190, 8321269, 2772600, 1182243, 87208, 636927, 4415111, 4423672, 6084020, 5095502, 4663471, 8352605, 822541, 1009365, 5926272, 6400920, 1596822, 4423473, 4620952, 6695264, 4969849, 2678278, 4611469, 4829411, 635956, 8129971, 5925040, 4234153, 6607829, 2192938, 6653329, 2387513, 4768667, 8111961, 5199961, 3747250, 2296099, 1239911, 4541938, 3195676, 2642980, 1254190, 8368000, 2998219, 141835, 8291116, 2513018, 7025525, 613238, 7070156, 6161950, 7921677, 6458423, 4040196, 4908348, 2039144, 6500539, 7561656, 6201452, 6757063, 2105286, 6006015, 6346610, 586241, 7200804, 527981, 5637006, 6903432, 1994046, 2491325, 6987258, 507927, 7192532, 7655613, 6545891, 5346675, 8041997, 2647994, 3009748, 5767564, 4148469, 749577, 4357667, 3980599, 2569011, 6764887, 1723229, 1665318, 2028038, 1163598, 5011144, 3994671, 8368538, 7009900, 3020393, 3363542, 214880, 545376, 7609976, 3105558, 7277073, 508145, 7826699, 860144, 3430436, 140244, 6866265, 6195333, 3123762, 2358373, 6187330, 5365997, 6663603, 2926054, 7987710, 8077412, 3531229, 4405932, 4606686, 1900052, 7598542, 1054478, 7648983];

    // forgefmt: disable-next-line
    uint256[512] psi_inv_rev = [uint256(1), 3572223, 4618904, 4614810, 3201430, 3145678, 2883726, 3201494, 1221177, 7822959, 1005239, 4615550, 6250525, 5698129, 4837932, 601683, 6096684, 5564778, 3585098, 642628, 6919699, 5926434, 6666122, 3227876, 1335936, 7703827, 434125, 3524442, 1674615, 5717039, 4063053, 3370349, 6522001, 5034454, 6526611, 5463079, 4510100, 7823561, 5188063, 2897314, 3950053, 1716988, 1935799, 4623627, 3574466, 817536, 6621070, 4965348, 6224367, 5138445, 4018989, 6308588, 3506380, 7284949, 7451668, 7986269, 7220542, 4675594, 6279007, 3110818, 3586446, 5639874, 5197539, 4778199, 6635910, 2236726, 1922253, 3818627, 2354215, 7369194, 327848, 8031605, 459163, 653275, 6067579, 3467665, 2778788, 5697147, 2775755, 7023969, 5006167, 5454601, 1226661, 4478945, 7759253, 5344437, 5919030, 1317678, 2362063, 1300016, 4182915, 4898211, 2254727, 2391089, 6592474, 2579253, 5121960, 3250154, 8145010, 6644104, 3197248, 6392603, 3488383, 4166425, 3334383, 5917973, 8210729, 565603, 2962264, 7231559, 7897768, 6852351, 4222329, 1109516, 2983781, 5569126, 3815725, 6442847, 6352299, 5871437, 274060, 3121440, 3222807, 4197045, 4528402, 2635473, 7102792, 5307408, 731434, 7325939, 781875, 6480365, 3773731, 3974485, 4849188, 303005, 392707, 5454363, 1716814, 3014420, 2193087, 6022044, 5256655, 2185084, 1514152, 8240173, 4949981, 7520273, 553718, 7872272, 1103344, 5274859, 770441, 7835041, 8165537, 5016875, 5360024, 1370517, 11879, 4385746, 3369273, 7216819, 6352379, 6715099, 6657188, 1615530, 5811406, 4399818, 4022750, 7630840, 4231948, 2612853, 5370669, 5732423, 338420, 3033742, 1834526, 724804, 1187885, 7872490, 1393159, 5889092, 6386371, 1476985, 2743411, 7852436, 1179613, 7794176, 2033807, 2374402, 6275131, 1623354, 2178965, 818761, 1879878, 6341273, 3472069, 4340221, 1921994, 458740, 2218467, 1310261, 7767179, 1354892, 5867399, 89301, 8238582, 5382198, 12417, 7126227, 5737437, 5184741, 3838479, 7140506, 6084318, 4633167, 3180456, 268456, 3611750, 5992904, 1727088, 6187479, 1772588, 4146264, 2455377, 250446, 7744461, 3551006, 3768948, 5702139, 3410568, 1685153, 3759465, 3956944, 6783595, 1979497, 2454145, 7371052, 7557876, 27812, 3716946, 3284915, 2296397, 3956745, 3965306, 7743490, 8293209, 7198174, 5607817, 59148, 1780227, 5720009, 1455890, 2659525, 1935420, 8378664];

    //stateful initialisation
    function setUp() public {
        bytes memory bytecode_psirev = abi.encodePacked(psi_rev);

        address a_psirev; //address of the precomputations bytecode contract
        a_psirev = address(uint160(0xcaca)); //here it is etched, use create in the future
        vm.etch(a_psirev, bytecode_psirev); //pushing psirev bytecode into contract todo : replace with create

        bytes memory bytecode_psiInvrev = abi.encodePacked(psi_inv_rev);

        address a_psiInvrev; //address of the precomputations bytecode contract
        a_psiInvrev = address(uint160(0xa5a5)); //here it is etched, use create in the future
        vm.etch(a_psiInvrev, bytecode_psiInvrev); //pushing psirev bytecode into contract todo : replace with create

        ntt.update(a_psirev, a_psiInvrev, 8380417, 8347681); //update ntt with outer contract

        dilithium = new ZKNOX_dilithium(ntt);
    }

    function testVerify() public {
""")

file.write("// Public key\n")
file.write(solidity_compact_mat(A_hat_compact, 'A_hat'))
file.write("bytes memory tr = hex\"{}\";\n".format(tr.hex()))
file.write(solidity_compact_vec(t1_compact, 't1'))

# SIG
sig = D.sign(sk, msg, _xof=XOF)
assert D.verify(pk, msg, sig, _xof=XOF)
c_tilde, z, h = D._unpack_sig(sig)
# z with only positive coefficients
for i in range(4):
    assert len(z._data[i]) == 1
    for j in range(256):
        if z._data[i][0].coeffs[j] < 0:
            z._data[i][0].coeffs[j] += 8380417
# Compact SIG for Solidity
z_compact = z.compact_256(32)
h_compact = h.compact_256(32)

file.write("\n// Signature\n")
file.write("bytes memory c_tilde = hex\"{}\";\n".format(c_tilde.hex()))
file.write(solidity_compact_vec(z_compact, 'z'))
file.write(solidity_compact_vec(h_compact, 'h'))
file.write("""
        // CREATE PK OBJECT
        PubKey memory pk;
        pk.a_hat = A_hat;
        pk.tr = tr;
        pk.t1 = t1;

        // CREATE SIG OBJECT
        Signature memory sig;
        sig.c_tilde = c_tilde;
        sig.z = z;
        sig.h = h;

        // MESSAGE
        """)
file.write("bytes memory msgs = hex\"{}\";\n".format(msg.hex()))
file.write("""
        uint256 gasStart = gasleft();
        bool ver = dilithium.verify(pk, msgs, sig);
        uint256 gasUsed = gasStart - gasleft();
        console.log("Gas used:", gasUsed);
        assertTrue(ver);
    }
}
""")
file.close()
