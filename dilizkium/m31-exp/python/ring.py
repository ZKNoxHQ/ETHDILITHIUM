from m31 import p
from m31_2 import mul2, inv2
from constants_ntt_recursive import Roots
from ntt_iterative import ntt, intt


def fp_to_fp2(a):
    # this map is Fp[x]/(x^n+1) -> Fp²[y]/(y^{n/2}+1)
    # by x -> ωy
    r = []
    n = len(a)//2
    ω = Roots[2*n][0]
    ω_i = [1, 0]
    for i in range(n):
        r.append(mul2([a[i], p-a[i+n]], ω_i))
        ω_i = mul2(ω_i, ω)
    return r


def fp2_to_fp(a):
    # inverse map
    r = []
    s = []
    n = len(a)
    ω = Roots[2*n][0]
    ω_inv = inv2(ω)
    ω_inv_i = [1, 0]
    for i in range(n):
        c = mul2(a[i], ω_inv_i)
        ω_inv_i = mul2(ω_inv_i, ω_inv)
        r.append(c[0])
        s.append(p-c[1])
    return r+s


def school_book(a, b):
    assert len(a) == len(b)
    r = [0] * (len(a)*2)
    for i in range(len(a)):
        for j in range(len(a)):
            r[i+j] = (r[i+j] + a[i]*b[j]) % p
    r_lo = r[:len(a)]
    r_hi = r[len(a):]
    return [(u-v) % p for (u, v) in zip(r_lo, r_hi)]


def mul_zknox(a, b):
    a2 = fp_to_fp2(a)
    a2_ntt = ntt(a2)

    b2 = fp_to_fp2(b)
    b2_ntt = ntt(b2)

    ab2_ntt = [mul2(x, y) for (x, y) in zip(a2_ntt, b2_ntt)]

    return fp2_to_fp(intt(ab2_ntt))
