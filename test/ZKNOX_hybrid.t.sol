// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {ZKNOX_HybridVerifier} from "../src/ZKNOX_hybrid.sol";
import {Signature} from "../src/ZKNOX_dilithium_utils.sol";
import {DeployPKContract} from "../script/DeployMLPK.s.sol";
import {Script_Deploy_Dilithium} from "../script/DeployDilithium.s.sol";

contract TestHybridVerifier is Test {
    function testHybridVerify() public {
        address eth_address = 0x9140286CDA95d59fa5f29ecb11dDe1F817999F9E;
        address mldsa_pk_address;
        address verifier_address;
        ZKNOX_HybridVerifier hybrid;

        // Scope 1: Deploy contracts
        {
            DeployPKContract deployPKContract = new DeployPKContract();
            mldsa_pk_address = deployPKContract.run();

            Script_Deploy_Dilithium deployVerifierContract = new Script_Deploy_Dilithium();
            verifier_address = deployVerifierContract.run();

            hybrid = new ZKNOX_HybridVerifier();
            hybrid.initialize(verifier_address, 1);
        }

        // Scope 2: Generate signature
        Signature memory sig;
        uint8 v;
        bytes32 r;
        bytes32 s;
        {
            bytes memory data = hex"1111222233334444111122223333444411112222333344441111222233334444";

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
            bytes memory data = hex"1111222233334444111122223333444411112222333344441111222233334444";
            uint256 gasStart = gasleft();
            bool valid = hybrid.isValid(eth_address, mldsa_pk_address, data, sig, v, r, s);
            uint256 gasUsed = gasStart - gasleft();
            console.log("Gas used:", gasUsed);
            assertTrue(valid);
        }
    }
}
