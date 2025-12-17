// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseAccount, PackedUserOperation} from "../lib/account-abstraction/contracts/core/BaseAccount.sol";
import {SIG_VALIDATION_FAILED, SIG_VALIDATION_SUCCESS} from  "../lib/account-abstraction/contracts/core/Helpers.sol";
import {IEntryPoint} from "../lib/account-abstraction/contracts/interfaces/IEntryPoint.sol";
import {ZKNOX_HybridVerifier} from  "./ZKNOX_hybrid.sol";

contract ZKNOX_ERC4337_account is BaseAccount {
    IEntryPoint private _entryPoint;
    bytes private preQuantumPubKey;
    bytes private postQuantumPubKey;
    address private preQuantumLogicContractAddress;
    address private postQuantumLogicContractAddress;
    address private hybridVerifierLogicContractAddress;

    constructor(
        IEntryPoint __entryPoint,
        bytes memory _preQuantumPubKey,
        bytes memory _postQuantumPubKey,
        address _preQuantumLogicContractAddress,
        address _postQuantumLogicContractAddress,
        address _hybridVerifierLogicContractAddress
    ) {
        _entryPoint = __entryPoint;
        preQuantumPubKey = _preQuantumPubKey;
        postQuantumPubKey = _postQuantumPubKey;
        preQuantumLogicContractAddress = _preQuantumLogicContractAddress;
        postQuantumLogicContractAddress = _postQuantumLogicContractAddress;
        hybridVerifierLogicContractAddress = _hybridVerifierLogicContractAddress;
    }

    /// @inheritdoc BaseAccount
    function entryPoint() public view virtual override returns (IEntryPoint) {
        return _entryPoint;
    }

    /// @inheritdoc BaseAccount
    function _validateSignature(PackedUserOperation calldata userOp, bytes32 userOpHash)
        internal
        virtual
        override
        returns (uint256 validationData)
    {
        (bytes memory preQuantumSig, bytes memory postQuantumSig) = abi.decode(userOp.signature, (bytes, bytes));
        ZKNOX_HybridVerifier hybridVerifier = ZKNOX_HybridVerifier(hybridVerifierLogicContractAddress);
        bool isValid = hybridVerifier.isValid(
            preQuantumPubKey,
            postQuantumPubKey,
            preQuantumLogicContractAddress,
            postQuantumLogicContractAddress,
            userOpHash,
            preQuantumSig,
            postQuantumSig
        );
        if (!isValid) {
            return SIG_VALIDATION_FAILED;
        }
        return SIG_VALIDATION_SUCCESS;
    }
}
