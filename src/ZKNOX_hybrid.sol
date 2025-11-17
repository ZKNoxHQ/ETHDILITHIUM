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

/// @notice Contract designed for being delegated to by EOAs to authorize a IVerifier key to transact on their behalf.
contract ZKNOX_HybridVerifier {
    /// @notice Address of the contract storing the pre quantum address and post quantum public key
    address authorized_HybridPublicKey;
    /// @notice Address of the verification contract logic
    address CoreAddress; // address of the core verifier (DILITHIUM or ETHDILITHIUM)
    uint256 algoID;

    /// @notice Events
    event HPKeySet(address indexed newKey);
    event CoreVerifierSet(address indexed newCore, uint256 algoID);

    /// @notice Initialize the contract with authorized keys and core verifier
    /// @param _hpk Address storing the public key contract
    /// @param _core Address of the core verifier contract
    /// @param _algoID Algorithm identifier
    function initialize(address _hpk, address _core, uint256 _algoID) external {
        // Only initialize once
        if (CoreAddress == address(0) && _hpk != address(0) && _core != address(0)) {
            authorized_HybridPublicKey = _hpk;
            CoreAddress = _core;
            algoID = _algoID;

            emit HPKeySet(_hpk);
            emit CoreVerifierSet(_core, _algoID);
        }
    }

    /// @notice Verify hybrid signature (ECDSA + MLDSA)
    /// @param digest The data that was signed
    /// @param sig The MLDSA signature
    /// @param v ECDSA signature parameter v
    /// @param r ECDSA signature parameter r
    /// @param s ECDSA signature parameter s
    /// @return true if both signatures are valid
    function isValid(bytes memory digest, Signature memory sig, uint8 v, bytes32 r, bytes32 s)
        public
        view
        returns (bool)
    {
        bytes32 digest_for_ecdsa;
        if (digest.length > 32) {
            return false;
        }
        assembly {
            digest_for_ecdsa := mload(add(digest, 32))
        }

        // PK contract address must be non-zero
        if (authorized_HybridPublicKey == address(0)) {
            return false; // Signature validation failed
        }

        address hpkAddr = authorized_HybridPublicKey;
        IPKContract hpk = IPKContract(hpkAddr);

        address eth_addr = hpk.get_eth_address();

        // Verify ECDSA signature
        address recovered = ecrecover(digest_for_ecdsa, v, r, s);
        if (recovered != eth_addr) {
            return false; // Signature validation failed
        }

        // Verify MLDSA signature
        PubKey memory mldsa_pk = hpk.get_mldsa_public_key();
        ZKNOX_dilithium core = ZKNOX_dilithium(CoreAddress);
        // ISigVerifier core = ISigVerifier(CoreAddress);
        if (!core.verify(mldsa_pk, digest, sig, "")) {
            return false; // Signature validation failed
        }

        return true;
    }
} // end contract
