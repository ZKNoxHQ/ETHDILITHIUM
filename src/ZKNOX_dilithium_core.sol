/**
 *
 */
/*ZZZZZZZZZZZZZZZZZZZKKKKKKKKK    KKKKKKKNNNNNNNN        NNNNNNNN     OOOOOOOOO     XXXXXXX       XXXXXXX                         ..../&@&#.       .###%@@@#, ..
/*Z:::::::::::::::::ZK:::::::K    K:::::KN:::::::N       N::::::N   OO:::::::::OO   X:::::X       X:::::X                      ...(@@* .... .           &#//%@@&,.
/*Z:::::::::::::::::ZK:::::::K    K:::::KN::::::::N      N::::::N OO:::::::::::::OO X:::::X       X:::::X                    ..*@@.........              .@#%%(%&@&..
/*Z:::ZZZZZZZZ:::::Z K:::::::K   K::::::KN:::::::::N     N::::::NO:::::::OOO:::::::OX::::::X     X::::::X                   .*@( ........ .  .&@@@@.      .@%%%%%#&@@.
/*ZZZZZ     Z:::::Z  KK::::::K  K:::::KKKN::::::::::N    N::::::NO::::::O   O::::::OXXX:::::X   X::::::XX                ...&@ ......... .  &.     .@      /@%%%%%%&@@#
/*        Z:::::Z      K:::::K K:::::K   N:::::::::::N   N::::::NO:::::O     O:::::O   X:::::X X:::::X                   ..@( .......... .  &.     ,&      /@%%%%&&&&@@@.
/*       Z:::::Z       K::::::K:::::K    N:::::::N::::N  N::::::NO:::::O     O:::::O    X:::::X:::::X                   ..&% ...........     .@%(#@#      ,@%%%%&&&&&@@@%.
/*      Z:::::Z        K:::::::::::K     N::::::N N::::N N::::::NO:::::O     O:::::O     X:::::::::X                   ..,@ ............                 *@%%%&%&&&&&&@@@.
/*     Z:::::Z         K:::::::::::K     N::::::N  N::::N:::::::NO:::::O     O:::::O     X:::::::::X                  ..(@ .............             ,#@&&&&&&&&&&&&@@@@*
/*    Z:::::Z          K::::::K:::::K    N::::::N   N:::::::::::NO:::::O     O:::::O    X:::::X:::::X                   .*@..............  . ..,(%&@@&&&&&&&&&&&&&&&&@@@@,
/*   Z:::::Z           K:::::K K:::::K   N::::::N    N::::::::::NO:::::O     O:::::O   X:::::X X:::::X                 ...&#............. *@@&&&&&&&&&&&&&&&&&&&&@@&@@@@&
/*ZZZ:::::Z     ZZZZZKK::::::K  K:::::KKKN::::::N     N:::::::::NO::::::O   O::::::OXXX:::::X   X::::::XX               ...@/.......... *@@@@. ,@@.  &@&&&&&&@@@@@@@@@@@.
/*Z::::::ZZZZZZZZ:::ZK:::::::K   K::::::KN::::::N      N::::::::NO:::::::OOO:::::::OX::::::X     X::::::X               ....&#..........@@@, *@@&&&@% .@@@@@@@@@@@@@@@&
/*Z:::::::::::::::::ZK:::::::K    K:::::KN::::::N       N:::::::N OO:::::::::::::OO X:::::X       X:::::X                ....*@.,......,@@@...@@@@@@&..%@@@@@@@@@@@@@/
/*Z:::::::::::::::::ZK:::::::K    K:::::KN::::::N        N::::::N   OO:::::::::OO   X:::::X       X:::::X                   ...*@,,.....%@@@,.........%@@@@@@@@@@@@(
/*ZZZZZZZZZZZZZZZZZZZKKKKKKKKK    KKKKKKKNNNNNNNN         NNNNNNN     OOOOOOOOO     XXXXXXX       XXXXXXX                      ...&@,....*@@@@@ ..,@@@@@@@@@@@@@&.
/*                                                                                                                                   ....,(&@@&..,,,/@&#*. .
/*                                                                                                                                    ......(&.,.,,/&@,.
/*                                                                                                                                      .....,%*.,*@%
/*                                                                                                                                    .#@@@&(&@*,,*@@%,..
/*                                                                                                                                    .##,,,**$.,,*@@@@@%.
/*                                                                                                                                     *(%%&&@(,,**@@@@@&
/*                                                                                                                                      . .  .#@((@@(*,**
/*                                                                                                                                             . (*. .
/*                                                                                                                                              .*/
///* Copyright (C) 2025 - Renaud Dubois, Simon Masson - This file is part of ZKNOX project
///* License: This software is licensed under MIT License
///* This Code may be reused including this header, license and copyright notice.
///* See LICENSE file at the root folder of the project.
///* FILE: ZKNOX_dilithium_core.sol
///* Description: Compute ethereum friendly version of dilithium verification
/**
 *
 */
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./ZKNOX_NTT_dilithium.sol";
import "./ZKNOX_shake.sol";
import {
    q,
    ZKNOX_Expand_Mat,
    ZKNOX_MatVecProductDilithium,
    ZKNOX_VECMULMOD,
    ZKNOX_VECSUBMOD,
    bitUnpackAtOffset,
    omega,
    k,
    l,
    n,
    gamma_1
} from "./ZKNOX_dilithium_utils.sol";
import {useHintDilithium} from "./ZKNOX_hint.sol";

function unpack_h(bytes memory hBytes) pure returns (bool success, uint256[][] memory h) {
    require(hBytes.length >= omega + k, "Invalid h bytes length");

    uint256 k_idx = 0;

    h = new uint256[][](k);
    for (uint256 i = 0; i < k; i++) {
        h[i] = new uint256[](n);
        for (uint256 j = 0; j < n; j++) {
            h[i][j] = 0;
        }

        uint256 omegaVal = uint8(hBytes[omega + i]);

        // Check bound on omegaVal
        if (omegaVal < k_idx || omegaVal > omega) {
            return (false, h);
        }

        for (uint256 j = k_idx; j < omegaVal; j++) {
            // Coefficients must be in strictly increasing order
            if (j > k_idx && uint8(hBytes[j]) <= uint8(hBytes[j - 1])) {
                return (false, h);
            }

            // Coefficients must be < n
            uint256 index = uint8(hBytes[j]);
            if (index >= n) {
                return (false, h);
            }

            h[i][index] = 1;
        }

        k_idx = omegaVal;
    }

    // Check extra indices are zero
    for (uint256 j = k_idx; j < omega; j++) {
        if (uint8(hBytes[j]) != 0) {
            return (false, h);
        }
    }

    return (true, h);
}

function unpack_z(bytes memory inputBytes) pure returns (uint256[][] memory coefficients) {
    uint256 coeffBits;
    uint256 requiredBytes;

    // Cache gamma_1 to avoid multiple SLOAD operations if it's a state variable
    uint256 _gamma_1 = gamma_1;

    // Use unchecked arithmetic where overflow is impossible
    unchecked {
        // Level 2 parameter set
        if (_gamma_1 == 131072) {
            // 1 << 17, use literal to save gas
            coeffBits = 18;
            requiredBytes = (n * l * 18) >> 3; // Use bit shift instead of division
        }
        // Level 3 and 5 parameter set
        else if (_gamma_1 == 524288) {
            // 1 << 19, use literal to save gas
            coeffBits = 20;
            requiredBytes = (n * l * 20) >> 3; // Use bit shift instead of division
        } else {
            revert("gamma_1 must be either 2^17 or 2^19");
        }
    }

    require(inputBytes.length >= requiredBytes, "Insufficient data");

    // Cache frequently used values
    uint256 _l = l;
    uint256 _n = n;
    uint256 _q = q;

    // Initialize 2D array
    coefficients = new uint256[][](_l);
    uint256 bitOffset = 0;

    unchecked {
        for (uint256 i = 0; i < _l; ++i) {
            // Unpack the altered coefficients for polynomial i
            uint256[] memory alteredCoeffs = bitUnpackAtOffset(inputBytes, coeffBits, bitOffset, _n);

            // Allocate array once
            uint256[] memory coeffs = new uint256[](_n);

            // Compute coefficients as gamma_1 - c
            for (uint256 j = 0; j < _n; ++j) {
                uint256 alteredCoeff = alteredCoeffs[j];

                // Simplified logic: use ternary operator and eliminate redundant check
                coeffs[j] = alteredCoeff < _gamma_1 ? _gamma_1 - alteredCoeff : _q + _gamma_1 - alteredCoeff;
            }

            coefficients[i] = coeffs;

            // Move to next polynomial
            bitOffset += _n * coeffBits;
        }
    }

    return coefficients;
}

function dilithium_core_1(Signature memory signature)
    pure
    returns (bool foo, uint256 norm_h, uint256[][] memory h, uint256[][] memory z)
{
    (foo, h) = unpack_h(signature.h);
    uint256 i;
    uint256 j;
    norm_h = 0;
    for (i = 0; i < 4; i++) {
        for (j = 0; j < 256; j++) {
            if (h[i][j] == 1) {
                norm_h += 1;
            }
            // else { /* check that h[i][j] == 0 ? */}
        }
    }

    z = unpack_z(signature.z);
}

function dilithium_core_2(
    PubKey memory pk,
    uint256[][] memory z,
    uint256[] memory c_ntt,
    uint256[][] memory h,
    uint256[][] memory t1_new
) pure returns (bytes memory w_prime_bytes) {
    // NTT(z)
    for (uint256 i = 0; i < 4; i++) {
        z[i] = ZKNOX_NTTFW(z[i]);
    }

    // 1. A*z
    uint256[][][] memory aHat = ZKNOX_Expand_Mat(pk.a_hat);
    z = ZKNOX_MatVecProductDilithium(aHat, z); // A * z

    // 2. A*z - c*t1
    for (uint256 i = 0; i < 4; i++) {
        z[i] = ZKNOX_NTTINV(ZKNOX_VECSUBMOD(z[i], ZKNOX_VECMULMOD(t1_new[i], c_ntt)));
    }

    // 3. w_prime packed using a "solidity-friendly encoding"
    w_prime_bytes = useHintDilithium(h, z);
}
