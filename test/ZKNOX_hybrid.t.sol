// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {ZKNOX_HybridVerifier} from "../src/ZKNOX_hybrid.sol";
import {Signature} from "../src/ZKNOX_dilithium_utils.sol";
import {DeployPKContract} from "../script/Deploy_MLDSA_PK.s.sol";
import {Script_Deploy_Dilithium} from "../script/DeployDilithium.s.sol";

contract TestHybridVerifier is Test {
    address mldsa_address;
    address verifier_address;

    function setUp() public {
        // deploy the contract containing the MLDSA public key
        uint256 gasStart = gasleft();
        DeployPKContract deployPKContract = new DeployPKContract();
        mldsa_address = deployPKContract.run();
        uint256 gasUsed = gasStart - gasleft();
        console.log("Gas used:", gasUsed);
        // deploy the contract containing the MLDSA core algorithm
        Script_Deploy_Dilithium deployVerifierContract = new Script_Deploy_Dilithium();
        verifier_address = deployVerifierContract.run();
    }

    function testHybridVerify() public {
        ZKNOX_HybridVerifier hybrid;
        hybrid = new ZKNOX_HybridVerifier();
        address eth_address = 0x9140286CDA95d59fa5f29ecb11dDe1F817999F9E;

        bytes memory data = hex"1111222233334444111122223333444411112222333344441111222233334444";
        bytes memory pre_quantum_sig;
        bytes memory post_quantum_sig;
        {

            string[] memory cmds = new string[](3);
            cmds[0] = "pythonref/myenv/bin/python";
            cmds[1] = "pythonref/sig_hybrid.py";
            cmds[2] = vm.toString(data);

            bytes memory result = vm.ffi(cmds);
            (bytes memory c_tilde, bytes memory z, bytes memory h, uint8 _v, uint256 _r, uint256 _s) =
                abi.decode(result, (bytes, bytes, bytes, uint8, uint256, uint256));

            pre_quantum_sig = abi.encodePacked(_r, _s, _v);
            post_quantum_sig = abi.encodePacked(c_tilde, z, h);
        }

        // Scope 3: Verify
        {
            uint256 gasStart = gasleft();
            bool valid = hybrid.isValid(
                abi.encodePacked(eth_address),
                abi.encodePacked(mldsa_address),
                address(0x1234123412341234123412341234123412341234),
                verifier_address,
                data,
                pre_quantum_sig,
                post_quantum_sig
            );
            uint256 gasUsed = gasStart - gasleft();
            console.log("Gas used:", gasUsed);
            assertTrue(valid);
        }
    }
}
