// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {ZKNOX_HybridVerifier} from "../src/ZKNOX_hybrid.sol";
import {Signature} from "../src/ZKNOX_dilithium_utils.sol";
import {DeployPKContract} from "../script/DeployMLPK.s.sol";
import {Script_Deploy_Dilithium} from "../script/DeployDilithium.s.sol";

contract TestHybridVerifier is Test {
    function testHybridVerify() public {
        // Address of a contract storing a public key
        address eth_address = 0x9140286CDA95d59fa5f29ecb11dDe1F817999F9E;

        DeployPKContract deployPKContract = new DeployPKContract();
        address mldsa_pk_address = deployPKContract.run();

        Script_Deploy_Dilithium deployVerifierContract = new Script_Deploy_Dilithium();
        address verifier_address = deployVerifierContract.run();

        // Deploy hybrid
        ZKNOX_HybridVerifier hybrid = new ZKNOX_HybridVerifier();

        // Initialize the hybrid contract with addresses
        hybrid.initialize(
            verifier_address, // PQ verification logic
            1 // algoID = 1 for Dilithium
        );

        // Sign a message with both MLDSA and ECDSA
        // MESSAGE
        bytes memory data = hex"1111222233334444111122223333444411112222333344441111222233334444";

        // Using python
        string[] memory cmds = new string[](3);
        cmds[0] = "pythonref/myenv/bin/python";
        cmds[1] = "pythonref/sig_hybrid.py";
        cmds[2] = vm.toString(data);
        bytes memory result = vm.ffi(cmds);
        (bytes memory c_tilde, bytes memory z, bytes memory h, uint8 v, uint256 r, uint256 s) =
            abi.decode(result, (bytes, bytes, bytes, uint8, uint256, uint256));
        // Signature
        Signature memory sig;
        sig.c_tilde = c_tilde;
        sig.z = z;
        sig.h = h;

        // Now call hybrid verification
        uint256 gasStart = gasleft();
        bool valid = hybrid.isValid(eth_address, mldsa_pk_address, data, sig, v, bytes32(r), bytes32(s));
        uint256 gasUsed = gasStart - gasleft();
        console.log("Gas used:", gasUsed);
        assertTrue(valid);
    }
}
