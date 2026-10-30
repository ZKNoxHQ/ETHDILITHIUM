// Copyright (C) 2026 - ZKNOX
// License: This software is licensed under MIT License
// This Code may be reused including this header, license and copyright notice.
// FILE: ZKNOX_dilithium87_utils.sol
// Description: ML-DSA-87 (FIPS 204, security category 5) parameters and sizes
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

// The ring (n, q), the NTT, the packed 4x64-bit-lane layout and the flat key
// format are those of ML-DSA-44 / ML-DSA-65; gamma1 and gamma2 are those of
// ML-DSA-65, so the z decoding (20-bit fields), Decompose / UseHint and the
// 4-bit w1Encode are shared with it. Only the dimensions, tau, beta, omega and
// lambda change.
//
//   ML-DSA-65            ML-DSA-87
//   (k, l) = (6, 5)      (8, 7)
//   eta = 4              2
//   tau = 49             60
//   beta = 196           120
//   gamma1 = 2^19        2^19
//   gamma2 = (q-1)/32    (q-1)/32
//   omega = 55           75
//   lambda = 192         256            (c~: 48 -> 64 bytes)
//   pk 1952 bytes        2592 bytes
//   sig 3309 bytes       4627 bytes     (c~ 64 || z 4480 || h 83)

uint256 constant K87 = 8;
uint256 constant L87 = 7;
uint256 constant ETA87 = 2;
uint256 constant TAU87 = 60;
uint256 constant BETA87 = 120; // tau * eta
uint256 constant GAMMA1_87 = 524288; // 2^19
uint256 constant GAMMA1_87_MINUS_BETA = 524168;
uint256 constant GAMMA2_87 = 261888; // (q-1)/32
uint256 constant OMEGA87 = 75;
uint256 constant LAMBDA87 = 256;

uint256 constant CTILDE87_BYTES = 64; // lambda / 4
uint256 constant Z87_BITS = 20; // bitlen(gamma1 - 1) + 1
uint256 constant Z87_BYTES = 4480; // l * 256 * 20 / 8
uint256 constant H87_BYTES = 83; // omega + k
uint256 constant SIG87_BYTES = 4627; // 64 + 4480 + 83
uint256 constant PK87_BYTES = 2592; // 32 + k * 320
uint256 constant W1_87_BYTES = 1024; // k * 256 * 4 / 8

// offsets of the three fields inside the signature
uint256 constant SIG87_Z_OFFSET = 64;
uint256 constant SIG87_H_OFFSET = 4544;
