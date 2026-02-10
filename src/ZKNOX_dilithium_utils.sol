// Copyright (C) 2026 - ZKNOX
// License: This software is licensed under MIT License
// This Code may be reused including this header, license and copyright notice.
// FILE: ZKNOX_dilithium_utils.sol
// Description: Utility functions and parameters for Dilithium signature scheme
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

/*
 * @title Dilithium Utility Library
 * @notice Provides constants, data structures, and optimized arithmetic
 *         operations for Dilithium signature verification
 * @dev Includes assembly-optimized routines for bit unpacking, vector/matrix
 *      arithmetic, and memory manipulation to minimize gas usage
 */

/* =============================================================
                            IDENTIFIERS
   ============================================================= */

uint256 constant ID_KECCAK = 0x00;
uint256 constant ID_TETRATION = 0x01;
uint256 constant ID_SHAKE = 0x02;

/* =============================================================
                          WORD SIZES
   ============================================================= */

uint256 constant _DILITHIUM_WORD256_S = 32;
uint256 constant _DILITHIUM_WORD32_S = 256;

/* =============================================================
                     DILITHIUM PARAMETERS
   ============================================================= */

uint256 constant n = 256;
uint256 constant q = 8380417;
uint256 constant N_MINUS_1_MOD_Q = 8347681;
uint256 constant OMEGA = 80;
uint256 constant GAMMA_1 = 131072;
uint256 constant GAMMA_1_MINUS_BETA = 130994;
uint256 constant TAU = 39;
uint256 constant d = 13;
uint256 constant k = 4;
uint256 constant l = 4;

/* =============================================================
                    BIT UNPACKING UTILITIES
   ============================================================= */

/**
 * @notice Unpacks coefficients starting at a specific bit offset
 * @dev Extracts numCoeffs values of coeffBits length from inputBytes.
 *      Uses assembly for fast memory access and reduced bounds checks.
 *      Supports Dilithium coefficient sizes (18 or 20 bits).
 * @param inputBytes Packed input byte array
 * @param coeffBits Bit width of each coefficient
 * @param startBitOffset Starting offset in bits
 * @param numCoeffs Number of coefficients to extract
 * @return result Array of unpacked coefficients
 */
function bitUnpackAtOffset(bytes memory inputBytes, uint256 coeffBits, uint256 startBitOffset, uint256 numCoeffs)
    pure
    returns (uint256[] memory result)
{
    require(coeffBits > 0 && coeffBits <= 256, "invalid coeffBits");

    result = new uint256[](numCoeffs);

    uint256 coeffMask;
    unchecked {
        coeffMask = coeffBits == 256 ? type(uint256).max : (uint256(1) << coeffBits) - 1;
    }

    uint256 inputLen = inputBytes.length;

    assembly {
        let inputData := add(inputBytes, 32)
        let resultData := add(result, 32)

        for { let i := 0 } lt(i, numCoeffs) { i := add(i, 1) } {
            let bitOffset := add(startBitOffset, mul(i, coeffBits))
            let byteOff := shr(3, bitOffset)
            let bitInByte := and(bitOffset, 7)

            let value := 0

            if lt(byteOff, inputLen) {
                let neededBytes := shr(3, add(add(bitInByte, coeffBits), 7))

                switch gt(neededBytes, 3)
                case 0 {
                    value := byte(0, mload(add(inputData, byteOff)))
                    if gt(neededBytes, 1) {
                        if lt(add(byteOff, 1), inputLen) {
                            value := or(value, shl(8, byte(0, mload(add(inputData, add(byteOff, 1))))))
                        }
                    }
                    if gt(neededBytes, 2) {
                        if lt(add(byteOff, 2), inputLen) {
                            value := or(value, shl(16, byte(0, mload(add(inputData, add(byteOff, 2))))))
                        }
                    }
                }
                default {
                    value := byte(0, mload(add(inputData, byteOff)))
                    if lt(add(byteOff, 1), inputLen) {
                        value := or(value, shl(8, byte(0, mload(add(inputData, add(byteOff, 1))))))
                    }
                    if lt(add(byteOff, 2), inputLen) {
                        value := or(value, shl(16, byte(0, mload(add(inputData, add(byteOff, 2))))))
                    }
                    if lt(add(byteOff, 3), inputLen) {
                        value := or(value, shl(24, byte(0, mload(add(inputData, add(byteOff, 3))))))
                    }
                }
            }

            mstore(add(resultData, mul(i, 32)), and(shr(bitInByte, value), coeffMask))
        }
    }

    return result;
}

/* =============================================================
                 EXPANSION / COMPACTION UTILITIES
   ============================================================= */

/**
 * @notice Expands a compressed 4×4×32 matrix into 4×4×256 form
 * @dev Applies expand() to each polynomial in the matrix
 * @param table Compressed input matrix
 * @return b Expanded matrix
 */
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

/**
 * @notice Expands a compressed vector into polynomial form
 * @dev Applies expand() to each element of the vector
 * @param table Compressed input vector
 * @return b Expanded vector
 */
function expandVec(uint256[][] memory table) pure returns (uint256[][] memory b) {
    b = new uint256[][](4);
    for (uint256 i = 0; i < 4; i++) {
        b[i] = expand(table[i]);
    }
    return b;
}

/**
 * @notice Expands a 32-word compressed polynomial into 256 coefficients
 * @dev Each 256-bit word is decomposed into eight 32-bit values
 * @param a Compressed polynomial (32 words)
 * @return b Expanded polynomial (256 coefficients)
 */
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

/**
 * @notice Compresses a 256-coefficient polynomial into 32 words
 * @dev Inverse operation of expand()
 * @param a Expanded polynomial
 * @return b Compressed representation
 */
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

/* =============================================================
                VECTOR / MATRIX ARITHMETIC
   ============================================================= */

/**
 * @notice Computes element-wise product modulo q
 * @dev Uses assembly for efficient memory access
 * @param a First vector
 * @param b Second vector
 * @return res Element-wise product modulo q
 */
function vecMulMod(uint256[] memory a, uint256[] memory b) pure returns (uint256[] memory res) {
    uint256 len = a.length;
    assert(len == b.length);
    res = new uint256[](len);

    assembly {
        let a_ptr := add(a, 32)
        let b_ptr := add(b, 32)
        let r_ptr := add(res, 32)
        let end := add(a_ptr, shl(5, len))

        for {} lt(a_ptr, end) {} {
            mstore(r_ptr, mulmod(mload(a_ptr), mload(b_ptr), q))
            a_ptr := add(a_ptr, 32)
            b_ptr := add(b_ptr, 32)
            r_ptr := add(r_ptr, 32)
        }
    }
}

/**
 * @notice Computes element-wise sum modulo q
 * @dev Assembly-optimized modular addition
 * @param a First vector
 * @param b Second vector
 * @return res Element-wise sum modulo q
 */
function vecAddMod(uint256[] memory a, uint256[] memory b) pure returns (uint256[] memory res) {
    uint256 len = a.length;
    assert(len == b.length);
    res = new uint256[](len);

    assembly {
        let a_ptr := add(a, 32)
        let b_ptr := add(b, 32)
        let r_ptr := add(res, 32)
        let end := add(a_ptr, shl(5, len))

        for {} lt(a_ptr, end) {} {
            mstore(r_ptr, addmod(mload(a_ptr), mload(b_ptr), q))
            a_ptr := add(a_ptr, 32)
            b_ptr := add(b_ptr, 32)
            r_ptr := add(r_ptr, 32)
        }
    }
}

/**
 * @notice Computes element-wise difference modulo q
 * @dev Implements (a - b) mod q using assembly
 * @param a First vector
 * @param b Second vector
 * @return res Element-wise difference modulo q
 */
function vecSubMod(uint256[] memory a, uint256[] memory b) pure returns (uint256[] memory res) {
    uint256 len = a.length;
    assert(len == b.length);
    res = new uint256[](len);

    assembly {
        let a_ptr := add(a, 32)
        let b_ptr := add(b, 32)
        let r_ptr := add(res, 32)
        let end := add(a_ptr, shl(5, len))

        for {} lt(a_ptr, end) {} {
            mstore(r_ptr, addmod(mload(a_ptr), sub(q, mload(b_ptr)), q))
            a_ptr := add(a_ptr, 32)
            b_ptr := add(b_ptr, 32)
            r_ptr := add(r_ptr, 32)
        }
    }
}

/**
 * @notice Computes (a - b * c) mod q element-wise in a single pass
 * @dev Fused operation replacing vecSubMod(a, vecMulMod(b, c)), eliminating
 *      one intermediate uint256[256] allocation (~8KB) and one full 256-iteration
 *      loop per call. Called 4 times in dilithiumCore2, saving ~32KB of allocations
 *      and ~1024 redundant loop iterations total.
 *      Computes res[k] = addmod(a[k], q - mulmod(b[k], c[k], q), q).
 * @param a Minuend vector
 * @param b First factor of the subtrahend
 * @param c Second factor of the subtrahend
 * @return res Element-wise result of (a - b*c) mod q
 */
function vecSubMulMod(uint256[] memory a, uint256[] memory b, uint256[] memory c)
    pure
    returns (uint256[] memory res)
{
    uint256 len = a.length;
    res = new uint256[](len);

    assembly {
        let a_ptr := add(a, 32)
        let b_ptr := add(b, 32)
        let c_ptr := add(c, 32)
        let r_ptr := add(res, 32)
        let end := add(a_ptr, shl(5, len))

        for {} lt(a_ptr, end) {} {
            mstore(r_ptr, addmod(mload(a_ptr), sub(q, mulmod(mload(b_ptr), mload(c_ptr), q)), q))
            a_ptr := add(a_ptr, 32)
            b_ptr := add(b_ptr, 32)
            c_ptr := add(c_ptr, 32)
            r_ptr := add(r_ptr, 32)
        }
    }
}

/**
 * @notice Computes scalar product of two polynomial vectors
 * @dev Performs element-wise multiplication and accumulation
 * @param a First polynomial vector
 * @param b Second polynomial vector
 * @return result Accumulated scalar product
 */
function scalarProduct(uint256[][] memory a, uint256[][] memory b) pure returns (uint256[] memory result) {
    result = new uint256[](256);

    for (uint256 i = 0; i < a.length; i++) {
        uint256[] memory tmp = vecMulMod(a[i], b[i]);
        result = vecAddMod(result, tmp);
    }
}

/**
 * @notice Multiplies matrix with vector of polynomials
 * @dev Computes M × v using scalar products
 * @param M Polynomial matrix
 * @param v Polynomial vector
 * @return mTimesV Resulting vector
 */
function matVecProduct(uint256[][][] memory M, uint256[][] memory v) pure returns (uint256[][] memory mTimesV) {
    mTimesV = new uint256[][](v.length);

    for (uint256 i = 0; i < M.length; i++) {
        mTimesV[i] = scalarProduct(M[i], v);
    }
}

/* =============================================================
            DILITHIUM-SPECIFIC MATRIX MULTIPLICATION
   ============================================================= */

uint256 constant VEC_SIZE = 256;
uint256 constant ROW_COUNT = 4;
uint256 constant COL_COUNT = 4;

/**
 * @notice Optimized Dilithium matrix-vector multiplication
 * @dev Specialized implementation for 4×4 matrices with assembly inner loops
 *      Reduces overhead by avoiding repeated function calls
 * @param M Expanded Dilithium matrix
 * @param v Polynomial vector
 * @return mTimesV Resulting vector
 */
function matVecProductDilithium(uint256[][][] memory M, uint256[][] memory v)
    pure
    returns (uint256[][] memory mTimesV)
{
    mTimesV = new uint256[][](ROW_COUNT);

    for (uint256 i = 0; i < ROW_COUNT; i++) {
        uint256[] memory tmp = new uint256[](VEC_SIZE);

        for (uint256 j = 0; j < COL_COUNT; j++) {
            uint256[] memory mij = M[i][j];
            uint256[] memory vj = v[j];

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

        assembly {
            let ptr := add(tmp, 32)
            for { let idx := 0 } lt(idx, 256) { idx := add(idx, 1) } {
                mstore(ptr, mod(mload(ptr), q))
                ptr := add(ptr, 32)
            }
        }

        mTimesV[i] = tmp;
    }
}

/* =============================================================
                      DATA STRUCTURES
   ============================================================= */

/**
 * @notice Dilithium signature structure
 */
struct Signature {
    bytes cTilde;
    bytes z;
    bytes h;
}

/**
 * @notice Dilithium public key structure
 */
struct PubKey {
    uint256[][][] aHat;
    bytes tr;
    uint256[][] t1;
}

/* =============================================================
                       MEMORY UTILITIES
   ============================================================= */

/**
 * @notice Extracts a slice from a byte array
 * @dev Uses EVM mcopy instruction for fast memory copying (Solidity ≥0.8.25)
 * @param data Source byte array
 * @param start Starting offset
 * @param len Length of slice
 * @return b Extracted byte slice
 */
function slice(bytes memory data, uint256 start, uint256 len) pure returns (bytes memory b) {
    require(data.length >= start + len, "slice out of range");

    b = new bytes(len);

    assembly {
        let src := add(add(data, 32), start)
        let dst := add(b, 32)
        mcopy(dst, src, len)
    }
}
