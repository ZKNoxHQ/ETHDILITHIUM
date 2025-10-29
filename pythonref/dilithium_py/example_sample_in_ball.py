from .dilithium.default_parameters import Dilithium2 as D
from .keccak_prng.keccak_prng_wrapper import Keccak256PRNG

c_tilde = bytes.fromhex(
    "cc501e9f471a004d2d3f60894d12aad3114e8abf62e413a800b7e7987ec5100b")
tau = 39
print("SAMPLE IN BALL (ETH)")
c = D.R.sample_in_ball(c_tilde, tau, _xof=Keccak256PRNG)
print(c.coeffs)
print("SAMPLE IN BALL (NIST)")
c = D.R.sample_in_ball(c_tilde, tau)
print(c.coeffs)
