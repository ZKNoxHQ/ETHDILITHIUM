p = 2**31 - 1
Fp = GF(p)
Fpx = Fp['x']
x = Fpx.gen()

Fp2 = GF(p**2, 'u', modulus=x**2+1)
u = Fp2.gen()
Fp2y = Fp2['y']
y = Fp2y.gen()

two_adicity = 2
assert two_adicity > 1  # because in Fp2, we consider halved lists
n = 1 << two_adicity

# root of x^{2n}+1 in Fp2
# u² = -1
roots = {}
phi_roots = [sqrt(u), -sqrt(u)]
for k in range(1, two_adicity+2):
    roots[1 << k] = phi_roots
    phi_roots = sum([[sqrt(elt), -sqrt(elt)] for elt in phi_roots], [])

sqr1 = u  # sqrt(u)


def fp_to_fp2(a):
    # this map is Fp[x]/(x^n+1) -> Fp²[y]/(y^{n/2}+1)
    # by x -> ωy
    r = []
    n = len(a)//2
    ω = roots[n][0]
    for i in range(n):
        r.append(Fp2([a[i], -a[i+n]]) * ω**i)
    return r


def fp2_to_fp(a):
    # inverse map
    r = []
    s = []
    n = len(a)
    ω = roots[n][0]
    for i in range(n):
        c = a[i]/ω**i
        r.append(c[0])
        s.append(-c[1])
    return r+s


a = [Fp.random_element() for _ in range(n)]
b = [Fp.random_element() for _ in range(n)]

# check that this map is indeed multiplicative
a_mul_b = ((Fpx(a) * Fpx(b)) % (x**n + 1)).list()
φ_ab = fp_to_fp2(a_mul_b)
φa_φb = ((Fp2y(fp_to_fp2(a)) * Fp2y(fp_to_fp2(b))) % (y**(n//2)+1)).list()
assert fp2_to_fp(φa_φb) == a_mul_b


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
    w = roots[n]
    f0_ntt = [0] * (n // 2)
    f1_ntt = [0] * (n // 2)
    for i in range(n // 2):
        f0_ntt[i] = (f_ntt[2 * i] + f_ntt[2 * i + 1]) / 2
        f1_ntt[i] = (f_ntt[2 * i] - f_ntt[2 * i + 1]) / 2 / w[2 * i]
    return [f0_ntt, f1_ntt]


def merge_ntt(f_list_ntt):
    """Merge two or three polynomials into a single polynomial f.
    """
    f0_ntt, f1_ntt = f_list_ntt
    n = 2 * len(f0_ntt)
    w = roots[n]
    f_ntt = [0] * n
    for i in range(n // 2):
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


a = [Fp.random_element() for _ in range(n)]
b = [Fp.random_element() for _ in range(n)]
a_mul_b = ((Fpx(a) * Fpx(b)) % (x**n + 1)).list()

φa = fp_to_fp2(a)
φb = fp_to_fp2(b)
φab = fp_to_fp2(a_mul_b)


φa_ntt = ntt(φa)
φb_ntt = ntt(φb)

φ_product_ntt = [x*y for (x, y) in zip(φa_ntt, φb_ntt)]
φ_product = intt(φ_product_ntt)

assert fp2_to_fp(φ_product) == a_mul_b
