// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {PubKey} from "./ZKNOX_dilithium_utils.sol";

contract PKContract {
    PubKey private Kpub;

    // Constructor initializes the full key
    constructor(uint256[][][] memory _a_hat, bytes memory _tr, uint256[][] memory _t1) {
        Kpub = PubKey({a_hat: _a_hat, tr: _tr, t1: _t1});
    }

    // Return the public key
    function getPubKey() external view returns (PubKey memory) {
        return Kpub;
    }
}

interface IPKContract {
    function getPubKey() external view returns (PubKey memory);
}
