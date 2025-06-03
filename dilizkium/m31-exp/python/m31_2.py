from m31 import p, inv_m31, sqrt_m31, i2, mul_m31, add_m31

two_adicity = 9


def opp2(x):
    return [p-x[0], p-x[1]]


def add2(x, y):
    return [add_m31(x[0], y[0]), add_m31(x[1], y[1])]


def sub2(x, y):
    return add2(x, opp2(y))


def mul2(x, y):
    return [add_m31(mul_m31(x[0], y[0]), p - mul_m31(x[1], y[1])), add_m31(mul_m31(x[0], y[1]), mul_m31(x[1], y[0]))]


def inv2(x):
    den = add_m31(mul_m31(x[0], x[0]), mul_m31(x[1], x[1]))
    inv_den = inv_m31(den)
    return [mul_m31(x[0], inv_den), mul_m31(p-x[1], inv_den)]


def sqrt_m31_2(x):
    if len(x) == 1:
        return sqrt_m31(x)
    x1, x2 = x
    Δ = add_m31(mul_m31(x1, x1), mul_m31(x2, x2))
    sqrtΔ = sqrt_m31(Δ)
    b2 = mul_m31(add_m31(p-x1, sqrtΔ), i2)
    b = sqrt_m31(b2)
    b_inv = inv_m31(b)
    a = mul_m31(mul_m31(x2, i2), b_inv)
    return [a, b]
