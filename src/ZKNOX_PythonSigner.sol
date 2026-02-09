// Copyright (C) 2026 - ZKNOX
// License: This software is licensed under MIT License
// This Code may be reused including this header, license and copyright notice.
// FILE: ZKNOX_PythonSigner.sol
// Description: Python wrapper for signing tests
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Test} from "forge-std/Test.sol";

contract PythonSigner is Test {
    function bytesToString(bytes memory data) internal pure returns (string memory) {
        return string(data);
    }

    // reusable Python sign function
    function sign(string memory pythonRepoPath, string memory data, string memory mode, string memory seedStr)
        external
        returns (bytes memory cTilde, bytes memory z, bytes memory h)
    {
        string[] memory cmds = new string[](5);
        cmds[0] = string(abi.encodePacked(pythonRepoPath, "/myenv/bin/python"));
        cmds[1] = string(abi.encodePacked(pythonRepoPath, "/sig_sol.py"));
        cmds[2] = data;
        cmds[3] = mode;
        cmds[4] = seedStr;
        bytes memory result = vm.ffi(cmds);
        (cTilde, z, h) = abi.decode(result, (bytes, bytes, bytes));
    }

    function getPubKey(string memory pythonRepoPath, string memory mode, string memory seedStr)
        external
        returns (bytes memory pubKeyBytes)
    {
        string[] memory cmds = new string[](5);
        cmds[0] = string(abi.encodePacked(pythonRepoPath, "/myenv/bin/python"));
        cmds[1] = string(abi.encodePacked(pythonRepoPath, "/prepare_pk_for_deployment.py"));
        cmds[2] = mode;
        cmds[3] = seedStr;
        pubKeyBytes = vm.ffi(cmds);
    }
}
