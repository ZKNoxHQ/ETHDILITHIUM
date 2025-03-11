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

import {ZKNOX_NTT} from "./ZKNOX_NTT.sol";

// import "./ZKNOX_falcon_utils.sol";
// import "./ZKNOX_falcon_core.sol";

contract ZKNOX_dilithium {
    ZKNOX_NTT ntt;

    //Outer NTT contract, initialized with dilithium field parameters
    constructor(ZKNOX_NTT i_ntt) {
        ntt = i_ntt;
    }

    struct DilithiumSignature {
        bytes32 c_tilde;
        uint256[][] z;
        uint256[][] h;
        uint256[] c_ntt;
    }

    struct DilithiumPubKey {
        uint256[][][] a_hat;
        bytes32 tr;
        uint256[][] t1_new;
        bool is_compact;
        uint256 hashID; //identifier for the internal XOF
    }

    function CheckKey(DilithiumPubKey memory Pubkey) public pure returns (bool) {
        bool isKnownID = false;

        if (Pubkey.is_compact) {
            if (Pubkey.value.length != _DILITHIUM_WORD256_S) return false;
        } else {
            if (Pubkey.value.length != _DILITHIUM_WORD32_S) return false;
        }

        if (falcon_checkPolynomialRange(Pubkey.value, Pubkey.is_compact) != true) return false;

        if (Pubkey.hashID == ID_keccak) isKnownID = true;
        if (Pubkey.hashID == ID_tetration) isKnownID = true;

        return isKnownID;
    }

    function verify(DilithiumPubKey memory pk, bytes memory msgs, DilithiumSignature memory signature)
        public
        view
        returns (bool result)
    {
        result = false;

        uint256[] memory hashed;
        if (CheckKey(pk) == false) return false;

        // TODO IMPLEMENT (SIMILAR TO WHAT IS DONE IN FALCON) 
        // if (pk.hashID == ID_keccak) {
        //     hashed = hashToPointRIP(signature.salt, msgs);
        // } else {
        //     if (pk.hashID == ID_tetration) {
        //         hashed = hashToPointTETRATION(signature.salt, msgs);
        //     } else {
        //         return false;
        //     } //unknwon ID
        // }

        // if (pk.is_compact == false) {
        //     if (pk.nttform == false) {
        //         //convert public key to ntt form
        //         pk.value = ntt.ZKNOX_NTTFW(pk.value, ntt.o_psirev());
        //     }
        //     signature.s2 = _ZKNOX_NTT_Compact(signature.s2);
        // }

        // return falcon_core(ntt, signature.salt, signature.s2, pk.value, hashed); //not implemented yet
    }
}

//end of contract
/* the contract shall be initialized with a valid precomputation of psi_rev and psi_invrev contracts provided to the input ntt contract*/