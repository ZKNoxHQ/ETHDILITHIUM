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
 * OPTIMIZATION: Assembly inner loop eliminates bounds checks and reads 32-byte words
 * Estimated savings: ~30k-50k gas (called 4x for 4 polynomials)
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
        let inputData := add(inputBytes, 32) // skip length prefix
        let resultData := add(result, 32)

        for { let i := 0 } lt(i, numCoeffs) { i := add(i, 1) } {
            let bitOffset := add(startBitOffset, mul(i, coeffBits))
            let byteOff := shr(3, bitOffset)
            let bitInByte := and(bitOffset, 7)

            // Read up to 4 bytes (sufficient for 18 or 20-bit coefficients)
            // by loading a 32-byte word from the byte offset and extracting
            let value := 0
            // Safety: only read if within bounds
            if lt(byteOff, inputLen) {
                // Load 32 bytes starting at byteOff (big-endian in memory)
                // We need little-endian byte extraction, so read bytes individually
                // but in groups for efficiency
                let neededBytes := shr(3, add(add(bitInByte, coeffBits), 7))

                // Fast path for 3 bytes (18-bit coefficients with up to 7-bit offset)
                // and 4 bytes (20-bit coefficients)
                switch gt(neededBytes, 3)
                case 0 {
                    // Need <= 3 bytes
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
                    // Need 4 bytes
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

/**
 * OPTIMIZATION: Assembly vecMulMod — eliminates array bounds checks and indexed access overhead
 * Estimated savings: ~3k-5k gas per call × 4 calls = ~12-20k gas
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
 * OPTIMIZATION: Assembly vecSubMod — same pattern
 * Estimated savings: ~3k-5k gas per call × 4 calls
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
        // OPTIMIZATION: Assembly mod reduction loop
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

/**
 * OPTIMIZATION: Assembly mcopy replaces byte-by-byte loop
 * For the 2304-byte z slice alone: old ~46k gas → new ~2k gas
 * Estimated savings: ~40k-50k gas
 */
function slice(bytes memory data, uint256 start, uint256 len) pure returns (bytes memory b) {
    require(data.length >= start + len, "slice out of range");

    b = new bytes(len);

    assembly {
        let src := add(add(data, 32), start)
        let dst := add(b, 32)
        // mcopy is available in Solidity ^0.8.25 (Cancun)
        mcopy(dst, src, len)
    }
}
