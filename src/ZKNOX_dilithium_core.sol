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
    ZKNOX_VECSUBMOD
} from "./ZKNOX_dilithium_utils.sol";
import {useHintDilithium} from "./ZKNOX_hint.sol";

function dilithium_core(
    address apsirev,
    address apsiInvrev,
    PubKey memory pk,
    // uint256[][] memory pk_t1_new,
    // uint256[][][] memory pk_a_hat,
    // bytes memory pk.tr,
    Signature memory signature
)
    // bytes memory signature_c_tilde,
    // uint256[][] memory signature_z,
    // uint256[][] memory signature_h,
    // uint256[] memory signature_c_ntt
    view
    returns (uint256 norm_h, uint256[][] memory z, bytes memory w_prime_bytes)
{
    // sum hint for h
    uint256[][] memory h = ZKNOX_Expand_Vec(signature.h);
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

    // check norm bound for z
    z = ZKNOX_Expand_Vec(signature.z);

    // NTT(z)
    uint256[][] memory tmp = new uint256[][](4);
    for (i = 0; i < 4; i++) {
        tmp[i] = new uint256[](256);
        for (j = 0; j < 256; j++) {
            tmp[i][j] = z[i][j];
        }
        tmp[i] = ZKNOX_NTTFW(tmp[i], apsirev);
    }

    // c_ntt
    uint256[] memory c_ntt = ZKNOX_Expand(signature.c_ntt);

    // t1_new
    uint256[][] memory t1_new = ZKNOX_Expand_Vec(pk.t1_new);

    // 1. A*z
    uint256[][][] memory A_hat = ZKNOX_Expand_Mat(pk.a_hat);
    tmp = ZKNOX_MatVecProductDilithium(A_hat, tmp); // A * z

    // 2. A*z - c*t1
    for (i = 0; i < 4; i++) {
        tmp[i] = ZKNOX_NTTINV(ZKNOX_VECSUBMOD(tmp[i], ZKNOX_VECMULMOD(t1_new[i], c_ntt)), apsiInvrev);
    }

    // 3. w_prime packed using a "solidity-friendly encoding"
    w_prime_bytes = useHintDilithium(h, tmp);
}
