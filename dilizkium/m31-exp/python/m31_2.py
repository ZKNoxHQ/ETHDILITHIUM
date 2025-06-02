from m31 import p, inv_mod, sqrt_m31

two_adicity = 9

i2 = [1073741824, 0]
assert (i2[0] * 2) % p == 1


sqr1 = [0, 1]
sqr1_inv = [0, p-1]


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
