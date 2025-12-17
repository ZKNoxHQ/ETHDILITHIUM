// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Test} from "forge-std/Test.sol";

contract PythonSigner is Test {
    function bytesToString(bytes memory data) internal pure returns (string memory) {
        return string(data);
    }

    // reusable Python sign function
    function sign(string memory data, string memory mode, string memory seedStr)
        external
        returns (bytes memory cTilde, bytes memory z, bytes memory h, uint8 v, uint256 r, uint256 s)
    {
        string[] memory cmds = new string[](5);
        cmds[0] = "pythonref/myenv/bin/python";
        cmds[1] = "pythonref/sig_hybrid.py";
        cmds[2] = data;
        cmds[3] = mode;
        cmds[4] = seedStr;
        bytes memory result = vm.ffi(cmds);
        (cTilde, z, h, v, r, s) = abi.decode(result, (bytes, bytes, bytes, uint8, uint256, uint256));
    }
}
