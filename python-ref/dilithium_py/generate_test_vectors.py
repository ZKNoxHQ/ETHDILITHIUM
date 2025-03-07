from .keccak_prng.keccak_prng_wrapper import Keccak256PRNG
from .dilithium import Dilithium2 as Dilithium

# An example of Dilithium with Keccak256PRNG everywhere. This uses ZKNOX's NTT
msg = b"We are ZKNox."

# Perform signature process
pk, sk = Dilithium.keygen(_xof=Keccak256PRNG, _xof2=Keccak256PRNG)
sig = Dilithium.sign(sk, msg, _xof=Keccak256PRNG, _xof2=Keccak256PRNG)
assert Dilithium.verify(
    pk, msg, sig, _xof=Keccak256PRNG, _xof2=Keccak256PRNG)

# PUBLIC KEY FOR ETHDILITHIUM
tr = Dilithium._h(pk, 32, _xof=Keccak256PRNG)
rho, t1 = Dilithium._unpack_pk(pk)
A_hat = Dilithium._expand_matrix_from_seed(rho, _xof=Keccak256PRNG)
t1_new = t1.to_ntt().scale(1 << Dilithium.d)
# A_hat, tr, t1_new
print("PK:")
print("\tA_hat:\t\tdimension {}".format(A_hat.dim()))
print("\ttr:\t\t{} bytes".format(len(tr)))
print("\tt1_new:\t\tdimension {}".format(t1_new.dim()))


# SIGNATURE FOR ETHDILITHIUM
c_tilde, z, h = Dilithium._unpack_sig(sig)
c = Dilithium.R.sample_in_ball(c_tilde, Dilithium.tau, _xof=Keccak256PRNG)
c_ntt = c.to_ntt()
# c_tilde, z, h, c_ntt
print("SIG:")
print("\tc_tilde:\t{} bytes".format(len(c_tilde)))
print("\tz:\t\tdimension {}".format(z.dim()))
print("\th:\t\tdimension {}".format(h.dim()))
print("\tc_ntt:\t\tdimension {}".format((1, 1)))
