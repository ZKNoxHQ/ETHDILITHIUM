"""UseHint test vectors for DilithiumZK over KoalaBear.

Parameters from ZK_PARAMETERS['dilithium2koalabear']:
  q       = 2130706433  (KoalaBear = 2^31 - 2^24 + 1)
  gamma_2 = 1040384     ((q-1)/2^11)
  alpha   = 2*gamma_2   = 2080768
  m       = (q-1)/alpha = 1024

UseHint spec:
  m = (q-1) / alpha
  (r1, r0) = Decompose(r, alpha, q)
  if h == 1:
      return (r1 + 1) mod m   if r0 > 0
      return (r1 - 1) mod m   otherwise (r0 <= 0)
  return r1
"""
from dilithium_py.utilities.utils import decompose, use_hint
from dilithium_py.dilithium.default_parameters import ZK_PARAMETERS

Q = 2130706433
GAMMA2 = ZK_PARAMETERS["dilithium2koalabear"]["gamma_2"]   # 1040384
ALPHA = 2 * GAMMA2                                          # 2080768
M = (Q - 1) // ALPHA                                        # 1024
assert (Q - 1) % ALPHA == 0, "alpha must divide q-1 exactly"
assert M == 1024

# --- Scalar test vectors ---------------------------------------------------
# Each tuple: (h, r, expected, description)
VECTORS = [
    # h = 0: UseHint returns r1 unchanged
    (0, 0,                   0,     "h=0, r=0"),
    (0, Q - 1,               0,     "h=0, r=q-1 (decompose special case -> r1=0)"),
    (0, 5 * ALPHA,           5,     "h=0, r aligned on alpha (r0=0)"),
    (0, 5 * ALPHA + 100,     5,     "h=0, r with small positive r0"),
    (0, 6 * ALPHA - 100,     6,     "h=0, r with small negative r0"),
    (0, (M - 1) * ALPHA,     M - 1, "h=0, r at top of range (r1=m-1)"),

    # h = 1, r0 > 0: return (r1 + 1) mod m
    (1, 5 * ALPHA + 100,     6,     "h=1, r0>0 -> r1+1"),
    (1, 5 * ALPHA + GAMMA2,  6,     "h=1, r0 = +alpha/2 (upper boundary) -> r1+1"),
    (1, (M - 1) * ALPHA + 500, 0,   "h=1, wrap at top: (m-1)+1 mod m = 0"),

    # h = 1, r0 <= 0: return (r1 - 1) mod m
    (1, 0,                   M - 1, "h=1, wrap at bottom: 0-1 mod m = m-1"),
    (1, 5 * ALPHA,           4,     "h=1, r0=0 -> r1-1"),
    (1, 6 * ALPHA - 100,     5,     "h=1, r0<0 -> r1-1"),
    (1, Q - 1,               M - 1, "h=1, r=q-1 (special case -> r1-1 mod m)"),
]

print(f"=== UseHint test vectors (DilithiumZK / KoalaBear) ===")
print(f"q = {Q}, gamma_2 = {GAMMA2}, alpha = {ALPHA}, m = {M}\n")
print(f"{'h':>2} {'r':>12}  {'r1':>5}  {'r0':>8}  {'UseHint':>8}   description")
print("-" * 80)
for h, r, expected, desc in VECTORS:
    r1, r0 = decompose(r, ALPHA, Q)
    actual = use_hint(h, r, ALPHA, Q)
    assert actual == expected, f"FAIL: h={h} r={r}: got {actual}, expected {expected}"
    print(f"{h:>2} {r:>12}  {r1:>5}  {r0:>8}  {actual:>8}   {desc}")
print("\nAll vectors pass.")

# --- Polynomial-level sanity check: UseHint is MakeHint's inverse on ---
# --- high_bits(r + z). For any r and z with z small, use_hint(h, r)   ---
# --- where h = make_hint(z, r) must equal high_bits(r + z).            ---
from dilithium_py.utilities.utils import make_hint, high_bits

import random
random.seed(0xDECAFBAD)
for _ in range(1000):
    r = random.randrange(0, Q)
    # pick z small: |z| < alpha/2 is enough to make the round-trip meaningful
    z = random.randrange(-GAMMA2 // 4, GAMMA2 // 4 + 1)
    h = make_hint(z, r, ALPHA, Q)
    assert use_hint(h, r, ALPHA, Q) == high_bits(r + z, ALPHA, Q)
print("UseHint/MakeHint round-trip: 1000 random (r, z) pairs OK")

# --- Polynomial-level test vector (N=256) ---------------------------------
# Deterministic input that actually exercises UseHint:
#   r[i] = i * alpha + (-1)^i * 100
# -> decompose(r[i]) = (r1 = i, r0 = +100 for even i, -100 for odd i)
# This spans r1 = 0..255 and alternates the sign of r0.
#   * UseHint(h=0, r[i]) = r1 = i                            (identity)
#   * UseHint(h=1, r[i]) = (r1+1) mod m if r0>0 (even i)
#                       = (r1-1) mod m if r0<=0 (odd i)
#     -> [1, 0, 3, 2, 5, 4, ..., 255, 254]  (adjacent pairs swapped)
import json
import os

N = 256
r_poly = [(i * ALPHA + (100 if i % 2 == 0 else -100)) % Q for i in range(N)]
out_h0 = [use_hint(0, r, ALPHA, Q) for r in r_poly]
out_h1 = [use_hint(1, r, ALPHA, Q) for r in r_poly]

assert out_h0 == list(range(N))
assert out_h1 == [i + 1 if i % 2 == 0 else i - 1 for i in range(N)]

def fmt_array(name, arr, per_row=16, width=4):
    out = [f"{name} = ["]
    for i in range(0, len(arr), per_row):
        out.append("    " + ", ".join(f"{v:>{width}}" for v in arr[i:i + per_row]) + ",")
    out.append("]")
    return "\n".join(out)

print()
print(f"=== Polynomial test vector (N={N}) ===")
print()
print(fmt_array("r", r_poly, per_row=16, width=3))
print()
print(fmt_array("use_hint_h0", out_h0, per_row=16, width=4))  # UseHint with h=1 at EVERY coord turned off
print()
print(fmt_array("use_hint_h1", out_h1, per_row=16, width=4))  # UseHint with h=1 at EVERY coord turned on

json_path = os.path.join(os.path.dirname(__file__), "use_hint_kb_testvector.json")
with open(json_path, "w") as f:
    json.dump({
        "q": Q,
        "gamma_2": GAMMA2,
        "alpha": ALPHA,
        "m": M,
        "n": N,
        "r": r_poly,
        "use_hint_h0": out_h0,
        "use_hint_h1": out_h1,
    }, f, indent=2)
print(f"\nFull test vector also written to: {json_path}")
