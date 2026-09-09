#!/usr/bin/env python3
# gen_ntt_mont.py -- emits src/ZKNOX_NTT_dilithium_mont.sol: the ML-DSA NTT
# (n = 256, q = 8380417) on a packed layout of four 64-bit lanes per word,
# radix-8 fused passes, Montgomery reduction of the twiddle products.
#
#   python3 pythonref/ntt_mont/gen_ntt_mont.py > src/ZKNOX_NTT_dilithium_mont.sol \
#       && forge fmt src/ZKNOX_NTT_dilithium_mont.sol
#
# The schedule, the twiddle-per-butterfly assignment and every bound below are
# validated first by pythonref/ntt_mont/model_ntt_mont.py against a model of the
# scalar transforms of src/ZKNOX_NTT_dilithium.sol (same psirev tables).
#
# Reduction. A twiddle product x = a * w_m (a a lane < 17q, w_m < q the twiddle
# in Montgomery form w * 2^32 mod q) is reduced lane-locally with
#     t = ((x mod 2^32) * QINV) mod 2^32,   r = (x + t*q) / 2^32,
# QINV = -q^-1 mod 2^32, so r = a * w (mod q) and r < x/2^32 + q < 2q. In a
# word of four 64-bit lanes every step stays inside its lane: (x mod 2^32)*QINV
# < 2^64, t*q < 2^55, x + t*q < 2^56, and the final shr(32) of the whole word
# is clean because each lane's low 32 bits are zero. Six ops, three multiplies:
#     and, mul, and, mul, add, shr
# against the ten ops (four multiplies) of the two-step lane Barrett that a
# 23-bit q otherwise needs. The in-word layers (t = 2, 1), whose lanes are
# extracted to scalars anyway, use the EVM's mulmod on the plain twiddles.
#
# Bounds (asserted in the model, exercised by the saturated vectors):
#   forward: canonical in, +2q per packed layer (r < 2q, bias 2q), < 13q before
#            the in-word pass; products < 13q*q < 2^50.
#   inverse: canonical lanes out of the in-word pass, sums never reduced and
#            doubling per layer (< 8q after B', < 64q at the folded last
#            layer), difference branch (u + Kq - v) < 2Kq; every product
#            < 64q*q < 2^53, so r < q + 2^21 < 2q, canonicalised at the end.
#
# Technique note (DECISIONS.md, ADR-NTT-MONT): the packed 4x64-bit-lane layout
# and the fused radix-8 passes follow fireblocks-labs/evm-ml-dsa-verifier
# (MIT, cca262b); reduction, schedule, tables, generator and code are ours.
import os
import re
import sys

q = 8380417
R = 1 << 32
QINV = (-pow(q, -1, R)) % R
NINV = 8347681
assert (q * QINV) % R == R - 1

HERE = os.path.dirname(os.path.abspath(__file__))
SRC = open(os.path.join(HERE, "..", "..", "src", "ZKNOX_NTT_dilithium.sol")).read()
ARRAYS = re.findall(r"uint256\[32\] memory psirev = \[(.*?)\];", SRC, re.S)
assert len(ARRAYS) == 2


def parse(a):
    w = [int(x, 16) for x in re.findall(r"0x[0-9a-fA-F]+", a)]
    assert len(w) == 32
    return [(w[i >> 3] >> (32 * (i & 7))) & 0xFFFFFFFF for i in range(256)]


FW, INV = parse(ARRAYS[0]), parse(ARRAYS[1])


def mont(x):
    return (x * R) % q


# tables: indices 1..63 (packed layers) in Montgomery form, 64..255 (in-word
# layers, scalar mulmod) as they are
def table(t):
    return [mont(t[i]) if 1 <= i < 64 else t[i] for i in range(256)]


FWT, INVT = table(FW), table(INV)


def rep4(v):
    return sum(v << (64 * i) for i in range(4))


def hx(v):
    return "0x" + format(v, "064x")


def table_literal(tbl):
    words = [sum(tbl[8 * w + j] << (32 * j) for j in range(8)) for w in range(32)]
    return ",\n".join("            " + ("uint256(" + hex(x) + ")" if i == 0 else hex(x)) for i, x in enumerate(words))


def table_hex(tbl):
    """the 32 packed words of a table (eight 32-bit fields each), as hex bytes"""
    words = [sum(tbl[8 * w + j] << (32 * j) for j in range(8)) for w in range(32)]
    return "".join(format(x, "064x") for x in words)


def indent(lines, n):
    pad = " " * n
    return "\n".join(pad + l if l else l for l in lines)


def RED(v):
    """Montgomery step in place on the four lanes of v (two statements). `m32`
    is the lane mask loaded once per pass into a Yul local: a DUP instead of a
    33-byte PUSH32 at each of the two uses (768 bytes of runtime per radix-8 pass)."""
    return [
        f"{v} := add({v}, mul(and(mul(and({v}, m32), _QINV), m32), {q}))",
        f"{v} := shr(32, {v})",
    ]


# ---------------------------------------------------------------------------
# radix-8 bodies. `ld(k)` / `st(k, expr)` are load/store expressions for the
# k-th word of the octet, so that the same body serves packed <-> packed
# passes and the boundary passes that read or write the expanded (one
# coefficient per word) array of the caller.
# ---------------------------------------------------------------------------
def ct_octet(ld, st, tw):
    """Cooley-Tukey radix-8 body. Layer 1 pairs (k, k+4) with S1; layer 2 pairs
    (0,2),(1,3) with S2a and (4,6),(5,7) with S2b; layer 3 pairs (2k, 2k+1) with
    S3[k]. Butterfly: (u, v) -> (u + V, u + 2q - V), V = red(v * S) < 2q."""
    L = ["let c0, c2, c4, c6", "{"]
    L += [
        f"    let u0 := {ld(0)}",
        f"    let t := mul({ld(4)}, {tw['S1']})",
        *["    " + l for l in RED("t")],
        "    let a0 := add(u0, t)",
        "    u0 := sub(add(u0, _Q4_2), t)",  # b0
        f"    let u2 := {ld(2)}",
        f"    t := mul({ld(6)}, {tw['S1']})",
        *["    " + l for l in RED("t")],
        "    let a2 := add(u2, t)",
        "    u2 := sub(add(u2, _Q4_2), t)",  # b2
        f"    t := mul(a2, {tw['S2a']})",
        *["    " + l for l in RED("t")],
        "    c0 := add(a0, t)",
        "    c2 := sub(add(a0, _Q4_2), t)",
        f"    t := mul(u2, {tw['S2b']})",
        *["    " + l for l in RED("t")],
        "    c4 := add(u0, t)",
        "    c6 := sub(add(u0, _Q4_2), t)",
        "}",
        "{",
        f"    let u1 := {ld(1)}",
        f"    let t := mul({ld(5)}, {tw['S1']})",
        *["    " + l for l in RED("t")],
        "    let a1 := add(u1, t)",
        "    let b1 := sub(add(u1, _Q4_2), t)",
        f"    u1 := {ld(3)}",
        f"    t := mul({ld(7)}, {tw['S1']})",
        *["    " + l for l in RED("t")],
        "    let a3 := add(u1, t)",
        "    u1 := sub(add(u1, _Q4_2), t)",  # b3
        f"    t := mul(a3, {tw['S2a']})",
        *["    " + l for l in RED("t")],
        "    a3 := sub(add(a1, _Q4_2), t)",  # c3
        "    a1 := add(a1, t)",  # c1
        f"    t := mul(u1, {tw['S2b']})",
        *["    " + l for l in RED("t")],
        "    u1 := sub(add(b1, _Q4_2), t)",  # c7
        "    b1 := add(b1, t)",  # c5
    ]
    for lo, hi, k in (("c0", "a1", 0), ("c2", "a3", 2), ("c4", "b1", 4), ("c6", "u1", 6)):
        L += [
            f"    t := mul({hi}, {tw['S3'][k // 2]})",
            *["    " + l for l in RED("t")],
            f"    {st(k, f'add({lo}, t)')}",
            f"    {st(k + 1, f'sub(add({lo}, _Q4_2), t)')}",
        ]
    L.append("}")
    return L


CANON = "sub(s, mul(shr(23, and(add(s, _C23), _H23)), 8380417))"


def gs_octet(ld, st, tw, K, last=False):
    """Gentleman-Sande radix-8 body. Layer 1 pairs (2k, 2k+1) with S3[k], bias
    K[0]q; layer 2 pairs (0,2),(1,3) with S2a and (4,6),(5,7) with S2b, bias
    K[1]q; layer 3 pairs (k, k+4) with S1, bias K[2]q. Butterfly: (u, v) ->
    (u + v, red((u + Kq - v) * S)). If last: layer 3 folds n^-1 into both
    branches (S1 is then (S * ninv)_m, the sum branch multiplies by ninv_m) and
    canonicalises the outputs."""
    B = {1: "_Q4_1", 2: "_Q4_2", 4: "_Q4_4", 8: "_Q4_8", 16: "_Q4_16", 32: "_Q4_32"}
    b1, b2, b3 = B[K[0]], B[K[1]], B[K[2]]
    L = ["let b0, b1, b2, b3", "{"]
    L += [
        f"    let u := {ld(0)}",
        f"    let v := {ld(1)}",
        f"    let t := mul(sub(add(u, {b1}), v), {tw['S3'][0]})",
        *["    " + l for l in RED("t")],  # a1
        "    u := add(u, v)",  # a0
        f"    v := {ld(2)}",
        f"    let w := {ld(3)}",
        f"    let s := mul(sub(add(v, {b1}), w), {tw['S3'][1]})",
        *["    " + l for l in RED("s")],  # a3
        "    v := add(v, w)",  # a2
        f"    w := mul(sub(add(u, {b2}), v), {tw['S2a']})",
        *["    " + l for l in RED("w")],
        "    b0 := add(u, v)",
        "    b2 := w",
        f"    w := mul(sub(add(t, {b2}), s), {tw['S2a']})",
        *["    " + l for l in RED("w")],
        "    b1 := add(t, s)",
        "    b3 := w",
        "}",
        "{",
        f"    let u := {ld(4)}",
        f"    let v := {ld(5)}",
        f"    let t := mul(sub(add(u, {b1}), v), {tw['S3'][2]})",
        *["    " + l for l in RED("t")],  # a5
        "    u := add(u, v)",  # a4
        f"    v := {ld(6)}",
        f"    let w := {ld(7)}",
        f"    let s := mul(sub(add(v, {b1}), w), {tw['S3'][3]})",
        *["    " + l for l in RED("s")],  # a7
        "    v := add(v, w)",  # a6
        f"    w := mul(sub(add(u, {b2}), v), {tw['S2b']})",
        *["    " + l for l in RED("w")],  # b6
        "    u := add(u, v)",  # b4
        f"    v := mul(sub(add(t, {b2}), s), {tw['S2b']})",
        *["    " + l for l in RED("v")],  # b7
        "    t := add(t, s)",  # b5
    ]
    for lo, hi, k in (("b0", "u", 0), ("b1", "t", 1), ("b2", "w", 2), ("b3", "v", 3)):
        L += [
            f"    s := mul(sub(add({lo}, {b3}), {hi}), {tw['S1']})",
            *["    " + l for l in RED("s")],
        ]
        if last:
            L += [f"    s := {CANON}"]
        L += [f"    {st(k + 4, 's')}"]
        if last:
            L += [
                f"    s := mul(add({lo}, {hi}), {hex(mont(NINV))})",
                *["    " + l for l in RED("s")],
                f"    s := {CANON}",
                f"    {st(k, 's')}",
            ]
        else:
            L += [f"    {st(k, f'add({lo}, {hi})')}"]
    L.append("}")
    return L


# load/store helpers --------------------------------------------------------
def packed(base):
    """word k of an octet in the packed array: base + stride*k, stride set per pass"""

    def ld(k, stride):
        return f"mload({base})" if k == 0 else f"mload(add({base}, {hex(k * stride)}))"

    def st(k, e, stride):
        return f"mstore({base}, {e})" if k == 0 else f"mstore(add({base}, {hex(k * stride)}), {e})"

    return ld, st


def ld_expanded(k, stride):
    """word k of an octet read from the caller's expanded array: four canonical
    coefficients at p + k*stride + {0, 32, 64, 96}, packed on the fly"""
    b = "p" if k == 0 else f"add(p, {hex(k * stride)})"
    return (
        f"or(or(mload({b}), shl(64, mload(add({b}, 32)))), "
        f"or(shl(128, mload(add({b}, 64))), shl(192, mload(add({b}, 96)))))"
    )


def st_expanded(k, e):
    """word k of an octet written to the caller's expanded array: the four
    canonical lanes of `e` (a variable) to d + k*0x400 + {0, 32, 64, 96}"""
    b = "d" if k == 0 else f"add(d, {hex(k * 0x400)})"
    return (
        f"mstore({b}, and({e}, _L64)) "
        f"mstore(add({b}, 32), and(shr(64, {e}), _L64)) "
        f"mstore(add({b}, 64), and(shr(128, {e}), _L64)) "
        f"mstore(add({b}, 96), shr(192, {e}))"
    )


# twiddle sources -----------------------------------------------------------
fwA = {
    "S1": hex(FWT[1]),
    "S2a": hex(FWT[2]),
    "S2b": hex(FWT[3]),
    "S3": [hex(FWT[4 + k]) for k in range(4)],
}
invA = {
    "S1": hex((INV[1] * NINV * R) % q),  # folded with n^-1, Montgomery form
    "S2a": hex(INVT[2]),
    "S2b": hex(INVT[3]),
    "S3": [hex(INVT[4 + k]) for k in range(4)],
}
# pass B / B': scratch word 0x00 = S(t=16) | S(t=8,a) << 32 | S(t=8,b) << 64 | S(t=4)[k] << (96 + 32k)
scratchB = {
    "S1": "and(mload(0), 0xffffffff)",
    "S2a": "and(shr(32, mload(0)), 0xffffffff)",
    "S2b": "and(shr(64, mload(0)), 0xffffffff)",
    "S3": ["and(shr(96, mload(0)), 0xffffffff)", "and(shr(128, mload(0)), 0xffffffff)", "and(shr(160, mload(0)), 0xffffffff)", "and(shr(192, mload(0)), 0xffffffff)"],
}
SCRATCH_B = """mstore(
    0,
    or(
        or(
            and(shr(shl(5, b), mload(add(tb, 32))), 0xffffffff),
            shl(32, and(shr(shl(6, and(b, 3)), mload(add(tb, add(64, shl(5, shr(2, b)))))), 0xffffffffffffffff))
        ),
        shl(96, shr(shl(7, and(b, 1)), mload(add(tb, add(128, shl(5, shr(1, b)))))))
    )
)"""

# ---------------------------------------------------------------------------
# in-word passes (t = 2 and t = 1), scalars, eight words per table word
# ---------------------------------------------------------------------------
def fw_inword(k, lazy=False):
    """word 8*i8 + k: lanes to scalars, t = 2 (S2 = fw[64 + w]) then t = 1
    (Sa, Sb = fw[128 + 2w], fw[129 + 2w]) with mulmod, four coefficients stored
    expanded at dst + 128k: canonical (addmod) or, if lazy, u + v and
    u + 2q - v as they come (< 17q), which is what the two addmods cost."""
    s2 = f"and(shr({32 * k}, mload(0)), 0xffffffff)" if k else "and(mload(0), 0xffffffff)"
    w1 = "w1a" if k < 4 else "w1b"
    sh = 64 * (k & 3)
    sa = f"and(shr({sh}, {w1}), 0xffffffff)" if sh else f"and({w1}, 0xffffffff)"
    sb = f"and(shr({sh + 32}, {w1}), 0xffffffff)"
    src = "p" if k == 0 else f"add(p, {hex(32 * k)})"
    d = lambda j: "dst" if k == 0 and j == 0 else f"add(dst, {hex(128 * k + 32 * j)})"
    return [
        "{",
        f"    let W := mload({src})",
        "    let l0 := and(W, _L64)",
        "    let l1 := and(shr(64, W), _L64)",
        "    let l2 := and(shr(128, W), _L64)",
        "    let l3 := shr(192, W)",
        f"    W := {s2}",
        "    let v := mulmod(l2, W, 8380417)",
        "    l2 := sub(add(l0, 8380417), v)",
        "    l0 := add(l0, v)",
        "    v := mulmod(l3, W, 8380417)",
        "    l3 := sub(add(l1, 8380417), v)",
        "    l1 := add(l1, v)",
        f"    v := mulmod(l1, {sa}, 8380417)",
    ] + (
        [
            "    l1 := or(add(l0, v), shl(64, sub(add(l0, 16760834), v)))",
            f"    v := mulmod(l3, {sb}, 8380417)",
            f"    mstore({src}, or(l1, or(shl(128, add(l2, v)), shl(192, sub(add(l2, 16760834), v)))))",
        ]
        if lazy == "packed"
        else [
            f"    mstore({d(0)}, add(l0, v))",
            f"    mstore({d(1)}, sub(add(l0, 16760834), v))",
            f"    v := mulmod(l3, {sb}, 8380417)",
            f"    mstore({d(2)}, add(l2, v))",
            f"    mstore({d(3)}, sub(add(l2, 16760834), v))",
        ]
        if lazy
        else [
            f"    mstore({d(0)}, addmod(l0, v, 8380417))",
            f"    mstore({d(1)}, addmod(l0, sub(8380417, v), 8380417))",
            f"    v := mulmod(l3, {sb}, 8380417)",
            f"    mstore({d(2)}, addmod(l2, v, 8380417))",
            f"    mstore({d(3)}, addmod(l2, sub(8380417, v), 8380417))",
        ]
    ) + [
        "}",
    ]


ACCQ30 = q << 30  # multiple of q above any accumulator lane (< 7.03e15 < q*2^30)


def inv_inword(k, raw=False):
    """word 8*i8 + k: four coefficients, read expanded at p + 128k (canonical),
    or, if raw, as the four lanes of the packed word at dst + 32k (matvec
    accumulator lanes < q*2^30, so the differences take a q*2^30 offset);
    t = 1 (Sa, Sb = inv[128 + 2w], inv[129 + 2w]) then t = 2 (S2 = inv[64 + w]),
    canonical lanes stored packed at dst + 32k."""
    s2 = f"and(shr({32 * k}, mload(0)), 0xffffffff)" if k else "and(mload(0), 0xffffffff)"
    w1 = "w1a" if k < 4 else "w1b"
    sh = 64 * (k & 3)
    sa = f"and(shr({sh}, {w1}), 0xffffffff)" if sh else f"and({w1}, 0xffffffff)"
    sb = f"and(shr({sh + 32}, {w1}), 0xffffffff)"
    s = lambda j: "p" if k == 0 and j == 0 else f"add(p, {hex(128 * k + 32 * j)})"
    dst = "dst" if k == 0 else f"add(dst, {hex(32 * k)})"
    if raw:
        head = [
            "{",
            f"    let l3 := mload({dst})",
            "    let l0 := and(l3, _L64)",
            "    let l1 := and(shr(64, l3), _L64)",
            f"    let d0 := mulmod(sub(add(l0, {ACCQ30}), l1), {sa}, 8380417)",
            "    l0 := addmod(l0, l1, 8380417)",
            "    l1 := and(shr(128, l3), _L64)",
            "    l3 := shr(192, l3)",
            f"    let d1 := mulmod(sub(add(l1, {ACCQ30}), l3), {sb}, 8380417)",
            "    l1 := addmod(l1, l3, 8380417)",
        ]
    else:
        head = [
            "{",
            f"    let l0 := mload({s(0)})",
            f"    let l1 := mload({s(1)})",
            f"    let d0 := mulmod(sub(add(l0, 8380417), l1), {sa}, 8380417)",
            "    l0 := addmod(l0, l1, 8380417)",
            f"    l1 := mload({s(2)})",
            f"    let l3 := mload({s(3)})",
            f"    let d1 := mulmod(sub(add(l1, 8380417), l3), {sb}, 8380417)",
            "    l1 := addmod(l1, l3, 8380417)",
        ]
    return head + [
        f"    l3 := {s2}",
        f"    mstore(",
        f"        {dst},",
        "        or(",
        "            or(addmod(l0, l1, 8380417), shl(64, addmod(d0, d1, 8380417))),",
        "            or(",
        "                shl(128, mulmod(sub(add(l0, 8380417), l1), l3, 8380417)),",
        "                shl(192, mulmod(sub(add(d0, 8380417), d1), l3, 8380417))",
        "            )",
        "        )",
        "    )",
        "}",
    ]


# ---------------------------------------------------------------------------
out = []
out.append(
    f"""// SPDX-License-Identifier: MIT
// Copyright (C) 2026 - ZKNOX
// License: This software is licensed under MIT License
// This Code may be reused including this header, license and copyright notice.
// FILE: ZKNOX_NTT_dilithium_mont.sol
// GENERATED by pythonref/ntt_mont/gen_ntt_mont.py -- do not edit by hand.
//
// Drop-in replacements for nttFw / nttInv of ZKNOX_NTT_dilithium.sol: same
// signature, same in-place semantics on a 256-word array of canonical
// coefficients, same result (asserted differentially in
// test/NTT_dilithium_mont.t.sol). Inside, the polynomial is handled as 64
// words of four 64-bit lanes (coefficient 4w + j in lane j of word w) and the
// eight layers run as three fused passes:
//   forward  A: t = 128, 64, 32 (octets of words i, i+8, ..., i+56), read
//               straight from the expanded input, packed on the fly;
//            B: t = 16, 8, 4 (octets of eight consecutive words);
//            C: t = 2, 1 inside each word, scalars (mulmod), written back
//               expanded and canonical.
//   inverse  C': t = 1, 2 in-word from the expanded input, canonical lanes;
//            B': t = 4, 8, 16, sums never reduced (bias q, 2q, 4q);
//            A': t = 32, 64, 128 (bias 8q, 16q, 32q), n^-1 folded into the
//               last layer, canonicalised, written back expanded.
// Twiddle products of the packed layers are reduced lane-locally with one
// Montgomery step (R = 2^32; twiddles of those layers stored as w * 2^32 mod
// q, so no conversion anywhere):
//   t = ((x mod 2^32) * QINV) mod 2^32,  r = (x + t*q) >> 32,  r < x/2^32 + q < 2q
// six ops and three multiplies per four products, against ten ops for the
// two-step lane Barrett a 23-bit modulus otherwise needs.
//
// Bounds (pythonref/ntt_mont/model_ntt_mont.py asserts them on every step):
//   forward: +2q per packed layer, < 13q before the in-word pass, products
//            < 13q*q < 2^50, (x mod 2^32)*QINV < 2^64, x + t*q < 2^56;
//   inverse: sums double per layer without reduction, < 64q at the folded
//            last layer, difference branch (u + Kq - v) < 2Kq, products
//            < 64q*q < 2^53, r < q + 2^21.
//
// Packed 4x64-bit-lane layout and fused radix-8 passes after
// fireblocks-labs/evm-ml-dsa-verifier (MIT, cca262b); reduction, schedule,
// tables, generator and code are ZKNOX's. See DECISIONS.md.
pragma solidity ^0.8.25;

uint256 constant _QINV = {QINV}; // -q^-1 mod 2^32
uint256 constant _M32 = {hx(rep4(0xFFFFFFFF))};
uint256 constant _L64 = 0xffffffffffffffff;
uint256 constant _Q4_1 = {hx(rep4(q))};
uint256 constant _Q4_2 = {hx(rep4(2 * q))};
uint256 constant _Q4_4 = {hx(rep4(4 * q))};
uint256 constant _Q4_8 = {hx(rep4(8 * q))};
uint256 constant _Q4_16 = {hx(rep4(16 * q))};
uint256 constant _Q4_32 = {hx(rep4(32 * q))};
// canonicalisation of a lane < 2q: bit 23 of (r + 2^23 - q) is set iff r >= q
uint256 constant _C23 = {hx(rep4((1 << 23) - q))};
uint256 constant _H23 = {hx(rep4(1 << 23))};

/// @dev forward twiddles: psirev[1..63] in Montgomery form (packed layers),
///      psirev[64..255] as they are (in-word layers); eight 32-bit fields per word
function _fwTableMont() pure returns (uint256 tb) {{
    uint256[32] memory psirev = [
{table_literal(FWT)}
    ];
    assembly ("memory-safe") {{
        tb := psirev
    }}
}}

/// @dev inverse twiddles, same arrangement
function _invTableMont() pure returns (uint256 tb) {{
    uint256[32] memory psirev = [
{table_literal(INVT)}
    ];
    assembly ("memory-safe") {{
        tb := psirev
    }}
}}

/// @dev both tables in one constant: forward (32 words) then inverse (32 words),
///      copied from code once per verify by _tablesMont(); the inverse table
///      is the forward pointer plus 1,024
bytes constant _TW_MONT = hex"{table_hex(FWT)}{table_hex(INVT)}";

/// @notice One copy of the twiddle tables: (forward pointer, inverse pointer)
function _tablesMont() pure returns (uint256 tb, uint256 ti) {{
    bytes memory t = _TW_MONT;
    assembly ("memory-safe") {{
        tb := add(t, 32)
        ti := add(tb, 1024)
    }}
}}
"""
)

# ---- forward ----------------------------------------------------------------
_QINV = QINV
ldp, stp = packed("p")
out.append(
    f"""
/// @dev Forward pass A: t = 128, 64, 32 on the octets (i, i+8, ..., i+56),
///      read from the expanded array `a` (coefficient 4w+j at word 4w+j) and
///      packed on the fly; twiddles psirev[1..7] as literals. Returns the
///      packed 64-word array.
function _fwPassA(uint256[] memory a) pure returns (uint256[] memory A) {{
    A = new uint256[](64);
    assembly ("memory-safe") {{
        let p := add(a, 32)
        let m32 := _M32
        let d := add(A, 32)
        for {{ let i := 0 }} lt(i, 8) {{ i := add(i, 1) }} {{
{indent(ct_octet(lambda k: ld_expanded(k, 0x400), lambda k, e: (f"mstore(d, {e})" if k == 0 else f"mstore(add(d, {hex(k * 0x100)}), {e})"), fwA), 12)}
            p := add(p, 0x80)
            d := add(d, 0x20)
        }}
    }}
}}

/// @dev Forward pass B: t = 16, 8, 4 on the octet (8b, ..., 8b+7). The seven
///      twiddles of the octet (psirev[8+b], [16+2b], [17+2b], [32+4b..35+4b])
///      are packed once in the scratch word 0x00.
function _fwPassB(uint256[] memory A, uint256 tb) pure {{
    assembly ("memory-safe") {{
        let p := add(A, 32)
        let m32 := _M32
        for {{ let b := 0 }} lt(b, 8) {{ b := add(b, 1) }} {{
{indent(SCRATCH_B.split(chr(10)), 12)}
{indent(ct_octet(lambda k: ldp(k, 0x20), lambda k, e: stp(k, e, 0x20), scratchB), 12)}
            p := add(p, 0x100)
        }}
    }}
}}

/// @dev Forward pass C: t = 2 and t = 1 inside each word (scalars, mulmod),
///      output written expanded and canonical into `a`. Eight words per
///      iteration: psirev[64 + 8i8 ..] in the scratch word, psirev[128 + 16i8 ..]
///      in w1a / w1b.
function _fwPassC(uint256[] memory A, uint256 tb, uint256[] memory a) pure {{
    assembly ("memory-safe") {{
        let p := add(A, 32)
        let dst := add(a, 32)
        let tw0 := add(tb, 256)
        let tw1 := add(tb, 512)
        for {{ let i8 := 0 }} lt(i8, 8) {{ i8 := add(i8, 1) }} {{
            mstore(0, mload(tw0))
            let w1a := mload(tw1)
            let w1b := mload(add(tw1, 32))
{indent(sum((fw_inword(k) for k in range(8)), []), 12)}
            p := add(p, 0x100)
            dst := add(dst, 0x400)
        }}
    }}
}}

/// @dev Same as _fwPassC with the output left LAZY: u + v and u + 2q - v
///      without the final addmod, so every coefficient is < 17q < 2^28 and
///      congruent to the canonical one. Two addmods per coefficient saved.
function _fwPassCLazy(uint256[] memory A, uint256 tb, uint256[] memory a) pure {{
    assembly ("memory-safe") {{
        let p := add(A, 32)
        let dst := add(a, 32)
        let tw0 := add(tb, 256)
        let tw1 := add(tb, 512)
        for {{ let i8 := 0 }} lt(i8, 8) {{ i8 := add(i8, 1) }} {{
            mstore(0, mload(tw0))
            let w1a := mload(tw1)
            let w1b := mload(add(tw1, 32))
{indent(sum((fw_inword(k, lazy=True) for k in range(8)), []), 12)}
            p := add(p, 0x100)
            dst := add(dst, 0x400)
        }}
    }}
}}

/// @notice Forward NTT, in place on `a` (256 canonical coefficients, one per
///         word), same result as nttFw. Returns `a`.
function nttFwMont(uint256[] memory a) pure returns (uint256[] memory) {{
    uint256[] memory A = _fwPassA(a);
    uint256 tb = _fwTableMont();
    _fwPassB(A, tb);
    _fwPassC(A, tb, a);
    return a;
}}

/// @dev Forward pass C, packed variant: the lazy result (lanes < 17q) is
///      written back into the packed word instead of the expanded array.
function _fwPassCPacked(uint256[] memory A, uint256 tb) pure {{
    assembly ("memory-safe") {{
        let p := add(A, 32)
        let tw0 := add(tb, 256)
        let tw1 := add(tb, 512)
        for {{ let i8 := 0 }} lt(i8, 8) {{ i8 := add(i8, 1) }} {{
            mstore(0, mload(tw0))
            let w1a := mload(tw1)
            let w1b := mload(add(tw1, 32))
{indent(sum((fw_inword(k, lazy="packed") for k in range(8)), []), 12)}
            p := add(p, 0x100)
        }}
    }}
}}

/// @dev Forward pass A on an already packed array (canonical lanes), in place.
function _fwPassAPacked(uint256[] memory A) pure {{
    assembly ("memory-safe") {{
        let p := add(A, 32)
        let m32 := _M32
        for {{ let i := 0 }} lt(i, 8) {{ i := add(i, 1) }} {{
{indent(ct_octet(lambda k: ldp(k, 0x100), lambda k, e: stp(k, e, 0x100), fwA), 12)}
            p := add(p, 0x20)
        }}
    }}
}}

/// @notice Forward NTT in place on a PACKED array of canonical lanes (64 words,
///         coefficient 4w + j in lane j of word w), output LAZY (lanes < 17q,
///         congruent to nttFw's). Returns `A`.
function nttFwMontPackedInPlace(uint256[] memory A) pure returns (uint256[] memory) {{
    _fwPassAPacked(A);
    uint256 tb = _fwTableMont();
    _fwPassB(A, tb);
    _fwPassCPacked(A, tb);
    return A;
}}

/// @notice Forward NTT of `a` (256 canonical coefficients, one per word, left
///         untouched) returned PACKED and LAZY: 64 words of four 64-bit lanes,
///         coefficient 4w + j in lane j of word w, each < 17q < 2^28 and
///         congruent to nttFw's. The layout the packed matrix-vector product
///         reads (ZKNOX_dilithium_core_packed.sol).
function nttFwMontPacked(uint256[] memory a) pure returns (uint256[] memory A) {{
    A = _fwPassA(a);
    uint256 tb = _fwTableMont();
    _fwPassB(A, tb);
    _fwPassCPacked(A, tb);
}}

/// @notice Forward NTT with a LAZY output: every coefficient is congruent to
///         nttFw's mod q and < 17q < 2^28, not canonical. For consumers that
///         only feed the result to mulmod / addmod (the matrix-vector product
///         and vecSubMulMod of the verifier), which is exactly what they do.
///         Saves two addmods per coefficient. Returns `a`.
function nttFwMontLazy(uint256[] memory a) pure returns (uint256[] memory) {{
    uint256[] memory A = _fwPassA(a);
    uint256 tb = _fwTableMont();
    _fwPassB(A, tb);
    _fwPassCLazy(A, tb, a);
    return a;
}}
"""
)

# ---- inverse ----------------------------------------------------------------
out.append(
    f"""
/// @dev Inverse pass C': t = 1 and t = 2 inside each word, scalars, read from
///      the expanded array `a`; canonical lanes stored packed. Returns the
///      packed 64-word array.
function _invPassC(uint256[] memory a, uint256 tb) pure returns (uint256[] memory A) {{
    A = new uint256[](64);
    assembly ("memory-safe") {{
        let p := add(a, 32)
        let dst := add(A, 32)
        let tw0 := add(tb, 256)
        let tw1 := add(tb, 512)
        for {{ let i8 := 0 }} lt(i8, 8) {{ i8 := add(i8, 1) }} {{
            mstore(0, mload(tw0))
            let w1a := mload(tw1)
            let w1b := mload(add(tw1, 32))
{indent(sum((inv_inword(k) for k in range(8)), []), 12)}
            p := add(p, 0x400)
            dst := add(dst, 0x100)
        }}
    }}
}}

/// @dev Inverse pass B': t = 4, 8, 16 on the octet (8b, ..., 8b+7), sums never
///      reduced: lanes < q in, < 8q out.
function _invPassB(uint256[] memory A, uint256 tb) pure {{
    assembly ("memory-safe") {{
        let p := add(A, 32)
        let m32 := _M32
        for {{ let b := 0 }} lt(b, 8) {{ b := add(b, 1) }} {{
{indent(SCRATCH_B.split(chr(10)), 12)}
{indent(gs_octet(lambda k: ldp(k, 0x20), lambda k, e: stp(k, e, 0x20), scratchB, (1, 2, 4)), 12)}
            p := add(p, 0x100)
        }}
    }}
}}

/// @dev Inverse pass A': t = 32, 64, 128 on the octets (i, i+8, ..., i+56);
///      n^-1 folded into the last layer (psirev_inv[1] * n^-1 and n^-1 in
///      Montgomery form as literals), outputs canonicalised and written
///      expanded into `a`.
function _invPassA(uint256[] memory A, uint256[] memory a) pure {{
    assembly ("memory-safe") {{
        let p := add(A, 32)
        let m32 := _M32
        let d := add(a, 32)
        for {{ let i := 0 }} lt(i, 8) {{ i := add(i, 1) }} {{
{indent(gs_octet(lambda k: ldp(k, 0x100), st_expanded, invA, (8, 16, 32), last=True), 12)}
            p := add(p, 0x20)
            d := add(d, 0x80)
        }}
    }}
}}

/// @dev Inverse pass C', raw variant: in place on the packed array, whose lanes
///      are matrix-vector accumulator values < q*2^30 (not reduced); the
///      reduction is folded into the scalar t = 1 / t = 2 layers (mulmod and
///      addmod take the raw lanes, the differences get a q*2^30 offset).
function _invPassCRaw(uint256[] memory A, uint256 tb) pure {{
    assembly ("memory-safe") {{
        let dst := add(A, 32)
        let tw0 := add(tb, 256)
        let tw1 := add(tb, 512)
        for {{ let i8 := 0 }} lt(i8, 8) {{ i8 := add(i8, 1) }} {{
            mstore(0, mload(tw0))
            let w1a := mload(tw1)
            let w1b := mload(add(tw1, 32))
{indent(sum((inv_inword(k, raw=True) for k in range(8)), []), 12)}
            dst := add(dst, 0x100)
        }}
    }}
}}

/// @dev Inverse pass A', packed variant: canonical lanes written back packed.
function _invPassAPacked(uint256[] memory A) pure {{
    assembly ("memory-safe") {{
        let p := add(A, 32)
        let m32 := _M32
        for {{ let i := 0 }} lt(i, 8) {{ i := add(i, 1) }} {{
{indent(gs_octet(lambda k: ldp(k, 0x100), lambda k, e: stp(k, e, 0x100), invA, (8, 16, 32), last=True), 12)}
            p := add(p, 0x20)
        }}
    }}
}}

/// @notice Inverse NTT (with the n^-1 scaling) in place on a PACKED array whose
///         lanes are raw matrix-vector accumulator values (each < q*2^30, see
///         ZKNOX_dilithium_core_packed.sol); output lanes canonical (< q).
///         Returns `A`.
function nttInvMontPackedRaw(uint256[] memory A) pure returns (uint256[] memory) {{
    uint256 tb = _invTableMont();
    _invPassCRaw(A, tb);
    _invPassB(A, tb);
    _invPassAPacked(A);
    return A;
}}

/// @notice Inverse NTT (with the n^-1 scaling), in place on `a` (256 canonical
///         coefficients, one per word), same result as nttInv. Returns `a`.
function nttInvMont(uint256[] memory a) pure returns (uint256[] memory) {{
    uint256 tb = _invTableMont();
    uint256[] memory A = _invPassC(a, tb);
    _invPassB(A, tb);
    _invPassA(A, a);
    return a;
}}
"""
)


# running twiddle pointers of the in-word passes: advance them at the end of
# every octet loop that reads them (the radix-8 passes do not)
def _advance_tw(text):
    """insert the pointer advances just before the closing brace of the octet loop
    that contains each `mstore(0, mload(tw0))` (brace-matched from the loop body)"""
    marker = "mstore(0, mload(tw0))"
    pos = 0
    while True:
        i = text.find(marker, pos)
        if i < 0:
            return text
        # walk forward to the closing brace of the enclosing loop body: depth 0 = the
        # loop body level, so the first "}" that brings the depth to -1 closes the loop
        d = 0
        k = i
        while True:
            c = text[k]
            if c == "{":
                d += 1
            elif c == "}":
                if d == 0:
                    break
                d -= 1
            k += 1
        # k points at the loop's closing brace; its line starts after the previous newline
        line_start = text.rfind("\n", 0, k) + 1
        ins = "            tw0 := add(tw0, 32)\n            tw1 := add(tw1, 64)\n"
        text = text[:line_start] + ins + text[line_start:]
        pos = k + len(ins) + 1


out = [_advance_tw(t) for t in out]

# ---------------------------------------------------------------------------
# Merged transforms for the verifier: the three passes in ONE assembly block.
# solc's Yul inliner refuses to inline a function into a caller that is already
# large (FullInliner: call-site size > 45), so with one function per pass only
# the first pass gets inlined into the wrapper and the others run as separate
# Yul functions, whose standalone stack layout costs ~20% more than the same
# code laid out inline (measured: 40k vs 49k per forward transform under
# via-IR). One block, three loops, nothing left to inline.
# ---------------------------------------------------------------------------
def asm_body(fn_name):
    """the inner text of the (single) assembly block of function fn_name"""
    text = "".join(out)
    i = text.index(f"function {fn_name}(")
    j = text.index('assembly ("memory-safe") {', i) + len('assembly ("memory-safe") {')
    d = 1
    k = j
    while d:
        c = text[k]
        if c == "{":
            d += 1
        elif c == "}":
            d -= 1
        k += 1
    return text[j:k - 1]


def no_m32(body):
    return body.replace("let m32 := _M32\n", "").replace("and(t, m32)", "and(t, _M32)").replace("QINV), m32)", "QINV), _M32)").replace("and(s, m32)", "and(s, _M32)").replace("and(w, m32)", "and(w, _M32)").replace("and(v, m32)", "and(v, _M32)").replace("and(V, m32)", "and(V, _M32)").replace("and(W, m32)", "and(W, _M32)")


FW_MERGED = asm_body("_fwPassAPacked") + "\n        }\n        {\n" + asm_body("_fwPassB") + "\n        }\n        {\n" + asm_body("_fwPassCPacked")
INV_MERGED = asm_body("_invPassCRaw") + "\n        }\n        {\n" + asm_body("_invPassB") + "\n        }\n        {\n" + asm_body("_invPassAPacked")

if os.environ.get("NO_M32"):
    FW_MERGED = no_m32(FW_MERGED)
    INV_MERGED = no_m32(INV_MERGED)
    assert "m32" not in FW_MERGED and "m32" not in INV_MERGED

out.append(
    f"""
/// @notice nttFwMontPackedInPlace with the three passes in one assembly
///         block (same code, same result): the form the verifier calls, see
///         the generator on why the split form costs more once compiled next to
///         the rest of the verifier.
function nttFwMontPackedFused(uint256[] memory A) pure returns (uint256[] memory) {{
    uint256 tb = _fwTableMont();
    assembly ("memory-safe") {{
        {{{FW_MERGED}
        }}
    }}
    return A;
}}

/// @notice nttInvMontPackedRaw with the three passes in one assembly block.
function nttInvMontPackedRawFused(uint256[] memory A) pure returns (uint256[] memory) {{
    uint256 tb = _invTableMont();
    assembly ("memory-safe") {{
        {{{INV_MERGED}
        }}
    }}
    return A;
}}
"""
)

out.append(
    f"""
/// @notice nttFwMontPackedFused with the forward table pointer supplied
///         (one table copy per verify, see _tablesMont)
function nttFwMontPackedFusedTb(uint256[] memory A, uint256 tb) pure returns (uint256[] memory) {{
    assembly ("memory-safe") {{
        {{{FW_MERGED}
        }}
    }}
    return A;
}}

/// @notice nttInvMontPackedRawFused with the inverse table pointer supplied
function nttInvMontPackedRawFusedTb(uint256[] memory A, uint256 tb) pure returns (uint256[] memory) {{
    assembly ("memory-safe") {{
        {{{INV_MERGED}
        }}
    }}
    return A;
}}
"""
)

sys.stdout.write("".join(out))
