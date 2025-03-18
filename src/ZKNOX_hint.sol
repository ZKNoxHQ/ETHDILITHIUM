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
///* FILE: ZKNOX_hint.sol
///* Description: Compute Negative Wrap Convolution NTT as specified in EIP-NTT
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

int256 constant gamma_2 = 95232;
int256 constant _2_gamma_2 = 190464;
int256 constant _2_gamma_2_inverse = 44; // (8380417 - 1) / _2_gamma_2

import {Test, console} from "forge-std/Test.sol";
import {q} from "./ZKNOX_utils.sol";

// Function to reduce r0 within the range of -(a << 1) < r0 <= (a << 1)
function reduceModPM(int256 r0) pure returns (int256 res) {
    res = r0 % _2_gamma_2;
    if (res > gamma_2) {
        res = res - _2_gamma_2;
    }
}

// Decompose function equivalent to the Python version
function decompose(uint256 r) pure returns (int256 r1, int256 r0) {
    int256 rp = int256(r % q);
    r0 = reduceModPM(rp);
    r1 = rp - r0;

    if (rp - r0 == 8380416) {
        r1 = 0;
        r0 = r0 - 1;
    } else {
        r1 = r1 / _2_gamma_2;
    }
    return (r1, r0);
}

// Main function, use_hint
function useHint(uint256 h, uint256 r) pure returns (int256) {
    int256 m = _2_gamma_2_inverse;
    (int256 r1, int256 r0) = decompose(r);

    if (h == 1) {
        if (r0 > 0) {
            return (r1 + 1) % m;
        }
        return (r1 - 1) % m;
    }

    return r1;
}

function useHintElt(uint256[] memory h, uint256[] memory r) pure returns (int256[] memory hint) {
    hint = new int256[](h.length);
    for (uint256 i = 0; i < h.length; i++) {
        hint[i] = useHint(h[i], r[i]);
    }
}

function useHintVec(uint256[][] memory h, uint256[][] memory r) pure returns (int256[][] memory hint) {
    hint = new int256[][](h.length);
    for (uint256 i = 0; i < h.length; i++) {
        hint[i] = useHintElt(h[i], r[i]);
    }
}

function useHintETHDilithium(uint256[][] memory h, uint256[][] memory r) pure returns (uint8[1024] memory hint) {
    for (uint256 i = 0; i < 4; i++) {
        for (uint256 j = 0; j < 256; j++) {
            hint[i * 256 + j] = uint8(uint256(useHint(h[i][j], r[i][j])));
        }
    }
}
