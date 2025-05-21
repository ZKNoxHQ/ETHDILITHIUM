from .dilithium import ETHDilithium2, Dilithium2

msg = b"We are ZKNox."

################################################
pk1, sk1 = ETHDilithium2.keygen()
sig1 = ETHDilithium2.sign(sk1, msg)
assert ETHDilithium2.verify(pk1, msg, sig1)

################################################

pk2, sk2 = Dilithium2.keygen()
sig2 = Dilithium2.sign(sk2, msg)
assert Dilithium2.verify(pk2, msg, sig2)
