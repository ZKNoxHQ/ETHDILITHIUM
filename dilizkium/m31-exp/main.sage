p = 2**31 - 1
Fp = GF(p)
Fpx = Fp['x']
x = Fpx.gen()

Fp2 = GF(p**2, 'u', modulus=x**2+1)
u = Fp2.gen()
Fp2y = Fp2['y']
y = Fp2y.gen()

two_adicity = 5
assert two_adicity > 1  # because in Fp2, we consider halved lists
n = 1 << two_adicity

# root of x^n + 1 in Fp2
# u² = -1


def sqrt_m31(x):
    y = x
    for i in range(29):
        y = y**2
    return y


def sqrt_m31_2(x):
    if x in Fp:
        return sqrt_m31(x)

    x1, x2 = x.list()
    Δ = x1**2 + x2**2
    sqrtΔ = sqrt_m31(Δ)
    b2 = (-x1 + sqrtΔ)/2
    b = sqrt_m31(b2)
    a = x2/(2*b)
    # assert a+u*b
    return a+u*b


Roots = {}
phi_roots = [u, -u]
for k in range(1, two_adicity+2):
    Roots[1 << k] = phi_roots
    phi_roots = sum([[sqrt_m31_2(elt), -sqrt_m31_2(elt)]
                    for elt in phi_roots], [])

sqr1 = u


def fp_to_fp2(a):
    # this map is Fp[x]/(x^n+1) -> Fp²[y]/(y^{n/2}+1)
    # by x -> ωy
    r = []
    n = len(a)//2
    ω = Roots[2*n][0]
    for i in range(n):
        r.append(Fp2([a[i], -a[i+n]]) * ω**i)
    return r


def fp2_to_fp(a):
    # inverse map
    r = []
    s = []
    n = len(a)
    ω = Roots[2*n][0]
    for i in range(n):
        c = a[i]/ω**i
        r.append(c[0])
        s.append(-c[1])
    return r+s


a = [Fp.random_element() for _ in range(n)]
b = [Fp.random_element() for _ in range(n)]

# check that this map is indeed multiplicative
ax = Fpx(a)
bx = Fpx(b)
abx = (ax*bx) % (x**n+1)

ay = Fp2y(fp_to_fp2(a))
by = Fp2y(fp_to_fp2(b))
aby = (ay * by) % (y**(n//2)+1)

assert abx.list() == fp2_to_fp(aby.list())


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
        f0_ntt[i] = (f_ntt[2 * i] + f_ntt[2 * i + 1]) / 2
        f1_ntt[i] = (f_ntt[2 * i] - f_ntt[2 * i + 1]) / 2 / w[2 * i]
    return [f0_ntt, f1_ntt]


def merge_ntt(f_list_ntt):
    """Merge two polynomials into a single polynomial f.
    """
    f0_ntt, f1_ntt = f_list_ntt
    n = len(f0_ntt)
    w = Roots[2*n]
    f_ntt = [0] * 2*n
    for i in range(n):
        f_ntt[2 * i + 0] = f0_ntt[i] + w[2 * i] * f1_ntt[i]
        f_ntt[2 * i + 1] = f0_ntt[i] - w[2 * i] * f1_ntt[i]
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
        f_ntt[0] = f[0] + sqr1 * f[1]
        f_ntt[1] = f[0] - sqr1 * f[1]
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
        f[0] = (f_ntt[0] + f_ntt[1]) / 2
        f[1] = (f_ntt[0] - f_ntt[1]) / 2 / sqr1
    return f


ay_ntt = ntt(ay.list())
by_ntt = ntt(by.list())

aby_ntt = [x*y for (x, y) in zip(ay_ntt, by_ntt)]
aby_zknox = intt(aby_ntt)

assert aby.list() == aby_zknox
