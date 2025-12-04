from dilithium_py.dilithium.default_parameters import Dilithium2 as D
from dilithium_py.shake.shake_wrapper import shake128, shake256
from dilithium_py.keccak_prng.keccak_prng_wrapper import Keccak256PRNG

from seed import seed
import sys
from eth_abi import encode
from eth_account import Account

# message to be signed is given as 0x......
msg_len = 256
msg = bytes.fromhex(sys.argv[1][2:])

if sys.argv[2] == 'ETH':
    xof = Keccak256PRNG
    xof2 = Keccak256PRNG
elif sys.argv[2] == 'NIST':
    xof = shake256
    xof2 = shake128

pk, sk = D.key_derive(seed, _xof=xof, _xof2=xof2)

# MLDSA signature
sig = D.sign(sk, msg, _xof=xof, _xof2=xof2)
assert D.verify(pk, msg, sig, _xof=xof, _xof2=xof2)
c_tilde = sig[:D.c_tilde_bytes]
z_bytes = sig[D.c_tilde_bytes: -(D.k + D.omega)]
h_bytes = sig[-(D.k + D.omega):]

# ECDSA with the PKContract we consider
account = Account.from_key(seed)
signed = Account.unsafe_sign_hash(msg, private_key=seed)


encoded = encode(
    ['bytes', 'bytes', 'bytes', 'uint8', 'uint256', 'uint256'],
    [c_tilde, z_bytes, h_bytes, signed.v, signed.r, signed.s]
)
print(encoded.hex())
