p = (1 << 31) - 1

i2 = 1073741824
assert (i2 * 2) % p == 1


def xgcd(a, b):
    """ Returns gcd(a, b), and x, y such that ax + by = gcd(a, b) """
    x0, x1, y0, y1 = 1, 0, 0, 1
    while b:
        q, a, b = a // b, b, a % b
        x0, x1 = x1, x0 - q * x1
        y0, y1 = y1, y0 - q * y1
    return a, x0, y0


def add_m31(a, b):
    result = a+b
    if result >= p:
        result -= p
    return result


def mul_m31(a, b):
    product = a * b
    result = (product & p) + (product >> 31)
    if result >= p:
        result -= p
    return result


def inv_m31(elt):
    _, inv_elt, _ = xgcd(elt, p)
    assert mul_m31(inv_elt, elt) == 1
    if inv_elt < 0:
        inv_elt += p
    return inv_elt


def sqrt_m31(x):
    y = x
    for i in range(29):
        y = mul_m31(y, y)
    return y
