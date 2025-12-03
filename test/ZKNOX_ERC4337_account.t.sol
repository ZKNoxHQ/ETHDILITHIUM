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

import {DeployPKContract} from "../script/Deploy_MLDSA_PK.s.sol";
import {Script_Deploy_Dilithium} from "../script/DeployDilithium.s.sol";

import "@openzeppelin/contracts/utils/Strings.sol";

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
        address post_quantum_address = deployPKContract.run();

        Script_Deploy_Dilithium script_Deploy_Dilithium = new Script_Deploy_Dilithium();
        address post_quantum_logic_address = script_Deploy_Dilithium.run();

        // Actually deploying the v0.8 EntryPoint
        entryPoint = new EntryPoint();

        bytes memory pre_quantum_pubkey = hex"9140286CDA95d59fa5f29ecb11dDe1F817999F9E";
        bytes memory post_quantum_pubkey = abi.encodePacked(post_quantum_address);

        // Deploy the Smart Account
        account = new ZKNOX_ERC4337_account(
            entryPoint,
            pre_quantum_pubkey,
            post_quantum_pubkey,
            address(0x00000000000000000000000000000000),
            post_quantum_logic_address
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
        string[] memory cmds = new string[](3);
        cmds[0] = "pythonref/myenv/bin/python";
        cmds[1] = "pythonref/sig_hybrid.py";
        cmds[2] = bytes32ToHex(userOpHash);
        bytes memory result = vm.ffi(cmds);
        (bytes memory c_tilde, bytes memory z, bytes memory h, uint8 v, uint256 r, uint256 s) =
            abi.decode(result, (bytes, bytes, bytes, uint8, uint256, uint256));

        bytes memory pre_quantum_sig = abi.encodePacked(r, s, v);
        bytes memory post_quantum_sig = abi.encodePacked(c_tilde, z, h);
        userOp.signature = abi.encode(pre_quantum_sig, post_quantum_sig);

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
        bytes memory invalid_pre_quantum_sig = abi.encodePacked(r, s, v);
        bytes memory invalid_post_quantum_sig = abi.encodePacked(c_tilde, z, h);
        userOp.signature = abi.encode(invalid_pre_quantum_sig, invalid_post_quantum_sig);

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
        string[] memory cmds = new string[](3);
        cmds[0] = "pythonref/myenv/bin/python";
        cmds[1] = "pythonref/sig_hybrid.py";
        cmds[2] = bytes32ToHex(userOpHash);
        bytes memory result = vm.ffi(cmds);
        (bytes memory c_tilde, bytes memory z, bytes memory h, uint8 v, uint256 r, uint256 s) =
            abi.decode(result, (bytes, bytes, bytes, uint8, uint256, uint256));

        bytes memory pre_quantum_sig = abi.encodePacked(r, s, v);
        bytes memory post_quantum_sig = abi.encodePacked(c_tilde, z, h);
        userOp.signature = abi.encode(pre_quantum_sig, post_quantum_sig);

        // Create an array with a single UserOperation
        PackedUserOperation[] memory ops = new PackedUserOperation[](1);
        ops[0] = userOp;

        vm.expectEmit(true, false, false, false, address(entryPoint));
        emit IStakeManager.Deposited(address(account), 0);
        emit IEntryPoint.BeforeExecution();
        emit TestTarget.Hello("Hello from UserOp");
        emit IEntryPoint.UserOperationEvent(userOpHash, address(account), address(0), 0, true, 0, 0);

        // Call handleOps on the EntryPoint
        entryPoint.handleOps(ops, payable(owner));

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
