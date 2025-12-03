// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {ZKNOX_HybridVerifier} from "../src/ZKNOX_hybrid.sol";
import {Signature} from "../src/ZKNOX_dilithium_utils.sol";
import {DeployPKContract} from "../script/DeployMLPK.s.sol";
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
        hybrid.initialize(verifier_address, 1);
        address eth_address = 0x9140286CDA95d59fa5f29ecb11dDe1F817999F9E;

        bytes memory data = hex"1111222233334444111122223333444411112222333344441111222233334444";
        Signature memory sig;
        uint8 v;
        bytes32 r;
        bytes32 s;
        {

            string[] memory cmds = new string[](3);
            cmds[0] = "pythonref/myenv/bin/python";
            cmds[1] = "pythonref/sig_hybrid.py";
            cmds[2] = vm.toString(data);

            bytes memory result = vm.ffi(cmds);
            (bytes memory c_tilde, bytes memory z, bytes memory h, uint8 _v, uint256 _r, uint256 _s) =
                abi.decode(result, (bytes, bytes, bytes, uint8, uint256, uint256));

            sig.c_tilde = c_tilde;
            sig.z = z;
            sig.h = h;
            v = _v;
            r = bytes32(_r);
            s = bytes32(_s);
        }

        // Scope 3: Verify
        {
            uint256 gasStart = gasleft();
            bool valid = hybrid.isValid(eth_address, mldsa_address, data, sig, v, r, s);
            uint256 gasUsed = gasStart - gasleft();
            console.log("Gas used:", gasUsed);
            assertTrue(valid);
        }
    }
}
