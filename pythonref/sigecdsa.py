from eth_account import Account
from eth_account.messages import encode_defunct

private_key = bytes.fromhex(
    "deadbeef")
account = Account.from_key(private_key)
print("Signer address:", account.address)

hash_bytes = bytes.fromhex(
    "7e15402722a37a2bd23d1bc63c55ea8371e501506107f879be4eaeae531625a2")

# Sign the raw hash — NO prefix, NO keccak
signed = Account.unsafe_sign_hash(hash_bytes, private_key=private_key)

print("Message:", hash_bytes.hex())
print("v:", signed.v)
print("r:", hex(signed.r))
print("s:", hex(signed.s))
print("Signature bytes:", signed.signature.hex())
