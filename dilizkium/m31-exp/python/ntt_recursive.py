from m31_2 import p, mul2, inv2, sub2, add2, i2
from constants_ntt_recursive import Roots

sqr1 = [0, 1]
sqr1_inv = [0, p-1]


def merge(f_list):
    """Merge two polynomials into a single polynomial f.
    """
    f0, f1 = f_list
    n = 2 * len(f0)
    f = [0] * n
    f[::2] = f0
    f[1::2] = f1
    return f


def split_ntt_rec(f_ntt):
    """Split a polynomial f in two or three polynomials.
    """
    n = len(f_ntt)
    w = Roots[n]
    f0_ntt = [0] * (n // 2)
    f1_ntt = [0] * (n // 2)
    for i in range(n // 2):
        f0_ntt[i] = mul2(add2(f_ntt[2*i], f_ntt[2*i+1]), [i2, 0])
        inv_w_2i = inv2(w[2*i])
        f1_ntt[i] = mul2(mul2([i2, 0], inv_w_2i),
                         sub2(f_ntt[2*i], f_ntt[2*i+1]))
    return [f0_ntt, f1_ntt]


def merge_ntt_rec(f_list_ntt):
    """Merge two polynomials into a single polynomial f.
    """
    f0_ntt, f1_ntt = f_list_ntt
    n = len(f0_ntt)
    w = Roots[2*n]
    f_ntt = [0] * 2*n
    for i in range(n):
        f_ntt[2 * i + 0] = add2(f0_ntt[i],
                                mul2(w[2 * i], f1_ntt[i]))
        f_ntt[2 * i + 1] = sub2(f0_ntt[i],
                                mul2(w[2 * i], f1_ntt[i]))
    return f_ntt


def ntt_rec(f):
    """Compute the NTT of a polynomial.
    """
    n = len(f)
    if (n > 2):
        f0, f1 = f[::2], f[1::2]
        f0_ntt = ntt_rec(f0)
        f1_ntt = ntt_rec(f1)
        f_ntt = merge_ntt_rec([f0_ntt, f1_ntt])
    elif (n == 2):
        f_ntt = [0] * n
        f_ntt[0] = add2(f[0], mul2(f[1], sqr1))
        f_ntt[1] = sub2(f[0], mul2(f[1], sqr1))
    return f_ntt


def intt_rec(f_ntt):
    """Compute the inverse NTT of a polynomial.
    """
    n = len(f_ntt)
    if (n > 2):
        f0_ntt, f1_ntt = split_ntt_rec(f_ntt)
        f0 = intt_rec(f0_ntt)
        f1 = intt_rec(f1_ntt)
        f = merge([f0, f1])
    elif (n == 2):
        f = [0] * n
        f[0] = mul2(add2(f_ntt[0], f_ntt[1]), [i2, 0])
        f[1] = mul2(sub2(f_ntt[0], f_ntt[1]), mul2([i2, 0], sqr1_inv))
    return f
