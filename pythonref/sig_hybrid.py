from dilithium_py.dilithium.default_parameters import Dilithium2 as D
from dilithium_py.tests.test_dilithium import parse_kat_data
from dilithium_py.drbg.aes256_ctr_drbg import AES256_CTR_DRBG
from seed import seed
import sys
from eth_abi import encode
from eth_account import Account

# message to be signed is given as 0x......
msg_len = 256
msg = bytes.fromhex(sys.argv[1][2:])
pk, sk = D.key_derive(seed)
# MLDSA signature
sig = D.sign(sk, msg)
assert D.verify(pk, msg, sig)
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
