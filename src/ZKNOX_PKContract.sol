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
///* FILE: ZKNOX_PKContract.sol
///* Description: Contract storing a hybrid public key, including a MLDSA expanded public key and an ETH address.
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {PubKey} from "./ZKNOX_dilithium_utils.sol";

// A PKContract stored:
// - mldsa_pk an expanded MLDSA public key
contract PKContract {
    PubKey private mldsa_pk;

    // Constructor initializes the full key
    constructor(uint256[][][] memory _a_hat, bytes memory _tr, uint256[][] memory _t1) {
        mldsa_pk = PubKey({a_hat: _a_hat, tr: _tr, t1: _t1});
    }

    // Return the Post-Quantum public key
    function get_mldsa_public_key() external view returns (PubKey memory) {
        return mldsa_pk;
    }

    function Deploy_Kpub(
    uint256[][][] memory _a_hat, 
    bytes memory _tr, 
    uint256[][] memory _t1, 
    uint256 salt
    ) external returns (address a_polynomial) {
    
    // Build the payload by flattening everything
    bytes memory payload;
    
    // Flatten a_hat (k x l x 256)
    for (uint256 i = 0; i < _a_hat.length; i++) {
        for (uint256 j = 0; j < _a_hat[i].length; j++) {
            payload = abi.encodePacked(payload, _a_hat[i][j]);
        }
    }
    
    // Append tr
    payload = abi.encodePacked(payload, _tr);
    
    // Flatten t1 (k x 256)
    for (uint256 i = 0; i < _t1.length; i++) {
        payload = abi.encodePacked(payload, _t1[i]);
    }
    
    // Wrap with creation code
    bytes memory bytecode_pol = abi.encodePacked(
        hex"63", 
        uint32(payload.length), 
        hex"80600E6000396000F3", 
        payload
    );
    
    assembly {
        a_polynomial := create2(0, add(bytecode_pol, 0x20), mload(bytecode_pol), salt)
    }
    require(a_polynomial != address(0), "Deployment failed");
}

function Deploy_flatten_Kpub(
    bytes calldata flatPayload,  // pre-encoded off-chain
    uint256 salt
) external returns (address a_polynomial) {
    bytes memory bytecode_pol = abi.encodePacked(
        hex"63", 
        uint32(flatPayload.length), 
        hex"80600E6000396000F3", 
        flatPayload
    );
    
    assembly {
        a_polynomial := create2(0, add(bytecode_pol, 0x20), mload(bytecode_pol), salt)
    }
    require(a_polynomial != address(0), "Deployment failed");
}

function ReadPolynomial(address pkContract) 
    external view 
    returns (
        uint256[4][4][32] memory a_hat,
        bytes32 tr,
        uint256[4][32] memory t1,
        bytes memory salt
    ) 
{
    // Sizes:
    // a_hat: 4 * 4 * 32 * 32 = 16384 bytes (0x4000)
    // tr: 32 bytes (0x20)
    // t1: 4 * 32 * 32 = 4096 bytes (0x1000)
    // salt: 40 bytes (0x28)
    // Total: 20552 bytes (0x5048)
    
    salt = new bytes(40);
    
    assembly {
        // a_hat: bytes 0 to 16383
        extcodecopy(pkContract, a_hat, 0, 0x4000)
        
        // tr: bytes 16384 to 16415 (use scratch space)
        extcodecopy(pkContract, 0x00, 0x4000, 0x20)
        tr := mload(0x00)
        
        // t1: bytes 16416 to 20511
        extcodecopy(pkContract, t1, 0x4020, 0x1000)
        
        // salt: bytes 20512 to 20551 (40 bytes)
        mstore(salt, 0x28)  // set length to 40
        extcodecopy(pkContract, add(salt, 0x20), 0x5020, 0x28)
    }
}

}

interface IPKContract {
    function get_mldsa_public_key() external view returns (PubKey memory);
}
