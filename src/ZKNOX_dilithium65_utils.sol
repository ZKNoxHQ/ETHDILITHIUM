// Copyright (C) 2026 - ZKNOX
// License: This software is licensed under MIT License
// This Code may be reused including this header, license and copyright notice.
// FILE: ZKNOX_dilithium65_utils.sol
// Description: ML-DSA-65 (FIPS 204, security category 3) parameters and sizes
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

// The ring (n, q), the NTT, the packed 4x64-bit-lane layout and the public key
// blob format are those of ML-DSA-44 (ZKNOX_dilithium_utils.sol,
// ZKNOX_NTT_dilithium_mont.sol): only the parameter set differs.
//
//   ML-DSA-44            ML-DSA-65
//   (k, l) = (4, 4)      (6, 5)
//   eta = 2              4
//   tau = 39             49
//   beta = 78            196
//   gamma1 = 2^17        2^19           (z coefficients: 18 -> 20 bits)
//   gamma2 = (q-1)/88    (q-1)/32       (w1 coefficients: 6 -> 4 bits)
//   omega = 80           55
//   lambda = 128         192            (c~: 32 -> 48 bytes)
//   pk 1312 bytes        1952 bytes
//   sig 2420 bytes       3309 bytes     (c~ 48 || z 3200 || h 61)

uint256 constant K65 = 6;
uint256 constant L65 = 5;
uint256 constant ETA65 = 4;
uint256 constant TAU65 = 49;
uint256 constant BETA65 = 196; // tau * eta
uint256 constant GAMMA1_65 = 524288; // 2^19
uint256 constant GAMMA1_65_MINUS_BETA = 524092;
uint256 constant GAMMA2_65 = 261888; // (q-1)/32
uint256 constant OMEGA65 = 55;
uint256 constant LAMBDA65 = 192;

uint256 constant CTILDE65_BYTES = 48; // lambda / 4
uint256 constant Z65_BITS = 20; // bitlen(gamma1 - 1) + 1
uint256 constant Z65_BYTES = 3200; // l * 256 * 20 / 8
uint256 constant H65_BYTES = 61; // omega + k
uint256 constant SIG65_BYTES = 3309; // 48 + 3200 + 61
uint256 constant PK65_BYTES = 1952; // 32 + k * 320
uint256 constant W1_65_BYTES = 768; // k * 256 * 4 / 8

// offsets of the three fields inside the signature
uint256 constant SIG65_Z_OFFSET = 48;
uint256 constant SIG65_H_OFFSET = 3248;
