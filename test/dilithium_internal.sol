// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "../src/ZKNOX_dilithium.sol";
import "../src/ZKNOX_dilithium_utils.sol";

contract ZKNOX_Dilithium_internal is ZKNOX_dilithium {
    function expose_verify_internal(PubKey memory pk, bytes memory m_prime, Signature memory signature)
        external
        view
        returns (bool)
    {
        return verifyInternal(pk, m_prime, signature);
    }
}
