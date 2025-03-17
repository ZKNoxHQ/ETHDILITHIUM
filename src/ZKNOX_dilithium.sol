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
import {ZKNOX_keccak_prng} from "./ZKNOX_keccak_prng.sol";
import {
    q,
    ZKNOX_Expand,
    ZKNOX_Expand_Vec,
    ZKNOX_Expand_Mat,
    ZKNOX_MatVecProduct,
    ZKNOX_VECMULMOD,
    ZKNOX_VECSUBMOD,
    ID_keccak,
    omega,
    gamma_1_minus_beta
} from "./ZKNOX_utils.sol";
import {useHintVec} from "./ZKNOX_hint.sol";

contract ZKNOX_dilithium {
    ZKNOX_NTT ntt;

    constructor(ZKNOX_NTT i_ntt) {
        ntt = i_ntt;
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

    function verify(DilithiumPubKey memory pk, bytes memory msgs, DilithiumSignature memory signature)
        public
        returns (bool result)
    {
        result = false;

        bytes memory mu;

        if (pk.hashID == ID_keccak) {
            ZKNOX_keccak_prng H = new ZKNOX_keccak_prng();
            H.inject(pk.tr);
            H.inject(msgs);
            H.flip();
            mu = H.extract(64);
        } else {
            // Unkown hash (I am tired of Tetration, sorry)
            return false;
        }

        // sum hint for h
        uint256[][] memory h = ZKNOX_Expand_Vec(signature.h);
        uint256 cpt = 0;
        uint256 i;
        uint256 j;
        for (i = 0; i < 4; i++) {
            for (j = 0; j < 256; j++) {
                if (h[i][j] == 1) {
                    cpt = cpt + 1;
                }
                // else {
                //     // can be removed?
                //     if (h[i][j] != 0) {
                //         return false;
                //     }
                // }
            }
        }
        if (cpt > omega) {
            return false;
        }

        // check norm bound for z
        uint256[][] memory z = ZKNOX_Expand_Vec(signature.z);
        for (uint256 i = 0; i < 4; i++) {
            for (uint256 j = 0; j < 256; j++) {
                if (z[i][j] > gamma_1_minus_beta && 8380417 - z[i][j] > gamma_1_minus_beta) {
                    return false;
                }
            }
        }

        // NTT(z)
        for (i = 0; i < 4; i++) {
            z[i] = ntt.ZKNOX_NTTFW(z[i], ntt.o_psirev());
        }

        // c_ntt
        uint256[] memory c_ntt = ZKNOX_Expand(signature.c_ntt);

        // t1_new
        uint256[][] memory t1_new = ZKNOX_Expand_Vec(pk.t1_new);

        // 1.
        uint256[][][] memory A_hat = ZKNOX_Expand_Mat(pk.a_hat);
        z = ZKNOX_MatVecProduct(A_hat, z); // A * z
        for (i = 0; i < 4; i++) {
            // we store in z A*z - c*t1
            z[i] = ntt.ZKNOX_NTTINV(ZKNOX_VECSUBMOD(z[i], ZKNOX_VECMULMOD(t1_new[i], c_ntt, q), q), ntt.o_psi_inv_rev());
        }

        // 2. w_prime
        int256[][] memory w_prime = useHintVec(h, z);

        // 3.
        bytes memory w_prime_bytes = abi.encode(w_prime); //w_prime.bit_pack_w(γ_2)

        // 4.
        // return c_tilde == H(μ + w_prime_bytes, 32)
        if (pk.hashID == ID_keccak) {
            ZKNOX_keccak_prng H = new ZKNOX_keccak_prng();
            H.inject(mu);
            H.inject(w_prime_bytes);
            H.flip();
            bytes memory H_output = H.extract(32);
            for (i = 0; i < 32; i++) {
                if (signature.c_tilde[i] != H_output[i]) {
                    return false;
                }
            }
            return true;
        } else {
            // Unkown hash (I am tired of Tetration, sorry)
            return false;
        }
    }
}

//end of contract
/* the contract shall be initialized with a valid precomputation of psi_rev and psi_invrev contracts provided to the input ntt contract*/
