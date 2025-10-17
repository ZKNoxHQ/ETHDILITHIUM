def reduce_mod_pm(x, n):
    """
    Takes an integer 0 < x < n and represents
    it as an integer in the range

    r = x % n

    for n odd:
        -(n-1)/2 < r <= (n-1)/2
    for n even:
        - n / 2  <= r <= n / 2
    """
    x = x % n
    if x > (n >> 1):
        x -= n
    return x


def decompose(r, a, q):
    """
    Takes an element r and represents
    it as:

    r = r1*a + r0

    With r0 in the range

    -(a << 1) < r0 <= (a << 1)
    """
    rp = r % q
    r0 = reduce_mod_pm(rp, a)
    r1 = rp - r0
    if rp - r0 == q - 1:
        r1 = 0
        r0 = r0 - 1
    else:
        r1 = (rp - r0) // a

    # assert r0 > -(a >> 1)
    # assert r0 <= (a >> 1)
    # assert r % q == (r0 + r1 * a) % q
    return r1, r0


def high_bits(r, a, q):
    r1, _ = decompose(r, a, q)
    return r1


def low_bits(r, a, q):
    _, r0 = decompose(r, a, q)
    return r0


def make_hint(z, r, a, q):
    """
    Check whether the top bit of z will change when r is added
    """
    r1 = high_bits(r, a, q)
    v1 = high_bits(r + z, a, q)
    return int(r1 != v1)


def make_hint_optimised(z0, r1, a, q):
    """
    Optimised version of the above used when the low bits w0 are extracted from
    `w = (A_hat @ y_hat).from_ntt()` during signing
    """
    gamma2 = a >> 1
    if z0 <= gamma2 or z0 > (q - gamma2) or (z0 == (q - gamma2) and r1 == 0):
        return 0
    return 1


def use_hint(h, r, a, q):
    m = (q - 1) // a
    r1, r0 = decompose(r, a, q)
    if h == 1:
        if r0 > 0:
            return (r1 + 1) % m
        return (r1 - 1) % m
    return r1


def check_norm_bound(n, b, q):
    """
    Norm bound is checked in the following four steps:
    x ∈ {0,        ...,                    ...,     q-1}
    x ∈ {-(q-1)/2, ...,       -1,       0, ..., (q-1)/2}
    x ∈ { (q-3)/2, ...,        0,       0, ..., (q-1)/2}
    x ∈ {0, 1,     ...,  (q-1)/2, (q-1)/2, ...,       1}
    """
    x = n % q
    x = ((q - 1) >> 1) - x
    x = x ^ (x >> 31)
    x = ((q - 1) >> 1) - x
    return x >= b


def xor_bytes(a, b):
    """
    XOR two byte arrays, assume that they are
    of the same length
    """
    return bytes(a ^ b for a, b in zip(a, b))


def solidity_compact_elt(h, name):
    out = "uint256[] memory {} = new uint256[](32);".format(name)
    for (i, coeff) in enumerate(h):
        out += '{}[{}] = uint256(0x00{:x});'.format(name, i, coeff)
    return out+"\n"


def solidity_compact_vec(h, name):
    n = len(h)
    out = 'uint256[][] memory {} = new uint256[][]({});\n'.format(name, n)
    out += "for (uint256 i = 0 ; i < 4 ; i ++) {\n"
    out += "\t{}[i] = new uint256[](32);\n".format(name)
    out += "}\n"

    for (i, a) in enumerate(h):
        for (j, b) in enumerate(a[0]):  # len(a) = 1...
            out += "{}[{}][{}] = uint256(0x00{:x});".format(name, i, j, b)
    return out+"\n"


def solidity_compact_mat(h, name):
    n, m = len(h), len(h[0])
    out = 'uint256[][][] memory {} = new uint256[][][]({});\n'.format(name, n)
    out += "for (uint256 i = 0 ; i < {} ; i++) {{\n".format(n)
    out += "\t{}[i] = new uint256[][]({});\n".format(name, m)
    out += "\tfor (uint256 j = 0 ; j < {}; j++) {{\n".format(m)
    out += "\t\t{}[i][j] = new uint256[](32);\n".format(name)
    out += "\t}\n"
    out += "}\n"
    for (i, a) in enumerate(h):
        for (j, b) in enumerate(a):
            for (k, c) in enumerate(b):
                out += "{}[{}][{}][{}] = uint256(0x00{:x});".format(
                    name, i, j, k, c)
    return out+"\n"
