// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseScript} from "./BaseScript.sol";
import {ZKNOX_dilithium65} from "../src/ZKNOX_dilithium65.sol";
import {console} from "forge-std/Test.sol";

/// Deploys ZKNOX_dilithium65 (ML-DSA-65) bound to the Keccak-f[1600] helper
/// already on the chain (F1600_HELPER, see DeployF1600Helper.s.sol), then
/// checks it on the NIST KAT read from test/KAT/mldsa65_kat0.json.
///
/// The verifier is the whole deployment: public keys live in the calldata of
/// each verification, so there is nothing to install per key and the check is a
/// single call carrying the 38,112-byte key. Set KAT_CHECK=false to skip it.
contract Script_Deploy_Dilithium65 is BaseScript {
    function run() external returns (address) {
        vm.startBroadcast();

        bytes32 salty = keccak256(abi.encodePacked("ZKNOX_MLDSA65_v0.1"));

        address helper = vm.envAddress("F1600_HELPER");
        ZKNOX_dilithium65 dilithium65 = new ZKNOX_dilithium65{salt: salty}(helper);
        console.log("ZKNOX_dilithium65 deployed at:", address(dilithium65));

        if (vm.envOr("KAT_CHECK", true)) {
            string memory kat = vm.readFile("test/KAT/mldsa65_kat0.json");
            bytes memory key = vm.parseJsonBytes(kat, ".blob");
            bool ok = dilithium65.verify(key, vm.parseJsonBytes(kat, ".msg"), vm.parseJsonBytes(kat, ".sig"), "");
            console.log("NIST KAT verification:", ok);
            require(ok, "ML-DSA-65 KAT failed on the deployed verifier");
            console.log("key bytes passed per verification:", key.length);
        }

        vm.stopBroadcast();
        return address(dilithium65);
    }
}
