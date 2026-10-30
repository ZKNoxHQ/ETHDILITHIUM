// Copyright (C) 2026 - ZKNOX
// License: This software is licensed under MIT License
// This Code may be reused including this header, license and copyright notice.
// FILE: ZKNOX_dilithium87_core.sol
// Description: ML-DSA-87 verification stages in their scalar, one-coefficient-
// per-word form: the reference the packed kernels of
// ZKNOX_dilithium87_core_packed.sol are tested against (not used by the
// verifier). Straight transcriptions of FIPS 204 Alg. 21 (HintBitUnpack),
// Alg. 19 (BitUnpack of z) and Alg. 28 (w1Encode) for gamma1 = 2^19,
// omega = 75, k = 8, l = 7; Decompose / UseHint (Alg. 36 / 40) are those of
// ML-DSA-65 (same gamma2 = (q-1)/32, ZKNOX_dilithium65_core.sol).
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {nttFwMont as nttFw, nttInvMont as nttInv} from "./ZKNOX_NTT_dilithium_mont.sol";
import {q, PubKey, expand, bitUnpackAtOffset, vecSubMulMod} from "./ZKNOX_dilithium_utils.sol";
import {K87, L87, OMEGA87, GAMMA1_87, GAMMA1_87_MINUS_BETA} from "./ZKNOX_dilithium87_utils.sol";
import {useHint65} from "./ZKNOX_dilithium65_core.sol";

/// @notice HintBitUnpack (FIPS 204 Alg. 21), k = 8, omega = 75: 83 bytes.
function unpackH87(bytes memory hBytes) pure returns (bool success, uint256[][] memory h) {
    h = new uint256[][](K87);
    for (uint256 i = 0; i < K87; i++) {
        h[i] = new uint256[](256);
    }
    if (hBytes.length != OMEGA87 + K87) return (false, h);
    uint256 kIdx = 0;
    for (uint256 i = 0; i < K87; i++) {
        uint256 omegaVal = uint8(hBytes[OMEGA87 + i]);
        if (omegaVal < kIdx || omegaVal > OMEGA87) return (false, h);
        for (uint256 j = kIdx; j < omegaVal; j++) {
            if (j > kIdx && uint8(hBytes[j]) <= uint8(hBytes[j - 1])) return (false, h);
            h[i][uint8(hBytes[j])] = 1;
        }
        kIdx = omegaVal;
    }
    for (uint256 j = kIdx; j < OMEGA87; j++) {
        if (uint8(hBytes[j]) != 0) return (false, h);
    }
    return (true, h);
}

/// @notice z_i = gamma1 - BitUnpack(z bytes, 20 bits) mod q, seven polynomials
///         (FIPS 204 Alg. 8 / 19); canonical coefficients.
function unpackZ87(bytes memory zBytes) pure returns (uint256[][] memory z) {
    require(zBytes.length >= (L87 * 256 * 20) >> 3, "Insufficient data");
    z = new uint256[][](L87);
    uint256 bitOffset = 0;
    for (uint256 i = 0; i < L87; i++) {
        uint256[] memory f = bitUnpackAtOffset(zBytes, 20, bitOffset, 256);
        uint256[] memory coeffs = new uint256[](256);
        for (uint256 j = 0; j < 256; j++) {
            coeffs[j] = f[j] <= GAMMA1_87 ? GAMMA1_87 - f[j] : q + GAMMA1_87 - f[j];
        }
        z[i] = coeffs;
        bitOffset += 256 * 20;
    }
}

/// @notice ||z||inf < gamma1 - beta on canonical coefficients (FIPS 204 Alg. 3 step 11).
function zNormOk87(uint256[][] memory z) pure returns (bool) {
    for (uint256 i = 0; i < z.length; i++) {
        for (uint256 j = 0; j < 256; j++) {
            uint256 v = z[i][j];
            uint256 a = v > (q - 1) / 2 ? q - v : v; // |centered value|
            if (a >= GAMMA1_87_MINUS_BETA) return false;
        }
    }
    return true;
}

/// @notice w1Encode(UseHint(h, r)) (FIPS 204 Alg. 28), eight polynomials of
///         4-bit coefficients, little-endian bit packing: 1024 bytes.
function useHintDilithium87(uint256[][] memory h, uint256[][] memory r) pure returns (bytes memory w1) {
    w1 = new bytes(1024);
    for (uint256 i = 0; i < K87; i++) {
        for (uint256 j = 0; j < 256; j += 2) {
            uint256 lo = useHint65(h[i][j], r[i][j]);
            uint256 hi = useHint65(h[i][j + 1], r[i][j + 1]);
            // forge-lint: disable-next-line(unsafe-typecast)
            w1[128 * i + (j >> 1)] = bytes1(uint8(lo | (hi << 4))); // lo, hi < 16
        }
    }
}

/// @notice Scalar second stage: w1 bytes of UseHint(h, A.z - c.t1) for the
///         challenge hash. Same output as dilithiumCore2Packed87 and
///         dilithiumCore2Calldata87 (asserted in test/dilithium87_core_packed.t.sol).
/// @param pk A (8 x 7) and t1 (8) in their stored compact form (NTT domain)
/// @param z 7 polynomials, canonical coefficients (unpackZ87); transformed IN PLACE
/// @param cNtt NTT(c), 256 canonical coefficients
/// @param h hints from unpackH87
function dilithiumCore2_87(PubKey memory pk, uint256[][] memory z, uint256[] memory cNtt, uint256[][] memory h)
    pure
    returns (bytes memory wPrimeBytes)
{
    for (uint256 j = 0; j < L87; j++) {
        z[j] = nttFw(z[j]);
    }
    uint256[][] memory w = new uint256[][](K87);
    for (uint256 i = 0; i < K87; i++) {
        uint256[] memory acc = new uint256[](256);
        for (uint256 j = 0; j < L87; j++) {
            uint256[] memory aij = expand(pk.aHat[i][j]);
            for (uint256 m = 0; m < 256; m++) {
                acc[m] = addmod(acc[m], mulmod(aij[m], z[j][m], q), q);
            }
        }
        w[i] = nttInv(vecSubMulMod(acc, expand(pk.t1[i]), cNtt));
    }
    wPrimeBytes = useHintDilithium87(h, w);
}
