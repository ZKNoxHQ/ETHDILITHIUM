from MSIS_security import MSIS_summarize_attacks, MSISParameterSet
from MLWE_security import MLWE_summarize_attacks, MLWEParameterSet
from math import sqrt


class UniformDilithiumParameterSet(object):
    def __init__(self, n, k, l, gamma1, gamma2, tau, q, eta, pkdrop=0):
        self.n = n
        self.k = k
        self.l = l
        self.gamma1 = gamma1
        self.gamma2 = gamma2
        self.q = q
        self.eta = eta
        self.tau = tau
        # SIS l_oo bound for unforgeability
        self.zeta = max(gamma1, 2*gamma2 + 1 + 2**(pkdrop-1) *
                        tau)                # Define in section 6.2
        # SIS l_oo bound for strong unforgeability
        # Define in section 6.2
        self.zeta_prime = max(2*gamma1, 4*gamma2 + 1)
        self.pkdrop = pkdrop

    def nb_iter(self):
        from math import e
        # return exp(self.tau * self.eta * 256 * (self.l/self.gamma1 + self.k/self.gamma2))
        return e**(self.tau * self.eta * 256 * (self.l/self.gamma1 + self.k/self.gamma2))


n = 256
q = 8380417
q_BB = 2**31 - 2**27 + 1  # babybear
q_M31 = 2**31 - 1  # Mersenne31
q_KB = 2**31 - 2**24 + 1  # koalabear

Dilithium = UniformDilithiumParameterSet(
    n, 4, 4, 2**17, (q-1)/88, 39, q, 2, pkdrop=13)
DilithiumBB_1 = UniformDilithiumParameterSet(
    n, 4, 4, 2**17, (q-1)/88, 39, q_BB, 2, pkdrop=13)
DilithiumBB_2 = UniformDilithiumParameterSet(
    n, 4, 4, 2**17, (q-1)/88, 39, q_BB, 10, pkdrop=13)
DilithiumBB_3 = UniformDilithiumParameterSet(
    n, 4, 5, 2**17, (q-1)/88, 39, q_BB, 2, pkdrop=13)
DilithiumBB_4 = UniformDilithiumParameterSet(
    n, 4, 5, 2**17, (q-1)/88, 39, q_BB, 4, pkdrop=13)
DilithiumBB_5 = UniformDilithiumParameterSet(
    n, 4, 5, 2**17, (q_BB-1)/2**10, 39, q_BB, 4, pkdrop=13)
DilithiumBB_6 = UniformDilithiumParameterSet(
    n, 4, 5, 2**21, (q_BB-1)/2**11, 39, q_BB, 4, pkdrop=13)
DilithiumBB_7 = UniformDilithiumParameterSet(
    n, 4, 5, 2**21, (q_BB-1)/2**11, 39, q_BB, 4, pkdrop=16)

DilithiumM31_1 = UniformDilithiumParameterSet(
    n, 4, 4, 2**17, (q-1)/88, 39, q_M31, 2, pkdrop=13)
DilithiumM31_2 = UniformDilithiumParameterSet(
    n, 4, 4, 2**17, (q-1)/88, 39, q_M31, 10, pkdrop=13)
DilithiumM31_3 = UniformDilithiumParameterSet(
    n, 4, 5, 2**17, (q-1)/88, 39, q_M31, 2, pkdrop=13)
DilithiumM31_4 = UniformDilithiumParameterSet(
    n, 4, 5, 2**17, (q-1)/88, 39, q_M31, 4, pkdrop=13)
DilithiumM31_5 = UniformDilithiumParameterSet(
    n, 4, 5, 2**17, (q_M31-1)/(2*7), 39, q_M31, 4, pkdrop=13)
DilithiumM31_6 = UniformDilithiumParameterSet(
    n, 4, 5, 2**17, (q_M31-1)/(2*7*151), 39, q_M31, 4, pkdrop=13)
DilithiumM31_7 = UniformDilithiumParameterSet(
    n, 4, 5, 2**21, (q_M31-1)/(2*7*151), 39, q_M31, 4, pkdrop=13)
DilithiumM31_8 = UniformDilithiumParameterSet(
    n, 4, 5, 2**21, (q_M31-1)/(2*7*151), 39, q_M31, 4, pkdrop=16)

DilithiumKB_1 = UniformDilithiumParameterSet(
    n, 4, 4, 2**17, (q-1)/88, 39, q_KB, 2, pkdrop=13)
DilithiumKB_2 = UniformDilithiumParameterSet(
    n, 4, 4, 2**17, (q-1)/88, 39, q_KB, 10, pkdrop=13)
DilithiumKB_3 = UniformDilithiumParameterSet(
    n, 4, 5, 2**17, (q-1)/88, 39, q_KB, 2, pkdrop=13)
DilithiumKB_4 = UniformDilithiumParameterSet(
    n, 4, 5, 2**17, (q-1)/88, 39, q_KB, 4, pkdrop=13)
DilithiumKB_5 = UniformDilithiumParameterSet(
    n, 4, 5, 2**17, (q_KB-1)/2**10, 39, q_KB, 4, pkdrop=13)
DilithiumKB_6 = UniformDilithiumParameterSet(
    n, 4, 5, 2**17, (q_KB-1)/2**11, 39, q_KB, 4, pkdrop=13)
DilithiumKB_7 = UniformDilithiumParameterSet(
    n, 4, 5, 2**21, (q_KB-1)/2**11, 39, q_KB, 4, pkdrop=13)
DilithiumKB_8 = UniformDilithiumParameterSet(
    n, 4, 5, 2**21, (q_KB-1)/2**11, 39, q_KB, 4, pkdrop=16)


all_params_unif = [
    ("Dilithium", Dilithium),
    # ("DilithiumBB_1", DilithiumBB_1),
    # ("DilithiumBB_2", DilithiumBB_2),
    # ("DilithiumBB_3", DilithiumBB_3),
    # ("DilithiumBB_4", DilithiumBB_4),
    # ("DilithiumBB_5", DilithiumBB_5),
    # ("DilithiumBB_6", DilithiumBB_6),
    ("DilithiumBB_7", DilithiumBB_7),

    # ("DilithiumM31_1", DilithiumM31_1),
    # ("DilithiumM31_2", DilithiumM31_2),
    # ("DilithiumM31_3", DilithiumM31_3),
    # ("DilithiumM31_4", DilithiumM31_4),
    # ("DilithiumM31_5", DilithiumM31_5),
    # ("DilithiumM31_6", DilithiumM31_6),
    # ("DilithiumM31_7", DilithiumM31_7),
    ("DilithiumM31_8", DilithiumM31_8),

    # ("DilithiumKB_1", DilithiumKB_1),
    # ("DilithiumKB_2", DilithiumKB_2),
    # ("DilithiumKB_3", DilithiumKB_3),
    # ("DilithiumKB_4", DilithiumKB_4),
    # ("DilithiumKB_5", DilithiumKB_5),
    # ("DilithiumKB_6", DilithiumKB_6),
    # ("DilithiumKB_7", DilithiumKB_7),
    ("DilithiumKB_8", DilithiumKB_8),
]


all_params = all_params_unif


def Dilithium_to_MSIS(dps, strong_uf=False):
    if strong_uf:
        return MSISParameterSet(dps.n, dps.k + dps.l + 1, dps.k, dps.zeta_prime, dps.q, norm="linf")
    else:
        return MSISParameterSet(dps.n, dps.k + dps.l + 1, dps.k, dps.zeta, dps.q, norm="linf")


def Dilithium_to_MLWE(dps):
    return MLWEParameterSet(dps.n, dps.l, dps.k, dps.eta, dps.q, distr="uniform")


text_SIS = ["BKZ block-size $b$ to break SIS", "Best Known Classical bit-cost",
            "Best Known Quantum bit-cost", "Best Plausible bit-cost"]
text_LWE = ["BKZ block-size $b$ to break LWE", "Best Known Classical bit-cost",
            "Best Known Quantum bit-cost", "Best Plausible bit-cost"]


table_SIS = [len(all_params_unif)*[0] for i in range(4)]
table_LWE = [len(all_params_unif)*[0] for i in range(4)]
table_iter = len(all_params_unif) * [0]
j = 0

for (scheme, param) in all_params_unif:
    print("\n"+scheme)
    print(param.__dict__)
    print("")
    table_iter[j] = param.nb_iter()
    print("nbiter: ", table_iter[j])
    print("=== WEAK UF")
    v = MSIS_summarize_attacks(Dilithium_to_MSIS(param))
    print("=== STRONG UF")
    v = MSIS_summarize_attacks(Dilithium_to_MSIS(param, strong_uf=True))
    for i in range(4):
        table_SIS[i][j] = v[i]
    print("=== SECRET KEY RECOVERY")
    v = MLWE_summarize_attacks(Dilithium_to_MLWE(param))
    for i in range(4):
        table_LWE[i][j] = v[i]
    j += 1

print("UNIFORM DILITHIUM TABLE")
print("========================")

print("\\hline")
print("NbIter & ", end='')
for i in range(len(all_params_unif)):
    print(round(table_iter[i], 2), end=''),
    if i < len(all_params_unif)-1:
        print(" & ", end=''),
print("\\\\")
print("\\hline")
for j in range(4):
    print(text_SIS[j]+" & ", end=''),
    for i in range(len(all_params_unif)):
        print(table_SIS[j][i], end=''),
        if i < len(all_params_unif)-1:
            print(" & ", end=''),
    print("\\\\")
print("\\hline")
for j in range(4):
    print(text_LWE[j]+" & ", end=''),
    for i in range(len(all_params_unif)):
        print(table_LWE[j][i], end=''),
        if i < len(all_params_unif)-1:
            print(" & ", end=''),
    print("\\\\")
print("\\hline")

print("========================")
