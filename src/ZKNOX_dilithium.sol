// Copyright (C) 2026 - ZKNOX
// License: This software is licensed under MIT License
// This Code may be reused including this header, license and copyright notice.
// FILE: ZKNOX_dilithium.sol
// Description: Dilithium Signature verifier following NIST specification
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
    /**
     * @notice Deploys a new PKContract containing the given public key.
     * @dev Stores the public key on-chain using SSTORE2 via PKContract.
     * @param pubkey The serialized Dilithium public key.
     * @return The ABI-encoded address of the deployed PKContract.
     */
    function setKey(bytes memory pubkey) external returns (bytes memory) {
        PKContract pkContract = new PKContract(pubkey);
        return abi.encodePacked(address(pkContract));
    }

    /**
     * @notice Verifies a Dilithium signature with context.
     * @dev Compatible with context-aware Dilithium verification.
     *      Extracts the public key contract address from `pk`.
     * @param pk ABI-encoded address of the PKContract.
     * @param m The message to verify.
     * @param signature The Dilithium signature.
     * @param ctx Optional context bytes (max length 255).
     * @return True if the signature is valid, false otherwise.
     */
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

    /**
     * @notice Verifies a Dilithium signature (EIP-style interface).
     * @dev Implements ISigVerifier interface.
     *      Does not support custom context.
     * @param pk Encoded PKContract address.
     * @param m Message hash.
     * @param signature Dilithium signature.
     * @return Selector on success, 0xFFFFFFFF on failure.
     */
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
     * @notice Performs the core Dilithium signature verification.
     * @dev Implements the full NIST Dilithium verification algorithm.
     *      Uses optimized assembly routines for gas efficiency.
     * @param pk Expanded public key structure.
     * @param mPrime Encoded message with context.
     * @param signature Parsed Dilithium signature.
     * @return True if the signature is valid, false otherwise.
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

        // z-norm check in assembly - avoids bounds checks on 1024 accesses
        {
            uint256 _q = q;
            uint256 _bound = GAMMA_1_MINUS_BETA;
            bool failed = false;
            assembly {
                for { let i := 0 } lt(i, 4) { i := add(i, 1) } {
                    let zi_ptr := mload(add(add(z, 32), mul(i, 32))) // z[i] pointer
                    let data_ptr := add(zi_ptr, 32) // skip length
                    for { let j := 0 } lt(j, 256) { j := add(j, 1) } {
                        let zij := mload(add(data_ptr, mul(j, 32)))
                        // if zij > bound && (q - zij) > bound â†’ fail
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
