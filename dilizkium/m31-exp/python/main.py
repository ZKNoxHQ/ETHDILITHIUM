from m31 import mul_m31, sqrt_m31
from random import randint
from m31_2 import two_adicity, p, mul2
from ntt_recursive import ntt_rec, intt_rec
from ring import fp_to_fp2, fp2_to_fp, school_book, mul_zknox

assert two_adicity > 1  # because in Fp2, we consider halved lists
n = 1 << two_adicity


a = [randint(0, p) for _ in range(n)]
b = [randint(0, p) for _ in range(n)]

a2 = fp_to_fp2(a)
b2 = fp_to_fp2(b)


#############
# RECURSIVE #
#############

a2_ntt = ntt_rec(a2)
b2_ntt = ntt_rec(b2)
ab2_ntt = [mul2(x, y) for (x, y) in zip(a2_ntt, b2_ntt)]
ab2_zknox = intt_rec(ab2_ntt)

assert fp2_to_fp(ab2_zknox) == school_book(a, b)

#############
# ITERATIVE #
#############

assert mul_zknox(a, b) == school_book(a, b)
