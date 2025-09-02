from dilithium_py.dilithium.default_parameters import ETHDilithium2BabyBear as ETHDilithiumBB
from dilithium_py.dilithium.default_parameters import ETHDilithium2KoalaBear as ETHDilithiumKB

# An example of ZK-ETHDilithium with Baby Bear and Koala Bear together with and Keccak256PRNG.
msg = b"We are ZKNox."

for D in [ETHDilithiumBB, ETHDilithiumKB]:
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
    c_tilde, z, h = D._unpack_sig(sig)
    # Compact SIG for Solidity
    z_compact = z.compact_256(32)
    h_compact = h.compact_256(32)

    print("WARNING -- SECURITY MAY BE AFFECTED BY THESE PARAMETERS!")
    print("\tPK:")
    print("\t\tA_hat:\t\tdimension {}".format(A_hat.dim()))
    print("\t\ttr:\t\t{} bytes".format(len(tr)))
    print("\t\tt1_new:\t\tdimension {}".format(t1_new.dim()))

    print("\tSIG:")
    print("\t\tc_tilde:\t{} bytes".format(len(c_tilde)))
    print("\t\tz:\t\tdimension {}".format(z.dim()))
    print("\t\th:\t\tdimension {}".format(h.dim()))
