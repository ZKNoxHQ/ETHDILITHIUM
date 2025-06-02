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


def sqrt_m31(x):
    y = x
    for i in range(29):
        y = (y**2) % p
    return y
