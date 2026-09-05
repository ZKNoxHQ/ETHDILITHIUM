// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Script} from "../lib/forge-std/src/Script.sol";
import {console} from "forge-std/Test.sol";

/// Deploys the Keccak-f[1600] helper contract (raw runtime test/f1600_170.hex,
/// 21,622 bytes, ~4.32M gas) once per chain. ZKNOX_dilithium binds it by code
/// hash at construction: pass the printed address as F1600_HELPER to
/// DeployDilithiumInternal.s.sol. Run with --ffi.
contract Script_Deploy_F1600_Helper is Script {
    function run() external returns (address helper) {
        string[] memory cmds = new string[](2);
        cmds[0] = "cat";
        cmds[1] = "test/f1600_170.hex";
        bytes memory runtime = vm.ffi(cmds);
        bytes memory initCode = abi.encodePacked(hex"61", uint16(runtime.length), hex"8061000b5f395ff3", runtime);
        vm.startBroadcast();
        assembly {
            helper := create(0, add(initCode, 32), mload(initCode))
        }
        vm.stopBroadcast();
        require(helper != address(0), "f1600-170: CREATE failed");
        require(
            helper.codehash == 0x4afb4435879cdf8e50474c7aab2bc3a679caed432550ad6dba64f509309a817b,
            "unexpected code hash"
        );
        console.log("F1600 helper deployed at:", helper);
    }
}
