from dilithium_py.dilithium.default_parameters import ETHDilithium2 as ETHDilithium

# An example of ETHDilithium.
# XOF: Keccak256PRNG
# NTT: ZKNOX
msg = b"We are ZKNox."

# Perform signature process
pk, sk = ETHDilithium.keygen()
sig = ETHDilithium.sign(sk, msg)
assert ETHDilithium.verify(
    pk, msg, sig)

A_hat, tr, t1_new = ETHDilithium._unpack_pk(pk)
print("PK:")
print("\tA_hat:\t\tdimension {}".format(A_hat.dim()))
print("\ttr:\t\t{} bytes".format(len(tr)))
print("\tt1_new:\t\tdimension {}".format(t1_new.dim()))

c_tilde, z, h, c_ntt = ETHDilithium._unpack_sig(sig)
print("SIG:")
print("\tc_tilde:\t{} bytes".format(len(c_tilde)))
print("\tz:\t\tdimension {}".format(z.dim()))
print("\th:\t\tdimension {}".format(h.dim()))
print("\tc_ntt:\t\tdimension {}".format((1, 1)))
