"""SampleInBall test vector using the Poseidon1/KoalaBear sponge as the XOF.

Mirrors example_sample_in_ball_keccak.py but swaps SHAKE256 for
PoseidonKoalaBearSponge. Any object exposing the (__init__(seed), flip(),
read(n)) interface plugs directly into R.sample_in_ball(..., _xof=...).
"""
import json
import os

from .dilithium.default_parameters import ZKDilithiumKB as D
from .poseidon_sponge.poseidon_sponge_wrapper import PoseidonKoalaBearSponge

C_TILDE = bytes.fromhex(
    "cc501e9f471a004d2d3f60894d12aad3114e8abf62e413a800b7e7987ec5100b"
)
TAU = D.tau  # 39 for the Dilithium2-family parameter set

c = D.R.sample_in_ball(C_TILDE, TAU, _xof=PoseidonKoalaBearSponge)
coeffs = list(c.coeffs)

# --- Sanity checks -------------------------------------------------------
assert len(coeffs) == 256
nonzero = [(i, v) for i, v in enumerate(coeffs) if v != 0]
assert len(nonzero) == TAU, f"expected {TAU} nonzero coeffs, got {len(nonzero)}"
assert all(v in (-1, 1) for _, v in nonzero), "nonzero coeffs must be ±1"

# --- Print summary -------------------------------------------------------
print("=== SampleInBall with PoseidonKoalaBearSponge XOF ===")
print(f"c_tilde = {C_TILDE.hex()}")
print(f"tau     = {TAU}")
print(f"# of ±1 = {len(nonzero)}  (expected {TAU})")
print()
print("c.coeffs = [")
for i in range(0, 256, 16):
    print("  " + ", ".join(f"{v:>2}" for v in coeffs[i:i + 16]) + ",")
print("]")
print()
print("nonzero positions and signs:")
for i, v in nonzero:
    print(f"  [{i:>3}] = {v:+d}")

# --- JSON dump -----------------------------------------------------------
out_path = os.path.join(os.path.dirname(__file__), "sample_in_ball_kb_testvector.json")
with open(out_path, "w") as f:
    json.dump({
        "c_tilde": C_TILDE.hex(),
        "tau": TAU,
        "xof": "PoseidonKoalaBearSponge",
        "coeffs": coeffs,
        "nonzero_positions": [i for i, _ in nonzero],
        "nonzero_signs":     [v for _, v in nonzero],
    }, f, indent=2)
print(f"\nTest vector written to: {out_path}")
