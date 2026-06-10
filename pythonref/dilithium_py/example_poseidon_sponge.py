from .poseidon_sponge.poseidon_sponge_wrapper import PoseidonKoalaBearSponge


msg = bytes.fromhex(
    "cc501e9f471a004d2d3f60894d12aad3114e8abf62e413a800b7e7987ec5100b")

print("=== KoalaBear (LeanSpec Poseidon1 PARAMS_16) ===")
hash = PoseidonKoalaBearSponge(msg)
hash.flip()
print(hash.read(64).hex())

# --- 4 absorbs of 256 bits (32 bytes each) -------------------------------
# Inject four 32-byte chunks separately, then squeeze 64 bytes.
# Also verify that splitting the input across 4 inject() calls yields the
# same digest as a single inject() over the concatenation.
print()
print("=== KoalaBear: 4 absorbs of 256 bits ===")
chunks = [
    bytes.fromhex("00112233445566778899aabbccddeeff00112233445566778899aabbccddeeff"),
    bytes.fromhex("0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"),
    bytes.fromhex("fedcba9876543210fedcba9876543210fedcba9876543210fedcba9876543210"),
    bytes.fromhex("deadbeefcafebabe0badf00d8badf00ddeadc0deabad1deafeedfacefacefeed"),
]
assert all(len(c) == 32 for c in chunks)

multi = PoseidonKoalaBearSponge()
for c in chunks:
    multi.inject(c)
multi.flip()
digest_multi = multi.read(64)

oneshot = PoseidonKoalaBearSponge(b"".join(chunks))
oneshot.flip()
digest_oneshot = oneshot.read(64)

assert digest_multi == digest_oneshot, "split absorb must match single absorb"

for i, c in enumerate(chunks):
    print(f"  inject[{i}]: {c.hex()}")
print(f"  digest (4x32B injects)  : {digest_multi.hex()}")
print(f"  digest (single 128B in) : {digest_oneshot.hex()}")
print(f"  match                   : OK")
