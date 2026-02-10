// Copyright (C) 2026 - ZKNOX
// License: This software is licensed under MIT License
// This Code may be reused including this header, license and copyright notice.
// FILE: ZKNOX_hint.sol
// Description: Hint computation for Dilithium verification (UseHint / Decompose)
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

int256 constant GAMMA_2 = 95232;
int256 constant _2_GAMMA_2 = 190464;
int256 constant _2_GAMMA_2_INVERSE = 44; // (8380417 - 1) / _2_GAMMA_2
import {q} from "./ZKNOX_dilithium_utils.sol";

// Function to reduce r0 within the range of -(a << 1) < r0 <= (a << 1)
function reduceModPm(int256 r0) pure returns (int256 res) {
    res = r0 % _2_GAMMA_2;
    if (res > GAMMA_2) {
        res = res - _2_GAMMA_2;
    }
}

// Decompose function equivalent to the Python version
function decompose(uint256 r) pure returns (int256 r1, int256 r0) {
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

// Main function, use_hint
function useHint(uint256 h, uint256 r) pure returns (uint256) {
    int256 m = _2_GAMMA_2_INVERSE;
    (int256 r1, int256 r0) = decompose(r);

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
    // casting to 'uint256' is safe because r1 is small enough as output by decompose
    // forge-lint: disable-next-line(unsafe-typecast)
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

function useHintEthDilithium(uint256[][] memory h, uint256[][] memory r) pure returns (uint8[1024] memory hint) {
    for (uint256 i = 0; i < 4; i++) {
        for (uint256 j = 0; j < 256; j++) {
            hint[i * 256 + j] = uint8(uint256(useHint(h[i][j], r[i][j])));
        }
    }
}

/**
 * @notice Assembly-optimized UseHint + Decompose with 6-bit packing for Dilithium
 * @dev Replaces 1024 Solidity-level function calls (useHint -> decompose -> reduceModPm)
 *      with a single assembly pass over the h[][] and r[][] arrays.
 *
 *      Gas savings come from:
 *        - Eliminating 1024 internal function call overhead (~20 gas each = ~20k)
 *        - Eliminating 4 intermediate hintI allocations (4 x 192 bytes)
 *        - Replacing int256 casting/division with unsigned assembly arithmetic
 *        - Direct pointer walking instead of nested array dereferencing (h[i][j])
 *        - Direct mstore8 writes instead of bytes1(uint8(...)) packing
 *
 *      Math inlined per coefficient (all unsigned):
 *        1. r0_raw = r_val % 190464          (unsigned mod by 2*GAMMA_2)
 *        2. Three cases determine r1 and sign of r0:
 *           a) r0_raw == 0  -> r0 not positive; r1 = r_val/190464 (or 0 if r_val == q-1)
 *           b) 0 < r0_raw <= 95232 -> r0 positive; r1 = (r_val - r0_raw) / 190464
 *           c) r0_raw > 95232 -> r0 negative; r1 = (r_val - r0_raw + 190464) / 190464
 *              (edge case: if that premul equals q-1, r1 = 0)
 *        3. If h == 1: adjust r1 -> (r1 + 1) % 44 if r0 > 0, else (r1 + 43) % 44
 *        4. Pack 4 results (6-bit each) into 3 bytes: 4 x 6 = 24 = 3 x 8
 *
 *      Output: 768 bytes = 4 rows x 192 bytes (256 coefficients x 6 bits / 8)
 *
 * @param h Hint matrix (4 x 256 binary values)
 * @param r Coefficient matrix (4 x 256 values mod q)
 * @return hint Packed 768-byte hint encoding
 */
function useHintDilithium(uint256[][] memory h, uint256[][] memory r) pure returns (bytes memory hint) {
    hint = new bytes(768);

    assembly {
        let hintData := add(hint, 32) // skip bytes length prefix

        for { let i := 0 } lt(i, 4) { i := add(i, 1) } {
            // Resolve h[i] and r[i] inner array pointers
            let iOff := shl(5, i) // i * 32
            let hi_arr := mload(add(add(h, 32), iOff)) // pointer to h[i]
            let ri_arr := mload(add(add(r, 32), iOff)) // pointer to r[i]
            let hi_data := add(hi_arr, 32) // skip length word
            let ri_data := add(ri_arr, 32) // skip length word
            let writePtr := add(hintData, mul(i, 192)) // destination offset in hint

            for { let j := 0 } lt(j, 256) { j := add(j, 4) } {
                let packed := 0
                let baseOff := shl(5, j) // j * 32

                for { let s := 0 } lt(s, 4) { s := add(s, 1) } {
                    let off := add(baseOff, shl(5, s)) // (j + s) * 32
                    let h_val := mload(add(hi_data, off))
                    let r_val := mload(add(ri_data, off))

                    // ======== Inline decompose + useHint ========
                    //
                    // decompose(r_val) computes:
                    //   r0 = reduceModPm(r_val)  -- centered mod 2*GAMMA_2
                    //   r1 = (r_val - r0) / (2*GAMMA_2)
                    //   with edge case at r_val - r0 == q-1
                    //
                    // useHint uses sign(r0) and h to adjust r1 mod 44

                    // Step 1: unsigned modulo
                    let r0_raw := mod(r_val, 190464) // r_val % (2 * GAMMA_2)
                    let r1 := 0
                    let r0_pos := 0 // tracks whether signed r0 > 0

                    switch iszero(r0_raw)
                    case 1 {
                        // r0_raw == 0: signed r0 = 0 (not positive)
                        // r1_premul = r_val itself
                        // Edge case: r_val == q-1 = 8380416 -> r1 = 0, r0 becomes -1
                        switch eq(r_val, 8380416)
                        case 1 { r1 := 0 }
                        default { r1 := div(r_val, 190464) }
                    }
                    default {
                        switch gt(r0_raw, 95232) // compare with GAMMA_2
                        case 0 {
                            // 0 < r0_raw <= GAMMA_2: signed r0 = r0_raw > 0
                            r1 := div(sub(r_val, r0_raw), 190464)
                            r0_pos := 1
                            // Note: r_val - r0_raw < q when r0_raw > 0,
                            // so edge case (== q-1) is impossible here
                        }
                        default {
                            // r0_raw > GAMMA_2: signed r0 = r0_raw - 190464 < 0
                            // r1_premul = r_val - (r0_raw - 190464) = r_val - r0_raw + 190464
                            let premul := add(sub(r_val, r0_raw), 190464)
                            switch eq(premul, 8380416)
                            case 1 { r1 := 0 }
                            default { r1 := div(premul, 190464) }
                            // r0_pos stays 0 (r0 is negative)
                        }
                    }

                    // Apply hint adjustment: if h == 1, rotate r1
                    if eq(h_val, 1) {
                        switch r0_pos
                        case 1 { r1 := mod(add(r1, 1), 44) } // (r1 + 1) mod m
                        default { r1 := mod(add(r1, 43), 44) } // (r1 + m - 1) mod m
                    }

                    // Pack r1 (6-bit value) into the 24-bit accumulator
                    // s=0 -> bits [0:5], s=1 -> bits [6:11], s=2 -> bits [12:17], s=3 -> bits [18:23]
                    packed := or(packed, shl(mul(s, 6), r1))
                }

                // Write 3 bytes from the 24-bit packed value
                // Byte layout matches original packing:
                //   byte 0 = (coeff1[1:0] << 6) | coeff0[5:0]     = packed[7:0]
                //   byte 1 = (coeff2[3:0] << 4) | coeff1[5:2]     = packed[15:8]
                //   byte 2 = (coeff3[5:0] << 2) | coeff2[5:4]     = packed[23:16]
                mstore8(writePtr, packed) // mstore8 writes lowest byte of value
                mstore8(add(writePtr, 1), shr(8, packed))
                mstore8(add(writePtr, 2), shr(16, packed))
                writePtr := add(writePtr, 3)
            }
        }
    }
}
