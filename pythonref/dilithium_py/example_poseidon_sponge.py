from .poseidon_sponge.poseidon_sponge_wrapper import (
    PoseidonSponge, PoseidonBabyBearSponge, PoseidonKoalaBearSponge
)


msg = bytes.fromhex(
    "cc501e9f471a004d2d3f60894d12aad3114e8abf62e413a800b7e7987ec5100b")

print("=== BN254 ===")
hash = PoseidonSponge(msg)
hash.flip()
print(hash.read(64).hex())

print("=== BabyBear ===")
hash = PoseidonBabyBearSponge(msg)
hash.flip()
print(hash.read(64).hex())

print("=== KoalaBear ===")
hash = PoseidonKoalaBearSponge(msg)
hash.flip()
print(hash.read(64).hex())
