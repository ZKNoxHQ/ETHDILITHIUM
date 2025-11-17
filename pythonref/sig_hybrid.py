from dilithium_py.dilithium.default_parameters import Dilithium2 as D
from dilithium_py.tests.test_dilithium import parse_kat_data
from dilithium_py.drbg.aes256_ctr_drbg import AES256_CTR_DRBG
from seed import seed as secret_key
import sys
from eth_abi import encode
from eth_account import Account

# message to be signed is given as 0x......
msg_len = 256
msg = bytes.fromhex(sys.argv[1][2:])

# MLDSA w.r.t the PKContract we consider here
entropy_input = bytes([i for i in range(48)])
drbg = AES256_CTR_DRBG(entropy_input)
with open(f"pythonref/assets/PQCsignKAT_Dilithium2.rsp") as f:
    # extract data from KAT
    kat_data = f.read()
    parsed_data = parse_kat_data(kat_data)
count = 0  # for count in range(100):
data = parsed_data[count]
seed = drbg.random_bytes(48)
D.set_drbg_seed(seed)
pk, sk = D.keygen()
# MLDSA signature
sig = D.sign(sk, msg)
assert D.verify(pk, msg, sig)
c_tilde = sig[:D.c_tilde_bytes]
z_bytes = sig[D.c_tilde_bytes: -(D.k + D.omega)]
h_bytes = sig[-(D.k + D.omega):]

# ECDSA with the PKContract we consider
account = Account.from_key(secret_key)
signed = Account.unsafe_sign_hash(msg, private_key=secret_key)


encoded = encode(
    ['bytes', 'bytes', 'bytes', 'uint8', 'uint256', 'uint256'],
    [c_tilde, z_bytes, h_bytes, signed.v, signed.r, signed.s]
)
print(encoded.hex())
