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
import "./ZKNOX_NTT_dilithium.sol";
import "./ZKNOX_dilithium_core.sol";
import "./ZKNOX_dilithium_utils.sol";

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
    gamma_1_minus_beta,
    tau,
    d
} from "./ZKNOX_dilithium_utils.sol";
import {useHintDilithium} from "./ZKNOX_hint.sol";

contract ZKNOX_dilithium {
    ZKNOX_NTT ntt;
    address public apsirev;
    address public apsiInvrev;
    bool immutableMe;
    bool EIP7885;

    function update(address i_psirev, address i_psiInvrev) public {
        if (immutableMe == true) revert();
        apsirev = i_psirev;
        apsiInvrev = i_psiInvrev;
        EIP7885 = false;
        immutableMe = true;
    }

    function updateNTT(ZKNOX_NTT i_ntt) public {
        if (immutableMe == true) revert();
        ntt = i_ntt;
        EIP7885 = true;
        immutableMe = true;
    }

    function compute_c_ntt(Signature memory signature) internal view returns (uint256[] memory c) {
        ctx_shake memory ctx;
        ctx = shake_update(ctx, signature.c_tilde);
        bytes memory sign_bytes = shake_digest(ctx, 8);
        uint256 sign_int = 0;
        for (uint256 i = 0; i < 8; i++) {
            sign_int |= uint256(uint8(sign_bytes[i])) << (8 * i);
        }

        // Now set tau values of c to be ±1
        c = new uint256[](256);
        uint256 j;
        bytes memory bytes_j;
        for (uint256 i = 256 - tau; i < 256; i++) {
            // Rejects values until a value j <= i is found
            while (true) {
                (ctx, bytes_j) = shake_squeeze(ctx, 1);
                j = uint256(uint8(bytes_j[0]));
                if (j <= i) {
                    break;
                }
            }
            c[i] = c[j];
            if (sign_int & 1 == 1) {
                c[j] = q - 1;
            } else {
                c[j] = 1;
            }
            sign_int >>= 1;
        }
        c = ZKNOX_NTTFW(c, apsirev);
    }

    function verify(PubKey memory pk, bytes memory msgs, Signature memory signature) external view returns (bool) {
        // FIRST CORE STEP
        (uint256 norm_h, uint256[][] memory h, uint256[][] memory z) = dilithium_core_1(signature);
        uint256 i;
        uint256 j;
        if (norm_h > omega) {
            return false;
        }
        for (i = 0; i < 4; i++) {
            for (j = 0; j < 256; j++) {
                if (z[i][j] > gamma_1_minus_beta && 8380417 - z[i][j] > gamma_1_minus_beta) {
                    return false;
                }
            }
        }
        // C_NTT
        uint256[] memory c_ntt = compute_c_ntt(signature);

        // computation of NTT_FW((1<<d) * t1)
        uint256[][] memory t1_new = ZKNOX_Expand_Vec(pk.t1);
        // scale by 1<<d
        for (i = 0; i < 4; i++) {
            for (j = 0; j < 256; j++) {
                t1_new[i][j] <<= d;
            }
            t1_new[i] = ZKNOX_NTTFW(t1_new[i], apsirev);
        }

        // SECOND CORE STEP
        bytes memory w_prime_bytes = dilithium_core_2(apsirev, apsiInvrev, pk, z, c_ntt, h, t1_new);

        // FINAL HASH
        bytes32 final_hash;
        ctx_shake memory ctx;
        ctx = shake_update(ctx, pk.tr);
        ctx = shake_update(ctx, msgs);
        bytes memory mu = shake_digest(ctx, 64);

        ctx_shake memory ctx2;
        ctx2 = shake_update(ctx2, mu);
        ctx2 = shake_update(ctx2, w_prime_bytes);
        final_hash = bytes32(shake_digest(ctx2, 32));
        for (i = 0; i < 32; i++) {
            if (signature.c_tilde[i] != final_hash[i]) {
                return false;
            }
        }
        return true;
    }
}

//end of contract
/* the contract shall be initialized with a valid precomputation of psi_rev and psi_invrev contracts provided to the input ntt contract*/
