"""NTT over KoalaBear (p = 2^31 - 2^24 + 1 = 2130706433) at N=256.

Negacyclic NTT — the ring is F_p[X] / (X^256 + 1).
Uses the polyntt library's precomputed tables for KoalaBear.
"""
from polyntt.ntt_iterative import NTTIterative

P = 2130706433  # KoalaBear prime
N = 256

ntt = NTTIterative(P)

# --- Test vector: deterministic input [0, 1, 2, ..., 255] ---
f = [i for i in range(N)]

# Forward NTT
F = ntt.ntt(list(f))

# Inverse NTT
f_roundtrip = ntt.intt(list(F))
assert f_roundtrip == f, "NTT round-trip failed"

# Multiplication sanity check: (f * g) via NTT = schoolbook mul mod X^N + 1
g = [(3 * i + 7) % P for i in range(N)]
G = ntt.ntt(list(g))
H_ntt = [(F[i] * G[i]) % P for i in range(N)]
h_via_ntt = ntt.intt(list(H_ntt))

h_schoolbook = [0] * N
for i in range(N):
    for j in range(N):
        k = i + j
        if k < N:
            h_schoolbook[k] = (h_schoolbook[k] + f[i] * g[j]) % P
        else:
            h_schoolbook[k - N] = (h_schoolbook[k - N] - f[i] * g[j]) % P
assert h_via_ntt == h_schoolbook, "NTT multiplication mismatch"

# --- Inverse NTT test vector: treat [0, 1, ..., 255] as NTT-domain input ---
F_in = [i for i in range(N)]
f_out = ntt.intt(list(F_in))
# sanity: ntt(intt(x)) == x
assert ntt.ntt(list(f_out)) == F_in, "INTT round-trip failed"

# --- Print the test vectors ---
print(f"KoalaBear NTT, p = {P}, N = {N}")
print()
print("--- Forward NTT ---")
print(f"input  f       = {f}")
print(f"ntt(f)         = {F}")
print(f"round-trip         : OK")
print(f"ntt-mul vs schoolbook (f * g mod X^256 + 1) : OK")
print()
print("--- Inverse NTT ---")
print(f"input  F_in    = {F_in}")
print(f"intt(F_in)     = {f_out}")
print(f"intt round-trip    : OK")
