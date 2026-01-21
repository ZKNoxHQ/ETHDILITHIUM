/**
 *
 */
/*ZZZZZZZZZZZZZZZZZZZKKKKKKKKK    KKKKKKKNNNNNNNN        NNNNNNNN     OOOOOOOOO     XXXXXXX       XXXXXXX                         ..../&@&#.       .###%@@@#, ..
/*Z:::::::::::::::::ZK:::::::K    K:::::KN:::::::N       N::::::N   OO:::::::::OO   X:::::X       X:::::X                      ...(@@* .... .           &#//%@@&,.
/*Z:::::::::::::::::ZK:::::::K    K:::::KN::::::::N      N::::::N OO:::::::::::::OO X:::::X       X:::::X                    ..*@@.........              .@#%%(%&@&..
/*Z:::ZZZZZZZZ:::::Z K:::::::K   K::::::KN:::::::::N     N::::::NO:::::::OOO:::::::OX::::::X     X::::::X                   .*@( ........ .  .&@@@@.      .@%%%%%#&@@.
/*ZZZZZ     Z:::::Z  KK::::::K  K:::::KKKN::::::::::N    N::::::NO::::::O   O::::::OXXX:::::X   X::::::XX                ...&@ ......... .  &.     .@      /@%%%%%%&@@#
/*        Z:::::Z      K:::::K K:::::K   N:::::::::::N   N::::::NO:::::O     O:::::O   X:::::X X:::::X                   ..@( .......... .  &.     ,&      /@%%%%&&&&@@@.
/*       Z:::::Z       K::::::K:::::K    N:::::::N::::N  N::::::NO:::::O     O:::::O    X:::::X:::::X                   ..&% ...........     .@%(#@#      ,@%%%%&&&&&@@@%.
/*      Z:::::Z        K:::::::::::K     N::::::N N::::N N::::::NO:::::O     O:::::O     X:::::::::X                   ..,@ ............                 *@%%%&%&&&&&&@@@.
/*     Z:::::Z         K:::::::::::K     N::::::N  N::::N:::::::NO:::::O     O:::::O     X:::::::::X                  ..(@ .............             ,#@&&&&&&&&&&&&@@@@*
/*    Z:::::Z          K::::::K:::::K    N::::::N   N:::::::::::NO:::::O     O:::::O    X:::::X:::::X                   .*@..............  . ..,(%&@@&&&&&&&&&&&&&&&&@@@@,
/*   Z:::::Z           K:::::K K:::::K   N::::::N    N::::::::::NO:::::O     O:::::O   X:::::X X:::::X                 ...&#............. *@@&&&&&&&&&&&&&&&&&&&&@@&@@@@&
/*ZZZ:::::Z     ZZZZZKK::::::K  K:::::KKKN::::::N     N:::::::::NO::::::O   O::::::OXXX:::::X   X::::::XX               ...@/.......... *@@@@. ,@@.  &@&&&&&&@@@@@@@@@@@.
/*Z::::::ZZZZZZZZ:::ZK:::::::K   K::::::KN::::::N      N::::::::NO:::::::OOO:::::::OX::::::X     X::::::X               ....&#..........@@@, *@@&&&@% .@@@@@@@@@@@@@@@&
/*Z:::::::::::::::::ZK:::::::K    K:::::KN::::::N       N:::::::N OO:::::::::::::OO X:::::X       X:::::X                ....*@.,......,@@@...@@@@@@&..%@@@@@@@@@@@@@/
/*Z:::::::::::::::::ZK:::::::K    K:::::KN::::::N        N::::::N   OO:::::::::OO   X:::::X       X:::::X                   ...*@,,.....%@@@,.........%@@@@@@@@@@@@(
/*ZZZZZZZZZZZZZZZZZZZKKKKKKKKK    KKKKKKKNNNNNNNN         NNNNNNN     OOOOOOOOO     XXXXXXX       XXXXXXX                      ...&@,....*@@@@@ ..,@@@@@@@@@@@@@&.
/*                                                                                                                                   ....,(&@@&..,,,/@&#*. .
/*                                                                                                                                    ......(&.,.,,/&@,.
/*                                                                                                                                      .....,%*.,*@%
/*                                                                                                                                    .#@@@&(&@*,,*@@%,..
/*                                                                                                                                    .##,,,**$.,,*@@@@@%.
/*                                                                                                                                     *(%%&&@(,,**@@@@@&
/*                                                                                                                                      . .  .#@((@@(*,**
/*                                                                                                                                             . (*. .
/*                                                                                                                                              .*/
///* Copyright (C) 2025 - Renaud Dubois, Simon Masson - This file is part of ZKNOX project
///* License: This software is licensed under MIT License
///* This Code may be reused including this header, license and copyright notice.
///* See LICENSE file at the root folder of the project.
///* FILE: ZKNOX_dilithium.sol
///* Description: Compute ethereum friendly version of dilithium verification
/**
 *
 */
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {nttFw} from "./ZKNOX_NTT_dilithium.sol";
import {dilithiumCore1, dilithiumCore2} from "./ZKNOX_dilithium_core.sol";
import {sampleInBallNist} from "./ZKNOX_SampleInBall.sol";
import {CtxShake, shakeUpdate, shakeDigest} from "./ZKNOX_shake.sol";
import {q, expandVec, OMEGA, GAMMA_1_MINUS_BETA, TAU, d, PubKey, Signature, slice} from "./ZKNOX_dilithium_utils.sol";
import {IERC7913SignatureVerifier} from "@openzeppelin/contracts/interfaces/IERC7913.sol";
import {IPKContract} from "./ZKNOX_PKContract.sol";

contract ZKNOX_dilithium is IERC7913SignatureVerifier {
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

        Signature memory sig =
            Signature({cTilde: slice(signature, 0, 32), z: slice(signature, 32, 2304), h: slice(signature, 2336, 84)});

        // Step 3: delegate to internal verify
        return verifyInternal(publicKey, mPrime, sig);
    }

    function verify(bytes calldata pk, bytes32 m, bytes calldata signature) external view returns (bytes4) {
        // Fetch the public key from the address `pk`
        address pubKeyAddress;
        assembly {
            pubKeyAddress := shr(96, calldataload(pk.offset))
        }
        PubKey memory publicKey = IPKContract(pubKeyAddress).getPublicKey();

        bytes memory mPrime = abi.encodePacked(bytes1(0), bytes1(0), m);

        Signature memory sig =
            Signature({cTilde: slice(signature, 0, 32), z: slice(signature, 32, 2304), h: slice(signature, 2336, 84)});

        // Step 3: delegate to internal verify
        if (verifyInternal(publicKey, mPrime, sig)) {
            return IERC7913SignatureVerifier.verify.selector;
        }
        return 0xFFFFFFFF;
    }

    function verifyInternal(PubKey memory pk, bytes memory mPrime, Signature memory signature)
        internal
        pure
        returns (bool)
    {
        uint256 i;
        uint256 j;

        // FIRST CORE STEP
        (bool foo, uint256 normH, uint256[][] memory h, uint256[][] memory z) = dilithiumCore1(signature);

        if (foo == false) {
            return false;
        }
        if (normH > OMEGA) {
            return false;
        }
        
        // OPTIMIZATION: unchecked - i bounded [0..3], j bounded [0..255]
        unchecked {
            for (i = 0; i < 4; i++) {
                for (j = 0; j < 256; j++) {
                    uint256 zij = z[i][j];
                    if (zij > GAMMA_1_MINUS_BETA && (q - zij) > GAMMA_1_MINUS_BETA) {
                        return false;
                    }
                }
            }
        }

        // C_NTT
        uint256[] memory cNtt = sampleInBallNist(signature.cTilde, TAU, q);
        cNtt = nttFw(cNtt);

        // compute NTT_FW((1<<d) * t1)
        uint256[][] memory t1New = expandVec(pk.t1);
        
        // OPTIMIZATION: unchecked - i bounded [0..3], j bounded [0..255]
        unchecked {
            for (i = 0; i < 4; i++) {
                for (j = 0; j < 256; j++) {
                    t1New[i][j] <<= d;
                }
                t1New[i] = nttFw(t1New[i]);
            }
        }

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

        // OPTIMIZATION: bytes32 direct comparison instead of byte-by-byte loop
        if (signature.cTilde.length < 32) {
            return false;
        }
        
        bytes32 cTildeBytes32;
        bytes memory cTildeData = signature.cTilde;
        assembly {
            cTildeBytes32 := mload(add(cTildeData, 32))
        }
        
        return cTildeBytes32 == finalHash;
    }
}

//end of contract
