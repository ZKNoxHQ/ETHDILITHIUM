// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
//  Code obtained from `generate_test_vectors.py` python file

import {Test, console} from "forge-std/Test.sol";
import {ZKNOX_ecdsa} from "../src/ZKNOX_ECDSA.sol";

contract ECDSATest is Test {
    ZKNOX_ecdsa ecdsa = new ZKNOX_ecdsa();

    function testVerify() public {
        // string[] memory cmds = new string[](4);
        // cmds[0] = "pythonref/myenv/bin/python";
        // cmds[1] = "pythonref/sig_hybrid.py";
        // cmds[2] = "0x541378a6e14874788370668707e1a0de6cdd4556deb4c95d1508e31f99656bd9";
        // cmds[3] = "NIST";

        // bytes memory result = vm.ffi(cmds);
        // (bytes memory c_tilde, bytes memory z, bytes memory h, uint8 v, uint256 r, uint256 s) =
        //     abi.decode(result, (bytes, bytes, bytes, uint8, uint256, uint256));
        // bytes memory sig = abi.encodePacked(r, s, v);

        bytes memory sig =
            hex"b8a0f1eef81401fc7378e21272fe21ed7e172122c6f85358f7db8e8f11d9d8e615197986e8f0c0173274d93c76d12caeee3b8d15b486ef6f5693dd2e2896d59c1b";
        bytes memory pubkey = hex"9140286CDA95d59fa5f29ecb11dDe1F817999F9E";
        bytes memory message = hex"541378a6e14874788370668707e1a0de6cdd4556deb4c95d1508e31f99656bd9";

        uint256 gasStart = gasleft();
        bool ver = ecdsa.verify(pubkey, message, sig, "");
        uint256 gasUsed = gasStart - gasleft();
        console.log("Gas used:", gasUsed);
        assertTrue(ver);
    }
}
