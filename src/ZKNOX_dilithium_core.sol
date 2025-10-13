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

import {console} from "forge-std/Test.sol";

import {ZKNOX_NTT} from "./ZKNOX_NTT.sol";
import "./ZKNOX_NTT_dilithium.sol";

import "./ZKNOX_shake.sol";
import {
    q,
    ZKNOX_Expand,
    ZKNOX_Expand_Vec,
    ZKNOX_Expand_Mat,
    ZKNOX_MatVecProductDilithium,
    ZKNOX_VECMULMOD,
    ZKNOX_VECSUBMOD,
    omega,
    k,
    n
} from "./ZKNOX_dilithium_utils.sol";
import {useHintDilithium} from "./ZKNOX_hint.sol";

function unpack_h(bytes memory hBytes) pure returns (bool success, uint256[][] memory h) {
    require(hBytes.length >= omega + k, "Invalid h bytes length");

    h = new uint256[][](k); // outer array length k
    for (uint256 i = 0; i < k; i++) {
        h[i] = new uint256[](n); // inner array length n
    }
    uint256 k_idx = 0;

    for (uint256 i = 0; i < k; i++) {
        // Initialize h[i] coefficients to 0
        for (uint256 j = 0; j < n; j++) {
            h[i][j] = 0;
        }

        // Read the position indicator for this polynomial
        uint256 omegaVal = uint8(hBytes[omega + i]);

        // Check bounds for strong unforgeability
        if (omegaVal < k_idx || omegaVal > omega) {
            return (false, h);
        }

        // Set hint bits based on the indices
        for (uint256 j = k_idx; j < omegaVal; j++) {
            // Check ordering for strong unforgeability
            // Coefficients must be in strictly increasing order
            if (j > k_idx && uint8(hBytes[j]) <= uint8(hBytes[j - 1])) {
                return (false, h);
            }

            // Get the coefficient index and validate it
            uint256 coeffIdx = uint8(hBytes[j]);
            if (coeffIdx >= n) {
                return (false, h);
            }

            // Set the hint bit
            h[i][coeffIdx] = 1;
        }

        k_idx = omegaVal;
    }

    // Check extra indices are zero for strong unforgeability
    for (uint256 j = k_idx; j < omega; j++) {
        if (uint8(hBytes[j]) != 0) {
            return (false, h);
        }
    }

    return (true, h);
}

function dilithium_core_1(Signature memory signature)
    pure
    returns (uint256 norm_h, uint256[][] memory h, uint256[][] memory z)
{
    bool foo;
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

    z = ZKNOX_Expand_Vec(signature.z);
}

function dilithium_core_2(
    address apsirev,
    address apsiInvrev,
    PubKey memory pk,
    uint256[][] memory z,
    uint256[] memory c_ntt,
    uint256[][] memory h,
    uint256[][] memory t1_new
) view returns (bytes memory w_prime_bytes) {
    // NTT(z)
    for (uint256 i = 0; i < 4; i++) {
        z[i] = ZKNOX_NTTFW(z[i], apsirev);
    }

    // 1. A*z
    uint256[][][] memory A_hat = ZKNOX_Expand_Mat(pk.a_hat);
    z = ZKNOX_MatVecProductDilithium(A_hat, z); // A * z

    // 2. A*z - c*t1
    for (uint256 i = 0; i < 4; i++) {
        z[i] = ZKNOX_NTTINV(ZKNOX_VECSUBMOD(z[i], ZKNOX_VECMULMOD(t1_new[i], c_ntt)), apsiInvrev);
    }

    // 3. w_prime packed using a "solidity-friendly encoding"
    w_prime_bytes = useHintDilithium(h, z);
}
