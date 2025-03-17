from dilithium_py.dilithium.default_parameters import ETHDilithium2 as D

# An example of ETHDilithium.
# XOF: Keccak256PRNG
# NTT: ZKNOX
msg = b"We are ZKNox."

pk, sk = D.keygen()
sig = D.sign(sk, msg)
assert D.verify(pk, msg, sig)

# PK
A_hat, tr, t1_new = D._unpack_pk(pk)
# Compact PK for Solidity
A_hat_compact = A_hat.compact_256(32)
t1_new_compact = t1_new.compact_256(32)

# SIG
c_tilde, z, h, c_ntt = D._unpack_sig(sig)
# Compact SIG for Solidity
z_compact = z.compact_256(32)
h_compact = h.compact_256(32)
c_ntt_compact = c_ntt.compact_256(32)

# print("PK:")
# print("\tA_hat:\t\tdimension {}".format(A_hat.dim()))
# print("\ttr:\t\t{} bytes".format(len(tr)))
# print("\tt1_new:\t\tdimension {}".format(t1_new.dim()))

# print("SIG:")
# print("\tc_tilde:\t{} bytes".format(len(c_tilde)))
# print("\tz:\t\tdimension {}".format(z.dim()))
# print("\th:\t\tdimension {}".format(h.dim()))
# print("\tc_ntt:\t\tdimension {}".format((1, 1)))


def print_compact_elt(h, name):
    out = "uint256[] memory {} = new uint256[](32);".format(name)
    for (i, coeff) in enumerate(h):
        out += '{}[{}] = uint256(0x00{:x});'.format(name, i, coeff)
    print(out+"\n")


def print_compact_vec(h, name):
    n = len(h)
    out = 'uint256[][] memory {} = new uint256[][]({});\n'.format(name, n)
    out += "for (uint256 i = 0 ; i < 4 ; i ++) {\n"
    out += "\t{}[i] = new uint256[](32);\n".format(name)
    out += "}\n"

    for (i, a) in enumerate(h):
        for (j, b) in enumerate(a[0]):  # len(a) = 1...
            out += "{}[{}][{}] = uint256(0x00{:x});".format(name, i, j, b)
    print(out+"\n\n")


def print_compact_mat(h, name):
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
    print(out+"\n\n")


print("// Public key")
print_compact_mat(A_hat_compact, 'A_hat')
print("bytes memory tr = \"{}\";".format(tr.hex()))
print_compact_vec(t1_new_compact, 't1_new')
print()
print('// Signature')
print("bytes memory c_tilde = \"{}\";".format(c_tilde.hex()))
print_compact_vec(z_compact, 'z')
print_compact_vec(h_compact, 'h')
print_compact_elt(c_ntt_compact, 'c_ntt')
