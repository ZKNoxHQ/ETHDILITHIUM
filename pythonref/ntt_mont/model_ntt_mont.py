#!/usr/bin/env python3
# model_ntt_mont.py -- Python model of the packed Montgomery NTT emitted by
# gen_ntt_mont.py (ML-DSA, n = 256, q = 8380417), checked against a model of
# the scalar transforms of src/ZKNOX_NTT_dilithium.sol (same psirev tables,
# read from the Solidity source).
#
#   python3 pythonref/ntt_mont/model_ntt_mont.py
#
# Layout: 64 words of four 64-bit lanes, coefficient 4w + j in lane j of word w.
# Twiddle products are reduced with a lane-local Montgomery step (R = 2^32):
#   t = ((x mod 2^32) * QINV) mod 2^32,  r = (x + t*q) / 2^32,  r = x / R (mod q)
# with the twiddles of the packed layers stored as w * R mod q, so that
# r = a * w (mod q) with no conversion anywhere. r < x / 2^32 + q.
# Every step asserts what the Solidity relies on: lane values < 2^64,
# (x mod 2^32) * QINV < 2^64 (lane-local), x + t*q < 2^64, no negative
# subtraction, and the < 2q bound on every reduced product (bias 2q).
import os
import random
import re

q = 8380417
R = 1 << 32
QINV = (-pow(q, -1, R)) % R        # 4236238847: q * QINV = -1 mod 2^32
NINV = 8347681                     # 256^-1 mod q (N_MINUS_1_MOD_Q)
assert (q * QINV) % R == R - 1

HERE = os.path.dirname(os.path.abspath(__file__))
SRC = open(os.path.join(HERE, "..", "..", "src", "ZKNOX_NTT_dilithium.sol")).read()
ARRAYS = re.findall(r"uint256\[32\] memory psirev = \[(.*?)\];", SRC, re.S)
assert len(ARRAYS) == 2


def _parse(a):
    w = [int(x, 16) for x in re.findall(r"0x[0-9a-fA-F]+", a)]
    assert len(w) == 32
    return [(w[i >> 3] >> (32 * (i & 7))) & 0xFFFFFFFF for i in range(256)]


fw, inv = _parse(ARRAYS[0]), _parse(ARRAYS[1])
fwm = [(x * R) % q for x in fw]    # Montgomery form, packed layers only
invm = [(x * R) % q for x in inv]


def redc(x):
    assert 0 <= x < 1 << 64
    lo = x & (R - 1)
    assert lo * QINV < 1 << 64
    t = (lo * QINV) & (R - 1)
    s = x + t * q
    assert s < 1 << 64 and s % R == 0
    r = s >> 32
    assert (r * R) % q == x % q
    return r


# ---------- reference: the scalar loops of ZKNOX_NTT_dilithium.sol ----------
def ref_fw(a):
    a = a[:]
    t, m = 256, 1
    while m < 256:
        t >>= 1
        for i in range(m):
            S = fw[m + i]
            for j in range(2 * i * t, 2 * i * t + t):
                U, V = a[j], (a[j + t] * S) % q
                a[j], a[j + t] = (U + V) % q, (U - V) % q
        m <<= 1
    return a


def ref_inv(a):
    a = a[:]
    t, m = 1, 256
    while m > 1:
        h = m >> 1
        for i in range(h):
            S = inv[h + i]
            for j in range(2 * i * t, 2 * i * t + t):
                U, V = a[j], a[j + t]
                a[j], a[j + t] = (U + V) % q, ((U - V) * S) % q
        t <<= 1
        m >>= 1
    return [(x * NINV) % q for x in a]


# ---------- packed helpers ----------
def pack(a):
    return [[a[4 * w + j] for j in range(4)] for w in range(64)]


def unpack(A):
    return [A[w][j] for w in range(64) for j in range(4)]


def bf_ct(U, V, Sm, K):
    """Cooley-Tukey on two words: (u + red(v S), u + Kq - red(v S)), lanes"""
    s, d = [], []
    for j in range(4):
        x = V[j] * Sm
        r = redc(x)
        assert r < 2 * q, "reduced product not < 2q"
        assert K * q >= r
        s.append(U[j] + r)
        d.append(U[j] + K * q - r)
        assert s[-1] < 1 << 64 and d[-1] < 1 << 64
    return s, d


def bf_gs(U, V, Sm, K):
    """Gentleman-Sande: (u + v, red((u + Kq - v) S)), sums never reduced"""
    s, d = [], []
    for j in range(4):
        s.append(U[j] + V[j])
        t = U[j] + K * q - V[j]
        assert t >= 0, "negative difference"
        d.append(redc(t * Sm))
        assert d[-1] < 2 * q
        assert s[-1] < 1 << 64
    return s, d


MAXFW = [0]


def fused_fw(a):
    """returns the canonical forward transform, computed with the packed schedule"""
    A = pack(a)
    # pass A: t = 128, 64, 32 (word distance 32, 16, 8), octets (i, i+8, ..., i+56)
    for i in range(8):
        idx = [i + 8 * k for k in range(8)]
        w = [A[x] for x in idx]
        for k in range(4):
            w[k], w[k + 4] = bf_ct(w[k], w[k + 4], fwm[1], 2)
        for k in (0, 1):
            w[k], w[k + 2] = bf_ct(w[k], w[k + 2], fwm[2], 2)
        for k in (4, 5):
            w[k], w[k + 2] = bf_ct(w[k], w[k + 2], fwm[3], 2)
        for k in range(4):
            w[2 * k], w[2 * k + 1] = bf_ct(w[2 * k], w[2 * k + 1], fwm[4 + k], 2)
        for k in range(8):
            A[idx[k]] = w[k]
    # pass B: t = 16, 8, 4 (word distance 4, 2, 1), octets (8b, ..., 8b+7)
    for b in range(8):
        idx = [8 * b + k for k in range(8)]
        w = [A[x] for x in idx]
        for k in range(4):
            w[k], w[k + 4] = bf_ct(w[k], w[k + 4], fwm[8 + b], 2)
        for k in (0, 1):
            w[k], w[k + 2] = bf_ct(w[k], w[k + 2], fwm[16 + 2 * b], 2)
        for k in (4, 5):
            w[k], w[k + 2] = bf_ct(w[k], w[k + 2], fwm[17 + 2 * b], 2)
        for k in range(4):
            w[2 * k], w[2 * k + 1] = bf_ct(w[2 * k], w[2 * k + 1], fwm[32 + 4 * b + k], 2)
        for k in range(8):
            A[idx[k]] = w[k]
    # pass C: in-word t = 2 then t = 1, scalars with mulmod/addmod: canonical output
    out = []
    for w in range(64):
        l = A[w]
        MAXFW[0] = max(MAXFW[0], max(l))
        assert max(l) < 13 * q, "lane bound before the in-word pass"
        S2 = fw[64 + w]
        v2, v3 = (l[2] * S2) % q, (l[3] * S2) % q
        l = [l[0] + v2, l[1] + v3, l[0] + q - v2, l[1] + q - v3]   # not reduced, < 15q
        Sa, Sb = fw[128 + 2 * w], fw[129 + 2 * w]
        va, vb = (l[1] * Sa) % q, (l[3] * Sb) % q
        o = [(l[0] + va) % q, (l[0] + q - va) % q, (l[2] + vb) % q, (l[2] + q - vb) % q]
        out += o
    return out


MAXINV = [0]


def fused_inv(a):
    """returns the canonical inverse transform (with n^-1), packed schedule"""
    A = []
    # pass C': in-word t = 1 then t = 2, scalars, canonical output lanes
    for w in range(64):
        l = a[4 * w: 4 * w + 4]
        Sa, Sb = inv[128 + 2 * w], inv[129 + 2 * w]
        s0, d0 = (l[0] + l[1]) % q, ((l[0] - l[1]) * Sa) % q
        s1, d1 = (l[2] + l[3]) % q, ((l[2] - l[3]) * Sb) % q
        S2 = inv[64 + w]
        A.append([(s0 + s1) % q, (d0 + d1) % q, ((s0 - s1) * S2) % q, ((d0 - d1) * S2) % q])
    # pass B': t = 4, 8, 16 (word distance 1, 2, 4), octets (8b, ..., 8b+7); biases 1, 2, 4
    for b in range(8):
        idx = [8 * b + k for k in range(8)]
        w = [A[x] for x in idx]
        for k in range(4):
            w[2 * k], w[2 * k + 1] = bf_gs(w[2 * k], w[2 * k + 1], invm[32 + 4 * b + k], 1)
        for k in (0, 1):
            w[k], w[k + 2] = bf_gs(w[k], w[k + 2], invm[16 + 2 * b], 2)
        for k in (4, 5):
            w[k], w[k + 2] = bf_gs(w[k], w[k + 2], invm[17 + 2 * b], 2)
        for k in range(4):
            w[k], w[k + 4] = bf_gs(w[k], w[k + 4], invm[8 + b], 4)
        for k in range(8):
            A[idx[k]] = w[k]
    # pass A': t = 32, 64, 128 (word distance 8, 16, 32), octets (i, i+8, ...); biases 8, 16, 32
    # the last layer folds n^-1: s = red((u + v) * ninv_m), d = red((u + 32q - v) * (S * ninv)_m)
    NM = (NINV * R) % q
    S1M = (inv[1] * NINV * R) % q
    out = [0] * 256
    for i in range(8):
        idx = [i + 8 * k for k in range(8)]
        w = [A[x] for x in idx]
        for k in range(4):
            w[2 * k], w[2 * k + 1] = bf_gs(w[2 * k], w[2 * k + 1], invm[4 + k], 8)
        for k in (0, 1):
            w[k], w[k + 2] = bf_gs(w[k], w[k + 2], invm[2], 16)
        for k in (4, 5):
            w[k], w[k + 2] = bf_gs(w[k], w[k + 2], invm[3], 16)
        for k in range(4):
            U, V = w[k], w[k + 4]
            s, d = [], []
            for j in range(4):
                MAXINV[0] = max(MAXINV[0], U[j] + V[j])
                r = redc((U[j] + V[j]) * NM)
                assert r < 2 * q          # < q + 64q^2/2^32 = 1.126q
                s.append(r - q if r >= q else r)
                t = U[j] + 32 * q - V[j]
                assert t >= 0
                r = redc(t * S1M)
                assert r < 2 * q
                d.append(r - q if r >= q else r)
            w[k], w[k + 4] = s, d
        for k in range(8):
            for j in range(4):
                out[4 * idx[k] + j] = w[k][j]
    return out


def rand_poly(rng, sat=False):
    if sat:
        return [q - 1] * 256
    return [rng.randrange(q) for _ in range(256)]


if __name__ == "__main__":
    # the fixed vector of test/NTT_dilithium.t.sol (p[i] = i) pins the reference
    T = open(os.path.join(HERE, "..", "..", "test", "NTT_dilithium.t.sol")).read()
    exp = [int(x) for x in re.findall(r"uint256\(8023823\), ([^\]]*)\]", T)[0].replace("\n", " ").split(",")]
    exp = [8023823] + [int(x) for x in exp]
    assert ref_fw(list(range(256))) == exp[:256], "scalar reference disagrees with the repo vector"
    rng = random.Random(1)
    for trial in range(40):
        a = rand_poly(rng, sat=(trial == 0))
        assert fused_fw(a) == ref_fw(a), f"forward mismatch, trial {trial}"
        b = rand_poly(rng, sat=(trial == 1))
        assert fused_inv(b) == ref_inv(b), f"inverse mismatch, trial {trial}"
        assert ref_inv(ref_fw(a)) == a
    print("all trials OK; max lane before the in-word forward pass =", MAXFW[0], "=", round(MAXFW[0] / q, 2), "q;",
          "max last-layer sum (inverse) =", MAXINV[0], "=", round(MAXINV[0] / q, 2), "q")
