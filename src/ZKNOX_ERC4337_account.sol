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
    PKContract private _pkContract;
    ZKNOX_HybridVerifier private _hybridVerifier;

    constructor(IEntryPoint entryPoint, PKContract pkContract, ZKNOX_HybridVerifier hybridVerifier) {
        _entryPoint = entryPoint;
        _pkContract = pkContract;
        _hybridVerifier = hybridVerifier;
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
        (Signature memory signature, uint8 v, bytes32 r, bytes32 s) =
            abi.decode(userOp.signature, (Signature, uint8, bytes32, bytes32));
        bool isValid = _hybridVerifier.isValid(abi.encodePacked(userOpHash), signature, v, r, s);
        if (!isValid) {
            return SIG_VALIDATION_FAILED;
        }
        return SIG_VALIDATION_SUCCESS;
    }
}
