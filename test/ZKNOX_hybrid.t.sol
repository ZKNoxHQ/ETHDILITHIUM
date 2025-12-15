// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {ZKNOX_HybridVerifier} from "../src/ZKNOX_hybrid.sol";
import {Signature} from "../src/ZKNOX_dilithium_utils.sol";
import {DeployPKContract} from "../script/Deploy_MLDSA_PK.s.sol";
import {DeployPKContract as DeployMLDSAETHPKContract} from "../script/Deploy_MLDSAETH_PK.s.sol";
import {Script_Deploy_Dilithium} from "../script/DeployDilithium.s.sol";
import {Script_Deploy_ETHDilithium} from "../script/DeployETHDilithium.s.sol";
import {Script_Deploy_ECDSA} from "../script/DeployECDSA.s.sol";

import {Constants} from "./ZKNOX_seed.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract TestHybridVerifier is Test {
    address mldsa_address;
    address mldsaeth_address;
    address verifier_address;
    address verifier_eth_address;
    address ecdsa_verifier_address;

    function setUp() public {
        // deploy the contract containing the MLDSA public key
        uint256 gasStart = gasleft();
        DeployPKContract deployPKContract = new DeployPKContract();
        mldsa_address = deployPKContract.run();
        uint256 gasUsed = gasStart - gasleft();
        console.log("Gas used:", gasUsed);

        DeployMLDSAETHPKContract deployMLDSAETHPKContract = new DeployMLDSAETHPKContract();
        mldsaeth_address = deployMLDSAETHPKContract.run();

        // deploy the contract containing the MLDSA core algorithm
        Script_Deploy_Dilithium deployVerifierContract = new Script_Deploy_Dilithium();
        verifier_address = deployVerifierContract.run();

        // deploy the contract containing the MLDSAETH core algorithm
        Script_Deploy_ETHDilithium deployETHVerifierContract = new Script_Deploy_ETHDilithium();
        verifier_eth_address = deployETHVerifierContract.run();

        // deploy the contract containing the ECDSA core algorithm
        Script_Deploy_ECDSA deployECDSAVerifierContract = new Script_Deploy_ECDSA();
        ecdsa_verifier_address = deployECDSAVerifierContract.run();
    }

    function testHybridVerify() public {
        ZKNOX_HybridVerifier hybrid;
        hybrid = new ZKNOX_HybridVerifier();
        address eth_address = Constants.addr;

        bytes32 data = hex"1111222233334444111122223333444411112222333344441111222233334444";
        bytes memory pre_quantum_sig;
        bytes memory post_quantum_sig;
        {
            string[] memory cmds = new string[](5);
            cmds[0] = "pythonref/myenv/bin/python";
            cmds[1] = "pythonref/sig_hybrid.py";
            cmds[2] = vm.toString(data);
            cmds[3] = "NIST";
            cmds[4] = Constants.seed_str;

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
                ecdsa_verifier_address,
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

    function testHybridVerifyETH() public {
        ZKNOX_HybridVerifier hybrid;
        hybrid = new ZKNOX_HybridVerifier();
        address eth_address = Constants.addr;

        bytes32 data = hex"1111222233334444111122223333444411112222333344441111222233334444";
        bytes memory pre_quantum_sig;
        bytes memory post_quantum_sig;
        {

            string[] memory cmds = new string[](5);
            cmds[0] = "pythonref/myenv/bin/python";
            cmds[1] = "pythonref/sig_hybrid.py";
            cmds[2] = vm.toString(data);
            cmds[3] = "ETH";
            cmds[4] = Constants.seed_str;

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
                abi.encodePacked(mldsaeth_address),
                ecdsa_verifier_address,
                verifier_eth_address,
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
