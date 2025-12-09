pragma solidity ^0.8.25;

import {Script} from "../lib/forge-std/src/Script.sol";
import {BaseScript} from "./BaseScript.sol";

import {console} from "forge-std/Test.sol";
import "../src/ZKNOX_P256VERIFY.sol";

contract Script_Deploy_P256VERIFY is BaseScript {
    // SPDX-License-Identifier: MIT

    function run() external returns (address) {
        // vm.startBroadcast();
        bytes32 salty = keccak256(abi.encodePacked("ZKNOX_v0.22"));
        ZKNOX_p256_verify ECDSA = new ZKNOX_p256_verify{salt: salty}();
        // vm.stopBroadcast();
        return address(ECDSA);
    }
}
