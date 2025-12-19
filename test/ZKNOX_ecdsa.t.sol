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
        bytes32 dataBytes = hex"541378a6e14874788370668707e1a0de6cdd4556deb4c95d1508e31f99656bd9";
        address signer = vm.addr(Constants.SEED_PREQUANTUM);
        (uint8 v, bytes32 r, bytes32 s) = vm.sign(Constants.SEED_PREQUANTUM, dataBytes);
        bytes memory sig = abi.encodePacked(r, s, v);
        bytes memory pubkey = abi.encodePacked(Constants.ADDR_PREQUANTUM);

        uint256 gasStart = gasleft();
        bytes4 ver = ecdsa.verify(pubkey, dataBytes, sig);
        uint256 gasUsed = gasStart - gasleft();
        console.log("Gas used:", gasUsed);
        assertEq(ver, ecdsa.verify.selector);
    }
}
