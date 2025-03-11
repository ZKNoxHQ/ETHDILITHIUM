from .dilithium import ETHDilithium2

msg = b"We are ZKNox."
pk, sk = ETHDilithium2.keygen()
sig = ETHDilithium2.sign(sk, msg)
assert ETHDilithium2.verify(pk, msg, sig)
