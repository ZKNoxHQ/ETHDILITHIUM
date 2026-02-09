// Copyright (C) 2026 - ZKNOX
// License: This software is licensed under MIT License
// This Code may be reused including this header, license and copyright notice.
// FILE: ZKNOX_dilithium_core.sol
// Description: Core algorithm of Dilithium
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {nttFw, nttInv} from "./ZKNOX_NTT_dilithium.sol";
import {PubKey, Signature} from "./ZKNOX_dilithium_utils.sol";
import {
    q,
    expandMat,
    matVecProductDilithium,
    vecMulMod,
    vecSubMod,
    bitUnpackAtOffset,
    OMEGA,
    k,
    l,
    n,
    GAMMA_1
} from "./ZKNOX_dilithium_utils.sol";
import {useHintDilithium} from "./ZKNOX_hint.sol";

/**
 * @notice Unpacks the hint vector h from its compressed byte representation
 * @dev Parses the sparse representation of h according to Dilithium specification.
 *      Each row is reconstructed using index offsets stored in hBytes.
 *      Performs strict validity checks on ordering and bounds.
 *      Uses unchecked arithmetic for gas optimization.
 * @param hBytes Encoded hint vector bytes
 * @return success True if decoding succeeded and format is valid
 * @return h Decoded k×n binary hint matrix
 */
function unpackH(bytes memory hBytes) pure returns (bool success, uint256[][] memory h) {
    require(hBytes.length >= OMEGA + k, "Invalid h bytes length");

    uint256 kIdx = 0;

    h = new uint256[][](k);
    unchecked {
        for (uint256 i = 0; i < k; i++) {
            h[i] = new uint256[](n);
            // REMOVED: redundant zero-init loop - new uint256[](n) is already zeroed

            uint256 omegaVal = uint8(hBytes[OMEGA + i]);

            if (omegaVal < kIdx || omegaVal > OMEGA) {
                return (false, h);
            }

            for (uint256 j = kIdx; j < omegaVal; j++) {
                if (j > kIdx && uint8(hBytes[j]) <= uint8(hBytes[j - 1])) {
                    return (false, h);
                }

                uint256 index = uint8(hBytes[j]);
                if (index >= n) {
                    return (false, h);
                }

                h[i][index] = 1;
            }

            kIdx = omegaVal;
        }

        for (uint256 j = kIdx; j < OMEGA; j++) {
            if (uint8(hBytes[j]) != 0) {
                return (false, h);
            }
        }
    }

    return (true, h);
}

/**
 * @notice Unpacks the response vector z from bit-packed representation
 * @dev Decodes l polynomials of length n from compressed input.
 *      Bit-width depends on GAMMA_1 parameter (18 or 20 bits).
 *      Reconstructs centered coefficients modulo q.
 * @param inputBytes Bit-packed input containing z coefficients
 * @return coefficients Decoded l×n polynomial vector
 */
function unpackZ(bytes memory inputBytes) pure returns (uint256[][] memory coefficients) {
    uint256 coeffBits;
    uint256 requiredBytes;

    uint256 _gamma1 = GAMMA_1;

    unchecked {
        if (_gamma1 == 131072) {
            coeffBits = 18;
            requiredBytes = (n * l * 18) >> 3;
        } else if (_gamma1 == 524288) {
            coeffBits = 20;
            requiredBytes = (n * l * 20) >> 3;
        } else {
            revert("GAMMA_1 must be either 2^17 or 2^19");
        }
    }

    require(inputBytes.length >= requiredBytes, "Insufficient data");

    uint256 _l = l;
    uint256 _n = n;
    uint256 _q = q;

    coefficients = new uint256[][](_l);
    uint256 bitOffset = 0;

    unchecked {
        for (uint256 i = 0; i < _l; ++i) {
            uint256[] memory alteredCoeffs = bitUnpackAtOffset(inputBytes, coeffBits, bitOffset, _n);
            uint256[] memory coeffs = new uint256[](_n);

            for (uint256 j = 0; j < _n; ++j) {
                uint256 alteredCoeff = alteredCoeffs[j];
                coeffs[j] = alteredCoeff < _gamma1 ? _gamma1 - alteredCoeff : _q + _gamma1 - alteredCoeff;
            }

            coefficients[i] = coeffs;
            bitOffset += _n * coeffBits;
        }
    }

    return coefficients;
}

/**
 * @notice Performs first stage of Dilithium verification
 * @dev Decodes hint vector h and response vector z from signature.
 *      Computes the Hamming weight (norm) of h using optimized assembly.
 *      Assembly avoids nested array dereferencing to reduce gas.
 * @param signature Dilithium signature structure
 * @return foo True if h decoding succeeded
 * @return normH Number of non-zero entries in h
 * @return h Decoded hint matrix
 * @return z Decoded response vector
 */
function dilithiumCore1(Signature memory signature)
    pure
    returns (bool foo, uint256 normH, uint256[][] memory h, uint256[][] memory z)
{
    (foo, h) = unpackH(signature.h);

    normH = 0;
    // Assembly: walk the h arrays directly in memory
    assembly {
        for { let i := 0 } lt(i, 4) { i := add(i, 1) } {
            // h is at memory location: h_ptr -> [length][ptr0][ptr1][ptr2][ptr3]
            // h[i] is a pointer to a uint256[] of length 256
            let hi_ptr := mload(add(add(h, 32), mul(i, 32))) // h[i] pointer
            let data_ptr := add(hi_ptr, 32) // skip length prefix
            for { let j := 0 } lt(j, 256) { j := add(j, 1) } {
                normH := add(normH, eq(mload(add(data_ptr, mul(j, 32))), 1))
            }
        }
    }

    z = unpackZ(signature.z);
}

/**
 * @notice Performs second stage of Dilithium verification
 * @dev Computes w' = A*z - c*t1 and applies hint correction.
 *      Steps:
 *      1. Applies forward NTT to z
 *      2. Computes matrix-vector product A*z
 *      3. Subtracts challenge-scaled public key component
 *      4. Applies inverse NTT
 *      5. Packs corrected result using hint vector
 * @param pk Public key containing expanded matrix seed
 * @param z Response vector in coefficient form
 * @param cNtt Challenge polynomial in NTT domain
 * @param h Hint matrix
 * @param t1New Adjusted public key vector
 * @return wPrimeBytes Packed w' bytes for challenge recomputation
 */
function dilithiumCore2(
    PubKey memory pk,
    uint256[][] memory z,
    uint256[] memory cNtt,
    uint256[][] memory h,
    uint256[][] memory t1New
) pure returns (bytes memory wPrimeBytes) {
    // NTT(z)
    for (uint256 i = 0; i < 4; i++) {
        z[i] = nttFw(z[i]);
    }

    // 1. A*z
    uint256[][][] memory aHat = expandMat(pk.aHat);
    z = matVecProductDilithium(aHat, z);

    // 2. A*z - c*t1
    for (uint256 i = 0; i < 4; i++) {
        z[i] = nttInv(vecSubMod(z[i], vecMulMod(t1New[i], cNtt)));
    }

    // 3. w_prime packed
    wPrimeBytes = useHintDilithium(h, z);
}
