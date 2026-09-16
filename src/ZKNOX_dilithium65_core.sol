// Copyright (C) 2026 - ZKNOX
// License: This software is licensed under MIT License
// This Code may be reused including this header, license and copyright notice.
// FILE: ZKNOX_dilithium65_core.sol
// Description: ML-DSA-65 verification stages in their scalar, one-coefficient-
// per-word form: the reference the packed kernels of
// ZKNOX_dilithium65_core_packed.sol are tested against (not used by the
// verifier). Straight transcriptions of FIPS 204 Alg. 21 (HintBitUnpack),
// Alg. 19 (BitUnpack of z), Alg. 36 (Decompose), Alg. 40 (UseHint) and
// Alg. 28 (w1Encode) for gamma1 = 2^19, gamma2 = (q-1)/32, omega = 55, k = 6, l = 5.
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {nttFwMont as nttFw, nttInvMont as nttInv} from "./ZKNOX_NTT_dilithium_mont.sol";
import {q, PubKey, expand, bitUnpackAtOffset, vecSubMulMod} from "./ZKNOX_dilithium_utils.sol";
import {K65, L65, OMEGA65, GAMMA1_65, GAMMA1_65_MINUS_BETA, GAMMA2_65} from "./ZKNOX_dilithium65_utils.sol";

int256 constant _2_GAMMA_2_65 = 523776; // 2 * gamma2
int256 constant _M65 = 16; // (q - 1) / (2 gamma2)

/// @notice HintBitUnpack (FIPS 204 Alg. 21), k = 6, omega = 55: 61 bytes.
function unpackH65(bytes memory hBytes) pure returns (bool success, uint256[][] memory h) {
    h = new uint256[][](K65);
    for (uint256 i = 0; i < K65; i++) {
        h[i] = new uint256[](256);
    }
    if (hBytes.length != OMEGA65 + K65) return (false, h);
    uint256 kIdx = 0;
    for (uint256 i = 0; i < K65; i++) {
        uint256 omegaVal = uint8(hBytes[OMEGA65 + i]);
        if (omegaVal < kIdx || omegaVal > OMEGA65) return (false, h);
        for (uint256 j = kIdx; j < omegaVal; j++) {
            if (j > kIdx && uint8(hBytes[j]) <= uint8(hBytes[j - 1])) return (false, h);
            h[i][uint8(hBytes[j])] = 1;
        }
        kIdx = omegaVal;
    }
    for (uint256 j = kIdx; j < OMEGA65; j++) {
        if (uint8(hBytes[j]) != 0) return (false, h);
    }
    return (true, h);
}

/// @notice z_i = gamma1 - BitUnpack(z bytes, 20 bits) mod q, five polynomials
///         (FIPS 204 Alg. 8 / 19); canonical coefficients.
function unpackZ65(bytes memory zBytes) pure returns (uint256[][] memory z) {
    require(zBytes.length >= (L65 * 256 * 20) >> 3, "Insufficient data");
    z = new uint256[][](L65);
    uint256 bitOffset = 0;
    for (uint256 i = 0; i < L65; i++) {
        uint256[] memory f = bitUnpackAtOffset(zBytes, 20, bitOffset, 256);
        uint256[] memory coeffs = new uint256[](256);
        for (uint256 j = 0; j < 256; j++) {
            coeffs[j] = f[j] <= GAMMA1_65 ? GAMMA1_65 - f[j] : q + GAMMA1_65 - f[j];
        }
        z[i] = coeffs;
        bitOffset += 256 * 20;
    }
}

/// @notice ||z||inf < gamma1 - beta on canonical coefficients (FIPS 204 Alg. 3 step 11).
function zNormOk65(uint256[][] memory z) pure returns (bool) {
    for (uint256 i = 0; i < z.length; i++) {
        for (uint256 j = 0; j < 256; j++) {
            uint256 v = z[i][j];
            uint256 a = v > (q - 1) / 2 ? q - v : v; // |centered value|
            if (a >= GAMMA1_65_MINUS_BETA) return false;
        }
    }
    return true;
}

/// @notice Decompose (FIPS 204 Alg. 36) for gamma2 = (q-1)/32.
function decompose65(uint256 r) pure returns (int256 r1, int256 r0) {
    // forge-lint: disable-next-line(unsafe-typecast)
    int256 rp = int256(r % q);
    r0 = rp % _2_GAMMA_2_65;
    if (r0 > _2_GAMMA_2_65 / 2) r0 -= _2_GAMMA_2_65;
    if (rp - r0 == 8380416) {
        r1 = 0;
        r0 = r0 - 1;
    } else {
        r1 = (rp - r0) / _2_GAMMA_2_65;
    }
}

/// @notice UseHint (FIPS 204 Alg. 40) for gamma2 = (q-1)/32: values in [0, 16).
function useHint65(uint256 h, uint256 r) pure returns (uint256) {
    (int256 r1, int256 r0) = decompose65(r);
    if (h == 1) {
        // forge-lint: disable-next-line(unsafe-typecast)
        if (r0 > 0) return uint256((r1 + 1) % _M65);
        // forge-lint: disable-next-line(unsafe-typecast)
        return uint256((r1 + _M65 - 1) % _M65);
    }
    // forge-lint: disable-next-line(unsafe-typecast)
    return uint256(r1);
}

/// @notice w1Encode(UseHint(h, r)) (FIPS 204 Alg. 28), six polynomials of
///         4-bit coefficients, little-endian bit packing: 768 bytes.
function useHintDilithium65(uint256[][] memory h, uint256[][] memory r) pure returns (bytes memory w1) {
    w1 = new bytes(768);
    for (uint256 i = 0; i < K65; i++) {
        for (uint256 j = 0; j < 256; j += 2) {
            uint256 lo = useHint65(h[i][j], r[i][j]);
            uint256 hi = useHint65(h[i][j + 1], r[i][j + 1]);
            w1[128 * i + (j >> 1)] = bytes1(uint8(lo | (hi << 4)));
        }
    }
}

/// @notice Scalar second stage: w1 bytes of UseHint(h, A.z - c.t1) for the
///         challenge hash. Same output as dilithiumCore2Packed65 (asserted in
///         test/dilithium65_core_packed.t.sol).
/// @param pk A (6 x 5) and t1 (6) in their stored compact form (NTT domain)
/// @param z 5 polynomials, canonical coefficients (unpackZ65); transformed IN PLACE
/// @param cNtt NTT(c), 256 canonical coefficients
/// @param h hints from unpackH65
function dilithiumCore2_65(PubKey memory pk, uint256[][] memory z, uint256[] memory cNtt, uint256[][] memory h)
    pure
    returns (bytes memory wPrimeBytes)
{
    for (uint256 j = 0; j < L65; j++) {
        z[j] = nttFw(z[j]);
    }
    uint256[][] memory w = new uint256[][](K65);
    for (uint256 i = 0; i < K65; i++) {
        uint256[] memory acc = new uint256[](256);
        for (uint256 j = 0; j < L65; j++) {
            uint256[] memory aij = expand(pk.aHat[i][j]);
            for (uint256 m = 0; m < 256; m++) {
                acc[m] = addmod(acc[m], mulmod(aij[m], z[j][m], q), q);
            }
        }
        w[i] = nttInv(vecSubMulMod(acc, expand(pk.t1[i]), cNtt));
    }
    wPrimeBytes = useHintDilithium65(h, w);
}
