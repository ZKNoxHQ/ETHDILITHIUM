// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "../lib/account-abstraction/contracts/core/EntryPoint.sol";
import {IEntryPoint} from "../lib/account-abstraction/contracts/interfaces/IEntryPoint.sol";
import {PackedUserOperation} from "../lib/account-abstraction/contracts/interfaces/PackedUserOperation.sol";
import {Signature} from "../src/ZKNOX_dilithium_utils.sol";
import {PKContract} from "../src/ZKNOX_PKContract.sol";
import {Test, console} from "forge-std/Test.sol";
import {ZKNOX_ERC4337_account} from "../src/ZKNOX_ERC4337_account.sol";
import {ZKNOX_HybridVerifier} from "../src/ZKNOX_hybrid.sol";


contract TestHybridVerifier is Test {

    ZKNOX_ERC4337_account public account;
    IEntryPoint public entryPoint;
    ZKNOX_HybridVerifier public hybridVerifier;
    PKContract public pkContract;
    TestTarget target;

    address public owner;
    uint256 public ownerPrivateKey;
    Signature signature;

    function setUp() public {
        /** Constants for the test **/
        signature = Signature({c_tilde: "", z: "", h: ""});
        ownerPrivateKey = 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80;

        owner = vm.addr(ownerPrivateKey);

        // Actually deploying the v0.8 EntryPoint
        entryPoint = new EntryPoint();

        // PKContract address deployed previously
        pkContract = PKContract(0x5FC8d32690cc91D4c39d9d3abcBD16989F875707);

        // Deploy HybridVerifier
        hybridVerifier = new ZKNOX_HybridVerifier();

        // Deploy the Smart Account
        account = new ZKNOX_ERC4337_account(
            entryPoint,
            pkContract,
            hybridVerifier
        );
        // Deploy TestTarget
        target = new TestTarget();

        // Fund the account
        vm.deal(address(account), 10 ether);
    }

    function test_ValidateUserOp_Success() public {
        // Create a UserOperation
        PackedUserOperation memory userOp = _createUserOp();

        // Generate the userOpHash
        bytes32 userOpHash = entryPoint.getUserOpHash(userOp);

        // Sign the userOpHash with both ECDSA and MLDSA
        (uint8 v, bytes32 r, bytes32 s) = vm.sign(ownerPrivateKey, userOpHash);

        // Encode the signature
        userOp.signature = abi.encode(signature, v, r, s);

        // Call validateUserOp from EntryPoint context
        vm.prank(address(entryPoint));
        uint256 validationData = account.validateUserOp(userOp, userOpHash, 0);

        // Check that validation succeeded (0 = success)
        assertEq(validationData, 0, "Signature validation should succeed");
    }

    function test_ValidateUserOp_InvalidSignature() public {
        PackedUserOperation memory userOp = _createUserOp();
        bytes32 userOpHash = entryPoint.getUserOpHash(userOp);

        // Create invalid signatures
        (uint8 v, bytes32 r, bytes32 s) = (27, bytes32(0), bytes32(0));
        Signature memory invalidSig;

        userOp.signature = abi.encode(invalidSig, v, r, s);

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

        // Sign the userOpHash with both ECDSA and MLDSA
        (uint8 v, bytes32 r, bytes32 s) = vm.sign(ownerPrivateKey, userOpHash);

        // Encode the signature
        userOp.signature = abi.encode(signature, v, r, s);

        // Create an array with a single UserOperation
        PackedUserOperation[] memory ops = new PackedUserOperation[](1);
        ops[0] = userOp;

        // Set up expectation for the Hello event
        vm.expectEmit(true, true, true, true);
        emit TestTarget.Hello("Hello from UserOp");

        // Call handleOps on the EntryPoint
        entryPoint.handleOps(ops, payable(owner));
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
            accountGasLimits: bytes32(abi.encodePacked(uint128(200000), uint128(200000))),
            preVerificationGas: 50000,
            gasFees: bytes32(abi.encodePacked(uint128(1 gwei), uint128(2 gwei))),
            paymasterAndData: "",
            signature: ""
        });
    }
}

contract TestTarget {
    event Hello(string greeting);

    function sayHello(string memory greeting) external {
        emit Hello(greeting);
    }
}
