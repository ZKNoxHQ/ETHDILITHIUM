// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
//  Code obtained from `generate_test_vectors.py` python file

import {Test, console} from "forge-std/Test.sol";
import {ZKNOX_ecdsa} from "../src/ZKNOX_ECDSA.sol";
import {Constants} from "./ZKNOX_seed.sol";
import {PythonSigner} from "../src/ZKNOX_PythonSigner.sol";

contract ECDSATest is Test {
    ZKNOX_ecdsa ecdsa = new ZKNOX_ecdsa();
    PythonSigner pythonSigner = new PythonSigner();

    function testVerify() public {
        string memory data = "0x541378a6e14874788370668707e1a0de6cdd4556deb4c95d1508e31f99656bd9";
        bytes memory dataBytes = hex"541378a6e14874788370668707e1a0de6cdd4556deb4c95d1508e31f99656bd9";
        string memory mode = "NIST";
        string memory seedStr = Constants.SEED_PREQUANTUUM_STR;
        (bytes memory cTilde, bytes memory z, bytes memory h, uint8 v, uint256 r, uint256 s) =
            pythonSigner.sign("pythonref", data, mode, seedStr);
        bytes memory sig = abi.encodePacked(r, s, v);
        bytes memory pubkey = abi.encodePacked(Constants.ADDR_PREQUANTUM);
        bytes32 message = hex"541378a6e14874788370668707e1a0de6cdd4556deb4c95d1508e31f99656bd9";

        uint256 gasStart = gasleft();
        bytes4 ver = ecdsa.verify(pubkey, message, sig);
        uint256 gasUsed = gasStart - gasleft();
        console.log("Gas used:", gasUsed);
        assertEq(ver, ecdsa.verify.selector);
    }
}
