// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {PKContract} from "./ZKNOX_PKContract.sol";

contract PKFactory {
    event Deployed(address indexed owner, address pkContract);

    function deploy(bytes calldata publicKeyData) external returns (address addr) {
        PKContract pk = new PKContract(publicKeyData);
        addr = address(pk);
        emit Deployed(msg.sender, addr);
    }
}
