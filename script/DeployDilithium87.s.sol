// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseScript} from "./BaseScript.sol";
import {ZKNOX_dilithium87} from "../src/ZKNOX_dilithium87.sol";
import {console} from "forge-std/Test.sol";

/// Deploys ZKNOX_dilithium87 (ML-DSA-87) bound to the Keccak-f[1600] helper
/// already on the chain (F1600_HELPER, see DeployF1600Helper.s.sol), then
/// checks it on the NIST KAT read from test/KAT/mldsa87_kat0.json.
///
/// The verifier is the whole deployment: public keys live in the calldata of
/// each verification, so there is nothing to install per key and the check is a
/// single call carrying the 67,680-byte key. Set KAT_CHECK=false to skip it.
contract Script_Deploy_Dilithium87 is BaseScript {
    function run() external returns (address) {
        vm.startBroadcast();

        bytes32 salty = keccak256(abi.encodePacked("ZKNOX_MLDSA87_v0.1"));

        address helper = vm.envAddress("F1600_HELPER");
        ZKNOX_dilithium87 dilithium87 = new ZKNOX_dilithium87{salt: salty}(helper);
        console.log("ZKNOX_dilithium87 deployed at:", address(dilithium87));

        if (vm.envOr("KAT_CHECK", true)) {
            string memory kat = vm.readFile("test/KAT/mldsa87_kat0.json");
            bytes memory key = vm.parseJsonBytes(kat, ".blob");
            bool ok = dilithium87.verify(key, vm.parseJsonBytes(kat, ".msg"), vm.parseJsonBytes(kat, ".sig"), "");
            console.log("NIST KAT verification:", ok);
            require(ok, "ML-DSA-87 KAT failed on the deployed verifier");
            console.log("key bytes passed per verification:", key.length);
        }

        vm.stopBroadcast();
        return address(dilithium87);
    }
}
