// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import {BaseScript} from "./BaseScript.sol";
import {ZKNOX_ERC4337_account} from "../src/ZKNOX_ERC4337_account.sol";
import "../lib/account-abstraction/contracts/core/EntryPoint.sol";
import {IEntryPoint} from "../lib/account-abstraction/contracts/interfaces/IEntryPoint.sol";
import {Constants} from "../test/ZKNOX_seed.sol";

contract DeployERC4337Account is BaseScript {
    function run() external returns (address) {
        vm.startBroadcast();

        // address of the ECDSA logic contract
        address pre_quantum_logic_address = address(0xAe7B7Ecebb895b0Db67aa58307e506F0F3d5F38e);
        // address of the MLDSA logic contract
        address post_quantum_logic_address = address(0x0000000000000000000000000000000000000000);
        address hybrid_verifier_logic_address = address(0x0000000000000000000000000000000000000000);
        IEntryPoint entryPoint = new EntryPoint();
        bytes memory pre_quantum_pubkey = abi.encodePacked(Constants.addr);
        // address of the PKContract storing the MLDSA public key
        bytes memory post_quantum_pubkey = hex"0000";

        // Deploy the Smart Account
        ZKNOX_ERC4337_account account = new ZKNOX_ERC4337_account(
            entryPoint,
            pre_quantum_pubkey,
            post_quantum_pubkey,
            pre_quantum_logic_address,
            post_quantum_logic_address,
            hybrid_verifier_logic_address
        );
        console.log("Deployed ERC4337_Account at:", address(account));

        vm.stopBroadcast();
        return address(account);
    }
}
