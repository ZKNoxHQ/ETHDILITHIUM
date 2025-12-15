pragma solidity ^0.8.25;

import {Script} from "../lib/forge-std/src/Script.sol";
import {BaseScript} from "./BaseScript.sol";

import {console} from "forge-std/Test.sol";
import {ERC7913P256Verifier} from "@openzeppelin/contracts/utils/cryptography/verifiers/ERC7913P256Verifier.sol";

contract Script_Deploy_P256VERIFY is BaseScript {
    // SPDX-License-Identifier: MIT

    function run() external returns (address) {
        vm.startBroadcast();
        bytes32 salty = keccak256(abi.encodePacked("ZKNOX_v0.22"));
        ERC7913P256Verifier ECDSA = new ERC7913P256Verifier{salt: salty}();
        vm.stopBroadcast();
        return address(ECDSA);
    }
}
