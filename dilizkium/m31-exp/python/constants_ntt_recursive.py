from m31 import p
from m31_2 import sqrt_m31_2, opp2, two_adicity

Roots = {}
phi_roots = [[0, 1], [0, p-1]]
for k in range(1, two_adicity+2):
    Roots[1 << k] = phi_roots
    phi_roots = sum([[sqrt_m31_2(elt), opp2(sqrt_m31_2(elt))]
                     for elt in phi_roots], [])
