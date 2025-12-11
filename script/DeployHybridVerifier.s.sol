pragma solidity ^0.8.25;

import {Script} from "../lib/forge-std/src/Script.sol";
import {BaseScript} from "./BaseScript.sol";
import "../src/ZKNOX_hybrid.sol";
import {DeployPKContract} from "./Deploy_MLDSA_PK.s.sol";
import {Script_Deploy_Dilithium} from "./DeployDilithium.s.sol";
import {Script_Deploy_ECDSA} from "./DeployECDSA.s.sol";

import {console} from "forge-std/Test.sol";
import {Constants} from "../test/ZKNOX_seed.sol";

import "@openzeppelin/contracts/utils/Strings.sol";

contract Script_Deploy_Hybrid_Verifier is BaseScript {
    // SPDX-License-Identifier: MIT

    function run() external returns (address) {
        address pre_quantum_address = Constants.addr;
        DeployPKContract deployPKContract = new DeployPKContract();
        address post_quantum_address = deployPKContract.run();
        Script_Deploy_ECDSA script_Deploy_ECDSA = new Script_Deploy_ECDSA();
        address pre_quantum_logic_address = script_Deploy_ECDSA.run();
        Script_Deploy_Dilithium script_Deploy_Dilithium = new Script_Deploy_Dilithium();
        address post_quantum_logic_address = script_Deploy_Dilithium.run();

        vm.startBroadcast();

        ZKNOX_HybridVerifier HybridVerifier = new ZKNOX_HybridVerifier();
        console.log("HybridVerifier deployed at:", address(HybridVerifier));

        bytes memory data = hex"1111222233334444111122223333444411112222333344441111222233334444";
        bytes memory pre_quantum_sig;
        bytes memory post_quantum_sig;
        {
            string[] memory cmds = new string[](5);
            cmds[0] = "pythonref/myenv/bin/python";
            cmds[1] = "pythonref/sig_hybrid.py";
            cmds[2] = vm.toString(data);
            cmds[3] = "NIST";
            cmds[4] = Constants.seed_str;

            bytes memory result = vm.ffi(cmds);
            (bytes memory c_tilde, bytes memory z, bytes memory h, uint8 v, uint256 r, uint256 s) =
                abi.decode(result, (bytes, bytes, bytes, uint8, uint256, uint256));

            pre_quantum_sig = abi.encodePacked(r, s, v);
            post_quantum_sig = abi.encodePacked(c_tilde, z, h);
        }

        // Scope 3: Verify
        bool valid = HybridVerifier.isValid(
            abi.encodePacked(pre_quantum_address),
            abi.encodePacked(post_quantum_address),
            pre_quantum_logic_address,
            post_quantum_logic_address,
            data,
            pre_quantum_sig,
            post_quantum_sig
        );
        console.log(valid);
        if (valid == false) revert("verification failure");

        vm.stopBroadcast();
        return address(HybridVerifier);
    }
}
