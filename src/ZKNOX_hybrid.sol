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
import {ISigVerifier} from "./ZKNOX_IVerifier.sol";

/// @notice Contract designed for being delegated to by EOAs to authorize a IVerifier key to transact on their behalf.
contract ZKNOX_HybridVerifier {
    /// @notice Storage slot for the contract's state
    bytes32 private constant STORAGE_SLOT = keccak256("ZKNOX_HybridVerifier_0");

    struct Storage {
        /// @notice Address of the contract storing the ECDSA public key
        address authorized_ECDSA;
        /// @notice Address of the contract storing the post quantum public key
        address authorized_PQPublicKey;
        /// @notice Address of the verification contract logic
        address CoreAddress; // address of the core verifier (FALCON, DILITHIUM, etc.), shall be the address of a ISigVerifier
        uint256 algoID;
    }

    /// @notice Events
    event ECDSAKeySet(address indexed newKey);
    event PQKeySet(address indexed newKey);
    event CoreVerifierSet(address indexed newCore, uint256 algoID);

    /// @notice Errors
    error InvalidECDSASignature();
    error InvalidPQSignature();
    error PQKeyNotSet();
    error UnauthorizedAccess();
    error ZeroAddress();

    /// @notice Get storage reference
    function getStorage() internal pure returns (Storage storage s) {
        bytes32 slot = STORAGE_SLOT;
        assembly {
            s.slot := slot
        }
    }

    /// @notice Initialize the contract with authorized keys and core verifier
    /// @param _ecdsaKey Address authorized for ECDSA verification
    /// @param _pqKey Address storing the post-quantum public key
    /// @param _core Address of the core verifier contract
    /// @param _algoID Algorithm identifier
    function initialize(address _ecdsaKey, address _pqKey, address _core, uint256 _algoID) external {
        Storage storage s = getStorage();

        // Only initialize once
        if (s.CoreAddress != address(0)) revert UnauthorizedAccess();

        if (_ecdsaKey == address(0) || _pqKey == address(0) || _core == address(0)) {
            revert ZeroAddress();
        }

        s.authorized_ECDSA = _ecdsaKey;
        s.authorized_PQPublicKey = _pqKey;
        s.CoreAddress = _core;
        s.algoID = _algoID;

        emit ECDSAKeySet(_ecdsaKey);
        emit PQKeySet(_pqKey);
        emit CoreVerifierSet(_core, _algoID);
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
        Storage storage store = getStorage();

        bytes32 digest_for_ecdsa;
        require(digest.length <= 32, "Input <= 32 bytes required");
        assembly {
            digest_for_ecdsa := mload(add(digest, 32))
        }

        // Verify ECDSA signature
        address recovered = ecrecover(digest_for_ecdsa, v, r, s);
        if (recovered != store.authorized_ECDSA) {
            revert InvalidECDSASignature();
        }

        // Verify MLDSA signature
        if (store.authorized_PQPublicKey == address(0)) {
            revert PQKeyNotSet();
        }
        ISigVerifier core = ISigVerifier(store.CoreAddress);
        PubKey memory pq_pk = core.GetPublicKey(store.authorized_PQPublicKey);
        bytes memory ctx = "";
        if (!core.verify(pq_pk, digest, sig, ctx)) {
            revert InvalidPQSignature();
        }

        return true;
    }
} // end contract
