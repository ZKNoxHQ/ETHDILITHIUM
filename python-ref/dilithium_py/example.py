from .dilithium import ETHDilithium2 as Dilithium

msg = b"We are ZKNox."
pk, sk = Dilithium.keygen()
sig = Dilithium.sign(sk, msg)
assert Dilithium.verify(pk, msg, sig)
