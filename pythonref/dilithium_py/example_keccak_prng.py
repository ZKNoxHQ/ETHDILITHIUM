from .keccak_prng.keccak_prng_wrapper import Keccak256PRNG


msg = bytes.fromhex(
    "cc501e9f471a004d2d3f60894d12aad3114e8abf62e413a800b7e7987ec5100b")
hash = Keccak256PRNG(msg)
hash.flip()
print(hash.read(64).hex())


# # debug FLEX
# seed = bytes.fromhex(
#     "7C9935A0B07694AA0C6D10E4DB6B1ADD2FD81A25CCB148032DCD739936737F2D0404")
# hash = Keccak256PRNG(seed)
# hash.flip()
# print("HASH:")
# print(hash.read(128).hex())


# debug simple
seed = bytes.fromhex(
    "abcdef12abcdef12abcdef12abcdef12abcdef12abcdef12abcdef12abcdef12abcdef12abcdef12abcdef12abcdef12abcdef12abcdef12abcdef12abcdef12abcdef12abcdef12abcdef12abcdef12abcdef12abcdef12abcdef12abcdef12abcdef12abcdef12")
hash = Keccak256PRNG(seed)
hash.flip()
print("HASH:")
print(hash.read(64).hex())
