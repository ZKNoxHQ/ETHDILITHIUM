pragma solidity ^0.8.25;

import {BaseScript} from "./BaseScript.sol";
import {ZKNOX_ecdsa} from "../src/ZKNOX_ECDSA.sol";

contract Script_Deploy_ECDSA is BaseScript {
    // SPDX-License-Identifier: MIT

    function run() external returns (address) {
        vm.startBroadcast();
        ZKNOX_ecdsa ecdsa = new ZKNOX_ecdsa();
        vm.stopBroadcast();
        return address(ecdsa);
    }
}
