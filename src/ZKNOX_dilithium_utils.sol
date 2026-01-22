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
///* FILE: ZKNOX_utils.sol
///* Description: Compute Negative Wrap Convolution NTT as specified in EIP-NTT
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

uint256 constant ID_KECCAK = 0x00;
uint256 constant ID_TETRATION = 0x01;
uint256 constant ID_SHAKE = 0x02;

uint256 constant _DILITHIUM_WORD256_S = 32;
uint256 constant _DILITHIUM_WORD32_S = 256;

// DILITHIUM PARAMETERS
uint256 constant n = 256;
uint256 constant q = 8380417;
uint256 constant N_MINUS_1_MOD_Q = 8347681;
uint256 constant OMEGA = 80;
uint256 constant GAMMA_1 = 131072;
uint256 constant GAMMA_1_MINUS_BETA = 130994; // γ1 - τ*η = 131072 - 39 * 2
uint256 constant TAU = 39;
uint256 constant d = 13;
uint256 constant k = 4;
uint256 constant l = 4;

/**
 * @notice Unpacks coefficients starting at a specific bit offset
 * @param inputBytes The packed data
 * @param coeffBits Number of bits per coefficient (18 or 20)
 * @param startBitOffset Starting bit position
 * @param numCoeffs Number of coefficients to unpack
 * @return result Array of unpacked coefficients
 */
function bitUnpackAtOffset(bytes memory inputBytes, uint256 coeffBits, uint256 startBitOffset, uint256 numCoeffs)
    pure
    returns (uint256[] memory result)
{
    require(coeffBits > 0 && coeffBits <= 256, "invalid coeffBits");

    result = new uint256[](numCoeffs);

    // Pre-calculate mask once
    uint256 coeffMask;
    unchecked {
        coeffMask = coeffBits == 256 ? type(uint256).max : (uint256(1) << coeffBits) - 1;
    }

    unchecked {
        for (uint256 i = 0; i < numCoeffs; ++i) {
            uint256 bitOffset = startBitOffset + i * coeffBits;
            uint256 byteOffset = bitOffset >> 3;
            uint256 bitInByte = bitOffset & 7;

            // Calculate and read needed bytes
            uint256 neededBytes = ((bitInByte + coeffBits + 7) >> 3);
            uint256 value = 0;

            for (uint256 j = 0; j < neededBytes; ++j) {
                if (byteOffset + j < inputBytes.length) {
                    value |= uint256(uint8(inputBytes[byteOffset + j])) << (j << 3);
                }
            }

            result[i] = (value >> bitInByte) & coeffMask;
        }
    }

    return result;
}

function expandMat(uint256[][][] memory table) pure returns (uint256[][][] memory b) {
    b = new uint256[][][](4);
    for (uint256 i = 0; i < 4; i++) {
        b[i] = new uint256[][](4);
        for (uint256 j = 0; j < 4; j++) {
            b[i][j] = expand(table[i][j]);
        }
    }
    return b;
}

function expandVec(uint256[][] memory table) pure returns (uint256[][] memory b) {
    b = new uint256[][](4);
    for (uint256 i = 0; i < 4; i++) {
        b[i] = expand(table[i]);
    }
    return b;
}

function expand(uint256[] memory a) pure returns (uint256[] memory b) {
    require(a.length == 32, "Input array must have exactly 32 elements");
    b = new uint256[](256);

    assembly {
        let aa := add(a, 32)
        let bb := add(b, 32)
        for { let i := 0 } lt(i, 32) { i := add(i, 1) } {
            let ai := mload(aa)
            for { let j := 0 } lt(j, 8) { j := add(j, 1) } {
                mstore(add(bb, mul(32, add(j, shl(3, i)))), and(shr(shl(5, j), ai), 0xffffffff))
            }
            aa := add(aa, 32)
        }
    }
    return b;
}

function compact(uint256[] memory a) pure returns (uint256[] memory b) {
    require(a.length == 256, "Input array must have exactly 256 elements");
    b = new uint256[](32);
    assembly {
        let aa := add(a, 32)
        let bb := add(b, 32)
        for { let i := 0 } lt(i, 256) { i := add(i, 1) } {
            let bi := add(bb, mul(32, shr(3, i)))
            mstore(bi, xor(mload(bi), shl(shl(5, and(i, 0x7)), mload(aa))))
            aa := add(aa, 32)
        }
    }

    return b;
}

// OPTIMIZATION: Full assembly implementation of vecMulMod
function vecMulMod(uint256[] memory a, uint256[] memory b) pure returns (uint256[] memory res) {
    assert(a.length == b.length);
    res = new uint256[](a.length);
    
    assembly {
        let len := mload(a)
        let a_ptr := add(a, 32)
        let b_ptr := add(b, 32)
        let res_ptr := add(res, 32)
        let end := add(a_ptr, shl(5, len))
        
        for {} lt(a_ptr, end) {} {
            mstore(res_ptr, mulmod(mload(a_ptr), mload(b_ptr), q))
            a_ptr := add(a_ptr, 32)
            b_ptr := add(b_ptr, 32)
            res_ptr := add(res_ptr, 32)
        }
    }
}

// OPTIMIZATION: Full assembly implementation of vecAddMod
function vecAddMod(uint256[] memory a, uint256[] memory b) pure returns (uint256[] memory res) {
    assert(a.length == b.length);
    res = new uint256[](a.length);
    
    assembly {
        let len := mload(a)
        let a_ptr := add(a, 32)
        let b_ptr := add(b, 32)
        let res_ptr := add(res, 32)
        let end := add(a_ptr, shl(5, len))
        
        for {} lt(a_ptr, end) {} {
            mstore(res_ptr, addmod(mload(a_ptr), mload(b_ptr), q))
            a_ptr := add(a_ptr, 32)
            b_ptr := add(b_ptr, 32)
            res_ptr := add(res_ptr, 32)
        }
    }
}

// OPTIMIZATION: Full assembly implementation of vecSubMod
function vecSubMod(uint256[] memory a, uint256[] memory b) pure returns (uint256[] memory res) {
    assert(a.length == b.length);
    res = new uint256[](a.length);
    
    assembly {
        let len := mload(a)
        let a_ptr := add(a, 32)
        let b_ptr := add(b, 32)
        let res_ptr := add(res, 32)
        let end := add(a_ptr, shl(5, len))
        
        for {} lt(a_ptr, end) {} {
            mstore(res_ptr, addmod(mload(a_ptr), sub(q, mload(b_ptr)), q))
            a_ptr := add(a_ptr, 32)
            b_ptr := add(b_ptr, 32)
            res_ptr := add(res_ptr, 32)
        }
    }
}

function scalarProduct(uint256[][] memory a, uint256[][] memory b) pure returns (uint256[] memory result) {
    result = new uint256[](256);
    for (uint256 i = 0; i < a.length; i++) {
        uint256[] memory toto = vecMulMod(a[i], b[i]);
        result = vecAddMod(result, toto);
    }
}

function matVecProduct(uint256[][][] memory M, uint256[][] memory v) pure returns (uint256[][] memory mTimesV) {
    mTimesV = new uint256[][](v.length);
    for (uint256 i = 0; i < M.length; i++) {
        mTimesV[i] = scalarProduct(M[i], v);
    }
}

uint256 constant VEC_SIZE = 256;
uint256 constant ROW_COUNT = 4;
uint256 constant COL_COUNT = 4;

function matVecProductDilithium(uint256[][][] memory M, uint256[][] memory v)
    pure
    returns (uint256[][] memory mTimesV)
{
    mTimesV = new uint256[][](ROW_COUNT);

    uint256 i;
    uint256 j;
    uint256 ell;
    uint256[] memory tmp;
    uint256[] memory mij;
    uint256[] memory vj;
    for (i = 0; i < ROW_COUNT; i++) {
        tmp = new uint256[](VEC_SIZE);
        for (j = 0; j < COL_COUNT; j++) {
            mij = M[i][j];
            vj = v[j];

            assembly {
                let a_tmp := add(tmp, 32)
                let a_mij := add(mij, 32)
                let a_vj := add(vj, 32)
                for { let offset_k := 0 } gt(8192, offset_k) { offset_k := add(offset_k, 32) } {
                    let tmp_k := add(a_tmp, offset_k)
                    mstore(tmp_k, add(mload(tmp_k), mulmod(mload(add(a_mij, offset_k)), mload(add(a_vj, offset_k)), q)))
                }
            }
        }
        for (ell = 0; ell < VEC_SIZE; ell++) {
            tmp[ell] %= q;
        }
        mTimesV[i] = tmp;
    }
}

struct Signature {
    bytes cTilde;
    bytes z;
    bytes h;
}

struct PubKey {
    uint256[][][] aHat;
    bytes tr;
    uint256[][] t1;
}

function slice(bytes memory data, uint256 start, uint256 len) pure returns (bytes memory) {
    require(data.length >= start + len, "slice out of range");

    bytes memory b = new bytes(len);

    for (uint256 i = 0; i < len; i++) {
        b[i] = data[start + i];
    }

    return b;
}
