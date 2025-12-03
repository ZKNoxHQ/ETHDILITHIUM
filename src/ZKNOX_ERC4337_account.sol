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
    bytes private pre_quantum_pubkey;
    bytes private post_quantum_pubkey;
    address private pre_quantum_logic_contract_address;
    address private post_quantum_logic_contract_address;
    ZKNOX_HybridVerifier private hybrid_verifier;

    constructor(
        IEntryPoint entry_point,
        bytes memory _eth_address,
        bytes memory _mldsa_pk_address,
        address eth_logic_address,
        address mldsa_logic_address
    ) {
        _entryPoint = entry_point;
        pre_quantum_pubkey = _eth_address;
        post_quantum_pubkey = _mldsa_pk_address;
        pre_quantum_logic_contract_address = eth_logic_address;
        post_quantum_logic_contract_address = mldsa_logic_address;
        hybrid_verifier = new ZKNOX_HybridVerifier();
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
        (bytes memory pre_quantum_sig, bytes memory post_quantum_sig) = abi.decode(userOp.signature, (bytes, bytes));
        bool isValid = hybrid_verifier.isValid(
            pre_quantum_pubkey,
            post_quantum_pubkey,
            pre_quantum_logic_contract_address,
            post_quantum_logic_contract_address,
            abi.encodePacked(userOpHash),
            pre_quantum_sig,
            post_quantum_sig
        );
        if (!isValid) {
            return SIG_VALIDATION_FAILED;
        }
        return SIG_VALIDATION_SUCCESS;
    }
}
