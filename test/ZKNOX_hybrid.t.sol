// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {ZKNOX_HybridVerifier} from "../src/ZKNOX_hybrid.sol";

contract TestHybridVerifier is Test {
    function testHybridVerify() public pure {
        // Address of the owner
        address ownerAddress = 0x9140286CDA95d59fa5f29ecb11dDe1F817999F9E;
        // Address of a contract storing a public key
        address pkAddr = 0xa8FaebF8C6b12aa240035948e81e5b1129c847f5;
        // NIST MLDSA contract address
        address verifierAddr = 0xe894f23A95cB5C6198D0D5917877f594aEb255ef;

        // Deploy hybrid
        ZKNOX_HybridVerifier hybrid = new ZKNOX_HybridVerifier();

        // Initialize the hybrid contract with addresses
        hybrid.initialize(
            ownerAddress, // authorized ECDSA public key holder
            pkAddr, // PQ Public Key Contract
            verifierAddr, // PQ verification logic
            1 // algoID = 1 for Dilithium
        );

        // Now call hybrid verification
        bool valid = hybrid.isValid(digest, sig, v, r, s);

        assertTrue(valid);
    }
}
