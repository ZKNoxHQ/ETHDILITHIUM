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
///* FILE: ZKNOX_hybrid.sol
///* Description: Compute hybrid verification of post-quantum and prequantum verification
/**
 *
 */
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Signature, PubKey, slice} from "./ZKNOX_dilithium_utils.sol";
import {IPKContract} from "./ZKNOX_PKContract.sol";
import {IERC7913SignatureVerifier} from "@openzeppelin/contracts/interfaces/IERC7913.sol";
import {ZKNOX_dilithium} from "./ZKNOX_dilithium.sol";
import {ZKNOX_ecdsa} from "./ZKNOX_ECDSA.sol";

/// @notice Contract designed for being delegated to by EOAs to authorize a IVerifier key to transact on their behalf.
contract ZKNOX_HybridVerifier {
    /// @notice Verify hybrid signature (pre- and post-quantum)
    /// @param pre_quantum_pubkey can be ecrecover with k1 curve or ecverify with r1 curve
    /// @param post_quantum_pubkey can be mldsa or mldsaeth address (pointing to a contract containing the public key)
    /// @param pre_quantum_logic_contract_address the logic of the pre-quantum verification
    /// @param post_quantum_logic_contract_address the logic of the post-quantum verification
    /// @param digest The data that was signed
    /// @param pre_quantum_sig the pre-quantum signature: [r, s, v] for k1, [r, s] for r1
    /// @param post_quantum_sig the post-quantum signature [c_tilde, z, h]
    /// @return true if both signatures are valid
    function isValid(
        bytes calldata pre_quantum_pubkey,
        bytes calldata post_quantum_pubkey,
        address pre_quantum_logic_contract_address,
        address post_quantum_logic_contract_address,
        bytes32 digest,
        bytes calldata pre_quantum_sig,
        bytes calldata post_quantum_sig
    ) public view returns (bool) {
        // Validate digest length
        if (digest.length > 32) {
            return false;
        }

        // Verify pre-quantum signature
        IERC7913SignatureVerifier pre_quantum_core = IERC7913SignatureVerifier(pre_quantum_logic_contract_address);
        if (pre_quantum_core.verify(pre_quantum_pubkey, digest, pre_quantum_sig) != pre_quantum_core.verify.selector) {
            return false;
        }

        // Verify post-quantum signature
        IERC7913SignatureVerifier post_quantum_core = IERC7913SignatureVerifier(post_quantum_logic_contract_address);
        if (
            post_quantum_core.verify(post_quantum_pubkey, digest, post_quantum_sig) != post_quantum_core.verify.selector
        ) {
            return false;
        }
        return true;
    }
} // end contract
