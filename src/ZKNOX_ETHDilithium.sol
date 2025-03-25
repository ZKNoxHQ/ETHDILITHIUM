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

import {console} from "forge-std/Test.sol";

import {ZKNOX_NTT} from "./ZKNOX_NTT.sol";
import "./ZKNOX_NTT_dilithium.sol";

import {KeccakPRNG} from "./ZKNOX_keccak_prng.sol";
import "./ZKNOX_shake.sol";
import {
    q,
    ZKNOX_Expand,
    ZKNOX_Expand_Vec,
    ZKNOX_Expand_Mat,
    ZKNOX_MatVecProductDilithium,
    ZKNOX_VECMULMOD,
    ZKNOX_VECSUBMOD,
    ID_keccak,
    omega,
    gamma_1_minus_beta
} from "./ZKNOX_dilithium_utils.sol";
import {useHintDilithium} from "./ZKNOX_hint.sol";

contract ZKNOX_dilithium {
    ZKNOX_NTT ntt;
    address public apsirev;
    address public apsiInvrev;

    constructor(ZKNOX_NTT i_ntt) {
        ntt = i_ntt;
        apsirev = ntt.o_psirev();
        apsiInvrev = ntt.o_psi_inv_rev();
    }

    struct DilithiumSignature {
        bytes c_tilde;
        uint256[][] z;
        uint256[][] h;
        uint256[] c_ntt;
    }

    struct DilithiumPubKey {
        uint256[][][] a_hat;
        bytes tr;
        uint256[][] t1_new;
        uint256 hashID; //identifier for the internal XOF
    }

    function dilithium_core(DilithiumPubKey memory pk, DilithiumSignature memory signature)
        public
        view
        returns (uint256 norm_h, uint256[][] memory z, bytes memory w_prime_bytes)
    {
        // sum hint for h
        uint256[][] memory h = ZKNOX_Expand_Vec(signature.h);
        norm_h = 0;
        uint256 i;
        uint256 j;
        for (i = 0; i < 4; i++) {
            for (j = 0; j < 256; j++) {
                if (h[i][j] == 1) {
                    norm_h += 1;
                }
                // else {
                //     // can be removed?
                //     if (h[i][j] != 0) {
                //         return false;
                //     }
                // }
            }
        }

        // check norm bound for z
        z = ZKNOX_Expand_Vec(signature.z);

        // NTT(z)
        uint256[][] memory tmp = new uint256[][](4);
        for (i = 0; i < 4; i++) {
            tmp[i] = new uint256[](256);
            for (j = 0; j < 256; j++) {
                tmp[i][j] = z[i][j];
            }
            tmp[i] = ZKNOX_NTTFW(tmp[i], apsirev);
        }

        // c_ntt
        uint256[] memory c_ntt = ZKNOX_Expand(signature.c_ntt);

        // t1_new
        uint256[][] memory t1_new = ZKNOX_Expand_Vec(pk.t1_new);

        // 1. A*z
        uint256[][][] memory A_hat = ZKNOX_Expand_Mat(pk.a_hat);
        tmp = ZKNOX_MatVecProductDilithium(A_hat, tmp); // A * z

        // 2. A*z - c*t1
        for (i = 0; i < 4; i++) {
            tmp[i] = ZKNOX_NTTINV(ZKNOX_VECSUBMOD(tmp[i], ZKNOX_VECMULMOD(t1_new[i], c_ntt)), apsiInvrev);
        }

        // 3. w_prime packed using a "solidity-friendly encoding"
        w_prime_bytes = useHintDilithium(h, tmp);
    }

    function verify(DilithiumPubKey memory pk, bytes memory msgs, DilithiumSignature memory signature)
        public
        view
        returns (bool result)
    {
        result = false;
        (uint256 norm_h, uint256[][] memory z, bytes memory w_prime_bytes) = dilithium_core(pk, signature);

        if (norm_h > omega) {
            return false;
        }
        for (uint256 i = 0; i < 4; i++) {
            for (uint256 j = 0; j < 256; j++) {
                if (z[i][j] > gamma_1_minus_beta && 8380417 - z[i][j] > gamma_1_minus_beta) {
                    return false;
                }
            }
        }
        bytes32 final_hash;
        if (pk.hashID == ID_keccak) {
            final_hash = KeccakPRNG(abi.encodePacked(KeccakPRNG(abi.encodePacked(pk.tr, msgs), 2), w_prime_bytes), 1)[0];
        } else if (pk.hashID == ID_shake) {
            ctx_shake memory ctx;
            ctx = shake_update(ctx, pk.tr);
            ctx = shake_update(ctx, msgs);
            bytes memory mu = shake_digest(ctx, 64);
            ctx_shake memory ctx2;
            ctx2 = shake_update(ctx2, mu);
            ctx2 = shake_update(ctx2, w_prime_bytes);
            final_hash = bytes32(shake_digest(ctx2, 32));
        } else {
            // Unkown hash (I am tired of Tetration, sorry)
            return false;
        }
        for (uint256 i = 0; i < 32; i++) {
            if (signature.c_tilde[i] != final_hash[i]) {
                return false;
            }
        }
        return true;
    }
}

//end of contract
/* the contract shall be initialized with a valid precomputation of psi_rev and psi_invrev contracts provided to the input ntt contract*/
