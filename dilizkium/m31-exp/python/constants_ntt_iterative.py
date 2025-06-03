from utils import bit_reverse_order
from m31 import inv_m31, p, mul_m31, add_m31
from m31_2 import two_adicity, mul2, inv2

# ψ is a root of the 2⁹-th cyclotomic polynomial
ψ = [13610297, 1064696601]
n = 1 << (two_adicity-1)

# check that ψ⁹ == 1  and ψ⁸ ≠ 1
toto = ψ
for i in range(two_adicity-1):
    toto = mul2(toto, toto)
assert toto != [1, 0]
assert mul2(toto, toto) == [1, 0]

ψ_inv = inv2(ψ)
assert mul2(ψ, ψ_inv) == [1, 0]

# Precompute powers of ψ to speedup main NTT process.
ψ_table = [[1, 0]] * n
ψ_inv_table = [[1, 0]] * n
for i in range(1, n):
    ψ_table[i] = mul2(ψ_table[i-1], ψ)
    ψ_inv_table[i] = mul2(ψ_inv_table[i-1], ψ_inv)

    # Change the lists into bit-reverse order.
    ψ_rev = bit_reverse_order(ψ_table)
    ψ_inv_rev = bit_reverse_order(ψ_inv_table)

n_inv = {}
for j in range(1, two_adicity+1):
    n_inv[1 << j] = [inv_m31(1 << j), 0]
