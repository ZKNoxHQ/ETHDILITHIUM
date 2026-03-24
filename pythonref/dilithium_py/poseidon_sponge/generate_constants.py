"""
Standalone Poseidon constant generator — no galois/numpy dependency.
Implements the Grain LFSR for round constants and Cauchy matrix for MDS,
following the Poseidon paper specification.

Usage:
    python -m dilithium_py.poseidon_prng.generate_constants
"""
from math import ceil, floor, log, log2


# ---------------------------------------------------------------------------
# Round number calculation (brute-force search from Poseidon paper)
# ---------------------------------------------------------------------------

def _security_check(prime_bit_len, t, full_round, partial_round, alpha, security_level):
    c = log2(alpha - 1) if alpha > 0 else 2
    full_round_stat = 6 if security_level <= ((floor(prime_bit_len) - c) * (t + 1)) else 10

    if alpha > 0:
        full_round_inter = (ceil(log(2, alpha) * min(security_level, ceil(prime_bit_len)))
                            + ceil(log(t, alpha)) - partial_round + 1)
        full_round_GR_1 = (log(2, alpha) * min(security_level / 3.0, prime_bit_len / 2.0)
                           - partial_round + 1)
        full_round_GR_2 = (min((log(2, alpha) * security_level) / (t + 1),
                                (log(2, alpha) * prime_bit_len) / 2.0)
                           - partial_round + t - 1)
        full_round_max = max(ceil(full_round_stat), ceil(full_round_inter),
                             ceil(full_round_GR_1), ceil(full_round_GR_2))
        return full_round >= full_round_max
    return False


def calc_round_numbers(prime_bit_len, security_level, t, alpha):
    partial_round = 0
    full_round = 0
    min_cost = float("inf")
    max_cost_rf = 0

    for rp_i in range(1, 500):
        for rf_i in range(4, 100, 2):
            if _security_check(prime_bit_len, t, rf_i, rp_i, alpha, security_level):
                rf_i += 2  # security margin
                rp_i = int(ceil(rp_i * 1.075))
                cost = t * rf_i + rp_i
                if cost < min_cost or (cost == min_cost and rf_i < max_cost_rf):
                    partial_round = ceil(rp_i)
                    full_round = ceil(rf_i)
                    min_cost = cost
                    max_cost_rf = full_round

    return int(full_round), int(partial_round), int(full_round // 2)


# ---------------------------------------------------------------------------
# Grain LFSR for round constants (from Poseidon paper Section 4)
# ---------------------------------------------------------------------------

def _init_grain_state(alpha, p, prime_bit_len, t, full_round, partial_round):
    if alpha == 3:
        exp_flag = 0
    elif alpha == 5:
        exp_flag = 1
    elif alpha == -1:
        exp_flag = 2
    else:
        exp_flag = 3

    state = []
    state += [int(b) for b in bin(p % 2)[2:].zfill(2)]
    state += [int(b) for b in bin(exp_flag)[2:].zfill(4)]
    state += [int(b) for b in bin(prime_bit_len)[2:].zfill(12)]
    state += [int(b) for b in bin(t)[2:].zfill(12)]
    state += [int(b) for b in bin(full_round)[2:].zfill(10)]
    state += [int(b) for b in bin(partial_round)[2:].zfill(10)]
    state += [1] * 30
    return state


def _grain_next_bit(state):
    new_bit = state[62] ^ state[51] ^ state[38] ^ state[23] ^ state[13] ^ state[0]
    state.pop(0)
    state.append(new_bit)
    return new_bit


def _grain_next_bits(state, num_bits):
    bits = []
    while len(bits) < num_bits:
        b1 = _grain_next_bit(state)
        b2 = _grain_next_bit(state)
        if b1 == 1:
            bits.append(b2)
    return bits


def calc_round_constants(p, prime_bit_len, t, full_round, partial_round, alpha):
    rc_count = t * (full_round + partial_round)
    state = _init_grain_state(alpha, p, prime_bit_len, t, full_round, partial_round)

    # Discard first 160 bits
    for _ in range(160):
        _grain_next_bit(state)

    constants = []
    while len(constants) < rc_count:
        bits = _grain_next_bits(state, prime_bit_len)
        val = int("".join(str(b) for b in bits), 2)
        if val < p:
            constants.append(val)

    return constants


# ---------------------------------------------------------------------------
# MDS matrix (Cauchy matrix construction)
# ---------------------------------------------------------------------------

def _mod_inverse(a, p):
    return pow(a, p - 2, p)


def calc_mds_matrix(p, t):
    """Cauchy matrix: M[i][j] = 1 / (x_i + y_j) where x = [0..t-1], y = [t..2t-1]."""
    mds = []
    for i in range(t):
        row = []
        for j in range(t):
            row.append(_mod_inverse((i + t + j) % p, p))
        mds.append(row)
    return mds


# ---------------------------------------------------------------------------
# Main: generate and print constants for a given field
# ---------------------------------------------------------------------------

def generate_poseidon_constants(p, alpha, t, security_level=128, name=""):
    prime_bit_len = ceil(log2(p))
    full_round, partial_round, half_full_round = calc_round_numbers(
        log2(p), security_level, t, alpha)
    rc = calc_round_constants(p, prime_bit_len, t, full_round, partial_round, alpha)
    mds = calc_mds_matrix(p, t)

    print(f"# {name}")
    print(f"# p = {p}, alpha = {alpha}, t = {t}, security = {security_level}")
    print(f"# R_F = {full_round} ({half_full_round} + {half_full_round}), R_P = {partial_round}")
    print(f"# RC count = {len(rc)}, MDS = {t}x{t}")
    print()
    print(f"P_{name} = {p}")
    print(f"ALPHA_{name} = {alpha}")
    print(f"T_{name} = {t}")
    print(f"RATE_{name} = {t - 9}")  # capacity = 9 for 128-bit security on 31-bit field
    print(f"HALF_FULL_ROUNDS_{name} = {half_full_round}")
    print(f"PARTIAL_ROUNDS_{name} = {partial_round}")
    print()
    print(f"MDS_MATRIX_{name} = [")
    for row in mds:
        print(f"    {row},")
    print("]")
    print()
    print(f"ROUND_CONSTANTS_{name} = [")
    for c in rc:
        print(f"    {c},")
    print("]")
    print()

    return {
        "p": p, "alpha": alpha, "t": t, "rate": t - 9,
        "half_full_rounds": half_full_round, "partial_rounds": partial_round,
        "mds": mds, "rc": rc,
    }


def verify_against_library(params, name):
    """Verify our constants match the poseidon-hash library (optional)."""
    try:
        import numpy as np
        _orig_gcd = np.gcd
        np.gcd = lambda a, b: _orig_gcd(int(a), int(b))
        from poseidon import Poseidon
        pos = Poseidon(
            p=params["p"], security_level=128, alpha=params["alpha"],
            input_rate=params["rate"], t=params["t"])

        lib_mds = [[int(x) for x in row] for row in pos.mds_matrix.tolist()]
        lib_rc = [int(x) for x in pos.rc_field]

        assert lib_mds == params["mds"], f"{name}: MDS mismatch!"
        assert lib_rc == params["rc"], f"{name}: RC mismatch!"
        print(f"# {name}: VERIFIED against poseidon-hash library")
    except Exception as e:
        print(f"# {name}: Could not verify ({e})")


if __name__ == "__main__":
    BABYBEAR = 2013265921
    KOALABEAR = 2130706433

    print("# Auto-generated Poseidon constants for BabyBear and KoalaBear fields.")
    print("# Generated by generate_constants.py")
    print()

    bb = generate_poseidon_constants(BABYBEAR, alpha=7, t=17, name="BB")
    kb = generate_poseidon_constants(KOALABEAR, alpha=5, t=17, name="KB")
