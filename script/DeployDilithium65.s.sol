// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseScript} from "./BaseScript.sol";
import {ZKNOX_dilithium65} from "../src/ZKNOX_dilithium65.sol";
import {console} from "forge-std/Test.sol";

/// Deploys ZKNOX_dilithium65 (ML-DSA-65) bound to the Keccak-f[1600] helper
/// already on the chain (F1600_HELPER, see DeployF1600Helper.s.sol), then
/// checks it on the NIST KAT (count 0 of test/KAT/PQCsignKAT_Dilithium3.rsp,
/// read from test/KAT/mldsa65_kat0.json written by js/gen_test_vectors65.js):
/// the key goes through setKey (two SSTORE2 halves) and the public
/// verify(pk, m, sig, ctx). Set KAT_CHECK=false to skip the on-chain check
/// (it writes the 2 x 20,160-byte key).
contract Script_Deploy_Dilithium65 is BaseScript {
    function run() external returns (address) {
        vm.startBroadcast();

        bytes32 salty = keccak256(abi.encodePacked("ZKNOX_MLDSA65_v0.1"));

        address helper = vm.envAddress("F1600_HELPER");
        ZKNOX_dilithium65 dilithium65 = new ZKNOX_dilithium65{salt: salty}(helper);
        console.log("ZKNOX_dilithium65 deployed at:", address(dilithium65));

        if (vm.envOr("KAT_CHECK", true)) {
            string memory kat = vm.readFile("test/KAT/mldsa65_kat0.json");
            bytes memory pk = dilithium65.setKey(vm.parseJsonBytes(kat, ".blob"));
            bytes memory sig = vm.parseJsonBytes(kat, ".sig");
            bytes memory m = vm.parseJsonBytes(kat, ".msg");
            bool ok = dilithium65.verify(pk, m, sig, "");
            console.log("NIST KAT verification:", ok);
            require(ok, "ML-DSA-65 KAT failed on the deployed verifier");
            console.log("KAT public key pointers (pointer0 || pointer1):");
            console.logBytes(pk);
        }

        vm.stopBroadcast();
        return address(dilithium65);
    }
}
