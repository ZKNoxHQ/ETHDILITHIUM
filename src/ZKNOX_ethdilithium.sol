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
///* FILE: ZKNOX_ethdilithium.sol
///* Description: Compute ethereum friendly version of dilithium verification
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "sstore2/SSTORE2.sol";
import {nttFw} from "./ZKNOX_NTT_dilithium.sol";
import {dilithiumCore1, dilithiumCore2} from "./ZKNOX_dilithium_core.sol";
import {sampleInBallKeccakPrng} from "./ZKNOX_SampleInBall.sol";
import {KeccakPrng, initPrng, refill} from "./ZKNOX_keccak_prng.sol";
import {q, expandVec, OMEGA, GAMMA_1_MINUS_BETA, TAU, PubKey, Signature, slice} from "./ZKNOX_dilithium_utils.sol";
import {ISigVerifier} from "InterfaceVerifier/IVerifier.sol";
import {IPKContract} from "./ZKNOX_PKContract.sol";

contract ZKNOX_ethdilithium is ISigVerifier {

    function setKey(bytes memory pubkey) external returns (bytes memory) {
        // deploy a PKContract and return the corresponding address
        address pointer = SSTORE2.write(pubkey);
        return abi.encodePacked(pointer);
    }

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
        // Step 1: Extract the SSTORE2 storage address from pk
        address storagePointer;
        assembly {
            storagePointer := shr(96, calldataload(pk.offset))
        }
        
        // Step 2: Read the actual PKContract address from SSTORE2 storage
        bytes memory storedData = SSTORE2.read(storagePointer);
        address pubKeyAddress = abi.decode(storedData, (address));
        
        // Step 3: Get the public key from PKContract
        PubKey memory publicKey = IPKContract(pubKeyAddress).getPublicKey();

        bytes memory mPrime = abi.encodePacked(bytes1(0), bytes1(0), m);

        Signature memory sig =
            Signature({cTilde: slice(signature, 0, 32), z: slice(signature, 32, 2304), h: slice(signature, 2336, 84)});

        // Step 3: delegate to internal verify
        if (verifyInternal(publicKey, mPrime, sig)) {
            return ISigVerifier.verify.selector;
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
        for (i = 0; i < 4; i++) {
            for (j = 0; j < 256; j++) {
                uint256 zij = z[i][j];
                if (zij > GAMMA_1_MINUS_BETA && (q - zij) > GAMMA_1_MINUS_BETA) {
                    return false;
                }
            }
        }

        // C_NTT
        uint256[] memory cNtt = sampleInBallKeccakPrng(signature.cTilde, TAU, q);
        cNtt = nttFw(cNtt);

        // t1New
        uint256[][] memory t1New = expandVec(pk.t1);

        // SECOND CORE STEP
        bytes memory wPrimeBytes = dilithiumCore2(pk, z, cNtt, h, t1New);

        // FINAL HASH
        KeccakPrng memory prng = initPrng(abi.encodePacked(pk.tr, mPrime));
        bytes32 out1 = prng.pool;
        refill(prng);
        bytes32 out2 = prng.pool;
        prng = initPrng(abi.encodePacked(out1, out2, wPrimeBytes));
        bytes32 finalHash = prng.pool;
        return finalHash == bytes32(signature.cTilde);
    }
}
//end of contract
