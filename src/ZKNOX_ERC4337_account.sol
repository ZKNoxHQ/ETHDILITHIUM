// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "../lib/account-abstraction/contracts/core/BaseAccount.sol";
import "../lib/account-abstraction/contracts/core/Helpers.sol";
import "../lib/account-abstraction/contracts/interfaces/IEntryPoint.sol";

import "./ZKNOX_PKContract.sol";
import "./ZKNOX_dilithium_utils.sol";
import "./ZKNOX_hybrid.sol";

contract ZKNOX_ERC4337_account is BaseAccount {
    IEntryPoint private _entryPoint;
    bytes private preQuantumPubKey;
    bytes private postQuantumPubKey;
    address private preQuantumLogicContractAddress;
    address private postQuantumLogicContractAddress;
    address private hybrid_verifier_logic_contract_address;

    constructor(
        IEntryPoint entry_point,
        bytes memory _preQuantumPubKey,
        bytes memory _postQuantumPubKey,
        address _preQuantumLogicContractAddress,
        address _postQuantumLogicContractAddress,
        address _hybrid_verifier_logic_contract_address
    ) {
        _entryPoint = entry_point;
        preQuantumPubKey = _preQuantumPubKey;
        postQuantumPubKey = _postQuantumPubKey;
        preQuantumLogicContractAddress = _preQuantumLogicContractAddress;
        postQuantumLogicContractAddress = _postQuantumLogicContractAddress;
        hybrid_verifier_logic_contract_address = _hybrid_verifier_logic_contract_address;
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
        ZKNOX_HybridVerifier hybrid_verifier = ZKNOX_HybridVerifier(hybrid_verifier_logic_contract_address);
        bool isValid = hybrid_verifier.isValid(
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
