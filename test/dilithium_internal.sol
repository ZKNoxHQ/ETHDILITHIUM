// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "../src/ZKNOX_dilithium.sol";
import "../src/ZKNOX_dilithium_utils.sol";

contract ZKNOX_Dilithium_internal is ZKNOX_dilithium {
    constructor(address helper) ZKNOX_dilithium(helper) {}

    /// @dev the verifier itself is 146 bytes under EIP-170: any exposed function
    ///      with its own ABI decoder puts this contract over. The deployment
    ///      sanity script goes through the public verify(pk, m, signature, ctx).
}
