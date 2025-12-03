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

import {Signature, PubKey} from "./ZKNOX_dilithium_utils.sol";
import {IPKContract} from "./ZKNOX_PKContract.sol";
import {ZKNOX_dilithium} from "./ZKNOX_dilithium.sol";
import {Test, console} from "forge-std/Test.sol";

/// @notice Contract designed for being delegated to by EOAs to authorize a IVerifier key to transact on their behalf.
contract ZKNOX_HybridVerifier {
    /// @notice Verify hybrid signature (ECDSA + MLDSA)
    /// @param pre_quantum_pubkey The ECDSA address
    /// @param post_quantum_pubkey The MLDSA address (pointing to a contract containing the public key)
    /// @param pre_quantum_logic_contract_address the logic of the pre-quantum verification
    /// @param post_quantum_logic_contract_address the logic of the post-quantum verification
    /// @param digest The data that was signed
    /// @param pre_quantum_sig the ECDSA signature [r, s, v]
    /// @param post_quantum_sig the MLDSA signature [c_tilde, z, h]
    /// @return true if both signatures are valid
    function isValid(
        bytes memory pre_quantum_pubkey,
        bytes memory post_quantum_pubkey,
        address pre_quantum_logic_contract_address,
        address post_quantum_logic_contract_address,
        bytes memory digest,
        bytes memory pre_quantum_sig,
        bytes memory post_quantum_sig
    ) public view returns (bool) {
        bytes32 digest_for_ecdsa;
        if (digest.length > 32) {
            return false;
        }
        assembly {
            digest_for_ecdsa := mload(add(digest, 32))
        }
        // Verify ECDSA signature
        bytes32 r;
        bytes32 s;
        uint8 v;
        assembly {
            r := mload(add(pre_quantum_sig, 32))
            s := mload(add(pre_quantum_sig, 64))
            v := byte(0, mload(add(pre_quantum_sig, 96)))
        }
        address recovered = ecrecover(digest_for_ecdsa, v, r, s);
        require(pre_quantum_pubkey.length == 20, "bytes length != 20");
        address pre_quantum_address;
        assembly {
            pre_quantum_address := mload(add(pre_quantum_pubkey, 20))
        }
        if (recovered != pre_quantum_address) {
            return false; // Signature validation failed
        }

        // Verify MLDSA signature
        // TODO check address(0)?
        address post_quantum_address;
        assembly {
            post_quantum_address := mload(add(post_quantum_pubkey, 20))
        }
        IPKContract hpk = IPKContract(post_quantum_address);
        PubKey memory mldsa_public_key = hpk.get_mldsa_public_key();
        ZKNOX_dilithium core = ZKNOX_dilithium(post_quantum_logic_contract_address);
        Signature memory sig;

        sig.c_tilde = slice(post_quantum_sig, 0, 32);
        sig.z = slice(post_quantum_sig, 32, 2304);
        sig.h = slice(post_quantum_sig, 2336, 84);
        if (!core.verify(mldsa_public_key, digest, sig, "")) {
            return false; // Signature validation failed
        }
        return true;
    }
} // end contract

function slice(bytes memory data, uint256 start, uint256 len) pure returns (bytes memory) {
    require(data.length >= start + len, "slice out of range");

    bytes memory b = new bytes(len);

    for (uint256 i = 0; i < len; i++) {
        b[i] = data[start + i];
    }

    return b;
}
