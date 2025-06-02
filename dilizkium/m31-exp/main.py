from random import randint

p = 2**31 - 1

two_adicity = 2
assert two_adicity > 1  # because in Fp2, we consider halved lists
n = 1 << two_adicity

i2 = [1073741824, 0]
assert (i2[0] * 2) % p == 1


def xgcd(a, b):
    """ Returns gcd(a, b), and x, y such that ax + by = gcd(a, b) """
    x0, x1, y0, y1 = 1, 0, 0, 1
    while b:
        q, a, b = a // b, b, a % b
        x0, x1 = x1, x0 - q * x1
        y0, y1 = y1, y0 - q * y1
    return a, x0, y0


def inv_mod(elt, q):
    """
    Thomas Prest stores the inverses mod q, but in the long term, we will consider a larger q,
    and thus we do not store the inverses mod q (it would require a too large storage).
    """
    _, inv_elt, _ = xgcd(elt, q)
    assert (inv_elt * elt) % q == 1
    if inv_elt < 0:
        inv_elt += q
    return inv_elt


def opp2(x):
    return [p-x[0], p-x[1]]


def add2(x, y):
    return [(x[0] + y[0]) % p, (x[1] + y[1]) % p]


def sub2(x, y):
    return add2(x, opp2(y))


def mul2(x, y):
    return [(x[0]*y[0] - x[1]*y[1]) % p, (x[0]*y[1] + x[1]*y[0]) % p]


def inv2(x):
    den = (x[0]*x[0] + x[1] * x[1]) % p
    inv_den = inv_mod(den, p)
    return [(x[0] * inv_den) % p, (-x[1] * inv_den) % p]


def sqrt_m31(x):
    y = x
    for i in range(29):
        y = (y**2) % p
    return y


def sqrt_m31_2(x):
    if len(x) == 1:
        return sqrt_m31(x)

    x1, x2 = x
    Δ = x1**2 + x2**2
    sqrtΔ = sqrt_m31(Δ)
    b2 = ((-x1 + sqrtΔ) * i2[0]) % p
    b = sqrt_m31(b2)
    b_inv = inv_mod(b, p)
    a = (x2*i2[0] * b_inv) % p
    return [a, b]


Roots = {}
phi_roots = [[0, 1], [0, -1]]
for k in range(1, two_adicity+2):
    Roots[1 << k] = phi_roots
    phi_roots = sum([[sqrt_m31_2(elt), opp2(sqrt_m31_2(elt))]
                     for elt in phi_roots], [])

sqr1 = [0, 1]
sqr1_inv = [0, -1]


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


a = [randint(0, p) for _ in range(n)]
b = [randint(0, p) for _ in range(n)]


def merge(f_list):
    """Merge two polynomials into a single polynomial f.
    """
    f0, f1 = f_list
    n = 2 * len(f0)
    f = [0] * n
    f[::2] = f0
    f[1::2] = f1
    return f


def split_ntt(f_ntt):
    """Split a polynomial f in two or three polynomials.
    """
    n = len(f_ntt)
    w = Roots[n]
    f0_ntt = [0] * (n // 2)
    f1_ntt = [0] * (n // 2)
    for i in range(n // 2):
        f0_ntt[i] = add2(f_ntt[2*i], mul2(f_ntt[2*i+1], i2))
        inv_w_2i = inv2(w[2*i])
        f1_ntt[i] = mul2(mul2(i2, inv_w_2i), sub2(f_ntt[2*i], f_ntt[2*i+1]))
    return [f0_ntt, f1_ntt]


def merge_ntt(f_list_ntt):
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


def ntt(f):
    """Compute the NTT of a polynomial.
    """
    n = len(f)
    if (n > 2):
        f0, f1 = f[::2], f[1::2]
        f0_ntt = ntt(f0)
        f1_ntt = ntt(f1)
        f_ntt = merge_ntt([f0_ntt, f1_ntt])
    elif (n == 2):
        f_ntt = [0] * n
        f_ntt[0] = add2(f[0], f[1])
        f_ntt[1] = sub2(f[0], f[1])
    return f_ntt


def intt(f_ntt):
    """Compute the inverse NTT of a polynomial.
    """
    n = len(f_ntt)
    if (n > 2):
        f0_ntt, f1_ntt = split_ntt(f_ntt)
        f0 = intt(f0_ntt)
        f1 = intt(f1_ntt)
        f = merge([f0, f1])
    elif (n == 2):
        f = [0] * n
        f[0] = mul2(add2(f_ntt[0], f_ntt[1]), i2)
        f[1] = mul2(sub2(f_ntt[0], f_ntt[1]), mul2(i2, sqr1_inv))
    return f


a2 = fp_to_fp2(a)
a2_ntt = ntt(a2)
print(intt(a2_ntt))
print(a2)
'''
ay_ntt = ntt(ay.list())
by_ntt = ntt(by.list())

aby_ntt = [x*y for (x, y) in zip(ay_ntt, by_ntt)]
aby_zknox = intt(aby_ntt)

assert aby.list() == aby_zknox
'''
