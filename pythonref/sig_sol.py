from dilithium_py.dilithium.default_parameters import Dilithium2 as D
from dilithium_py.shake.shake_wrapper import shake128, shake256
from dilithium_py.keccak_prng.keccak_prng_wrapper import Keccak256PRNG

import sys
from eth_abi import encode

# message to be signed has a prefix `0x`
msg = bytes.fromhex(sys.argv[1][2:])

if sys.argv[2] == 'ETH':
    xof = Keccak256PRNG
    xof2 = Keccak256PRNG
elif sys.argv[2] == 'NIST':
    xof = shake256
    xof2 = shake128

seed = bytes.fromhex(sys.argv[3])

pk, sk = D.key_derive(seed, _xof=xof, _xof2=xof2)

# MLDSA signature
sig = D.sign(sk, msg, deterministic=True, _xof=xof, _xof2=xof2)
assert D.verify(pk, msg, sig, _xof=xof, _xof2=xof2)
c_tilde = sig[:D.c_tilde_bytes]
z_bytes = sig[D.c_tilde_bytes: -(D.k + D.omega)]
h_bytes = sig[-(D.k + D.omega):]

encoded = encode(
    ['bytes', 'bytes', 'bytes'],
    [c_tilde, z_bytes, h_bytes]
)
print(encoded.hex())
