// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Test, console} from "forge-std/Test.sol";
import "../src/ZKNOX_dilithium_utils.sol";
import {
    dilithiumCore1Packed87,
    dilithiumCore1PackedCalldata87,
    dilithiumCore2Packed87,
    dilithiumCore2Calldata87,
    unpackZPacked87,
    useHintPacked87,
    _matvecRowPacked87,
    _matvecRowInvCCalldata87,
    _splitLanes87,
    _hintMasks87,
    _hintMasksFromBytes87,
    _checkHintBytes87,
    readPubKeyCalldata87,
    checkPubKeyCalldata87,
    POLY_BYTES87,
    KEY_POLYS87,
    KEY_BYTES87
} from "../src/ZKNOX_dilithium87_core_packed.sol";
import {BadPubKeyBlob, packPoly} from "../src/ZKNOX_dilithium_core_packed.sol";
import {
    unpackH87,
    unpackZ87,
    zNormOk87,
    useHintDilithium87,
    dilithiumCore2_87
} from "../src/ZKNOX_dilithium87_core.sol";
import {OMEGA87, GAMMA2_87, TAU87} from "../src/ZKNOX_dilithium87_utils.sol";
import {nttFw, nttInv} from "../src/ZKNOX_NTT_dilithium.sol";
import {
    nttFwMontPacked,
    nttInvMontPackedRaw,
    nttInvMontPackedTailTb,
    _tablesMont
} from "../src/ZKNOX_NTT_dilithium_mont.sol";
import {sampleInBallNist} from "../src/ZKNOX_SampleInBall.sol";
import {sampleInBallFastTau} from "../src/ZKNOX_shake_fast.sol";
import {F1600Helper} from "./F1600Helper.sol";

/// external wrappers for the calldata forms: vm.expectRevert on
/// readPubKeyCalldata87, and the verifier's own kernels on a key and a
/// signature that live in the calldata
contract Harness87 {
    function read(bytes calldata key) external pure returns (PubKey memory) {
        return readPubKeyCalldata87(key);
    }

    function check(bytes calldata key) external pure returns (bool) {
        return checkPubKeyCalldata87(key);
    }

    /// row i of the verifier's second stage: the folded matvec kernel then the
    /// tail of the inverse transform, on transformed (packed, lazy) z and c
    function row(bytes calldata key, uint256 i, uint256[][] memory zHat, uint256[] memory cHat)
        external
        pure
        returns (uint256[] memory acc)
    {
        (, uint256 ti) = _tablesMont();
        uint256 zs = _splitLanes87(zHat, cHat);
        acc = new uint256[](64);
        uint256 aRow;
        uint256 t1;
        assembly {
            aRow := add(key.offset, add(mul(mul(i, 7), POLY_BYTES87), 32))
            t1 := add(key.offset, add(mul(add(56, i), POLY_BYTES87), 32))
        }
        _matvecRowInvCCalldata87(aRow, zs, t1, acc, ti);
        nttInvMontPackedTailTb(acc, ti);
    }

    /// the verifier's two stages on the calldata (w1 bytes), signature split as it splits it
    function core(bytes calldata key, bytes calldata sig, address helper)
        external
        view
        returns (bool ok, bytes memory w1)
    {
        uint256[][] memory z;
        uint256[8] memory masks;
        (ok, z, masks) = dilithiumCore1PackedCalldata87(sig);
        if (!ok) return (false, w1);
        w1 = dilithiumCore2Calldata87(key, z, sampleInBallFastTau(sig[0:64], 60, helper), masks);
    }
}

/// Differential tests of the ML-DSA-87 packed stages against the scalar ones
/// (ZKNOX_dilithium87_core.sol), on the NIST KAT (count 0 of
/// PQCsignKAT_Dilithium5.rsp, test/KAT/mldsa87_kat0.json) and on fuzzed inputs.
contract Dilithium87CorePackedTest is Test {
    uint256 constant Q30 = q << 30;
    uint256 constant Q31 = q << 31;
    uint256 constant MAX_LAZY = 17 * q - 1; // bound of the forward transform's lazy output

    function _kat0() internal view returns (string memory) {
        return vm.readFile("test/KAT/mldsa87_kat0.json");
    }

    /// the KAT key as the verifier takes it, and the key decoded independently
    /// of readPubKeyCalldata87 as the reference
    function _katKey() internal view returns (bytes memory key, PubKey memory ref) {
        key = vm.parseJsonBytes(_kat0(), ".blob");
        assertEq(key.length, KEY_BYTES87);
        ref.aHat = new uint256[][][](8);
        ref.t1 = new uint256[][](8);
        for (uint256 i = 0; i < 8; i++) {
            ref.aHat[i] = new uint256[][](7);
        }
        // flat index f: f < 56 is A[f / 7][f % 7], f >= 56 is t1[f - 56]
        for (uint256 f = 0; f < KEY_POLYS87; f++) {
            uint256[] memory poly = _readPolyAt(key, f * POLY_BYTES87);
            if (f < 56) ref.aHat[f / 7][f % 7] = poly;
            else ref.t1[f - 56] = poly;
        }
        ref.tr = slice(key, KEY_POLYS87 * POLY_BYTES87 + 32, 64);
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

    /// the 64 polynomials of a key in reading order
    function _flatPolys(PubKey memory pk) internal pure returns (uint256[][] memory polys) {
        polys = new uint256[][](64);
        for (uint256 f = 0; f < 64; f++) {
            polys[f] = f < 56 ? pk.aHat[f / 7][f % 7] : pk.t1[f - 56];
        }
    }

    function _katSigBytes() internal view returns (bytes memory s) {
        s = vm.parseJsonBytes(_kat0(), ".sig");
        require(s.length == 4627, "kat0 signature length");
    }

    function _katSignature() internal view returns (Signature memory sig) {
        bytes memory s = _katSigBytes();
        sig = Signature({cTilde: slice(s, 0, 64), z: slice(s, 64, 4480), h: slice(s, 4544, 83)});
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
    /// malformed keys rejected (readPubKeyCalldata87 and the verifier's own
    /// shape check checkPubKeyCalldata87 agree on every case)
    function test_readPubKeyCalldata87() public {
        (bytes memory key, PubKey memory ref) = _katKey();
        Harness87 h = new Harness87();
        PubKey memory got = h.read(key);
        assertTrue(h.check(key));
        assertEq(keccak256(got.tr), keccak256(ref.tr));
        assertEq(got.aHat.length, 8);
        assertEq(got.t1.length, 8);
        for (uint256 i = 0; i < 8; i++) {
            assertEq(got.aHat[i].length, 7);
            assertEq(keccak256(abi.encodePacked(got.t1[i])), keccak256(abi.encodePacked(ref.t1[i])));
            for (uint256 j = 0; j < 7; j++) {
                assertEq(keccak256(abi.encodePacked(got.aHat[i][j])), keccak256(abi.encodePacked(ref.aHat[i][j])));
            }
        }
        // the key rebuilt from the reference is the one read
        uint256[][] memory polys = _flatPolys(ref);
        assertEq(keccak256(_run(polys, 0, KEY_POLYS87, ref.tr)), keccak256(key));

        bytes[] memory bads = new bytes[](7);
        // one polynomial short, one too many, empty
        bads[0] = _run(polys, 0, KEY_POLYS87 - 1, ref.tr);
        bads[1] = abi.encodePacked(key, _run(polys, 0, 1, bytes("")));
        bads[2] = "";
        // the right length, one byte off
        bads[3] = slice(key, 0, KEY_BYTES87 - 1);
        // no tr, and a tr of 32 bytes
        bads[4] = _run(polys, 0, KEY_POLYS87, bytes(""));
        bads[5] = _run(polys, 0, KEY_POLYS87, new bytes(32));
        // tr of the right size behind a length word of 32: right total length, rejected
        bads[6] = abi.encodePacked(_run(polys, 0, KEY_POLYS87, bytes("")), uint256(32), ref.tr);
        assertEq(bads[6].length, KEY_BYTES87);
        for (uint256 b = 0; b < bads.length; b++) {
            assertFalse(h.check(bads[b]));
            vm.expectRevert(BadPubKeyBlob.selector);
            h.read(bads[b]);
        }
        // a polynomial announcing 31 words: right total length, rejected on the length word
        // (every residue mod 4 of the flat index, the shape check reads four per iteration)
        bytes memory bad;
        for (uint256 f = 0; f < KEY_POLYS87; f += 5) {
            bad = bytes.concat(key);
            uint256 at = 32 + f * POLY_BYTES87;
            assembly {
                mstore(add(bad, at), 31)
            }
            assertFalse(h.check(bad));
            vm.expectRevert(BadPubKeyBlob.selector);
            h.read(bad);
        }
        // two polynomials swapped: well formed, another key
        bad = bytes.concat(key);
        for (uint256 i = 0; i < POLY_BYTES87; i++) {
            (bad[i], bad[POLY_BYTES87 + i]) = (key[POLY_BYTES87 + i], key[i]);
        }
        PubKey memory swapped = h.read(bad);
        assertTrue(h.check(bad));
        assertEq(keccak256(abi.encodePacked(swapped.aHat[0][0])), keccak256(abi.encodePacked(ref.aHat[0][1])));
    }

    /* ------------------------------------------------------------ z decode */

    function _assertZ(bytes memory zb) internal pure {
        (uint256[][] memory zp, bool normOk) = unpackZPacked87(zb);
        uint256[][] memory zRef = unpackZ87(zb);
        assertEq(zp.length, 7);
        for (uint256 i = 0; i < 7; i++) {
            assertEq(zp[i].length, 64);
            for (uint256 j = 0; j < 256; j++) {
                require(_lane(zp[i], j) == zRef[i][j], "z lane differs");
            }
        }
        require(normOk == zNormOk87(zRef), "norm verdict differs");
    }

    /// 4480 bytes of z where every group of four fields is V (a 80-bit word)
    function _zOfGroups(uint256[] memory groups) internal pure returns (bytes memory zb) {
        zb = new bytes(4480);
        for (uint256 g = 0; g < 448; g++) {
            uint256 V = groups[g];
            for (uint256 b = 0; b < 10; b++) {
                zb[10 * g + b] = bytes1(uint8(V >> (8 * b)));
            }
        }
    }

    /// the KAT's z: same values as the scalar decode, norm accepted
    function test_unpackZPacked87_real_signature() public view {
        bytes memory zb = _katSignature().z;
        _assertZ(zb);
        (, bool normOk) = unpackZPacked87(zb);
        require(normOk, "real signature must pass the norm");
    }

    /// random bytes: mostly out of norm, every field value exercised
    function testFuzz_unpackZPacked87(bytes32 seed) public pure {
        bytes memory zb = new bytes(4480);
        for (uint256 i = 0; i < 4480; i += 32) {
            bytes32 w = keccak256(abi.encodePacked(seed, i));
            for (uint256 kk = 0; kk < 32; kk++) {
                zb[i + kk] = w[kk];
            }
        }
        _assertZ(zb);
    }

    /// random in-norm fields: the packed decode accepts and agrees with the scalar one
    function testFuzz_unpackZPacked87_inNorm(bytes32 seed) public pure {
        uint256[] memory groups = new uint256[](448);
        for (uint256 g = 0; g < 448; g++) {
            uint256 V;
            for (uint256 f = 0; f < 4; f++) {
                // f in [121, 1048455]
                uint256 v = 121 + uint256(keccak256(abi.encodePacked(seed, g, f))) % (1048455 - 121 + 1);
                V |= v << (20 * f);
            }
            groups[g] = V;
        }
        bytes memory zb = _zOfGroups(groups);
        _assertZ(zb);
        (, bool normOk) = unpackZPacked87(zb);
        require(normOk, "in-norm fields must be accepted");
    }

    /// fields at the norm boundary: 120 / 121 and 1048455 / 1048456, in every lane position
    function test_unpackZPacked87_boundaries() public pure {
        uint256[4] memory vals = [uint256(120), 121, 1048455, 1048456];
        for (uint256 v = 0; v < 4; v++) {
            for (uint256 pos = 0; pos < 4; pos++) {
                // all fields = 524288 (z = 0) except one field per group at `pos`
                uint256[] memory groups = new uint256[](448);
                for (uint256 g = 0; g < 448; g++) {
                    uint256 V;
                    for (uint256 f = 0; f < 4; f++) {
                        V |= (f == pos ? vals[v] : 524288) << (20 * f);
                    }
                    groups[g] = V;
                }
                bytes memory zb = _zOfGroups(groups);
                _assertZ(zb);
                (, bool normOk) = unpackZPacked87(zb);
                require(normOk == (v == 1 || v == 2), "boundary verdict");
            }
        }
    }

    /// the whole 20-bit range of one field, every other field at z = 0
    function test_unpackZPacked87_sweep() public pure {
        // 1792 fields: values 0..1791, 524288 - 896 .. 524288 + 895, 2^20 - 1792 .. 2^20 - 1
        uint256[3] memory bases = [uint256(0), 524288 - 896, (1 << 20) - 1792];
        for (uint256 pass = 0; pass < 3; pass++) {
            bytes memory zb = new bytes(4480);
            for (uint256 c = 0; c < 1792; c++) {
                uint256 v = bases[pass] + c;
                uint256 bit = 20 * c;
                for (uint256 b = 0; b < 3; b++) {
                    uint256 byteIdx = (bit >> 3) + b;
                    uint256 shift = 8 * b;
                    zb[byteIdx] = bytes1(uint8(uint8(zb[byteIdx]) | uint8(((v << (bit & 7)) >> shift) & 0xff)));
                }
            }
            _assertZ(zb);
        }
    }

    /// the calldata decoder of the verifier and the memory one give the same lanes
    /// (lazy) and verdicts, on the KAT and on a corrupted z
    function test_unpackZ87_calldata_matches_memory() public view {
        bytes memory s = _katSigBytes();
        Signature memory sig = _katSignature();
        (bool ok1, uint256[][] memory z1, uint256[8] memory m1) = this.core1Calldata(s);
        (bool ok2, uint256[][] memory z2, uint256[8] memory m2) = dilithiumCore1Packed87(sig);
        assertTrue(ok1 && ok2);
        for (uint256 i = 0; i < 7; i++) {
            assertEq(keccak256(abi.encodePacked(z1[i])), keccak256(abi.encodePacked(z2[i])));
        }
        for (uint256 i = 0; i < 8; i++) {
            assertEq(m1[i], m2[i]);
        }
        // the last two z bytes forced to 0xff: field 1791 >= 0xffff0 > 2 gamma1 - beta - 1,
        // rejected by both
        s[64 + 4478] = 0xff;
        s[64 + 4479] = 0xff;
        sig.z[4478] = 0xff;
        sig.z[4479] = 0xff;
        (ok1,,) = this.core1Calldata(s);
        (ok2,,) = dilithiumCore1Packed87(sig);
        assertFalse(ok1);
        assertFalse(ok2);
    }

    function core1Calldata(bytes calldata s) external pure returns (bool, uint256[][] memory, uint256[8] memory) {
        return dilithiumCore1PackedCalldata87(s);
    }

    /* --------------------------------------------------------------- hints */

    /// hint encoding validation against unpackH87, on the KAT and corruptions of it
    function test_checkHintBytes87() public view {
        bytes memory hb = _katSignature().h;
        (bool ok, uint256 count) = _checkHintBytes87(hb);
        (bool okRef, uint256[][] memory h) = unpackH87(hb);
        require(ok && okRef, "valid encoding rejected");
        uint256 w;
        for (uint256 i = 0; i < 8; i++) {
            for (uint256 j = 0; j < 256; j++) {
                w += h[i][j];
            }
        }
        require(count == w && count <= OMEGA87, "weight differs");
        // the masks from the bytes equal the masks from the arrays
        uint256[8] memory m1 = _hintMasksFromBytes87(hb);
        uint256[8] memory m2 = _hintMasks87(h);
        for (uint256 i = 0; i < 8; i++) {
            assertEq(m1[i], m2[i]);
        }
        // corruptions: both must reject
        bytes memory bad = abi.encodePacked(hb);
        bad[82] = bytes1(uint8(76)); // last count above omega
        _bothReject(bad);
        bad = abi.encodePacked(hb);
        bad[75] = bytes1(uint8(uint8(hb[82]) + 1)); // first count above the last
        _bothReject(bad);
        bad = abi.encodePacked(hb);
        bad[74] = 0x01; // unused index byte not zero
        _bothReject(bad);
        if (uint8(hb[75]) >= 2) {
            bad = abi.encodePacked(hb);
            bad[1] = hb[0]; // non-increasing indices
            _bothReject(bad);
        }
        // wrong lengths
        _bothReject(abi.encodePacked(hb, hex"00"));
        bad = new bytes(82);
        for (uint256 i = 0; i < 82; i++) {
            bad[i] = hb[i];
        }
        _bothReject(bad);
    }

    function _bothReject(bytes memory hb) internal pure {
        (bool ok,) = _checkHintBytes87(hb);
        (bool okRef,) = unpackH87(hb);
        require(!ok && !okRef, "corruption not rejected by both");
    }

    /// random valid encodings of random weight: accepted, masks as from the arrays;
    /// then one random byte flipped: same verdict as the scalar decoder
    function testFuzz_hintBytes87(bytes32 seed, uint8 weight, uint8 flipAt, uint8 flipBy) public pure {
        uint256 total = weight % 76; // 0..75
        bytes memory hb = new bytes(83);
        uint256 idx;
        for (uint256 i = 0; i < 8; i++) {
            // this polynomial takes a share of the remaining weight
            uint256 share = i == 7 ? total - idx : uint256(keccak256(abi.encodePacked(seed, i))) % (total - idx + 1);
            // `share` strictly increasing indices in [0, 256): steps of 1..3,
            // so at most 2 + 3 * 74 = 224
            uint256 last = 0;
            for (uint256 s = 0; s < share; s++) {
                uint256 step = 1 + uint256(keccak256(abi.encodePacked(seed, i, s))) % 3;
                uint256 v = s == 0 ? (step - 1) : last + step;
                hb[idx] = bytes1(uint8(v));
                last = v;
                idx++;
            }
            hb[75 + i] = bytes1(uint8(idx));
        }
        (bool ok, uint256 count,) = _checkAll(hb);
        (bool okRef, uint256[][] memory h) = unpackH87(hb);
        require(ok && okRef, "valid encoding rejected");
        require(count == total, "weight");
        uint256[8] memory m1 = _hintMasksFromBytes87(hb);
        uint256[8] memory m2 = _hintMasks87(h);
        for (uint256 i = 0; i < 8; i++) {
            assertEq(m1[i], m2[i]);
        }
        // a corrupted byte anywhere: both decoders agree on the verdict, and on
        // the masks when they accept
        if (flipBy == 0) return;
        hb[flipAt % 83] = bytes1(uint8(hb[flipAt % 83]) ^ flipBy);
        (ok,,) = _checkAll(hb);
        (okRef, h) = unpackH87(hb);
        require(ok == okRef, "verdicts differ after corruption");
        if (ok) {
            m1 = _hintMasksFromBytes87(hb);
            m2 = _hintMasks87(h);
            for (uint256 i = 0; i < 8; i++) {
                assertEq(m1[i], m2[i]);
            }
        }
    }

    function _checkAll(bytes memory hb) internal pure returns (bool ok, uint256 count, uint256[8] memory masks) {
        (ok, count) = _checkHintBytes87(hb);
        masks = _hintMasksFromBytes87(hb);
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
        f.aRow = new uint256[][](7);
        f.zHat = new uint256[][](7);
        f.aRowE = new uint256[][](7);
        f.zE = new uint256[][](7);
        for (uint256 j = 0; j < 7; j++) {
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
            for (uint256 j = 0; j < 7; j++) {
                s = addmod(s, mulmod(f.aRowE[j][i], f.zE[j][i], q), q);
            }
            r[i] = addmod(s, q - mulmod(f.t1E[i], f.cNtt[i], q), q);
        }
    }

    /// a full 67,680-byte key whose row `i` (A[i][0..6], t1[i]) is the fixture's
    /// and whose other polynomials are filler
    function _keyWithRow(uint256 i, uint256[][] memory aRow, uint256[] memory t1i)
        internal
        pure
        returns (bytes memory key)
    {
        uint256[] memory filler = new uint256[](32);
        for (uint256 m = 0; m < 32; m++) {
            filler[m] = 0x0000000100000002000000030000000400000005000000060000000700000008;
        }
        for (uint256 f = 0; f < 64; f++) {
            uint256[] memory p = filler;
            if (f >= 7 * i && f < 7 * i + 7) p = aRow[f - 7 * i];
            if (f == 56 + i) p = t1i;
            key = abi.encodePacked(key, uint256(32), p);
        }
        key = abi.encodePacked(key, uint256(64), new bytes(64));
        require(key.length == KEY_BYTES87, "key length");
    }

    /// random matrix row of seven columns: the packed accumulator, reduced,
    /// equals A.z - c.t1 of the scalar path with its lanes under q*2^31; its
    /// inverse transform (after the mod q reduction of the reference path)
    /// equals the scalar one, and so does the verifier's folded kernel reading
    /// the row from a calldata key at the same position
    function testFuzz_matvec_row87(uint256 seed) public {
        RowFixture memory f = _rowFixture(seed);
        uint256[] memory acc = _matvecRowPacked87(f.aRow, f.zHat, f.cHat, f.t1i);
        uint256[] memory r = _refRow(f);
        for (uint256 i = 0; i < 256; i++) {
            uint256 lane = _lane(acc, i);
            require(lane < Q31, "accumulator lane bound");
            require(lane % q == r[i], "row differs");
        }
        r = nttInv(r);
        for (uint256 m = 0; m < 64; m++) {
            uint256 w = acc[m];
            acc[m] = (((w >> 0) & 0xffffffffffffffff) % q) | ((((w >> 64) & 0xffffffffffffffff) % q) << 64)
                | ((((w >> 128) & 0xffffffffffffffff) % q) << 128) | (((w >> 192) % q) << 192);
        }
        nttInvMontPackedRaw(acc);
        for (uint256 i = 0; i < 256; i++) {
            require(_lane(acc, i) == r[i], "inverse of the row differs");
        }
        uint256 rowIdx = seed % 8;
        uint256[] memory folded = new Harness87().row(_keyWithRow(rowIdx, f.aRow, f.t1i), rowIdx, f.zHat, f.cHat);
        for (uint256 i = 0; i < 256; i++) {
            require(_lane(folded, i) == r[i], "folded kernel differs");
        }
    }

    /// key fields of one compact polynomial: q - 1 on the coefficients selected
    /// by `sel` (bit c % 4 of the 4-bit mask), 0 elsewhere
    function _fieldsBySel(uint256 sel) internal pure returns (uint256[] memory p) {
        p = new uint256[](32);
        uint256 w;
        for (uint256 f = 0; f < 8; f++) {
            if ((sel >> (f & 3)) & 1 == 1) w |= (q - 1) << (32 * f);
        }
        for (uint256 m = 0; m < 32; m++) {
            p[m] = w;
        }
    }

    /// worst cases of the lane bounds, every lazy z lane and c lane at their
    /// maximum 17q - 1, the key fields at q - 1 or 0 by coefficient position:
    ///   0: every A field q - 1, t1 0: every raw lane at the maximum
    ///      7 (17q - 1)(q - 1) + q*2^28, above q*2^30;
    ///   1: the same with t1 at q - 1: the c . t1 subtraction never borrows;
    ///   2: A at q - 1 on the odd coefficients, t1 at q - 1 on the even ones:
    ///      the lane differences of the first inverse pass (4m+1 minus 4m)
    ///      reach 8 (17q - 1)(q - 1) > q*2^30, the ML-DSA-65 offset;
    ///   3: A at q - 1 on coefficients 4m+2, 4m+3, t1 on 4m, 4m+1: the
    ///      differences of the lane sums reach 16 (17q - 1)(q - 1) > q*2^31,
    ///      the ML-DSA-65 offset of that step.
    /// The reference row kernel gives the exact raw lanes (all < q*2^31), and
    /// the verifier's folded kernel gives the inverse transform of the reduced
    /// row, for the first and the last row position.
    function test_matvec_row87_saturated() public {
        uint256 fullLanes;
        for (uint256 ln = 0; ln < 4; ln++) {
            fullLanes |= MAX_LAZY << (64 * ln);
        }
        uint256[][] memory zHat = new uint256[][](7);
        for (uint256 j = 0; j < 7; j++) {
            zHat[j] = new uint256[](64);
            for (uint256 m = 0; m < 64; m++) {
                zHat[j][m] = fullLanes;
            }
        }
        uint256[] memory cHat = new uint256[](64);
        for (uint256 m = 0; m < 64; m++) {
            cHat[m] = fullLanes;
        }
        // (A selection, t1 selection) of the four cases, bit c % 4
        uint8[4] memory selA = [15, 15, 10, 12];
        uint8[4] memory selT = [0, 15, 5, 3];
        Harness87 h = new Harness87();
        for (uint256 pat = 0; pat < 4; pat++) {
            uint256[][] memory aRow = new uint256[][](7);
            for (uint256 j = 0; j < 7; j++) {
                aRow[j] = _fieldsBySel(selA[pat]);
            }
            uint256[] memory t1i = _fieldsBySel(selT[pat]);
            uint256[] memory acc = _matvecRowPacked87(aRow, zHat, cHat, t1i);
            uint256[] memory r = new uint256[](256);
            uint256 hi;
            uint256 lo = type(uint256).max;
            for (uint256 c = 0; c < 256; c++) {
                uint256 raw = (q << 28);
                if ((selA[pat] >> (c & 3)) & 1 == 1) raw += 7 * MAX_LAZY * (q - 1);
                if ((selT[pat] >> (c & 3)) & 1 == 1) raw -= MAX_LAZY * (q - 1);
                assertEq(_lane(acc, c), raw);
                require(raw < Q31, "raw lane bound");
                if (raw > hi) hi = raw;
                if (raw < lo) lo = raw;
                r[c] = raw % q;
            }
            if (pat == 0) require(hi > Q30, "case 0 must exceed q*2^30");
            if (pat == 2) require(hi - lo > Q30, "case 2 must exceed the q*2^30 offset");
            if (pat == 3) require(2 * (hi - lo) > Q31, "case 3 must exceed the q*2^31 offset");
            r = nttInv(r);
            for (uint256 rowIdx = 0; rowIdx < 8; rowIdx += 7) {
                uint256[] memory folded = h.row(_keyWithRow(rowIdx, aRow, t1i), rowIdx, zHat, cHat);
                for (uint256 i = 0; i < 256; i++) {
                    require(_lane(folded, i) == r[i], "saturated folded kernel differs");
                }
            }
        }
    }

    /* ------------------------------------------------------------- useHint */

    /// useHint on random canonical inputs with random hints, packed vs scalar
    function testFuzz_useHint87(uint256 seed, uint256 density) public pure {
        uint256[][] memory h = new uint256[][](8);
        uint256[][] memory rE = new uint256[][](8);
        uint256[][] memory rP = new uint256[][](8);
        uint256 dens = 1 + density % 8;
        for (uint256 i = 0; i < 8; i++) {
            h[i] = new uint256[](256);
            rE[i] = _poly(seed ^ (100 + i));
            rP[i] = new uint256[](64);
            for (uint256 j = 0; j < 256; j++) {
                h[i][j] = uint256(keccak256(abi.encodePacked(seed, i, j))) % dens == 0 ? 1 : 0;
                rP[i][j >> 2] |= rE[i][j] << (64 * (j & 3));
            }
        }
        assertEq(keccak256(useHintPacked87(_hintMasks87(h), rP)), keccak256(useHintDilithium87(h, rE)));
    }

    /// the boundary values of Decompose (gamma2 = 261888), every lane position, both hint values
    function test_useHint87_boundaries() public pure {
        uint256 g2 = GAMMA2_87;
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
                uint256[][] memory h = new uint256[][](8);
                uint256[][] memory rE = new uint256[][](8);
                uint256[][] memory rP = new uint256[][](8);
                for (uint256 i = 0; i < 8; i++) {
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
                assertEq(keccak256(useHintPacked87(_hintMasks87(h), rP)), keccak256(useHintDilithium87(h, rE)));
            }
        }
    }

    function test_hint_masks87() public pure {
        uint256[][] memory h = new uint256[][](8);
        for (uint256 i = 0; i < 8; i++) {
            h[i] = new uint256[](256);
            h[i][i] = 1;
            h[i][255 - i] = 1;
            h[i][100] = 1;
        }
        uint256[8] memory m = _hintMasks87(h);
        for (uint256 i = 0; i < 8; i++) {
            assertEq(m[i], (uint256(1) << i) | (uint256(1) << (255 - i)) | (uint256(1) << 100));
        }
    }

    /* -------------------------------------------------------- SampleInBall */

    /// tau = 60 on the KAT's 64-byte c~ and on random 64-byte inputs: same
    /// polynomial as sampleInBallNist
    function test_sampleInBallFastTau87_kat() public {
        address helper = F1600Helper.deploy(vm);
        _assertBall(_katSignature().cTilde, helper);
    }

    function testFuzz_sampleInBallFastTau87(bytes32 a, bytes32 b) public {
        address helper = F1600Helper.deploy(vm);
        _assertBall(abi.encodePacked(a, b), helper);
    }

    function _assertBall(bytes memory cTilde, address helper) internal view {
        uint256[] memory fast = sampleInBallFastTau(cTilde, TAU87, helper);
        uint256[] memory ref = sampleInBallNist(cTilde, TAU87, q);
        uint256 nz;
        for (uint256 i = 0; i < 256; i++) {
            uint256 v = _lane(fast, i);
            require(v == ref[i], "sampleInBall differs");
            if (v != 0) {
                require(v == 1 || v == q - 1, "coefficient not in {1, q-1}");
                nz++;
            }
        }
        require(nz == TAU87, "weight != tau");
    }

    /* ------------------------------------------------- full second stage */

    /// the KAT's key and signature: the scalar second stage, the packed one on
    /// the decoded key and the verifier's calldata one give the same w1 bytes
    function test_core2_packed87_matches_scalar_real_signature() public {
        (bytes memory key,) = _katKey();
        Harness87 hn = new Harness87();
        PubKey memory pk = hn.read(key);
        Signature memory sig = _katSignature();
        address helper = F1600Helper.deploy(vm);

        // packed path, decoded key
        (bool ok, uint256[][] memory zp, uint256[8] memory masks) = dilithiumCore1Packed87(sig);
        require(ok, "core1 rejected the KAT");
        uint256[] memory cHatIn = sampleInBallFastTau(sig.cTilde, TAU87, helper);
        bytes memory w1Packed = dilithiumCore2Packed87(pk, zp, cHatIn, masks);

        // calldata path
        (bool okCd, bytes memory w1Calldata) = hn.core(key, _katSigBytes(), helper);
        require(okCd, "calldata core1 rejected the KAT");

        // scalar path
        (bool okH, uint256[][] memory h) = unpackH87(sig.h);
        require(okH, "unpackH87 rejected the KAT");
        uint256[][] memory z = unpackZ87(sig.z);
        require(zNormOk87(z), "scalar norm rejected the KAT");
        uint256[] memory cNtt = nttFw(sampleInBallNist(sig.cTilde, TAU87, q));
        bytes memory w1Scalar = dilithiumCore2_87(pk, z, cNtt, h);

        assertEq(w1Packed.length, 1024);
        assertEq(keccak256(w1Packed), keccak256(w1Scalar));
        assertEq(keccak256(w1Calldata), keccak256(w1Scalar));
        // and the packed challenge polynomial equals packPoly of the scalar one
        uint256[] memory cPacked = packPoly(sampleInBallNist(sig.cTilde, TAU87, q));
        uint256[] memory cFast = sampleInBallFastTau(sig.cTilde, TAU87, helper);
        assertEq(keccak256(abi.encodePacked(cPacked)), keccak256(abi.encodePacked(cFast)));
    }

    /// the first stage rejects a hint weight above omega and an out-of-norm z
    function test_core1_packed87_rejects() public view {
        Signature memory sig = _katSignature();
        // 76 hints: indices 0..75 in the first polynomial, counts of 76 > omega
        bytes memory h = new bytes(83);
        for (uint256 i = 0; i < 75; i++) {
            h[i] = bytes1(uint8(i));
        }
        for (uint256 i = 0; i < 8; i++) {
            h[75 + i] = bytes1(uint8(76));
        }
        (bool ok,,) = dilithiumCore1Packed87(Signature({cTilde: sig.cTilde, z: sig.z, h: h}));
        require(!ok, "weight above omega accepted");
        // exactly omega = 75 hints in the first polynomial: accepted
        for (uint256 i = 0; i < 8; i++) {
            h[75 + i] = bytes1(uint8(75));
        }
        (ok,,) = dilithiumCore1Packed87(Signature({cTilde: sig.cTilde, z: sig.z, h: h}));
        require(ok, "weight omega rejected");
        // z with one field at 120 (|z| = gamma1 - beta, rejected by the strict bound)
        uint256[] memory groups = new uint256[](448);
        for (uint256 g = 0; g < 448; g++) {
            uint256 V;
            for (uint256 f = 0; f < 4; f++) {
                V |= uint256(524288) << (20 * f);
            }
            if (g == 7) V = (V & ~uint256(0xfffff)) | 120;
            groups[g] = V;
        }
        bytes memory z = _zOfGroups(groups);
        (ok,,) = dilithiumCore1Packed87(Signature({cTilde: sig.cTilde, z: z, h: sig.h}));
        require(!ok, "out-of-norm z accepted");
        // the same z with 121: accepted
        z[70] = bytes1(uint8(121));
        (ok,,) = dilithiumCore1Packed87(Signature({cTilde: sig.cTilde, z: z, h: sig.h}));
        require(ok, "in-norm z rejected");
    }
}
