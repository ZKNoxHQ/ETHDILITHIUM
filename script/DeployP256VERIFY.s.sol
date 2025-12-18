pragma solidity ^0.8.25;

import {BaseScript} from "./BaseScript.sol";
import {ERC7913P256Verifier} from "@openzeppelin/contracts/utils/cryptography/verifiers/ERC7913P256Verifier.sol";

contract Script_Deploy_P256VERIFY is BaseScript {
    // SPDX-License-Identifier: MIT

    function run() external returns (address) {
        vm.startBroadcast();
        bytes32 salty = keccak256(abi.encodePacked("ZKNOX_v0.22"));
        ERC7913P256Verifier ecdsa = new ERC7913P256Verifier{salt: salty}();
        vm.stopBroadcast();
        return address(ecdsa);
    }
}
