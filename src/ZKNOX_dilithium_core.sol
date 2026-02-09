// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {nttFw, nttInv} from "./ZKNOX_NTT_dilithium.sol";
import {PubKey, Signature} from "./ZKNOX_dilithium_utils.sol";
import {
    q,
    expandMat,
    matVecProductDilithium,
    vecMulMod,
    vecSubMod,
    bitUnpackAtOffset,
    OMEGA,
    k,
    l,
    n,
    GAMMA_1
} from "./ZKNOX_dilithium_utils.sol";
import {useHintDilithium} from "./ZKNOX_hint.sol";

/**
 * OPTIMIZATION 1: Removed redundant zero-initialization loop (h[i][j]=0)
 *   `new uint256[](n)` already zero-fills. Saves 4×256×~6 = ~6k gas.
 * OPTIMIZATION 2: unchecked arithmetic in loops where overflow is impossible.
 */
function unpackH(bytes memory hBytes) pure returns (bool success, uint256[][] memory h) {
    require(hBytes.length >= OMEGA + k, "Invalid h bytes length");

    uint256 kIdx = 0;

    h = new uint256[][](k);
    unchecked {
        for (uint256 i = 0; i < k; i++) {
            h[i] = new uint256[](n);
            // REMOVED: redundant zero-init loop — new uint256[](n) is already zeroed

            uint256 omegaVal = uint8(hBytes[OMEGA + i]);

            if (omegaVal < kIdx || omegaVal > OMEGA) {
                return (false, h);
            }

            for (uint256 j = kIdx; j < omegaVal; j++) {
                if (j > kIdx && uint8(hBytes[j]) <= uint8(hBytes[j - 1])) {
                    return (false, h);
                }

                uint256 index = uint8(hBytes[j]);
                if (index >= n) {
                    return (false, h);
                }

                h[i][index] = 1;
            }

            kIdx = omegaVal;
        }

        for (uint256 j = kIdx; j < OMEGA; j++) {
            if (uint8(hBytes[j]) != 0) {
                return (false, h);
            }
        }
    }

    return (true, h);
}

function unpackZ(bytes memory inputBytes) pure returns (uint256[][] memory coefficients) {
    uint256 coeffBits;
    uint256 requiredBytes;

    uint256 _gamma1 = GAMMA_1;

    unchecked {
        if (_gamma1 == 131072) {
            coeffBits = 18;
            requiredBytes = (n * l * 18) >> 3;
        } else if (_gamma1 == 524288) {
            coeffBits = 20;
            requiredBytes = (n * l * 20) >> 3;
        } else {
            revert("GAMMA_1 must be either 2^17 or 2^19");
        }
    }

    require(inputBytes.length >= requiredBytes, "Insufficient data");

    uint256 _l = l;
    uint256 _n = n;
    uint256 _q = q;

    coefficients = new uint256[][](_l);
    uint256 bitOffset = 0;

    unchecked {
        for (uint256 i = 0; i < _l; ++i) {
            uint256[] memory alteredCoeffs = bitUnpackAtOffset(inputBytes, coeffBits, bitOffset, _n);
            uint256[] memory coeffs = new uint256[](_n);

            for (uint256 j = 0; j < _n; ++j) {
                uint256 alteredCoeff = alteredCoeffs[j];
                coeffs[j] = alteredCoeff < _gamma1 ? _gamma1 - alteredCoeff : _q + _gamma1 - alteredCoeff;
            }

            coefficients[i] = coeffs;
            bitOffset += _n * coeffBits;
        }
    }

    return coefficients;
}

/**
 * OPTIMIZATION: Assembly-based normH counting.
 * Walks memory directly instead of double-array dereference per element.
 * Saves ~5k-8k gas.
 */
function dilithiumCore1(Signature memory signature)
    pure
    returns (bool foo, uint256 normH, uint256[][] memory h, uint256[][] memory z)
{
    (foo, h) = unpackH(signature.h);

    normH = 0;
    // Assembly: walk the h arrays directly in memory
    assembly {
        for { let i := 0 } lt(i, 4) { i := add(i, 1) } {
            // h is at memory location: h_ptr -> [length][ptr0][ptr1][ptr2][ptr3]
            // h[i] is a pointer to a uint256[] of length 256
            let hi_ptr := mload(add(add(h, 32), mul(i, 32)))  // h[i] pointer
            let data_ptr := add(hi_ptr, 32) // skip length prefix
            for { let j := 0 } lt(j, 256) { j := add(j, 1) } {
                normH := add(normH, eq(mload(add(data_ptr, mul(j, 32))), 1))
            }
        }
    }

    z = unpackZ(signature.z);
}

function dilithiumCore2(
    PubKey memory pk,
    uint256[][] memory z,
    uint256[] memory cNtt,
    uint256[][] memory h,
    uint256[][] memory t1New
) pure returns (bytes memory wPrimeBytes) {
    // NTT(z)
    for (uint256 i = 0; i < 4; i++) {
        z[i] = nttFw(z[i]);
    }

    // 1. A*z
    uint256[][][] memory aHat = expandMat(pk.aHat);
    z = matVecProductDilithium(aHat, z);

    // 2. A*z - c*t1
    for (uint256 i = 0; i < 4; i++) {
        z[i] = nttInv(vecSubMod(z[i], vecMulMod(t1New[i], cNtt)));
    }

    // 3. w_prime packed
    wPrimeBytes = useHintDilithium(h, z);
}
