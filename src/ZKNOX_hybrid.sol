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
import "ZKNOX_IVerifier.sol";

/// @notice Contract designed for being delegated to by EOAs to authorize a IVerifier key to transact on their behalf.
contract ZKNOX_HybridVerifier {
    //derived address from ecdsa
    address public authorized_ECDSA;

    /// @notice Address of the contract storing the post quantum public key
    address public authorized_PQPublicKey;
    /// @notice Address of the verification contract logic

    address public CoreAddress; //address of the core verifier (FALCON, DILITHIUM, etc.), shall be the address of a ISigVerifier
    uint256 public algoID;

    /// @notice Internal nonce used for replay protection, must be tracked and included into prehashed message.
    uint256 public nonce;

    //input are AlgoIdentifier, Signature verification address, publickey storing contract
    constructor(uint256 iAlgoID, address iCore, address iPublicPQKey) {
        CoreAddress = iCore; // Address of contract of Signature verification (FALCON, DILITHIUM)
        algoID = iAlgoID;
        authorized_PQPublicKey = iPublicPQKey;
        nonce = 0;
    }

    /// @notice Main entrypoint for authorized transactions. Accepts transaction parameters (to, data, value) and a musig2 signature.
    function transact(
        address to,
        bytes memory data,
        uint256 val,
        uint8 v,
        bytes32 r,
        bytes32 s,
        bytes memory sig // MLDSA signature
    )
        external
        payable
    {
        bytes32 digest = keccak256(abi.encode(nonce++, to, data, val));
        ISigVerifier Core = ISigVerifier(CoreAddress);

        uint256[] memory nttpk;
        address recovered = ecrecover(digest, v, r, s);

        require(authorized_PQPublicKey != address(0), "authorizedPublicKey null");
        require(recovered == authorized_ECDSA, "Invalid ECDSA signature");
        // todo something with sig here?

        (bool success,) = to.call{value: val}(data);

        require(success, "failing executing the cal");
    }

    function isValid_HybridSignature(
        address to,
        bytes memory data,
        uint256 val,
        uint8 v,
        bytes32 r,
        bytes32 s,
        bytes memory sig
    ) public returns (bool) {
        bytes32 digest = keccak256(abi.encode(nonce++, to, data, val));
        ISigVerifier Core = ISigVerifier(CoreAddress);

        uint256[] memory nttpk;
        address recovered = ecrecover(digest, v, r, s);

        require(authorized_PQPublicKey != address(0), "authorizedPublicKey null");
        require(recovered == authorized_ECDSA, "Invalid ECDSA signature");
        pqpk = Core.GetPublicKey(authorized_PQPublicKey);
        require(Core.verify(abi.encodePacked(digest), sig, pqpk), "Invalid Dilithium");

        return true;
    }

    //debug function for now: todo, remove when transact successfully tested
    function verify(
        bytes memory data,
        bytes memory salt, // compacted signature salt part
        uint256[] memory s2
    )
        public
        view
        returns (bool)
    {
        ISigVerifier Core = ISigVerifier(CoreAddress);
        uint256[] memory nttpk;
        nttpk = Core.GetPublicKey(authorized_PQPublicKey);
        return Core.verify(data, salt, s2, nttpk);
    }

    function GetPublicKey() public view returns (uint256[] memory res) {
        ISigVerifier Core = ISigVerifier(CoreAddress);
        res = Core.GetPublicKey(authorized_PQPublicKey);
    }

    function GetStorage() public view returns (address, address) {
        return (CoreAddress, authorized_PQPublicKey);
    }
    //receive() external payable {}
} //end contract
