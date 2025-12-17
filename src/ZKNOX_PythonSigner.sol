// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Test} from "forge-std/Test.sol";
import {Constants} from "../test/ZKNOX_seed.sol";

contract PythonSignerBase is Test {

    function bytesToString(bytes memory data) internal pure returns (string memory) {
        return string(data);
    }

    // reusable Python sign function
    function pythonSign(bytes memory data) internal returns (bytes memory signature) {
        string[] memory cmds = new string[](5);
        cmds[0] = "pythonref/myenv/bin/python";
        cmds[1] = "pythonref/sig_hybrid.py";
        cmds[2] = bytesToString(data); // convert bytes to string
        cmds[3] = "NIST";
        cmds[4] = Constants.SEED_STR;

        bytes memory result = vm.ffi(cmds); // vm is available here
        (bytes memory cTilde, bytes memory z, bytes memory h,,,) =
            abi.decode(result, (bytes, bytes, bytes, uint8, uint256, uint256));
        signature = abi.encodePacked(cTilde, z, h);
    }
}
