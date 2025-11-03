from eth_account import Account
from eth_account.messages import encode_defunct

private_key = bytes.fromhex(
    "541378a6e14874788370668707e1a0de6cdd4556deb4c95d1508e31f99656bd9")
account = Account.from_key(private_key)
print("Signer address:", account.address)

hash_bytes = bytes.fromhex(
    "1111222233334444111122223333444411112222333344441111222233334444")

# Sign the raw hash — NO prefix, NO keccak
signed = Account.unsafe_sign_hash(hash_bytes, private_key=private_key)

print("Message:", hash_bytes.hex())
print("v:", signed.v)
print("r:", hex(signed.r))
print("s:", hex(signed.s))
print("Signature bytes:", signed.signature.hex())
