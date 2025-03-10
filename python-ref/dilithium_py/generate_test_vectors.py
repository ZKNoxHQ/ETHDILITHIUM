from dilithium_py.dilithium.default_parameters import ETHDilithium2 as ETHDilithium
from .keccak_prng.keccak_prng_wrapper import Keccak256PRNG

# An example of Dilithium with Keccak256PRNG everywhere. This uses ZKNOX's NTT
msg = b"We are ZKNox."

# Perform signature process
pk, sk = ETHDilithium.keygen(_xof=Keccak256PRNG, _xof2=Keccak256PRNG)
sig = ETHDilithium.sign(sk, msg, _xof=Keccak256PRNG, _xof2=Keccak256PRNG)
assert ETHDilithium.verify(
    pk, msg, sig, _xof=Keccak256PRNG, _xof2=Keccak256PRNG)

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
