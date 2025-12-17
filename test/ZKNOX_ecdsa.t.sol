// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
//  Code obtained from `generate_test_vectors.py` python file

import {Test, console} from "forge-std/Test.sol";
import {ZKNOX_ecdsa} from "../src/ZKNOX_ECDSA.sol";
import {Constants} from "./ZKNOX_seed.sol";

contract ECDSATest is Test {
    ZKNOX_ecdsa ecdsa = new ZKNOX_ecdsa();

    function testVerify() public {
        string[] memory cmds = new string[](5);
        cmds[0] = "pythonref/myenv/bin/python";
        cmds[1] = "pythonref/sig_hybrid.py";
        cmds[2] = "0x541378a6e14874788370668707e1a0de6cdd4556deb4c95d1508e31f99656bd9";
        cmds[3] = "NIST";
        cmds[4] = Constants.seed_str;

        bytes memory result = vm.ffi(cmds);
        (bytes memory cTilde, bytes memory z, bytes memory h, uint8 v, uint256 r, uint256 s) =
            abi.decode(result, (bytes, bytes, bytes, uint8, uint256, uint256));
        bytes memory sig = abi.encodePacked(r, s, v);
        bytes memory pubkey = abi.encodePacked(Constants.addr);
        bytes32 message = hex"541378a6e14874788370668707e1a0de6cdd4556deb4c95d1508e31f99656bd9";

        uint256 gasStart = gasleft();
        bytes4 ver = ecdsa.verify(pubkey, message, sig);
        uint256 gasUsed = gasStart - gasleft();
        console.log("Gas used:", gasUsed);
        assertEq(ver, ecdsa.verify.selector);
    }
}
