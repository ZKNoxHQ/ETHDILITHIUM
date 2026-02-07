// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "sstore2/SSTORE2.sol";
import {nttFw} from "./ZKNOX_NTT_dilithium.sol";
import {dilithiumCore1, dilithiumCore2} from "./ZKNOX_dilithium_core.sol";
import {sampleInBallNist} from "./ZKNOX_SampleInBall.sol";
import {CtxShake, shakeUpdate, shakeDigest} from "./ZKNOX_shake.sol";
import {q, expandVec, OMEGA, GAMMA_1_MINUS_BETA, TAU, d, PubKey, Signature, slice} from "./ZKNOX_dilithium_utils.sol";
import {ISigVerifier} from "InterfaceVerifier/IVerifier.sol";
import {IPKContract, PKContract} from "./ZKNOX_PKContract.sol";

contract ZKNOX_dilithium is ISigVerifier {
    function setKey(bytes memory pubkey) external returns (bytes memory) {
        PKContract pkContract = new PKContract(pubkey);
        return abi.encodePacked(address(pkContract));
    }

    function verify(bytes memory pk, bytes memory m, bytes memory signature, bytes memory ctx)
        external
        view
        returns (bool)
    {
        address pubKeyAddress;
        assembly {
            pubKeyAddress := mload(add(pk, 20))
        }
        PubKey memory publicKey = IPKContract(pubKeyAddress).getPublicKey();

        if (ctx.length > 255) {
            revert("ctx bytes must have length at most 255");
        }
        bytes memory mPrime = abi.encodePacked(bytes1(0), bytes1(uint8(ctx.length)), ctx, m);

        Signature memory sig =
            Signature({cTilde: slice(signature, 0, 32), z: slice(signature, 32, 2304), h: slice(signature, 2336, 84)});

        return verifyInternal(publicKey, mPrime, sig);
    }

    function verify(bytes calldata pk, bytes32 m, bytes calldata signature) external view returns (bytes4) {
        address pkContractAddress;
        assembly {
            pkContractAddress := shr(96, calldataload(pk.offset))
        }

        PubKey memory publicKey = IPKContract(pkContractAddress).getPublicKey();

        bytes memory mPrime = abi.encodePacked(bytes1(0), bytes1(0), m);

        Signature memory sig =
            Signature({cTilde: slice(signature, 0, 32), z: slice(signature, 32, 2304), h: slice(signature, 2336, 84)});

        if (verifyInternal(publicKey, mPrime, sig)) {
            return ISigVerifier.verify.selector;
        }
        return 0xFFFFFFFF;
    }

    /**
     * OPTIMIZATION: Assembly z-norm check replaces double-nested Solidity loop.
     * Eliminates array bounds checks on z[i][j] access.
     * Estimated savings: ~5k-8k gas.
     */
    function verifyInternal(PubKey memory pk, bytes memory mPrime, Signature memory signature)
        internal
        pure
        returns (bool)
    {
        // FIRST CORE STEP
        (bool foo, uint256 normH, uint256[][] memory h, uint256[][] memory z) = dilithiumCore1(signature);

        if (foo == false) {
            return false;
        }
        if (normH > OMEGA) {
            return false;
        }

        // z-norm check in assembly — avoids bounds checks on 1024 accesses
        {
            uint256 _q = q;
            uint256 _bound = GAMMA_1_MINUS_BETA;
            bool failed = false;
            assembly {
                for { let i := 0 } lt(i, 4) { i := add(i, 1) } {
                    let zi_ptr := mload(add(add(z, 32), mul(i, 32))) // z[i] pointer
                    let data_ptr := add(zi_ptr, 32)                   // skip length
                    for { let j := 0 } lt(j, 256) { j := add(j, 1) } {
                        let zij := mload(add(data_ptr, mul(j, 32)))
                        // if zij > bound && (q - zij) > bound → fail
                        if and(gt(zij, _bound), gt(sub(_q, zij), _bound)) {
                            failed := 1
                        }
                    }
                }
            }
            if (failed) return false;
        }

        // C_NTT
        uint256[] memory cNtt = sampleInBallNist(signature.cTilde, TAU, q);
        cNtt = nttFw(cNtt);

        // t1 is stored in the NTT domain, with a 1<<d shift
        uint256[][] memory t1New = expandVec(pk.t1);

        // SECOND CORE STEP
        bytes memory wPrimeBytes = dilithiumCore2(pk, z, cNtt, h, t1New);
        // FINAL HASH
        CtxShake memory sctx;
        sctx = shakeUpdate(sctx, pk.tr);
        sctx = shakeUpdate(sctx, mPrime);
        bytes memory mu = shakeDigest(sctx, 64);

        CtxShake memory sctx2;
        sctx2 = shakeUpdate(sctx2, mu);
        sctx2 = shakeUpdate(sctx2, wPrimeBytes);
        bytes32 finalHash = bytes32(shakeDigest(sctx2, 32));

        return finalHash == bytes32(signature.cTilde);
    }
}
