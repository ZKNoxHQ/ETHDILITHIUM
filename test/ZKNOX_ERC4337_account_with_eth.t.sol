// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "../lib/account-abstraction/contracts/core/EntryPoint.sol";
import {IEntryPoint} from "../lib/account-abstraction/contracts/interfaces/IEntryPoint.sol";
import {IStakeManager} from "../lib/account-abstraction/contracts/interfaces/IStakeManager.sol";
import {PackedUserOperation} from "../lib/account-abstraction/contracts/interfaces/PackedUserOperation.sol";
import {Signature} from "../src/ZKNOX_dilithium_utils.sol";
import {PKContract} from "../src/ZKNOX_PKContract.sol";
import {Test, console} from "forge-std/Test.sol";
import {ZKNOX_ERC4337_account} from "../src/ZKNOX_ERC4337_account.sol";
import {ZKNOX_HybridVerifier} from "../src/ZKNOX_hybrid.sol";

import {DeployPKContract} from "../script/Deploy_MLDSAETH_PK.s.sol";
import {Script_Deploy_ETHDilithium} from "../script/DeployETHDilithium.s.sol";
import {Script_Deploy_ECDSA} from "../script/DeployECDSA.s.sol";
import {Script_Deploy_Hybrid_Verifier} from "../script/DeployHybridVerifier.s.sol";

import "@openzeppelin/contracts/utils/Strings.sol";

import {Constants} from "./ZKNOX_seed.sol";

function bytes32ToHex(bytes32 value) pure returns (string memory) {
    return Strings.toHexString(uint256(value), 32);
}

contract TestERC4337_Account is Test {
    ZKNOX_ERC4337_account public account;
    IEntryPoint public entryPoint;
    ZKNOX_HybridVerifier public hybridVerifier;
    PKContract public pkContract;
    TestTarget target;

    address public owner;
    uint256 public ownerPrivateKey;
    Signature signature;

    function setUp() public {
        /**
         *
         */

        DeployPKContract deployPKContract = new DeployPKContract();
        address postQuantumAddress = deployPKContract.run();

        Script_Deploy_Hybrid_Verifier script_Deploy_Hybrid_Verifier = new Script_Deploy_Hybrid_Verifier();
        address hybrid_verifier_logic_address = script_Deploy_Hybrid_Verifier.run();

        Script_Deploy_ETHDilithium script_Deploy_ETHDilithium = new Script_Deploy_ETHDilithium();
        address postQuantumLogicAddress = script_Deploy_ETHDilithium.run();

        Script_Deploy_ECDSA script_Deploy_ecdsa = new Script_Deploy_ECDSA();
        address preQuantumLogicAddress = script_Deploy_ecdsa.run();

        // Actually deploying the v0.8 EntryPoint
        entryPoint = new EntryPoint();

        bytes memory preQuantumPubKey = abi.encodePacked(Constants.addr);
        bytes memory postQuantumPubKey = abi.encodePacked(postQuantumAddress);

        // Deploy the Smart Account
        account = new ZKNOX_ERC4337_account(
            entryPoint,
            preQuantumPubKey,
            postQuantumPubKey,
            preQuantumLogicAddress,
            postQuantumLogicAddress,
            hybrid_verifier_logic_address
        );
        // Deploy TestTarget
        target = new TestTarget();

        // Fund the account
        vm.deal(address(account), 10 ether);

        owner = 0x1234567890123456789012345678901234567890;
    }

    function test_ValidateUserOp_Success() public {
        // Create a UserOperation
        PackedUserOperation memory userOp = _createUserOp();

        // Generate the userOpHash
        bytes32 userOpHash = entryPoint.getUserOpHash(userOp);

        // Sign the userOpHash with both MLDSA and ECDSA
        string[] memory cmds = new string[](5);
        cmds[0] = "pythonref/myenv/bin/python";
        cmds[1] = "pythonref/sig_hybrid.py";
        cmds[2] = bytes32ToHex(userOpHash);
        cmds[3] = "ETH";
        cmds[4] = Constants.seed_str;

        bytes memory result = vm.ffi(cmds);
        (bytes memory c_tilde, bytes memory z, bytes memory h, uint8 v, uint256 r, uint256 s) =
            abi.decode(result, (bytes, bytes, bytes, uint8, uint256, uint256));

        bytes memory preQuantumSig = abi.encodePacked(r, s, v);
        bytes memory postQuantumSig = abi.encodePacked(c_tilde, z, h);
        userOp.signature = abi.encode(preQuantumSig, postQuantumSig);

        vm.prank(address(entryPoint));
        uint256 validationData = account.validateUserOp(userOp, userOpHash, 0);

        // Check that validation succeeded (0 = success)
        assertEq(validationData, 0, "Signature validation should succeed");
    }

    function test_ValidateUserOp_InvalidSignature() public {
        PackedUserOperation memory userOp = _createUserOp();
        bytes32 userOpHash = entryPoint.getUserOpHash(userOp);

        // Create invalid signatures
        (uint8 v, bytes32 r, bytes32 s) = (28, bytes32(0), bytes32(0));
        bytes memory c_tilde = hex"00";
        bytes memory z = hex"00";
        bytes memory h = hex"00";
        bytes memory invalid_preQuantumSig = abi.encodePacked(r, s, v);
        bytes memory invalid_postQuantumSig = abi.encodePacked(c_tilde, z, h);
        userOp.signature = abi.encode(invalid_preQuantumSig, invalid_postQuantumSig);

        vm.prank(address(entryPoint));
        uint256 validationData = account.validateUserOp(userOp, userOpHash, 0);

        // Check that validation failed (1 = SIG_VALIDATION_FAILED)
        assertEq(validationData, 1, "Invalid signature should fail");
    }

    function test_Execute() public {
        // Create a UserOperation
        PackedUserOperation memory userOp = _createUserOp();

        // Generate the userOpHash
        bytes32 userOpHash = entryPoint.getUserOpHash(userOp);

        // Sign the userOpHash with both MLDSA and ECDSA
        // Using python
        string[] memory cmds = new string[](5);
        cmds[0] = "pythonref/myenv/bin/python";
        cmds[1] = "pythonref/sig_hybrid.py";
        cmds[2] = bytes32ToHex(userOpHash);
        cmds[3] = "ETH";
        cmds[4] = Constants.seed_str;

        bytes memory result = vm.ffi(cmds);
        (bytes memory c_tilde, bytes memory z, bytes memory h, uint8 v, uint256 r, uint256 s) =
            abi.decode(result, (bytes, bytes, bytes, uint8, uint256, uint256));

        bytes memory preQuantumSig = abi.encodePacked(r, s, v);
        bytes memory postQuantumSig = abi.encodePacked(c_tilde, z, h);
        userOp.signature = abi.encode(preQuantumSig, postQuantumSig);

        // Create an array with a single UserOperation
        PackedUserOperation[] memory ops = new PackedUserOperation[](1);
        ops[0] = userOp;

        vm.expectEmit(true, false, false, false, address(entryPoint));
        emit IStakeManager.Deposited(address(account), 0);
        emit IEntryPoint.BeforeExecution();
        emit TestTarget.Hello("Hello from UserOp");
        emit IEntryPoint.UserOperationEvent(userOpHash, address(account), address(0), 0, true, 0, 0);

        // Call handleOps on the EntryPoint
        uint256 gasStart = gasleft();
        entryPoint.handleOps(ops, payable(owner));
        uint256 gasUsed = gasStart - gasleft();
        console.log("Gas used:", gasUsed);

        assertEq(target.lastGreeting(), "Hello from UserOp", "Target call should succeed");
    }

    function _createUserOp() internal view returns (PackedUserOperation memory) {
        // Encode the call to sayHello
        bytes memory callData = abi.encodeWithSelector(
            account.execute.selector,
            address(target),
            0,
            abi.encodeWithSignature("sayHello(string)", "Hello from UserOp")
        );

        return PackedUserOperation({
            sender: address(account),
            nonce: 0,
            initCode: "",
            callData: callData,
            accountGasLimits: bytes32(abi.encodePacked(uint128(20_000_000), uint128(500_000))),
            preVerificationGas: 100000,
            gasFees: bytes32(abi.encodePacked(uint128(1 gwei), uint128(2 gwei))),
            paymasterAndData: "",
            signature: ""
        });
    }
}

contract TestTarget {
    event Hello(string greeting);
    string public lastGreeting;

    function sayHello(string memory greeting) external {
        lastGreeting = greeting;
        emit Hello(greeting);
    }
}
