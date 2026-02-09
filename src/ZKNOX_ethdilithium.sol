// Copyright (C) 2026 - ZKNOX
// License: This software is licensed under MIT License
// This Code may be reused including this header, license and copyright notice.
// FILE: ZKNOX_ethdilithium.sol
// Description: Ethereum-compatible Dilithium signature verifier using Keccak-based PRNG
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "sstore2/SSTORE2.sol";
import {nttFw} from "./ZKNOX_NTT_dilithium.sol";
import {dilithiumCore1, dilithiumCore2} from "./ZKNOX_dilithium_core.sol";
import {sampleInBallKeccakPrng} from "./ZKNOX_SampleInBall.sol";
import {KeccakPrng, initPrng, refill} from "./ZKNOX_keccak_prng.sol";
import {q, expandVec, OMEGA, GAMMA_1_MINUS_BETA, TAU, PubKey, Signature, slice} from "./ZKNOX_dilithium_utils.sol";
import {ISigVerifier} from "InterfaceVerifier/IVerifier.sol";
import {IPKContract, PKContract} from "./ZKNOX_PKContract.sol";

/**
 * @title ZKNOX_ethdilithium
 * @notice Ethereum-compatible Dilithium post-quantum signature verifier.
 * @dev Uses Keccak-based PRNG instead of SHAKE for final hash generation.
 *      Public keys are stored in dedicated PKContract instances.
 */
contract ZKNOX_ethdilithium is ISigVerifier {
    /**
     * @notice Deploys a new PKContract containing the public key.
     * @dev Stores the public key using SSTORE2 for gas efficiency.
     * @param pubkey Serialized Dilithium public key.
     * @return ABI-encoded address of the deployed PKContract.
     */
    function setKey(bytes memory pubkey) external returns (bytes memory) {
        PKContract pkContract = new PKContract(pubkey);
        return abi.encodePacked(address(pkContract));
    }

    /**
     * @notice Verifies a Dilithium signature with context.
     * @dev Builds the context-encoded message and delegates verification
     *      to the internal verification routine.
     * @param pk ABI-encoded PKContract address.
     * @param m Message to verify.
     * @param signature Dilithium signature.
     * @param ctx Optional context (max 255 bytes).
     * @return True if the signature is valid, false otherwise.
     */
    function verify(bytes memory pk, bytes memory m, bytes memory signature, bytes memory ctx)
        external
        view
        returns (bool)
    {
        // Fetch the public key from the address `pk`
        address pubKeyAddress;
        assembly {
            pubKeyAddress := mload(add(pk, 20))
        }
        PubKey memory publicKey = IPKContract(pubKeyAddress).getPublicKey();

        // Step 1: check ctx length
        if (ctx.length > 255) {
            revert("ctx bytes must have length at most 255");
        }

        // Step 2: mPrime = 0x00 || len(ctx) || ctx || m
        bytes memory mPrime = abi.encodePacked(bytes1(0), bytes1(uint8(ctx.length)), ctx, m);

        // Parse signature
        Signature memory sig =
            Signature({cTilde: slice(signature, 0, 32), z: slice(signature, 32, 2304), h: slice(signature, 2336, 84)});

        // Step 3: delegate to internal verify
        return verifyInternal(publicKey, mPrime, sig);
    }

    /**
     * @notice Verifies a Dilithium signature using the ISigVerifier interface.
     * @dev Compatible with Ethereum-style verification flows.
     *      Does not support custom context.
     * @param pk Encoded PKContract address.
     * @param m Message hash.
     * @param signature Dilithium signature.
     * @return Selector on success, 0xFFFFFFFF on failure.
     */
    function verify(bytes calldata pk, bytes32 m, bytes calldata signature) external view returns (bytes4) {
        // Step 1: pk contains the PKContract address (returned by setKey)
        address pkContractAddress;
        assembly {
            pkContractAddress := shr(96, calldataload(pk.offset))
        }

        // Step 2: Get the public key directly from PKContract
        PubKey memory publicKey = IPKContract(pkContractAddress).getPublicKey();

        // mPrime = 0x00 || 0x00 || m
        bytes memory mPrime = abi.encodePacked(bytes1(0), bytes1(0), m);

        // Parse signature
        Signature memory sig =
            Signature({cTilde: slice(signature, 0, 32), z: slice(signature, 32, 2304), h: slice(signature, 2336, 84)});

        // Step 3: delegate to internal verify
        if (verifyInternal(publicKey, mPrime, sig)) {
            return ISigVerifier.verify.selector;
        }
        return 0xFFFFFFFF;
    }

    /**
     * @notice Performs the core Dilithium verification algorithm.
     * @dev Implements NIST Dilithium verification with Keccak-based hashing.
     *      Includes norm checks, NTT transformation, and final hash comparison.
     * @param pk Expanded public key.
     * @param mPrime Context-encoded message.
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
                        // if zij > bound && (q - zij) > bound → fail
                        if and(gt(zij, _bound), gt(sub(_q, zij), _bound)) {
                            failed := 1
                        }
                    }
                }
            }
            if (failed) return false;
        }

        // C_NTT: Sample challenge and apply NTT
        uint256[] memory cNtt = sampleInBallKeccakPrng(signature.cTilde, TAU, q);

        cNtt = nttFw(cNtt);

        // Expand t1 (stored in compressed form)
        uint256[][] memory t1New = expandVec(pk.t1);

        // SECOND CORE STEP
        bytes memory wPrimeBytes = dilithiumCore2(pk, z, cNtt, h, t1New);

        // FINAL HASH (Keccak-based PRNG)
        KeccakPrng memory prng = initPrng(abi.encodePacked(pk.tr, mPrime));

        bytes32 out1 = prng.pool;

        refill(prng);

        bytes32 out2 = prng.pool;

        prng = initPrng(abi.encodePacked(out1, out2, wPrimeBytes));

        bytes32 finalHash = prng.pool;

        // Compare challenge hashes
        return finalHash == bytes32(signature.cTilde);
    }
}
// end of contract
