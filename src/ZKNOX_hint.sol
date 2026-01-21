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

int256 constant GAMMA_2 = 95232;
int256 constant _2_GAMMA_2 = 190464;
int256 constant _2_GAMMA_2_INVERSE = 44; // (8380417 - 1) / _2_GAMMA_2
import {q} from "./ZKNOX_dilithium_utils.sol";

// Function to reduce r0 within the range of -(a << 1) < r0 <= (a << 1)
// OPTIMIZATION: unchecked - values are bounded by GAMMA_2
function reduceModPm(int256 r0) pure returns (int256 res) {
    unchecked {
        res = r0 % _2_GAMMA_2;
        if (res > GAMMA_2) {
            res = res - _2_GAMMA_2;
        }
    }
}

// Decompose function equivalent to the Python version
// OPTIMIZATION: unchecked - values are bounded
function decompose(uint256 r) pure returns (int256 r1, int256 r0) {
    unchecked {
        // casting to 'int256' is safe because q is 23-bit long
        // forge-lint: disable-next-line(unsafe-typecast)
        int256 rp = int256(r % q);
        r0 = reduceModPm(rp);
        r1 = rp - r0;

        if (rp - r0 == 8380416) {
            r1 = 0;
            r0 = r0 - 1;
        } else {
            r1 = r1 / _2_GAMMA_2;
        }
        return (r1, r0);
    }
}

// Main function, use_hint
// OPTIMIZATION: unchecked - values are bounded
function useHint(uint256 h, uint256 r) pure returns (uint256) {
    int256 m = _2_GAMMA_2_INVERSE;
    (int256 r1, int256 r0) = decompose(r);

    unchecked {
        if (h == 1) {
            if (r0 > 0) {
                // casting to 'int256' is safe because q is 23-bit long
                // forge-lint: disable-next-line(unsafe-typecast)
                return uint256((r1 + 1) % m);
            }
            // (r1-1)%m
            // casting to 'uint256' is safe because q is 23-bit long
            // forge-lint: disable-next-line(unsafe-typecast)
            return uint256((r1 + m - 1) % m);
        }
    }
    // casting to 'uint256' is safe because r1 is small enough as output by decompose
    // forge-lint: disable-next-line(unsafe-typecast)
    return uint256(r1);
}

// OPTIMIZATION: unchecked loop
function useHintElt(uint256[] memory h, uint256[] memory r) pure returns (uint256[] memory hint) {
    hint = new uint256[](h.length);
    unchecked {
        for (uint256 i = 0; i < h.length; i++) {
            hint[i] = useHint(h[i], r[i]);
        }
    }
}

// OPTIMIZATION: unchecked loop
function useHintVec(uint256[][] memory h, uint256[][] memory r) pure returns (uint256[][] memory hint) {
    hint = new uint256[][](h.length);
    unchecked {
        for (uint256 i = 0; i < h.length; i++) {
            hint[i] = useHintElt(h[i], r[i]);
        }
    }
}

// OPTIMIZATION: unchecked loop
function useHintEthDilithium(uint256[][] memory h, uint256[][] memory r) pure returns (uint8[1024] memory hint) {
    unchecked {
        for (uint256 i = 0; i < 4; i++) {
            for (uint256 j = 0; j < 256; j++) {
                hint[i * 256 + j] = uint8(uint256(useHint(h[i][j], r[i][j])));
            }
        }
    }
}

// OPTIMIZATION: unchecked loop + direct write (no intermediate hintI buffer)
function useHintDilithium(uint256[][] memory h, uint256[][] memory r) pure returns (bytes memory hint) {
    // Hint computed with a packing of 6 bytes
    // Total = (ModuleDimension) * (RingDimension) * (useHintBitSize)
    //       =       4           *       256       *        6
    //       = 4 * 1535 bits
    //       = 4 * 192 bytes
    //       = 768 bytes.
    hint = new bytes(768);
    
    unchecked {
        for (uint256 i = 0; i < 4; i++) {
            uint256 baseOffset = i * 192;
            uint256 k = 0;
            
            for (uint256 j = 0; j < 256; j = j + 4) {
                // reading coefficients by slice of 4 (each of them is 6-bit long)
                uint256 result0 = useHint(h[i][j], r[i][j]);
                uint256 result1 = useHint(h[i][j + 1], r[i][j + 1]);
                uint256 result2 = useHint(h[i][j + 2], r[i][j + 2]);
                uint256 result3 = useHint(h[i][j + 3], r[i][j + 3]);
                
                // storing by slices of 3 bytes (as 4*6 = 3*8)
                // Write directly to hint instead of intermediate buffer
                hint[baseOffset + k] = bytes1(uint8((result1 & 3) << 6 | result0));
                hint[baseOffset + k + 1] = bytes1(uint8((result2 & 15) << 4 | result1 >> 2));
                hint[baseOffset + k + 2] = bytes1(uint8(result3 << 2 | result2 >> 4));
                k += 3;
            }
        }
    }
}
