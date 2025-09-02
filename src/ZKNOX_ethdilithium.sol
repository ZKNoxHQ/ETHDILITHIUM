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
    gamma_1_minus_beta
} from "./ZKNOX_dilithium_utils.sol";
import {useHintDilithium} from "./ZKNOX_hint.sol";

contract ZKNOX_ethdilithium {
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

    function compute_c(bytes memory c_tilde) public view returns (uint256[] memory c) {
        // Initial state
        bytes32 state = keccak256(c_tilde);
        // counter mode prng
        bytes32[] memory output = new bytes32[](n);
        uint64 counter = 0;
        uint256 i = 0;
        while (i < n) {
            output[i] = keccak256(abi.encodePacked(state, counter));
            i += 1;
            counter += 1;
        }

        ctx_shake memory ctx;
        ctx = shake_update(ctx, c_tilde);
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
    }

    function verify(PubKey memory pk, bytes memory msgs, Signature memory signature)
        external
        view
        returns (bool result)
    {
        // FIRST CORE STEP
        (uint256 norm_h, uint256[][] memory h, uint256[][] memory z) = dilithium_core_1(signature);

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
        // CNTT
        uint256[] memory c_ntt = ZKNOX_Expand(signature.c_ntt);

        // t1_new
        uint256[][] memory t1_new = ZKNOX_Expand_Vec(pk.t1);

        // SECOND CORE STEP
        bytes memory w_prime_bytes = dilithium_core_2(apsirev, apsiInvrev, pk, z, c_ntt, h, t1_new);

        // FINAL HASH
        bytes32 final_hash =
            KeccakPRNG(abi.encodePacked(KeccakPRNG(abi.encodePacked(pk.tr, msgs), 2), w_prime_bytes), 1)[0];
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
