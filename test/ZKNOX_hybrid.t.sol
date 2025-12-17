// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {ZKNOX_HybridVerifier} from "../src/ZKNOX_hybrid.sol";
import {DeployPKContract} from "../script/Deploy_MLDSA_PK.s.sol";
import {DeployPKContract as DeployMLDSAETHPKContract} from "../script/Deploy_MLDSAETH_PK.s.sol";
import {Script_Deploy_Dilithium} from "../script/DeployDilithium.s.sol";
import {Script_Deploy_ETHDilithium} from "../script/DeployETHDilithium.s.sol";
import {Script_Deploy_ECDSA} from "../script/DeployECDSA.s.sol";
import {Constants} from "./ZKNOX_seed.sol";

contract TestHybridVerifier is Test {
    address mldsaAddress;
    address mldsaEthAddress;
    address verifierAddress;
    address verifierEthAddress;
    address ecdsaVerifierAddress;

    function setUp() public {
        // deploy the contract containing the MLDSA public key
        uint256 gasStart = gasleft();
        DeployPKContract deployPkContract = new DeployPKContract();
        mldsaAddress = deployPkContract.run();
        uint256 gasUsed = gasStart - gasleft();
        console.log("Gas used:", gasUsed);

        DeployMLDSAETHPKContract deployMldsaEthPkContract = new DeployMLDSAETHPKContract();
        mldsaEthAddress = deployMldsaEthPkContract.run();

        // deploy the contract containing the MLDSA core algorithm
        Script_Deploy_Dilithium deployVerifierContract = new Script_Deploy_Dilithium();
        verifierAddress = deployVerifierContract.run();

        // deploy the contract containing the MLDSAETH core algorithm
        Script_Deploy_ETHDilithium deployEthVerifierContract = new Script_Deploy_ETHDilithium();
        verifierEthAddress = deployEthVerifierContract.run();

        // deploy the contract containing the ECDSA core algorithm
        Script_Deploy_ECDSA deployEcdsaVerifierContract = new Script_Deploy_ECDSA();
        ecdsaVerifierAddress = deployEcdsaVerifierContract.run();
    }

    function testHybridVerify() public {
        ZKNOX_HybridVerifier hybrid;
        hybrid = new ZKNOX_HybridVerifier();
        address ethAddress = Constants.ADDR;

        bytes32 data = hex"1111222233334444111122223333444411112222333344441111222233334444";
        bytes memory preQuantumSig;
        bytes memory postQuantumSig;
        {
            string[] memory cmds = new string[](5);
            cmds[0] = "pythonref/myenv/bin/python";
            cmds[1] = "pythonref/sig_hybrid.py";
            cmds[2] = vm.toString(data);
            cmds[3] = "NIST";
            cmds[4] = Constants.SEED_STR;

            bytes memory result = vm.ffi(cmds);
            (bytes memory cTilde, bytes memory z, bytes memory h, uint8 _v, uint256 _r, uint256 _s) =
                abi.decode(result, (bytes, bytes, bytes, uint8, uint256, uint256));
            preQuantumSig = abi.encodePacked(_r, _s, _v);
            postQuantumSig = abi.encodePacked(cTilde, z, h);
        }

        // Scope 3: Verify
        {
            uint256 gasStart = gasleft();
            bool valid = hybrid.isValid(
                abi.encodePacked(ethAddress),
                abi.encodePacked(mldsaAddress),
                ecdsaVerifierAddress,
                verifierAddress,
                data,
                preQuantumSig,
                postQuantumSig
            );
            uint256 gasUsed = gasStart - gasleft();
            console.log("Gas used:", gasUsed);
            assertTrue(valid);
        }
    }

    function testHybridVerifyETH() public {
        ZKNOX_HybridVerifier hybrid;
        hybrid = new ZKNOX_HybridVerifier();
        address ethAddress = Constants.ADDR;

        bytes32 data = hex"1111222233334444111122223333444411112222333344441111222233334444";
        bytes memory preQuantumSig;
        bytes memory postQuantumSig;
        {

            string[] memory cmds = new string[](5);
            cmds[0] = "pythonref/myenv/bin/python";
            cmds[1] = "pythonref/sig_hybrid.py";
            cmds[2] = vm.toString(data);
            cmds[3] = "ETH";
            cmds[4] = Constants.SEED_STR;

            bytes memory result = vm.ffi(cmds);
            (bytes memory cTilde, bytes memory z, bytes memory h, uint8 _v, uint256 _r, uint256 _s) =
                abi.decode(result, (bytes, bytes, bytes, uint8, uint256, uint256));

            preQuantumSig = abi.encodePacked(_r, _s, _v);
            postQuantumSig = abi.encodePacked(cTilde, z, h);
        }

        // Scope 3: Verify
        {
            uint256 gasStart = gasleft();
            bool valid = hybrid.isValid(
                abi.encodePacked(ethAddress),
                abi.encodePacked(mldsaEthAddress),
                ecdsaVerifierAddress,
                verifierEthAddress,
                data,
                preQuantumSig,
                postQuantumSig
            );
            uint256 gasUsed = gasStart - gasleft();
            console.log("Gas used:", gasUsed);
            assertTrue(valid);
        }
    }
}
