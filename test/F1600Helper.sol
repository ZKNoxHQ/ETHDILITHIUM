// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Vm} from "forge-std/Vm.sol";

/// Deploys the Keccak-f[1600] helper (test/f1600_170.hex, raw runtime) for the tests.
library F1600Helper {
    function deploy(Vm vm) internal returns (address helper) {
        string[] memory cmds = new string[](2);
        cmds[0] = "cat";
        cmds[1] = "test/f1600_170.hex";
        bytes memory runtime = vm.ffi(cmds);
        bytes memory initCode = abi.encodePacked(hex"61", uint16(runtime.length), hex"8061000b5f395ff3", runtime);
        assembly {
            helper := create(0, add(initCode, 32), mload(initCode))
        }
        require(helper != address(0), "f1600-170: CREATE failed");
    }
}
