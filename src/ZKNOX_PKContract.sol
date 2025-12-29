// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {SSTORE2} from "solady/utils/SSTORE2.sol";
import {PubKey} from "./ZKNOX_dilithium_utils.sol";

/// @title PKContractV2 - Optimized ML-DSA Public Key Storage
/// @notice Stores an expanded ML-DSA public key using SSTORE2 for gas-efficient deployment
/// @dev Uses bytecode storage pattern to reduce deployment costs by ~70%
contract PKContract{
    /// @notice Pointer to contract storing A_hat matrix as bytecode
    address private immutable aHatPointer;
    
    /// @notice Pointer to contract storing t1 vector as bytecode
    address private immutable t1Pointer;
    
    /// @notice First 32 bytes of tr
    bytes32 private immutable trPart1;
    
    /// @notice Second 32 bytes of tr
    bytes32 private immutable trPart2;

    /// @notice Constructor stores public key components using SSTORE2
    /// @param _aHat A_hat matrix (uint256[4][4][32])
    /// @param _tr 64-byte tr value
    /// @param _t1 t1 vector (uint256[4][32])
    constructor(uint256[][][] memory _aHat, bytes memory _tr, uint256[][] memory _t1) {
        require(_tr.length == 64, "tr must be 64 bytes");
        
        // Encode and store large arrays as contract bytecode via SSTORE2
        aHatPointer = SSTORE2.write(abi.encode(_aHat));
        t1Pointer = SSTORE2.write(abi.encode(_t1));
        
        // Store tr in immutable slots (cheaper than SSTORE2 for small data)
        bytes32 part1;
        bytes32 part2;
        assembly {
            part1 := mload(add(_tr, 32))
            part2 := mload(add(_tr, 64))
        }
        trPart1 = part1;
        trPart2 = part2;
    }

    /// @notice Returns the full ML-DSA public key
    /// @return PubKey struct containing aHat, tr, and t1
    function getPublicKey() external view returns (PubKey memory) {
        // Decode A_hat from bytecode storage
        bytes memory aHatData = SSTORE2.read(aHatPointer);
        uint256[][][] memory aHat = abi.decode(aHatData, (uint256[][][]));
        
        // Decode t1 from bytecode storage
        bytes memory t1Data = SSTORE2.read(t1Pointer);
        uint256[][] memory t1 = abi.decode(t1Data, (uint256[][]));
        
        // Reconstruct tr from immutable slots
        bytes memory tr = new bytes(64);
        bytes32 part1 = trPart1;
        bytes32 part2 = trPart2;
        assembly {
            mstore(add(tr, 32), part1)
            mstore(add(tr, 64), part2)
        }
        
        return PubKey({aHat: aHat, tr: tr, t1: t1});
    }
}

/// @notice Interface for PK contracts - unchanged from original
interface IPKContract {
    function getPublicKey() external view returns (PubKey memory);
}
