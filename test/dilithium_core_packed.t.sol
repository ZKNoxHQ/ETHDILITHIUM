// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Test, console} from "forge-std/Test.sol";
import "../src/ZKNOX_dilithium_utils.sol";
import {dilithiumCore1, dilithiumCore2} from "../src/ZKNOX_dilithium_core.sol";
import {
    dilithiumCore1Packed,
    dilithiumCore2Packed,
    unpackZPacked,
    useHintPacked,
    _matvecRowPacked,
    _hintMasks,
    _hintMasksFromBytes,
    _checkHintBytes,
    readPubKeyPacked,
    packPoly,
    BadPubKeyBlob
} from "../src/ZKNOX_dilithium_core_packed.sol";
import {unpackH, unpackZ} from "../src/ZKNOX_dilithium_core.sol";
import {GAMMA_1_MINUS_BETA, OMEGA} from "../src/ZKNOX_dilithium_utils.sol";
import {useHintDilithium} from "../src/ZKNOX_hint.sol";
import {nttFw, nttInv} from "../src/ZKNOX_NTT_dilithium.sol";
import {nttFwMontPacked, nttInvMontPackedRaw} from "../src/ZKNOX_NTT_dilithium_mont.sol";
import {sampleInBallNist} from "../src/ZKNOX_SampleInBall.sol";
import {DeployPKContract} from "../script/Deploy_MLDSA_PK.s.sol";
import {Constants} from "./seed.sol";
import {PythonSigner} from "../src/ZKNOX_PythonSigner.sol";
import {SSTORE2} from "sstore2/SSTORE2.sol";

/// external wrapper so that vm.expectRevert can observe readPubKeyPacked's revert
contract PkReader {
    function read(address ptr) external view returns (PubKey memory) {
        return readPubKeyPacked(ptr);
    }
}

/// Differential tests of the packed second stage against the scalar one.
contract DilithiumCorePackedTest is Test {
    PythonSigner pythonSigner = new PythonSigner();

    function _readPubKey(address pointer) internal view returns (PubKey memory) {
        (bytes memory aHatEncoded, bytes memory tr, bytes memory t1Encoded) =
            abi.decode(SSTORE2.read(pointer), (bytes, bytes, bytes));
        uint256[][][] memory aHat = abi.decode(aHatEncoded, (uint256[][][]));
        uint256[][] memory t1 = abi.decode(t1Encoded, (uint256[][]));
        return PubKey({aHat: aHat, tr: tr, t1: t1});
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

    /// zero-copy key read: same polynomials and tr as the abi.decode path, malformed blobs rejected
    function test_readPubKeyPacked() public {
        DeployPKContract dep = new DeployPKContract();
        address ptr = dep.run();
        PubKey memory ref = _readPubKey(ptr);
        PubKey memory got = readPubKeyPacked(ptr);
        assertEq(keccak256(got.tr), keccak256(ref.tr));
        for (uint256 i = 0; i < 4; i++) {
            assertEq(keccak256(abi.encodePacked(got.t1[i])), keccak256(abi.encodePacked(ref.t1[i])));
            for (uint256 j = 0; j < 4; j++) {
                assertEq(keccak256(abi.encodePacked(got.aHat[i][j])), keccak256(abi.encodePacked(ref.aHat[i][j])));
            }
        }
        // a blob of another shape: 3 rows
        uint256[][][] memory a3 = new uint256[][][](3);
        for (uint256 i = 0; i < 3; i++) {
            a3[i] = new uint256[][](4);
            for (uint256 j = 0; j < 4; j++) {
                a3[i][j] = new uint256[](32);
            }
        }
        PkReader reader = new PkReader();
        address bad = SSTORE2.write(abi.encode(abi.encode(a3), ref.tr, abi.encode(ref.t1)));
        vm.expectRevert(BadPubKeyBlob.selector);
        reader.read(bad);
        // a truncated blob
        bytes memory full = SSTORE2.read(ptr);
        bytes memory cut = new bytes(full.length - 40);
        for (uint256 i = 0; i < cut.length; i++) {
            cut[i] = full[i];
        }
        address bad2 = SSTORE2.write(cut);
        vm.expectRevert(BadPubKeyBlob.selector);
        reader.read(bad2);
    }

    /// real key and signature: same w1 bytes as the scalar stage
    function test_core2_packed_matches_scalar_real_signature() public {
        DeployPKContract dep = new DeployPKContract();
        PubKey memory pk = _readPubKey(dep.run());
        (bytes memory cTilde, bytes memory zb, bytes memory hb) = pythonSigner.sign(
            "pythonref",
            "0x1111222233334444111122223333444411112222333344441111222233334444",
            "NIST",
            Constants.SEED_POSTQUANTUM_STR
        );
        bytes32 ref = _scalarW1(pk, cTilde, zb, hb);
        bytes32 got = _packedW1(pk, cTilde, zb, hb);
        assertEq(got, ref);
    }

    function _scalarW1(PubKey memory pk, bytes memory cTilde, bytes memory zb, bytes memory hb)
        internal
        pure
        returns (bytes32)
    {
        (bool ok,, uint256[][] memory h, uint256[][] memory z) =
            dilithiumCore1(Signature({cTilde: cTilde, z: zb, h: hb}));
        require(ok, "core1");
        uint256[] memory cNtt = nttFw(sampleInBallNist(cTilde, TAU, q));
        bytes memory w1 = dilithiumCore2(pk, z, cNtt, h, expandVec(pk.t1));
        require(w1.length == 768, "length");
        return keccak256(w1);
    }

    function _packedW1(PubKey memory pk, bytes memory cTilde, bytes memory zb, bytes memory hb)
        internal
        pure
        returns (bytes32)
    {
        (bool ok, uint256[][] memory zp, uint256[4] memory hm) =
            dilithiumCore1Packed(Signature({cTilde: cTilde, z: zb, h: hb}));
        require(ok, "core1 packed");
        // masks from the encoding agree with masks from the decoded arrays
        (bool okH, uint256[][] memory h) = unpackH(hb);
        require(okH, "unpackH");
        uint256[4] memory mb = _hintMasksFromBytes(hb);
        uint256[4] memory ma = _hintMasks(h);
        for (uint256 i = 0; i < 4; i++) {
            require(mb[i] == ma[i], "hint masks differ");
        }
        for (uint256 i = 0; i < 4; i++) {
            require(hm[i] == mb[i], "core1 masks differ");
        }
        bytes memory w1 = dilithiumCore2Packed(pk, zp, packPoly(sampleInBallNist(cTilde, TAU, q)), hm);
        require(w1.length == 768, "length");
        return keccak256(w1);
    }

    /// z decode: same coefficients as unpackZ, same verdict as the verifier's norm loop
    function _zVectorFromSignature() internal returns (bytes memory zb) {
        (, zb,) = pythonSigner.sign(
            "pythonref",
            "0x1111222233334444111122223333444411112222333344441111222233334444",
            "NIST",
            Constants.SEED_POSTQUANTUM_STR
        );
    }

    /// FIPS 204 Alg. 3: reject iff ||z||inf >= gamma1 - beta. (The previous
    /// verifier loop rejected iff ||z||inf > gamma1 - beta, one value looser.)
    function _refNormOk(uint256[][] memory z) internal pure returns (bool) {
        for (uint256 i = 0; i < 4; i++) {
            for (uint256 j = 0; j < 256; j++) {
                uint256 v = z[i][j] % q;
                if (v >= GAMMA_1_MINUS_BETA && q - v >= GAMMA_1_MINUS_BETA) return false;
            }
        }
        return true;
    }

    function _assertZ(bytes memory zb) internal pure {
        uint256[][] memory zE = unpackZ(zb);
        (uint256[][] memory zp, bool normOk) = unpackZPacked(zb);
        for (uint256 i = 0; i < 4; i++) {
            for (uint256 j = 0; j < 256; j++) {
                // unpackZ leaves z = 0 as q (field == gamma1); the packed decode is canonical
                uint256 lane = _lane(zp[i], j);
                require(lane < q && lane == zE[i][j] % q, "z differs");
            }
        }
        require(normOk == _refNormOk(zE), "norm verdict differs");
    }

    function test_unpackZPacked_real_signature() public {
        bytes memory zb = _zVectorFromSignature();
        _assertZ(zb);
        (, bool normOk) = unpackZPacked(zb);
        require(normOk, "real signature must pass the norm");
    }

    /// random bytes: mostly out of norm, every field value exercised
    function testFuzz_unpackZPacked(bytes32 seed) public pure {
        bytes memory zb = new bytes(2304);
        for (uint256 i = 0; i < 2304; i += 32) {
            bytes32 w = keccak256(abi.encodePacked(seed, i));
            for (uint256 k = 0; k < 32 && i + k < 2304; k++) {
                zb[i + k] = w[k];
            }
        }
        _assertZ(zb);
    }

    /// fields at the norm boundary: 78 / 79 and 262065 / 262066, in every lane position
    function test_unpackZPacked_boundaries() public pure {
        uint256[4] memory vals = [uint256(78), 79, 262065, 262066];
        for (uint256 v = 0; v < 4; v++) {
            for (uint256 pos = 0; pos < 4; pos++) {
                bytes memory zb = new bytes(2304);
                // all fields = 131072 (z = 0) except one field per group at `pos`
                for (uint256 g = 0; g < 256; g++) {
                    uint256 V;
                    for (uint256 f = 0; f < 4; f++) {
                        V |= (f == pos ? vals[v] : 131072) << (18 * f);
                    }
                    for (uint256 b = 0; b < 9; b++) {
                        zb[9 * g + b] = bytes1(uint8(V >> (8 * b)));
                    }
                }
                _assertZ(zb);
                (, bool normOk) = unpackZPacked(zb);
                require(normOk == (v == 1 || v == 2), "boundary verdict");
            }
        }
    }

    /// hint encoding validation against unpackH
    function test_checkHintBytes() public {
        (,, bytes memory hb) = pythonSigner.sign(
            "pythonref",
            "0x1111222233334444111122223333444411112222333344441111222233334444",
            "NIST",
            Constants.SEED_POSTQUANTUM_STR
        );
        (bool ok, uint256 count) = _checkHintBytes(hb);
        (bool okRef, uint256[][] memory h) = unpackH(hb);
        require(ok && okRef, "valid encoding rejected");
        uint256 w;
        for (uint256 i = 0; i < 4; i++) {
            for (uint256 j = 0; j < 256; j++) {
                w += h[i][j];
            }
        }
        require(count == w && count <= OMEGA, "weight differs");
        // corruptions: both must reject
        bytes memory bad = abi.encodePacked(hb);
        bad[83] = bytes1(uint8(81)); // count above omega
        _bothReject(bad);
        bad = abi.encodePacked(hb);
        bad[80] = bytes1(uint8(uint8(hb[83]) + 1)); // first count above the last
        _bothReject(bad);
        bad = abi.encodePacked(hb);
        bad[79] = 0x01; // unused index byte not zero
        _bothReject(bad);
        if (uint8(hb[80]) >= 2) {
            bad = abi.encodePacked(hb);
            bad[1] = hb[0]; // non-increasing indices
            _bothReject(bad);
        }
    }

    function _bothReject(bytes memory hb) internal pure {
        (bool ok,) = _checkHintBytes(hb);
        (bool okRef,) = unpackH(hb);
        require(!ok && !okRef, "corruption not rejected by both");
    }

    function _copy(uint256[] memory p) internal pure returns (uint256[] memory c) {
        c = new uint256[](p.length);
        for (uint256 i = 0; i < p.length; i++) {
            c[i] = p[i];
        }
    }

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
        f.aRow = new uint256[][](4);
        f.zHat = new uint256[][](4);
        f.aRowE = new uint256[][](4);
        f.zE = new uint256[][](4);
        for (uint256 j = 0; j < 4; j++) {
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
            for (uint256 j = 0; j < 4; j++) {
                s = addmod(s, mulmod(f.aRowE[j][i], f.zE[j][i], q), q);
            }
            r[i] = addmod(s, q - mulmod(f.t1E[i], f.cNtt[i], q), q);
        }
    }

    /// random matrix row: the packed accumulator, reduced, equals A.z - c.t1 of the scalar path
    function testFuzz_matvec_row(uint256 seed) public pure {
        RowFixture memory f = _rowFixture(seed);
        uint256[] memory acc = _matvecRowPacked(f.aRow, f.zHat, f.cHat, f.t1i);
        uint256[] memory r = _refRow(f);
        for (uint256 i = 0; i < 256; i++) {
            uint256 lane = _lane(acc, i);
            require(lane < (q << 30), "accumulator lane bound");
            require(lane % q == r[i], "row differs");
        }
        r = nttInv(r);
        nttInvMontPackedRaw(acc);
        for (uint256 i = 0; i < 256; i++) {
            require(_lane(acc, i) == r[i], "inverse of the row differs");
        }
    }

    /// useHint on random canonical inputs with random hints, packed vs scalar
    function testFuzz_useHint(uint256 seed, uint256 density) public pure {
        uint256[][] memory h = new uint256[][](4);
        uint256[][] memory rE = new uint256[][](4);
        uint256[][] memory rP = new uint256[][](4);
        uint256 dens = 1 + density % 8;
        for (uint256 i = 0; i < 4; i++) {
            h[i] = new uint256[](256);
            rE[i] = _poly(seed ^ (100 + i));
            rP[i] = new uint256[](64);
            for (uint256 j = 0; j < 256; j++) {
                h[i][j] = uint256(keccak256(abi.encodePacked(seed, i, j))) % dens == 0 ? 1 : 0;
                rP[i][j >> 2] |= rE[i][j] << (64 * (j & 3));
            }
        }
        assertEq(keccak256(useHintPacked(_hintMasks(h), rP)), keccak256(useHintDilithium(h, rE)));
    }

    /// the boundary values of decompose, every lane position, both hint values
    function test_useHint_boundaries() public pure {
        uint256[16] memory vals = [
            uint256(0),
            1,
            95231,
            95232,
            95233,
            190463,
            190464,
            190465,
            4190208,
            4190209,
            q - 190465,
            q - 190464,
            q - 95233,
            q - 95232,
            q - 2,
            q - 1
        ];
        for (uint256 hv = 0; hv < 2; hv++) {
            for (uint256 rot = 0; rot < 4; rot++) {
                uint256[][] memory h = new uint256[][](4);
                uint256[][] memory rE = new uint256[][](4);
                uint256[][] memory rP = new uint256[][](4);
                for (uint256 i = 0; i < 4; i++) {
                    h[i] = new uint256[](256);
                    rE[i] = new uint256[](256);
                    rP[i] = new uint256[](64);
                    for (uint256 j = 0; j < 256; j++) {
                        uint256 v = vals[(j + rot + i) % 16];
                        rE[i][j] = v;
                        rP[i][j >> 2] |= v << (64 * (j & 3));
                        h[i][j] = (hv == 1 && (j + i) % 3 != 0) ? 1 : 0;
                    }
                }
                assertEq(keccak256(useHintPacked(_hintMasks(h), rP)), keccak256(useHintDilithium(h, rE)));
            }
        }
    }

    function test_hint_masks() public pure {
        uint256[][] memory h = new uint256[][](4);
        for (uint256 i = 0; i < 4; i++) {
            h[i] = new uint256[](256);
            h[i][i] = 1;
            h[i][255 - i] = 1;
            h[i][100] = 1;
        }
        uint256[4] memory m = _hintMasks(h);
        for (uint256 i = 0; i < 4; i++) {
            assertEq(m[i], (uint256(1) << i) | (uint256(1) << (255 - i)) | (uint256(1) << 100));
        }
    }
}
