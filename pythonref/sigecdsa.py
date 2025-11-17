from eth_account import Account
from eth_account.messages import encode_defunct

private_key = bytes.fromhex(
    "deadfacedeadfacedeadfacedeadfacedeadfacedeadfacedeadfacedeadface")
account = Account.from_key(private_key)
print("Signer address:", account.address)

hash_bytes = bytes.fromhex(
    "377032d9dd2d1eeda432826e287327ee6fd5c63f6770a74d5663bce8dbf47afc")

# Sign the raw hash — NO prefix, NO keccak
signed = Account.unsafe_sign_hash(hash_bytes, private_key=private_key)

print("Message:", hash_bytes.hex())
print("v:", signed.v)
print("r:", hex(signed.r))
print("s:", hex(signed.s))
print("Signature bytes:", signed.signature.hex())
