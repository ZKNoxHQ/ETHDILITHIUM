from dilithium_py.dilithium.default_parameters import ETHDilithium2 as D

# An example of ETHDilithium.
# XOF: Keccak256PRNG
# NTT: ZKNOX
msg = b"We are ZKNox."

pk, sk = D.keygen()
sig = D.sign(sk, msg)
sig_fake = D.sign(sk, msg)
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


def print_compact(h, name):
    out = "uint256[{}][{}][32] memory {} = [\n".format(
        len(h), len(h[0]), name)
    for a in h:
        out += '['
        for b in a:
            out += '[ // forgefmt: disable-next-line\n'
            for c in b:
                out += '{},'.format(hex(c))
            out = out[:-1]
            out += '],\n'
        out = out[:-2]
        out += '],'
    out = out[:-1]
    out += '\n];'
    print(out)


def print_compact_2(h, name):
    out = ''
    for (i, a) in enumerate(h):
        for (j, b) in enumerate(a):
            out += "uint256[32] memory {}_{}_{} = [\n".format(name, i, j)
            # out += '// forgefmt: disable-next-line\n'
            for c in b:
                out += 'uint256(0x00{:x}),'.format(c)
            out = out[:-1]
            out += '];\n'
    print(out)


def print_compact_elt(h, name):
    out = ""
    out += "uint256[32] memory {} = [".format(name)
    for coeff in h:
        out += 'uint256(0x00{:x}),'.format(coeff)

    out = out[:-1]
    out += '];'
    print(out)


print("// Public key")
print_compact_2(A_hat_compact, 'A_hat')
print("bytes memory tr = \"{}\";".format(tr.hex()))
print_compact_2(t1_new_compact, 't1_new')
print()
print('// Signature')
print("bytes memory c_tilde = \"{}\";".format(c_tilde.hex()))
print_compact_2(z_compact, 'z')
print_compact_2(h_compact, 'h')
print_compact_elt(c_ntt_compact, 'c_ntt')
