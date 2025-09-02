from .keccak_prng.keccak_prng_wrapper import Keccak256PRNG


msg = bytes.fromhex(
    "cc501e9f471a004d2d3f60894d12aad3114e8abf62e413a800b7e7987ec5100b")
hash = Keccak256PRNG(msg)
hash.flip()
print(hash.read(32).hex())
print(hash.read(32).hex())
