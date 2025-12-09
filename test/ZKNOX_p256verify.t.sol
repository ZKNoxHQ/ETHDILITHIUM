// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
//  Code obtained from `generate_test_vectors.py` python file

import {Test, console} from "forge-std/Test.sol";
import {ZKNOX_p256_verify} from "../src/ZKNOX_P256VERIFY.sol";

contract P256VERIFYTest is Test {
    ZKNOX_p256_verify p256verify = new ZKNOX_p256_verify();

    function testVerify() public view {
        bytes memory sig =
            hex"2ba3a8be6b94d5ec80a6d9d1190a436effe50d85a1eee859b8cc6af9bd5c2e184cd60b855d442f5b3c7b11eb6c4e0ae7525fe710fab9aa7c77a67f79e6fadd76";
        bytes memory pubkey =
            hex"2927b10512bae3eddcfe467828128bad2903269919f7086069c8c4df6c732838c7787964eaac00e5921fb1498a60f4606766b3d9685001558d1a974e7341513e";
        bytes memory message = hex"bb5a52f42f9c9261ed4361f59422a1e30036e7c32b270c8807a419feca605023";

        uint256 gasStart = gasleft();
        bool ver = p256verify.verify(pubkey, message, sig, "");
        uint256 gasUsed = gasStart - gasleft();
        console.log("Gas used:", gasUsed);
        assertTrue(ver);
    }

    function testVerify2() public view {
        // private key
        bytes32 priv = hex"0A1D0F90D7299AF6F990FD67A2D535D2FD82BCDA9B9AA352E08B262C7021573C";
        // digest to be signed
        bytes32 digest = hex"54705ba3baafdbdfba8c5f9a70f7a89bee98d906b53e31074da7baecdc0da9ad";

        // signature
        (bytes32 r, bytes32 s) = vm.signP256(uint256(priv), digest);
        bytes memory sig = abi.encodePacked(r, s);

        // public key
        uint256 pubX;
        uint256 pubY;
        (pubX, pubY) = vm.publicKeyP256(uint256(priv));
        bytes memory pub = abi.encodePacked(pubX, pubY);

        // verification
        uint256 gasStart = gasleft();
        bool ver = p256verify.verify(pub, abi.encodePacked(digest), sig, "");
        uint256 gasUsed = gasStart - gasleft();
        console.log("Gas used:", gasUsed);
        assertTrue(ver);
    }
}
