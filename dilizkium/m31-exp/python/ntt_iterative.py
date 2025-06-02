from m31_2 import mul2, add2, sub2
from constants_ntt_iterative import ψ_rev, ψ_inv_rev, n_inv


def ntt(f):
    # following eprint 2016/504 Algorithm 1
    a = [_ for _ in f]
    n = len(a)
    t = n
    m = 1
    while m < n:
        t //= 2
        for i in range(m):
            j1 = 2*i*t
            j2 = j1+t-1
            S = ψ_rev[m+i]
            for j in range(j1, j2+1):
                U = a[j]
                V = mul2(a[j+t], S)
                a[j] = add2(U, V)
                a[j+t] = sub2(U, V)
        m = 2*m
    return a


def intt(f_ntt):
    # following eprint 2016/504 Algorithm 2
    a = [_ for _ in f_ntt]
    n = len(a)
    t = 1
    m = n
    while m > 1:
        j1 = 0
        h = m//2
        for i in range(h):
            j2 = j1+t-1
            S = ψ_inv_rev[h+i]
            for j in range(j1, j2+1):
                U = a[j]
                V = a[j+t]
                a[j] = add2(U, V)
                a[j+t] = mul2(sub2(U, V), S)
            j1 += 2*t
        t *= 2
        m //= 2
    for j in range(n):
        a[j] = mul2(a[j], n_inv[n])
    return a
