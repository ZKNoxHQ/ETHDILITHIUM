// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Test, console} from "forge-std/Test.sol";
import {nttFw, nttInv} from "../src/ZKNOX_NTT_dilithium.sol";
import {nttFwMont, nttFwMontLazy, nttInvMont} from "../src/ZKNOX_NTT_dilithium_mont.sol";
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
}
