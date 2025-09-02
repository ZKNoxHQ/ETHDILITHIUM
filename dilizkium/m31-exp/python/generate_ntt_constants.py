from utils import bit_reverse_order
from m31_2 import two_adicity, mul2, inv2

#
# Generate constants for the iterative case
#

f = open("ntt_constants_iterative.py", "w")
f.write("# File generated with `python generate_ntt_constants.py`.\n")
f.write(
    "# Precomputations for NTT.\n\n"
)

ψ_table = dict()
ψ_inv_table = dict()
ψ_rev = dict()
ψ_inv_rev = dict()
n_inv = dict()

q = (1<<31)-1
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
ψ_table[q] = [[1, 0]] * n
ψ_inv_table[q] = [[1, 0]] * n
for i in range(1, n):
    ψ_table[q][i] = mul2(ψ_table[q][i-1], ψ)
    ψ_inv_table[q][i] = mul2(ψ_inv_table[q][i-1], ψ_inv)

# Change the lists into bit-reverse order.
ψ_rev[q] = bit_reverse_order(ψ_table[q])
ψ_inv_rev[q] = bit_reverse_order(ψ_inv_table[q])

# n_inv = {}
# for j in range(1, two_adicity+1):
#     n_inv[1 << j] = [inv_m31(1 << j), 0]


# writing ψ
f.write("# Dictionary containing the powers ψ, a 2^n-th root of unity.\n")
f.write("ψ = {\n")
for (q, two_adicity) in [(q,two_adicity)]:
    f.write("\t# ψ = {}, ψ has multiplicative order {}.\n".format(
        ψ_table[q][1], 1 << two_adicity))
    f.write("\t{} : {},\n".format(q, ψ_table[q]))
f.write("}\n\n")

# writing ψ_inv
f.write("# Dictionary containing the powers of ψ_inv.\n")
f.write("ψ_inv = {\n")
for (q, two_adicity) in [(q,two_adicity)]:
    f.write("\t # ψ_inv = {}, ψ*ψ_inv = 1.\n".format(ψ_inv_table[q][1]))
    f.write("\t{} : {},\n".format(q, ψ_inv_table[q]))
f.write("}\n\n")

# writing ψ_rev
f.write(
    "# The table ψ, but in bit-reversed order, i.e. the i-th element corresponds to ψ^{BitReversed(i)}.\n")
f.write("ψ_rev = {\n")
for (q, two_adicity) in [(q,two_adicity)]:
    f.write("\t{} : {},\n".format(q, ψ_rev[q]))
f.write("}\n\n")

# writing ψ_rev_inv
f.write(
    "# The table ψ_inv, but in bit-reversed order, i.e. the i-th element corresponds to ψ^{BitReversed(-i)}.\n")
f.write("ψ_inv_rev = {\n")
for (q, two_adicity) in [(q,two_adicity)]:
    f.write("\t{} : {},\n".format(q, ψ_inv_rev[q]))
f.write("}\n\n")

# writing n_inv
f.write("# The inverses of powers of 2 mod q\n")
f.write("n_inv = {\n")
for (q, two_adicity) in [(q,two_adicity)]:
    f.write("\t{}: {{\n".format(q))
    # n_inv[{}] = {{\n".format(q))
    for j in range(1, two_adicity+1):
        f.write("\t\t{}: {},\n".format(1 << j, [pow(1 << j, -1, q),0]))
    f.write("\t},\n")
f.write("}")

f.close()

#
# Generate constants for the recursive case
#

file = open("ntt_constants_recursive.py", 'w')
file.write(
    "# Roots of the cyclotomic polynomials mod q for the recursive ntt implementation\n")
file.write("# File generated using `generate_contants_recursive.sage`\n")
file.write(
    "# roots_dict_mod[q][n] corresponds to the roots of x^{2n} + 1 mod q\n")
file.write("roots_dict_mod = {\n")


from m31 import p
from m31_2 import sqrt_m31_2, opp2, two_adicity

for (q, two_adicity) in [(q, two_adicity)]:
    file.write("\t{}: {{\n".format(q))
    phi_roots = [[0, 1], [0, p-1]]
    for k in range(1, two_adicity+2):
        file.write("\t\t{} : {},\n".format(1 << k, phi_roots))
        phi_roots = sum([[sqrt_m31_2(elt), opp2(sqrt_m31_2(elt))]
                        for elt in phi_roots], [])
    file.write("\t},\n")
file.write("}\n")
file.close()
