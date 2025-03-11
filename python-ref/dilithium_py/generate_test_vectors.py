from dilithium_py.dilithium.default_parameters import ETHDilithium2 as ETHDilithium
from dilithium_py.dilithium.default_parameters import ETHDilithium2BabyBear as ETHDilithiumBB

# An example of ETHDilithium.
# XOF: Keccak256PRNG
# NTT: ZKNOX
msg = b"We are ZKNox."

for D in [ETHDilithium, ETHDilithiumBB]:
    # Perform signature process
    pk, sk = D.keygen()
    sig = D.sign(sk, msg)
    assert D.verify(pk, msg, sig)

    A_hat, tr, t1_new = D._unpack_pk(pk)
    print("PK:")
    print("\tA_hat:\t\tdimension {}".format(A_hat.dim()))
    print("\ttr:\t\t{} bytes".format(len(tr)))
    print("\tt1_new:\t\tdimension {}".format(t1_new.dim()))

    c_tilde, z, h, c_ntt = D._unpack_sig(sig)
    print("SIG:")
    print("\tc_tilde:\t{} bytes".format(len(c_tilde)))
    print("\tz:\t\tdimension {}".format(z.dim()))
    print("\th:\t\tdimension {}".format(h.dim()))
    print("\tc_ntt:\t\tdimension {}".format((1, 1)))
