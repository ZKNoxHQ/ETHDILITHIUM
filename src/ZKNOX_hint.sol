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
import {q} from "./ZKNOX_dilithium_utils.sol";

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
function useHint(uint256 h, uint256 r) pure returns (uint256) {
    int256 m = _2_gamma_2_inverse;
    (int256 r1, int256 r0) = decompose(r);

    if (h == 1) {
        if (r0 > 0) {
            return uint256((r1 + 1) % m);
        }
        return uint256((r1 - 1) % m);
    }

    return uint256(r1);
}

function useHintElt(uint256[] memory h, uint256[] memory r) pure returns (uint256[] memory hint) {
    hint = new uint256[](h.length);
    for (uint256 i = 0; i < h.length; i++) {
        hint[i] = useHint(h[i], r[i]);
    }
}

function useHintVec(uint256[][] memory h, uint256[][] memory r) pure returns (uint256[][] memory hint) {
    hint = new uint256[][](h.length);
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

function useHintDilithium(uint256[][] memory h, uint256[][] memory r) pure returns (bytes memory hint) {
    // Stored in 768 bytes for 4 * 256 * 6 bits (useHint output < 64)
    // We follow the packing of the reference implementation
    hint = new bytes(768);
    bytes memory hint_i;
    uint256 bitIndex;
    uint256 i;
    uint256 j;
    uint256 l;
    uint8 result0;
    uint8 result1;
    uint8 result2;
    uint8 result3;

    for (i = 0; i < 4; i++) {
        hint_i = new bytes(192);
        l = 192;
        bitIndex = 191;
        for (j = 0; j < 256; j=j+4) {
            // reading coefficients in reversed order
            result0 = uint8(uint256(useHint(h[i][255 - j], r[i][255 - j])));
            result1 = uint8(uint256(useHint(h[i][255 - j-1], r[i][255 - j-1])));
            result2 = uint8(uint256(useHint(h[i][255 - j-2], r[i][255 - j-2])));
            result3 = uint8(uint256(useHint(h[i][255 - j-3], r[i][255 - j-3])));
            hint_i[l-1]= bytes1(result0 << 2 | result1 >> 4);
            hint_i[l-2] = bytes1((result1 & 15) << 4 | result2 >> 2);
            hint_i[l-3] = bytes1((result2 & 3) << 6 | result3);
            l = l-3;
        }
        // copy hint_i into hint 
        assembly {
            let dest := add(hint, add(32, mul(i, 192)))
            let src := add(hint_i, 32)
            mcopy(dest, src, 192)
        }
    }
}


/*

[12 23 34 45]

45 101101
34 100010
23  10111
12   1100

|  45  |  34  |  23  |  12  |
|101101|100010|010111|001100|
*/