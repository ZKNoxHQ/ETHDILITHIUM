// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Test, console} from "forge-std/Test.sol";
import "../src/ZKNOX_dilithium_utils.sol";
import {
    dilithiumCore1Packed65,
    dilithiumCore2Packed65,
    unpackZPacked65,
    useHintPacked65,
    _matvecRowPacked65,
    _hintMasks65,
    _hintMasksFromBytes65,
    _checkHintBytes65,
    readPubKeyCalldata65,
    POLY_BYTES65,
    KEY_POLYS65,
    KEY_BYTES65
} from "../src/ZKNOX_dilithium65_core_packed.sol";
import {BadPubKeyBlob, packPoly} from "../src/ZKNOX_dilithium_core_packed.sol";
import {
    unpackH65,
    unpackZ65,
    zNormOk65,
    useHintDilithium65,
    useHint65,
    dilithiumCore2_65
} from "../src/ZKNOX_dilithium65_core.sol";
import {OMEGA65, GAMMA2_65, TAU65} from "../src/ZKNOX_dilithium65_utils.sol";
import {nttFw, nttInv} from "../src/ZKNOX_NTT_dilithium.sol";
import {nttFwMontPacked, nttInvMontPackedRaw} from "../src/ZKNOX_NTT_dilithium_mont.sol";
import {sampleInBallNist} from "../src/ZKNOX_SampleInBall.sol";
import {sampleInBallFastTau} from "../src/ZKNOX_shake_fast.sol";
import {F1600Helper} from "./F1600Helper.sol";

/// external wrapper so that vm.expectRevert can observe readPubKeyCalldata65's revert
contract PkReader65 {
    function read(bytes calldata key) external pure returns (PubKey memory) {
        return readPubKeyCalldata65(key);
    }
}

/// Differential tests of the ML-DSA-65 packed stages against the scalar ones
/// (ZKNOX_dilithium65_core.sol), on the NIST KAT (count 0 of
/// PQCsignKAT_Dilithium3.rsp, test/KAT/mldsa65_kat0.json) and on fuzzed inputs.
contract Dilithium65CorePackedTest is Test {
    uint256 constant Q30 = q << 30;

    function _kat0() internal view returns (string memory) {
        return vm.readFile("test/KAT/mldsa65_kat0.json");
    }

    /// the KAT key as the verifier takes it, and the key decoded independently
    /// of readPubKeyCalldata65 as the reference
    function _katKey() internal view returns (bytes memory key, PubKey memory ref) {
        key = vm.parseJsonBytes(_kat0(), ".blob");
        assertEq(key.length, KEY_BYTES65);
        ref.aHat = new uint256[][][](6);
        ref.t1 = new uint256[][](6);
        for (uint256 i = 0; i < 6; i++) {
            ref.aHat[i] = new uint256[][](5);
        }
        // flat index f: f < 30 is A[f / 5][f % 5], f >= 30 is t1[f - 30]
        for (uint256 f = 0; f < KEY_POLYS65; f++) {
            uint256[] memory poly = _readPolyAt(key, f * POLY_BYTES65);
            if (f < 30) ref.aHat[f / 5][f % 5] = poly;
            else ref.t1[f - 30] = poly;
        }
        ref.tr = slice(key, KEY_POLYS65 * POLY_BYTES65 + 32, 64);
        assertEq(keccak256(ref.tr), keccak256(vm.parseJsonBytes(_kat0(), ".tr")));
    }

    /// one [32][32 words] polynomial of the key, read as the verifier reads it
    function _readPolyAt(bytes memory blob, uint256 offset) internal pure returns (uint256[] memory poly) {
        uint256 len;
        assembly {
            len := mload(add(add(blob, 32), offset))
        }
        assertEqUint(len, 32);
        poly = new uint256[](32);
        for (uint256 w = 0; w < 32; w++) {
            uint256 v;
            assembly {
                v := mload(add(add(add(blob, 64), offset), mul(w, 32)))
            }
            poly[w] = v;
        }
    }

    /// `n` polynomials taken from `polys` starting at `from`, tr appended when given
    function _run(uint256[][] memory polys, uint256 from, uint256 n, bytes memory trailer)
        internal
        pure
        returns (bytes memory out)
    {
        for (uint256 i = 0; i < n; i++) {
            out = abi.encodePacked(out, uint256(32), polys[from + i]);
        }
        if (trailer.length > 0) out = abi.encodePacked(out, uint256(trailer.length), trailer);
    }

    /// the 36 polynomials of a key in reading order
    function _flatPolys(PubKey memory pk) internal pure returns (uint256[][] memory polys) {
        polys = new uint256[][](36);
        for (uint256 f = 0; f < 36; f++) {
            polys[f] = f < 30 ? pk.aHat[f / 5][f % 5] : pk.t1[f - 30];
        }
    }

    function _katSignature() internal view returns (Signature memory sig) {
        bytes memory s = vm.parseJsonBytes(_kat0(), ".sig");
        require(s.length == 3309, "kat0 signature length");
        sig = Signature({cTilde: slice(s, 0, 48), z: slice(s, 48, 3200), h: slice(s, 3248, 61)});
    }

    function _poly(uint256 seed) internal pure returns (uint256[] memory p) {
        p = new uint256[](256);
        for (uint256 i = 0; i < 256; i++) {
            p[i] = uint256(keccak256(abi.encodePacked(seed, i))) % q;
        }
    }

    function _compactPoly(uint256 seed) internal pure returns (uint256[] memory c) {
        c = new uint256[](32);
        for (uint256 m = 0; m < 32; m++) {
            uint256 w;
            for (uint256 f = 0; f < 8; f++) {
                w |= (uint256(keccak256(abi.encodePacked(seed, m, f))) % q) << (32 * f);
            }
            c[m] = w;
        }
    }

    function _lane(uint256[] memory A, uint256 i) internal pure returns (uint256) {
        return (A[i >> 2] >> (64 * (i & 3))) & 0xffffffffffffffff;
    }

    function _copy(uint256[] memory p) internal pure returns (uint256[] memory c) {
        c = new uint256[](p.length);
        for (uint256 i = 0; i < p.length; i++) {
            c[i] = p[i];
        }
    }

    /* ------------------------------------------------------------ key blob */

    /// zero-copy key read: same polynomials and tr as the independent decode,
    /// malformed keys rejected. The key is never stored, so its whole shape
    /// check is its length plus the length word in front of each polynomial.
    function test_readPubKeyCalldata65() public {
        (bytes memory key, PubKey memory ref) = _katKey();
        PkReader65 reader = new PkReader65();
        PubKey memory got = reader.read(key);
        assertEq(keccak256(got.tr), keccak256(ref.tr));
        assertEq(got.aHat.length, 6);
        assertEq(got.t1.length, 6);
        for (uint256 i = 0; i < 6; i++) {
            assertEq(got.aHat[i].length, 5);
            assertEq(keccak256(abi.encodePacked(got.t1[i])), keccak256(abi.encodePacked(ref.t1[i])));
            for (uint256 j = 0; j < 5; j++) {
                assertEq(keccak256(abi.encodePacked(got.aHat[i][j])), keccak256(abi.encodePacked(ref.aHat[i][j])));
            }
        }
        // the key rebuilt from the reference is the one read
        uint256[][] memory polys = _flatPolys(ref);
        assertEq(keccak256(_run(polys, 0, KEY_POLYS65, ref.tr)), keccak256(key));

        // one polynomial short, one too many, empty
        vm.expectRevert(BadPubKeyBlob.selector);
        reader.read(_run(polys, 0, KEY_POLYS65 - 1, ref.tr));
        vm.expectRevert(BadPubKeyBlob.selector);
        reader.read(abi.encodePacked(key, _run(polys, 0, 1, bytes(""))));
        vm.expectRevert(BadPubKeyBlob.selector);
        reader.read("");
        // the right length, one byte off
        vm.expectRevert(BadPubKeyBlob.selector);
        reader.read(slice(key, 0, KEY_BYTES65 - 1));
        // no tr, and a tr of 32 bytes
        vm.expectRevert(BadPubKeyBlob.selector);
        reader.read(_run(polys, 0, KEY_POLYS65, bytes("")));
        vm.expectRevert(BadPubKeyBlob.selector);
        reader.read(_run(polys, 0, KEY_POLYS65, new bytes(32)));
        // tr of the right size behind a length word of 32: right total length, rejected
        bytes memory bad = abi.encodePacked(_run(polys, 0, KEY_POLYS65, bytes("")), uint256(32), ref.tr);
        assertEq(bad.length, KEY_BYTES65);
        vm.expectRevert(BadPubKeyBlob.selector);
        reader.read(bad);
        // a polynomial announcing 31 words: right total length, rejected on the length word
        for (uint256 f = 0; f < KEY_POLYS65; f += 7) {
            bad = bytes.concat(key);
            uint256 at = 32 + f * POLY_BYTES65;
            assembly {
                mstore(add(bad, at), 31)
            }
            vm.expectRevert(BadPubKeyBlob.selector);
            reader.read(bad);
        }
        // two polynomials swapped: well formed, another key
        bad = bytes.concat(key);
        for (uint256 i = 0; i < POLY_BYTES65; i++) {
            (bad[i], bad[POLY_BYTES65 + i]) = (key[POLY_BYTES65 + i], key[i]);
        }
        PubKey memory swapped = reader.read(bad);
        assertEq(keccak256(abi.encodePacked(swapped.aHat[0][0])), keccak256(abi.encodePacked(ref.aHat[0][1])));
    }

    /* ------------------------------------------------------------ z decode */

    function _assertZ(bytes memory zb) internal pure {
        (uint256[][] memory zp, bool normOk) = unpackZPacked65(zb);
        uint256[][] memory zRef = unpackZ65(zb);
        assertEq(zp.length, 5);
        for (uint256 i = 0; i < 5; i++) {
            assertEq(zp[i].length, 64);
            for (uint256 j = 0; j < 256; j++) {
                require(_lane(zp[i], j) == zRef[i][j], "z lane differs");
            }
        }
        require(normOk == zNormOk65(zRef), "norm verdict differs");
    }

    /// the KAT's z: same values as the scalar decode, norm accepted
    function test_unpackZPacked65_real_signature() public view {
        bytes memory zb = _katSignature().z;
        _assertZ(zb);
        (, bool normOk) = unpackZPacked65(zb);
        require(normOk, "real signature must pass the norm");
    }

    /// random bytes: mostly out of norm, every field value exercised
    function testFuzz_unpackZPacked65(bytes32 seed) public pure {
        bytes memory zb = new bytes(3200);
        for (uint256 i = 0; i < 3200; i += 32) {
            bytes32 w = keccak256(abi.encodePacked(seed, i));
            for (uint256 kk = 0; kk < 32; kk++) {
                zb[i + kk] = w[kk];
            }
        }
        _assertZ(zb);
    }

    /// random in-norm fields (z = 0 mostly, some at random in-range values):
    /// the packed decode accepts and agrees with the scalar one
    function testFuzz_unpackZPacked65_inNorm(bytes32 seed) public pure {
        bytes memory zb = new bytes(3200);
        for (uint256 g = 0; g < 320; g++) {
            uint256 V;
            for (uint256 f = 0; f < 4; f++) {
                // f in [197, 1048379]
                uint256 v = 197 + uint256(keccak256(abi.encodePacked(seed, g, f))) % (1048379 - 197 + 1);
                V |= v << (20 * f);
            }
            for (uint256 b = 0; b < 10; b++) {
                zb[10 * g + b] = bytes1(uint8(V >> (8 * b)));
            }
        }
        _assertZ(zb);
        (, bool normOk) = unpackZPacked65(zb);
        require(normOk, "in-norm fields must be accepted");
    }

    /// fields at the norm boundary: 196 / 197 and 1048379 / 1048380, in every lane position
    function test_unpackZPacked65_boundaries() public pure {
        uint256[4] memory vals = [uint256(196), 197, 1048379, 1048380];
        for (uint256 v = 0; v < 4; v++) {
            for (uint256 pos = 0; pos < 4; pos++) {
                bytes memory zb = new bytes(3200);
                // all fields = 524288 (z = 0) except one field per group at `pos`
                for (uint256 g = 0; g < 320; g++) {
                    uint256 V;
                    for (uint256 f = 0; f < 4; f++) {
                        V |= (f == pos ? vals[v] : 524288) << (20 * f);
                    }
                    for (uint256 b = 0; b < 10; b++) {
                        zb[10 * g + b] = bytes1(uint8(V >> (8 * b)));
                    }
                }
                _assertZ(zb);
                (, bool normOk) = unpackZPacked65(zb);
                require(normOk == (v == 1 || v == 2), "boundary verdict");
            }
        }
    }

    /// the whole 20-bit range of one field, every other field at z = 0
    function test_unpackZPacked65_sweep() public pure {
        bytes memory zb = new bytes(3200);
        // 1280 fields: values 0..1279, 524288 - 640 .. 524288 + 639, 2^20 - 1280 .. 2^20 - 1
        // over three passes
        uint256[3] memory bases = [uint256(0), 524288 - 640, (1 << 20) - 1280];
        for (uint256 pass = 0; pass < 3; pass++) {
            for (uint256 c = 0; c < 1280; c++) {
                uint256 v = bases[pass] + c;
                uint256 bit = 20 * c;
                for (uint256 b = 0; b < 3; b++) {
                    uint256 byteIdx = (bit >> 3) + b;
                    uint256 shift = 8 * b;
                    zb[byteIdx] = bytes1(uint8(uint8(zb[byteIdx]) | uint8(((v << (bit & 7)) >> shift) & 0xff)));
                }
            }
            _assertZ(zb);
            zb = new bytes(3200);
        }
    }

    /* --------------------------------------------------------------- hints */

    /// hint encoding validation against unpackH65, on the KAT and corruptions of it
    function test_checkHintBytes65() public view {
        bytes memory hb = _katSignature().h;
        (bool ok, uint256 count) = _checkHintBytes65(hb);
        (bool okRef, uint256[][] memory h) = unpackH65(hb);
        require(ok && okRef, "valid encoding rejected");
        uint256 w;
        for (uint256 i = 0; i < 6; i++) {
            for (uint256 j = 0; j < 256; j++) {
                w += h[i][j];
            }
        }
        require(count == w && count <= OMEGA65, "weight differs");
        // the masks from the bytes equal the masks from the arrays
        uint256[6] memory m1 = _hintMasksFromBytes65(hb);
        uint256[6] memory m2 = _hintMasks65(h);
        for (uint256 i = 0; i < 6; i++) {
            assertEq(m1[i], m2[i]);
        }
        // corruptions: both must reject
        bytes memory bad = abi.encodePacked(hb);
        bad[60] = bytes1(uint8(56)); // last count above omega
        _bothReject(bad);
        bad = abi.encodePacked(hb);
        bad[55] = bytes1(uint8(uint8(hb[60]) + 1)); // first count above the last
        _bothReject(bad);
        bad = abi.encodePacked(hb);
        bad[54] = 0x01; // unused index byte not zero
        _bothReject(bad);
        if (uint8(hb[55]) >= 2) {
            bad = abi.encodePacked(hb);
            bad[1] = hb[0]; // non-increasing indices
            _bothReject(bad);
        }
        // wrong lengths
        _bothReject(abi.encodePacked(hb, hex"00"));
        bad = new bytes(60);
        for (uint256 i = 0; i < 60; i++) {
            bad[i] = hb[i];
        }
        _bothReject(bad);
    }

    function _bothReject(bytes memory hb) internal pure {
        (bool ok,) = _checkHintBytes65(hb);
        (bool okRef,) = unpackH65(hb);
        require(!ok && !okRef, "corruption not rejected by both");
    }

    /// random valid encodings of random weight: accepted, masks as from the arrays
    function testFuzz_hintBytes65(bytes32 seed, uint8 weight) public pure {
        uint256 total = weight % 56; // 0..55
        bytes memory hb = new bytes(61);
        uint256 idx;
        for (uint256 i = 0; i < 6; i++) {
            // this polynomial takes a share of the remaining weight
            uint256 share = i == 5 ? total - idx : uint256(keccak256(abi.encodePacked(seed, i))) % (total - idx + 1);
            // `share` strictly increasing indices in [0, 256): steps of 1..4,
            // so at most 3 + 4 * 54 = 219
            uint256 last = 0;
            for (uint256 s = 0; s < share; s++) {
                uint256 step = 1 + uint256(keccak256(abi.encodePacked(seed, i, s))) % 4;
                uint256 v = s == 0 ? (step - 1) : last + step;
                hb[idx] = bytes1(uint8(v));
                last = v;
                idx++;
            }
            hb[55 + i] = bytes1(uint8(idx));
        }
        (bool ok, uint256 count,) = _checkAll(hb);
        (bool okRef, uint256[][] memory h) = unpackH65(hb);
        require(ok == okRef, "verdicts differ");
        if (ok) {
            require(count == total, "weight");
            uint256[6] memory m1 = _hintMasksFromBytes65(hb);
            uint256[6] memory m2 = _hintMasks65(h);
            for (uint256 i = 0; i < 6; i++) {
                assertEq(m1[i], m2[i]);
            }
        }
    }

    function _checkAll(bytes memory hb) internal pure returns (bool ok, uint256 count, uint256[6] memory masks) {
        (ok, count) = _checkHintBytes65(hb);
        masks = _hintMasksFromBytes65(hb);
    }

    /* -------------------------------------------------------------- matvec */

    struct RowFixture {
        uint256[][] aRow;
        uint256[][] zHat;
        uint256[][] aRowE;
        uint256[][] zE;
        uint256[] t1i;
        uint256[] t1E;
        uint256[] cNtt;
        uint256[] cHat;
    }

    function _rowFixture(uint256 seed) internal pure returns (RowFixture memory f) {
        f.aRow = new uint256[][](5);
        f.zHat = new uint256[][](5);
        f.aRowE = new uint256[][](5);
        f.zE = new uint256[][](5);
        for (uint256 j = 0; j < 5; j++) {
            f.aRow[j] = _compactPoly(seed ^ j);
            f.aRowE[j] = expand(f.aRow[j]);
            uint256[] memory zj = _poly(seed ^ (10 + j));
            f.zE[j] = nttFw(_copy(zj));
            f.zHat[j] = nttFwMontPacked(zj);
        }
        f.t1i = _compactPoly(seed ^ 20);
        f.t1E = expand(f.t1i);
        uint256[] memory cc = _poly(seed ^ 21);
        f.cNtt = nttFw(_copy(cc));
        f.cHat = nttFwMontPacked(cc);
    }

    function _refRow(RowFixture memory f) internal pure returns (uint256[] memory r) {
        r = new uint256[](256);
        for (uint256 i = 0; i < 256; i++) {
            uint256 s;
            for (uint256 j = 0; j < 5; j++) {
                s = addmod(s, mulmod(f.aRowE[j][i], f.zE[j][i], q), q);
            }
            r[i] = addmod(s, q - mulmod(f.t1E[i], f.cNtt[i], q), q);
        }
    }

    /// random matrix row of five columns: the packed accumulator, reduced,
    /// equals A.z - c.t1 of the scalar path, its lanes stay under q*2^30 (the
    /// bound the inverse transform's folded reduction needs), and its inverse
    /// transform equals the scalar one
    function testFuzz_matvec_row65(uint256 seed) public pure {
        RowFixture memory f = _rowFixture(seed);
        uint256[] memory acc = _matvecRowPacked65(f.aRow, f.zHat, f.cHat, f.t1i);
        uint256[] memory r = _refRow(f);
        for (uint256 i = 0; i < 256; i++) {
            uint256 lane = _lane(acc, i);
            require(lane < Q30, "accumulator lane bound");
            require(lane % q == r[i], "row differs");
        }
        r = nttInv(r);
        nttInvMontPackedRaw(acc);
        for (uint256 i = 0; i < 256; i++) {
            require(_lane(acc, i) == r[i], "inverse of the row differs");
        }
    }

    /// worst case of the lane bound: every key field q - 1, every lazy z lane
    /// and c lane at their maximum 16q - 1, t1 fields 0 (nothing subtracted)
    function test_matvec_row65_saturated() public pure {
        uint256 maxLane = 16 * q - 1;
        uint256[][] memory aRow = new uint256[][](5);
        uint256[][] memory zHat = new uint256[][](5);
        uint256 fullFields;
        for (uint256 f = 0; f < 8; f++) {
            fullFields |= (q - 1) << (32 * f);
        }
        uint256 fullLanes;
        for (uint256 ln = 0; ln < 4; ln++) {
            fullLanes |= maxLane << (64 * ln);
        }
        for (uint256 j = 0; j < 5; j++) {
            aRow[j] = new uint256[](32);
            zHat[j] = new uint256[](64);
            for (uint256 m = 0; m < 32; m++) {
                aRow[j][m] = fullFields;
            }
            for (uint256 m = 0; m < 64; m++) {
                zHat[j][m] = fullLanes;
            }
        }
        uint256[] memory cHat = new uint256[](64);
        for (uint256 m = 0; m < 64; m++) {
            cHat[m] = fullLanes;
        }
        uint256[] memory t1i = new uint256[](32);
        uint256[] memory acc = _matvecRowPacked65(aRow, zHat, cHat, t1i);
        uint256 expected = 5 * maxLane * (q - 1) + (q << 28);
        require(expected < Q30, "bound arithmetic");
        for (uint256 i = 0; i < 256; i++) {
            assertEq(_lane(acc, i), expected);
        }
        // and with t1 fields at q - 1: the subtraction never borrows
        for (uint256 m = 0; m < 32; m++) {
            t1i[m] = fullFields;
        }
        acc = _matvecRowPacked65(aRow, zHat, cHat, t1i);
        expected = expected - maxLane * (q - 1);
        for (uint256 i = 0; i < 256; i++) {
            assertEq(_lane(acc, i), expected);
        }
    }

    /* ------------------------------------------------------------- useHint */

    /// useHint on random canonical inputs with random hints, packed vs scalar
    function testFuzz_useHint65(uint256 seed, uint256 density) public pure {
        uint256[][] memory h = new uint256[][](6);
        uint256[][] memory rE = new uint256[][](6);
        uint256[][] memory rP = new uint256[][](6);
        uint256 dens = 1 + density % 8;
        for (uint256 i = 0; i < 6; i++) {
            h[i] = new uint256[](256);
            rE[i] = _poly(seed ^ (100 + i));
            rP[i] = new uint256[](64);
            for (uint256 j = 0; j < 256; j++) {
                h[i][j] = uint256(keccak256(abi.encodePacked(seed, i, j))) % dens == 0 ? 1 : 0;
                rP[i][j >> 2] |= rE[i][j] << (64 * (j & 3));
            }
        }
        assertEq(keccak256(useHintPacked65(_hintMasks65(h), rP)), keccak256(useHintDilithium65(h, rE)));
    }

    /// the boundary values of Decompose (gamma2 = 261888), every lane position, both hint values
    function test_useHint65_boundaries() public pure {
        uint256 g2 = GAMMA2_65;
        uint256[24] memory vals = [
            uint256(0),
            1,
            g2 - 1,
            g2,
            g2 + 1,
            2 * g2 - 1,
            2 * g2,
            2 * g2 + 1,
            3 * g2,
            3 * g2 + 1,
            4 * g2 - 1,
            4 * g2,
            4 * g2 + 1,
            (q - 1) / 2,
            (q - 1) / 2 + 1,
            15 * 2 * g2 - 1,
            15 * 2 * g2,
            15 * 2 * g2 + 1,
            q - 2 * g2 - 1,
            q - 2 * g2,
            q - g2 - 1,
            q - g2,
            q - 2,
            q - 1
        ];
        for (uint256 hv = 0; hv < 2; hv++) {
            for (uint256 rot = 0; rot < 4; rot++) {
                uint256[][] memory h = new uint256[][](6);
                uint256[][] memory rE = new uint256[][](6);
                uint256[][] memory rP = new uint256[][](6);
                for (uint256 i = 0; i < 6; i++) {
                    h[i] = new uint256[](256);
                    rE[i] = new uint256[](256);
                    rP[i] = new uint256[](64);
                    for (uint256 j = 0; j < 256; j++) {
                        uint256 v = vals[(j + rot + i) % 24];
                        rE[i][j] = v;
                        rP[i][j >> 2] |= v << (64 * (j & 3));
                        h[i][j] = (hv == 1 && (j + i) % 3 != 0) ? 1 : 0;
                    }
                }
                assertEq(keccak256(useHintPacked65(_hintMasks65(h), rP)), keccak256(useHintDilithium65(h, rE)));
            }
        }
    }

    /// every multiple of 2 gamma2 and its neighbours (the a1 steps), both hints:
    /// the scalar UseHint against a direct transcription of FIPS 204
    function test_useHint65_scalar_steps() public pure {
        uint256 twoG2 = 2 * GAMMA2_65;
        for (uint256 a1 = 0; a1 <= 16; a1++) {
            // r = a1 * 2 gamma2 - 1, a1 * 2 gamma2, a1 * 2 gamma2 + 1 (when in [0, q))
            for (uint256 dd = 0; dd < 3; dd++) {
                if (a1 == 0 && dd == 0) continue;
                uint256 r = a1 * twoG2 + dd - 1;
                if (r >= q) continue;
                for (uint256 hv = 0; hv < 2; hv++) {
                    assertEq(useHint65(hv, r), _fipsUseHint(hv, r));
                }
            }
        }
    }

    /// FIPS 204 Alg. 36 / 40 with plain integer arithmetic
    function _fipsUseHint(uint256 hv, uint256 r) internal pure returns (uint256) {
        uint256 twoG2 = 2 * GAMMA2_65;
        int256 rp = int256(r % q);
        int256 r0 = rp % int256(twoG2);
        if (r0 > int256(GAMMA2_65)) r0 -= int256(twoG2);
        int256 r1;
        if (rp - r0 == int256(q) - 1) {
            r1 = 0;
            r0 -= 1;
        } else {
            r1 = (rp - r0) / int256(twoG2);
        }
        if (hv == 0) return uint256(r1);
        if (r0 > 0) return uint256((r1 + 1) % 16);
        return uint256((r1 + 15) % 16);
    }

    function test_hint_masks65() public pure {
        uint256[][] memory h = new uint256[][](6);
        for (uint256 i = 0; i < 6; i++) {
            h[i] = new uint256[](256);
            h[i][i] = 1;
            h[i][255 - i] = 1;
            h[i][100] = 1;
        }
        uint256[6] memory m = _hintMasks65(h);
        for (uint256 i = 0; i < 6; i++) {
            assertEq(m[i], (uint256(1) << i) | (uint256(1) << (255 - i)) | (uint256(1) << 100));
        }
    }

    /* -------------------------------------------------------- SampleInBall */

    /// tau = 49 on the KAT's 48-byte c~ and on random 48-byte inputs: same
    /// polynomial as sampleInBallNist
    function test_sampleInBallFastTau_kat() public {
        address helper = F1600Helper.deploy(vm);
        bytes memory cTilde = _katSignature().cTilde;
        _assertBall(cTilde, helper);
    }

    function testFuzz_sampleInBallFastTau(bytes32 a, bytes16 b) public {
        address helper = F1600Helper.deploy(vm);
        _assertBall(abi.encodePacked(a, b), helper);
    }

    function _assertBall(bytes memory cTilde, address helper) internal view {
        uint256[] memory fast = sampleInBallFastTau(cTilde, TAU65, helper);
        uint256[] memory ref = sampleInBallNist(cTilde, TAU65, q);
        uint256 nz;
        for (uint256 i = 0; i < 256; i++) {
            uint256 v = _lane(fast, i);
            require(v == ref[i], "sampleInBall differs");
            if (v != 0) {
                require(v == 1 || v == q - 1, "coefficient not in {1, q-1}");
                nz++;
            }
        }
        require(nz == TAU65, "weight != tau");
    }

    /* ------------------------------------------------- full second stage */

    /// the KAT's key and signature: the packed second stage gives the same w1
    /// bytes as the scalar one, and the first stage accepts
    function test_core2_packed65_matches_scalar_real_signature() public {
        (bytes memory key,) = _katKey();
        PubKey memory pk = new PkReader65().read(key);
        Signature memory sig = _katSignature();
        address helper = F1600Helper.deploy(vm);

        // packed path
        (bool ok, uint256[][] memory zp, uint256[6] memory masks) = dilithiumCore1Packed65(sig);
        require(ok, "core1 rejected the KAT");
        uint256[] memory cHatIn = sampleInBallFastTau(sig.cTilde, TAU65, helper);
        bytes memory w1Packed = dilithiumCore2Packed65(pk, zp, cHatIn, masks);

        // scalar path
        (bool okH, uint256[][] memory h) = unpackH65(sig.h);
        require(okH, "unpackH65 rejected the KAT");
        uint256[][] memory z = unpackZ65(sig.z);
        require(zNormOk65(z), "scalar norm rejected the KAT");
        uint256[] memory cNtt = nttFw(sampleInBallNist(sig.cTilde, TAU65, q));
        bytes memory w1Scalar = dilithiumCore2_65(pk, z, cNtt, h);

        assertEq(w1Packed.length, 768);
        assertEq(keccak256(w1Packed), keccak256(w1Scalar));
        // and the packed challenge polynomial equals packPoly of the scalar one
        uint256[] memory cPacked = packPoly(sampleInBallNist(sig.cTilde, TAU65, q));
        uint256[] memory cFast = sampleInBallFastTau(sig.cTilde, TAU65, helper);
        assertEq(keccak256(abi.encodePacked(cPacked)), keccak256(abi.encodePacked(cFast)));
    }

    /// the first stage rejects a hint weight above omega and an out-of-norm z
    function test_core1_packed65_rejects() public view {
        Signature memory sig = _katSignature();
        // 56 hints: indices 0..55 in the first polynomial
        bytes memory h = new bytes(61);
        for (uint256 i = 0; i < 56; i++) {
            h[i] = bytes1(uint8(i));
        }
        // counts: 56 would be > omega, so the encoding is invalid as well
        h[55] = bytes1(uint8(56));
        for (uint256 i = 1; i < 6; i++) {
            h[55 + i] = bytes1(uint8(56));
        }
        (bool ok,,) = dilithiumCore1Packed65(Signature({cTilde: sig.cTilde, z: sig.z, h: h}));
        require(!ok, "weight above omega accepted");
        // z with one field at 196 (|z| = gamma1 - beta, rejected by the strict bound)
        bytes memory z = new bytes(3200);
        for (uint256 g = 0; g < 320; g++) {
            uint256 V;
            for (uint256 f = 0; f < 4; f++) {
                V |= uint256(524288) << (20 * f);
            }
            if (g == 7) V = (V & ~uint256(0xfffff)) | 196;
            for (uint256 b = 0; b < 10; b++) {
                z[10 * g + b] = bytes1(uint8(V >> (8 * b)));
            }
        }
        (ok,,) = dilithiumCore1Packed65(Signature({cTilde: sig.cTilde, z: z, h: sig.h}));
        require(!ok, "out-of-norm z accepted");
        // the same z with 197: accepted
        z[70] = bytes1(uint8(197));
        (ok,,) = dilithiumCore1Packed65(Signature({cTilde: sig.cTilde, z: z, h: sig.h}));
        require(ok, "in-norm z rejected");
    }
}
