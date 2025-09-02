from .dilithium.default_parameters import ETHDilithium2 as D
from .keccak_prng.keccak_prng_wrapper import Keccak256PRNG

print("SAMPLE IN BALL")
c_tilde = bytes.fromhex(
    "cc501e9f471a004d2d3f60894d12aad3114e8abf62e413a800b7e7987ec5100b")
tau = 39
# c = D.R.sample_in_ball(c_tilde, tau, _xof=Keccak256PRNG)
c = D.R.sample_in_ball(c_tilde, tau)
print(c.coeffs)  # assert c.to_ntt() == c_ntt
