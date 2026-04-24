from .poseidon_sponge.poseidon_sponge_wrapper import PoseidonKoalaBearSponge


msg = bytes.fromhex(
    "cc501e9f471a004d2d3f60894d12aad3114e8abf62e413a800b7e7987ec5100b")

print("=== KoalaBear (LeanSpec Poseidon1 PARAMS_16) ===")
hash = PoseidonKoalaBearSponge(msg)
hash.flip()
print(hash.read(64).hex())
