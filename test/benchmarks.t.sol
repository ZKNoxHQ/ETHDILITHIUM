// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
//  Code obtained from `generate_sample_in_ball_test_vectors.py` python file

import {Test, console} from "forge-std/Test.sol";
import {TAU, q} from "../src/ZKNOX_dilithium_utils.sol";
import {sampleInBallKeccakPrng, sampleInBallNist} from "../src/ZKNOX_SampleInBall.sol";
import {DeployPKContract as DeployPKContractETH} from "../script/Deploy_MLDSAETH_PK.s.sol";
import {DeployPKContract} from "../script/Deploy_MLDSA_PK.s.sol";
import {Constants} from "./seed.sol";
import {ZKNOX_dilithium} from "../src/ZKNOX_dilithium.sol";
import {ZKNOX_ethdilithium} from "../src/ZKNOX_ethdilithium.sol";
import {PythonSigner} from "../src/ZKNOX_PythonSigner.sol";

contract BenchmarksTest is Test {
    ZKNOX_dilithium dilithium = new ZKNOX_dilithium();
    ZKNOX_ethdilithium ethdilithium = new ZKNOX_ethdilithium();
    PythonSigner pythonSigner = new PythonSigner();

    function testSampleInBallNIST() public view {
        bytes memory cTilde = hex"cc501e9f471a004d2d3f60894d12aad3114e8abf62e413a800b7e7987ec5100b";
        uint256 gasStart = gasleft();
        uint256[] memory c = sampleInBallNist(cTilde, TAU, q);
        console.log("Gas used: ", gasStart - gasleft());
    }

    function testSampleInBallETH() public view {
        bytes memory cTilde = hex"cc501e9f471a004d2d3f60894d12aad3114e8abf62e413a800b7e7987ec5100b";
        uint256 gasStart = gasleft();
        uint256[] memory c = sampleInBallKeccakPrng(cTilde, TAU, q);
        console.log("Gas used: ", gasStart - gasleft());
    }

    function testMLDSA() public {
        // Public key contract
        DeployPKContract deployPkContract = new DeployPKContract();
        address mldsaAddress = deployPkContract.run();

        string memory data = "0x1111222233334444111122223333444411112222333344441111222233334444";
        bytes memory dataBytes = hex"1111222233334444111122223333444411112222333344441111222233334444";
        string memory mode = "NIST";
        string memory seedStr = Constants.SEED_POSTQUANTUM_STR;
        (bytes memory cTilde, bytes memory z, bytes memory h) = pythonSigner.sign("pythonref", data, mode, seedStr);
        bytes memory sig = abi.encodePacked(cTilde, z, h);

        // MESSAGE
        uint256 gasStart = gasleft();
        bool ver = dilithium.verify(abi.encodePacked(mldsaAddress), dataBytes, sig, "");
        uint256 gasUsed = gasStart - gasleft();
        console.log("Gas used:", gasUsed);
        assertTrue(ver);
    }

    function testMLDSAETH() public {
        // Public key contract
        DeployPKContractETH deployPkContractETH = new DeployPKContractETH();
        address mldsaEthAddress = deployPkContractETH.run();

        string memory data = "0x1111222233334444111122223333444411112222333344441111222233334444";
        bytes memory dataBytes = hex"1111222233334444111122223333444411112222333344441111222233334444";
        string memory mode = "ETH";
        string memory seedStr = Constants.SEED_POSTQUANTUM_STR;
        (bytes memory cTilde, bytes memory z, bytes memory h) = pythonSigner.sign("pythonref", data, mode, seedStr);
        bytes memory sig = abi.encodePacked(cTilde, z, h);

        // MESSAGE
        uint256 gasStart = gasleft();
        bool ver = ethdilithium.verify(abi.encodePacked(mldsaEthAddress), dataBytes, sig, "");
        uint256 gasUsed = gasStart - gasleft();
        console.log("Gas used:", gasUsed);
        assertTrue(ver);
    }
}
