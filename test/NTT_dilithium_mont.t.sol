// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Test, console} from "forge-std/Test.sol";
import {nttFw, nttInv} from "../src/ZKNOX_NTT_dilithium.sol";
import {
    nttFwMont,
    nttFwMontLazy,
    nttInvMont,
    nttFwMontPackedFusedTb,
    nttFwMontPackedFusedTbSplit,
    _tablesMont
} from "../src/ZKNOX_NTT_dilithium_mont.sol";
import {_splitLanes} from "../src/ZKNOX_dilithium_core_packed.sol";
import {q} from "../src/ZKNOX_dilithium_utils.sol";

/// Differential tests of the packed Montgomery transforms against the scalar
/// nttFw / nttInv (themselves pinned to the python reference in
/// test/NTT_dilithium.t.sol).
contract NTT_DilithiumMontTest is Test {
    function _poly(uint256 seed) internal pure returns (uint256[] memory p) {
        p = new uint256[](256);
        for (uint256 i = 0; i < 256; i++) {
            p[i] = uint256(keccak256(abi.encodePacked(seed, i))) % q;
        }
    }

    function _copy(uint256[] memory p) internal pure returns (uint256[] memory c) {
        c = new uint256[](256);
        for (uint256 i = 0; i < 256; i++) {
            c[i] = p[i];
        }
    }

    function _saturated() internal pure returns (uint256[] memory p) {
        p = new uint256[](256);
        for (uint256 i = 0; i < 256; i++) {
            p[i] = q - 1;
        }
    }

    function _assertEq(uint256[] memory a, uint256[] memory b) internal pure {
        for (uint256 i = 0; i < 256; i++) {
            require(a[i] < q, "not canonical");
            require(a[i] == b[i], "transform differs");
        }
    }

    function test_fw_repo_vector() public pure {
        uint256[] memory p = new uint256[](256);
        for (uint256 i = 0; i < 256; i++) {
            p[i] = i;
        }
        uint256[] memory r = nttFw(_copy(p));
        assertEq(r[0], 8023823);
        _assertEq(nttFwMont(p), r);
    }

    function test_fw_matches_scalar() public pure {
        for (uint256 s = 0; s < 8; s++) {
            uint256[] memory p = _poly(s);
            _assertEq(nttFwMont(_copy(p)), nttFw(p));
        }
        _assertEq(nttFwMont(_saturated()), nttFw(_saturated()));
        _assertEq(nttFwMont(new uint256[](256)), nttFw(new uint256[](256)));
    }

    function testFuzz_fw_matches_scalar(uint256 seed) public pure {
        uint256[] memory p = _poly(seed);
        _assertEq(nttFwMont(_copy(p)), nttFw(p));
    }

    function test_inv_matches_scalar() public pure {
        for (uint256 s = 0; s < 8; s++) {
            uint256[] memory p = _poly(100 + s);
            _assertEq(nttInvMont(_copy(p)), nttInv(p));
        }
        _assertEq(nttInvMont(_saturated()), nttInv(_saturated()));
        _assertEq(nttInvMont(new uint256[](256)), nttInv(new uint256[](256)));
    }

    function testFuzz_inv_matches_scalar(uint256 seed) public pure {
        uint256[] memory p = _poly(seed);
        _assertEq(nttInvMont(_copy(p)), nttInv(p));
    }

    /// lazy variant: congruent mod q, every coefficient < 17q
    function test_fw_lazy_matches_scalar_mod_q() public pure {
        for (uint256 s = 0; s < 6; s++) {
            uint256[] memory p = s == 0 ? _saturated() : _poly(300 + s);
            uint256[] memory r = nttFw(_copy(p));
            uint256[] memory l = nttFwMontLazy(p);
            for (uint256 i = 0; i < 256; i++) {
                require(l[i] < 17 * q, "lazy coefficient exceeds 17q");
                require(l[i] % q == r[i], "lazy transform differs mod q");
            }
        }
    }

    function testFuzz_fw_lazy_matches_scalar_mod_q(uint256 seed) public pure {
        uint256[] memory p = _poly(seed);
        uint256[] memory r = nttFw(_copy(p));
        uint256[] memory l = nttFwMontLazy(p);
        for (uint256 i = 0; i < 256; i++) {
            require(l[i] < 17 * q && l[i] % q == r[i], "lazy transform differs mod q");
        }
    }

    function test_roundtrip() public pure {
        for (uint256 s = 0; s < 4; s++) {
            uint256[] memory p = _poly(200 + s);
            _assertEq(nttInvMont(nttFwMont(_copy(p))), p);
            _assertEq(nttInv(nttFwMont(_copy(p))), p);
            _assertEq(nttInvMont(nttFw(_copy(p))), p);
        }
    }

    /// inputs with a single nonzero coefficient hit every twiddle of one path
    function test_impulses() public pure {
        for (uint256 i = 0; i < 256; i += 17) {
            uint256[] memory p = new uint256[](256);
            p[i] = q - 1 - i;
            _assertEq(nttFwMont(_copy(p)), nttFw(_copy(p)));
            _assertEq(nttInvMont(_copy(p)), nttInv(_copy(p)));
        }
    }

    function test_gas() public view {
        uint256[] memory p = _poly(7);
        uint256[] memory a = _copy(p);
        uint256[] memory b = _copy(p);
        uint256 g = gasleft();
        nttFw(a);
        console.log("nttFw scalar     :", g - gasleft());
        g = gasleft();
        nttFwMont(b);
        console.log("nttFwMont packed :", g - gasleft());
        g = gasleft();
        nttInv(a);
        console.log("nttInv scalar    :", g - gasleft());
        g = gasleft();
        nttInvMont(b);
        console.log("nttInvMont packed:", g - gasleft());
    }

    /// the split-output forward kernel writes exactly the lane split
    /// (_splitLanes) of the packed fused kernel's output, word for word
    function testFuzz_fw_split_matches_packed_split(uint256 seed) public pure {
        _checkSplit(_poly(seed));
    }

    function test_fw_split_saturated() public pure {
        _checkSplit(_saturated());
    }

    /// lazy input lanes (x + q < 2q, the verifier's unpackZPackedLazy form):
    /// same split as the canonical input mod q, every lane under 17q
    function testFuzz_fw_split_lazy_input(uint256 seed) public pure {
        _checkSplitLazy(_poly(seed));
    }

    function test_fw_split_lazy_saturated() public pure {
        _checkSplitLazy(_saturated());
    }

    function _checkSplitLazy(uint256[] memory p) internal pure {
        (uint256 tb,) = _tablesMont();
        uint256 dRef;
        uint256 dLazy;
        assembly ("memory-safe") {
            dRef := mload(0x40)
            dLazy := add(dRef, 0x1000)
            mstore(0x40, add(dRef, 0x2000))
        }
        nttFwMontPackedFusedTbSplit(_packCanonical(p), tb, dRef);
        uint256[] memory lazy = _packCanonical(p);
        for (uint256 w = 0; w < 64; w++) {
            lazy[w] += (q | (q << 64) | (q << 128) | (q << 192));
        }
        nttFwMontPackedFusedTbSplit(lazy, tb, dLazy);
        for (uint256 w = 0; w < 128; w++) {
            uint256 x;
            uint256 y;
            assembly ("memory-safe") {
                x := mload(add(dRef, shl(5, w)))
                y := mload(add(dLazy, shl(5, w)))
            }
            uint256 sh = (w & 1) == 0 ? 0 : 32;
            for (uint256 k = 0; k < 2; k++) {
                uint256 xv = (x >> (sh + 64 * k)) & 0xffffffff;
                uint256 yv = (y >> (sh + 64 * k)) & 0xffffffff;
                require(yv < 17 * q, "lazy input: lane bound");
                require(xv % q == yv % q, "lazy input: differs mod q");
            }
            require((y & ~((uint256(0xffffffff) << sh) | (uint256(0xffffffff) << (sh + 64)))) == 0, "stray bits");
        }
    }

    function _checkSplit(uint256[] memory p) internal pure {
        (uint256 tb,) = _tablesMont();
        // reference: the packed fused kernel, then the split (zHat column 0, the rest ignored)
        uint256[] memory a = nttFwMontPackedFusedTb(_packCanonical(p), tb);
        uint256[][] memory zHat = new uint256[][](4);
        for (uint256 j = 0; j < 4; j++) {
            zHat[j] = a;
        }
        uint256 zs = _splitLanes(zHat, a);
        // candidate
        uint256 d;
        assembly ("memory-safe") {
            d := mload(0x40)
            mstore(0x40, add(d, 0x1000))
        }
        nttFwMontPackedFusedTbSplit(_packCanonical(p), tb, d);
        for (uint256 w = 0; w < 128; w++) {
            uint256 x;
            uint256 y;
            assembly ("memory-safe") {
                x := mload(add(zs, shl(5, w)))
                y := mload(add(d, shl(5, w)))
            }
            require(x == y, "split kernel differs");
        }
    }

    /// 256 canonical coefficients to the packed layout (lane j of word w = coefficient 4w + j)
    function _packCanonical(uint256[] memory p) internal pure returns (uint256[] memory A) {
        A = new uint256[](64);
        for (uint256 w = 0; w < 64; w++) {
            A[w] = p[4 * w] | (p[4 * w + 1] << 64) | (p[4 * w + 2] << 128) | (p[4 * w + 3] << 192);
        }
    }
}
