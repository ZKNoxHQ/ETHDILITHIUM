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
        /**
         *
         */

        signature = Signature({
            c_tilde: hex"48072065609daf79e5fa6116ae2db9227552092f0cd5ed61861e0bfa4120f697",
            z: hex"65cd08a659365057f0dcf9c97b7e7653dc1f018681c21a24980b0a6087297e312b5e087ddb27c6883159a7de176cc3e67f304e1c337b7f31d5b5839938ebe77f8c049d62c64156aa347420edaf69eec79e8663c6d0de6691a43181ee752158797a041bfc6671c619bf929b2328d80a5487c53f3df65589a8c0281f300c0d03138e3d1c72555ebfabd397fcb82404ae0e381ab1549d2ca94918ce914bcfd030c386412e420953e6317789ed2af74c2c74e5f1cffede45f7af504238a1e59d800759b5b4a9e5f0de9ae0f85cabe836d24e65d6b8e985f66f535bbced68b91393246ca38c8e58d5e6e4f1af90e34aeb49004a266aad2d341cd37fd535be9eea888c2688fadf78da52802b144b3627868872fb57e9c1e9efb66b4b6d4a8f071495e7562b83798b6d49eeae1f7bc6633b794e3bcaa393f0458afa147f476f8787ebf54e19c4b9393b1c88e3ed501f43835aadbbd3ac282884f3844bb8d8932c5db3e05fa3982a2c7ab571b2317dd443263a87cad66165dfb55bb2136e89b69613370ec803f6ccd74f2b094193eb12f90742e1524b3748c5fc38d88bacfa26653996bf6b99fd4b314b61fdb752b13840d99e62ef4638d61cf3e814f19031a65d0b8b991c4aa190d7fc44f026c6fa434746fa20bdc8289f3ac9547e900c8e11fccf4676ea8860aeb7121b4136ee481e86d5b5098367872be8870cd4e1fde7b6094691c46e471379a11453c04eadfa87b0a78c7cd51ec9a67849498301bd58a25e07ca66373e5b86c24c78ac1bc6450cd98c145eefa33f6e81e9eb1012943c7318c211475fedb5d05d461e3698cd40d5579175879be1a2d1d480f5f0f5468e2a2719073ba4baa6c9b766e45fd6c2f5da3fe7aa5b6d39a21cead0d9b0f7a0354b05a132eb4e737613001d3b3dab7a6e141908fdfca423ed9b352ca1018b8bbdecb0963ca99d39c744932c228875a4ee5206bd7462d2ace349d2776761eb8e100276d2c4b6febd782cd05c9bfab0b505887610122a2a9f432013ae54d42b10eb80712606bf1dee8b3334b5fef675f3831fc858f9ed3b3bb606a73bd335dedb984259783c48c496b8c9b98a5ac27dc1fa556c148a0d37657909a842c13348ac0aad731e9d34b12005d9d437969dc2e85f9ea421078b255a2c7ff3b666308160cd3c899ea4457c93b29d2ff044147179a87b9914c56f9283b3f8917161667ae4d78c4ae722c7355a1802590a33561ebfc76182b018c5e67754e45bc69b63cdcb47e17449f6a9fca78b42ca35b29dcd6fdd3413e76d95f31158d902776064ba00cf6491c1f865cb9a1d557d6a275addf41d2740b1651be14ca349b4b408c3fcdb661b019c7a2654bb12a3f223ee1ab79211b36afdff61afb2e62fb5199c746803793ab84f9098d1c8b01a82f375299c18a646ceb63e376ad9b8fd6e28f42dc0a66d1e25c4bade37a6c45ecd15dce4efe99bf81b396c754f94fc662db99d88a8a8a0ec6f9d06e652f174c2615fe1a408730df72d0bb519d9dd36536d12dcba9328d41a33031d24059c3e4e47d5a983af50341ac18055dda1c2168c7b233fa4b336ce8c4e7dc06f4a82449623990ec0b95d5cb8dd3dcac7dc04d62f3f03d68a0779333e8daf7a60cf0632a6611ca2229b60a8fa07e2a4087aa40919e9c5a37c30f46af9a53cbdfc0e8471fe550fcad2bcac6f4325496514334ee0bdf22cc6ad8e1f10224973522e1fdd6fc6df98584dee25fe0a33779cb8799144515bd3f2d6b1e7ad135a216bd7fb460d1a585c8c7310880d89243ba24e845959aecb333495efd99eca74eb3a46745ed9690adb30329c188318878b8b37efc08e5a0d7d98fee78f94f109d20b02c31d7055b5b110318a84c4ad6572c2e30caa47cf597966c0c00a67153c350714c3b3b70798b6c0e523bde50b62b0f6dcb18d5c9252bec9e6622855d556ee8533e9dac59bb78f53da82bd3d042f4496c8746f9e64116e953cf0f5fb21043d94ea35922dd55cd5b055f965a10fe2dfe0a1ebd147420fe8c8745db18051f562e87a88b97d8c46d0c8a551e226f886dcfab3371bf47231fcb3dbc79f4f023b35e7b80bae8b287f3c2e0812d78dfa471a0811b0195357737b47d93c685815438ddc2fa4be96ee101e3ac85132300c930711817b65269eeafedb0c1a0d2ab892d4eec22dd83ec2201355ee2331ac2b7141b1c6097d768a005b57419fd2cae58dcc78e99f125b5181e8be1a20d477381d0f4428cf0a6801075eb35d7137fd5cdc29c12fdd82e9fa5fb00b69f0025a13bf305302a090e51347375118e806bd96bf3725f308a70b7ee6c24d533254dd2d1caf59834d64e927ff1f91023e7c373f165dfd93e5ebcb22fe385398ee4280fbfc4cad2f38b7695674f310eb7701758234253a344ac50443fae0503f5629c7203c1798aacc25e7d1465744706be5ec06be347b8a2b280fe71ac92b387ac5222f174847e36429009b88756f68508987265b1fafdff5c84fba45c88782e45f38f441871b99fe92dff145d485f9003821fce43e03ba355595e148771dbb76e2a2be1c84ce2ce1ef7502df7fe8566186ccce61500a29e0b31b6d6d21330278c34ec312d8cfdd370b00c14f79387412e709fcafdfd9cf8b4932ae681eaab45836e56e3e6cb3c992853fbd80c8067e7b94658b406154f655749d970ec4386aae1fb515692a480162720b2905fab4685e89a5a2e1e8a6f7b622bab9642043099a1e553a96ce2623e11ae78e5b3699604b1df28785d89ac5cfab2087f9c73a49dd27283e2551161d0cc5798ff6735160ffd054273ec3d83abf8fbc35e0d2f44de47de59c393a8b77e8c42b5ce96497ab5b9182a81af7d76c8e79e166f1d3cd74eec0a1379d5063512dd7a0a1dc1edbad254161d6232a3d9052bd235699b6c9426113f305078160dfd5b030d45f8ef414d9b74872f923de3bd9dccdcd84e0b2d90111166eaebe553a161f828c43142979eb28931db64d39821fb569a358c39bb2cc5240bad2ac8f182f05b1b9635ec82c1251486ddd546ba5b6b7a31e752e827422d2b698fa984fbafbef382d789c087ce7691082c455d141a048bf965a62e239aaa9065410e374ded8845c26bc15bb78782ca16891c1e4f517db7e4b9fb81619dd36166a2fc800eda4924a62b535d12b16229807dd0f7b7962f1c4b36e860e95fc16e9bbda6e0890400e41f01a8902c3d5ab366d6c303976521ffc8b1c41a57ab258b31c6cb37f7401932bb15c8efebfef08aa6c21c9a501",
            h: hex"10111a21314a6e7e94a7acedf4f5f909192d3051717478becbcedaf00b0e162a3b3d5d686c739cb0c2e9fc0b141e3d5354585b7273989db4b7de000000000000000000000000000000000000000000000f1c2b3a"
        });

        owner = 0x9140286CDA95d59fa5f29ecb11dDe1F817999F9E; //vm.addr(ownerPrivateKey);

        // Actually deploying the v0.8 EntryPoint
        entryPoint = new EntryPoint();

        // PKContract address deployed previously
        pkContract = PKContract(0x6F6739B758e447F541D7F3c069289864568c702E);

        // Deploy HybridVerifier
        // Address of a contract storing a public key
        address hpkAddr = 0x6F6739B758e447F541D7F3c069289864568c702E;
        // NIST MLDSA contract address
        address verifierAddr = 0x99Ef3088074Cc1B6687229b3D34916445755847F;
        // Deploy hybrid
        hybridVerifier = new ZKNOX_HybridVerifier();

        // Initialize the hybrid contract with addresses
        hybridVerifier.initialize(
            hpkAddr, // Public Key Contract address
            verifierAddr, // PQ verification logic
            1 // algoID = 1 for Dilithium
        );

        // Deploy the Smart Account
        account = new ZKNOX_ERC4337_account(entryPoint, pkContract, hybridVerifier);
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
        uint8 v = 28;
        bytes32 r = 0xb41a6e50820a6b4286f7d55fc444a5e6ebd846cd186cad589a890dab03783b5d;
        bytes32 s = 0x3cd7470306c684a6a962ea778480b16eb5466a28bb04023ebcf49115b4109186;

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
        (uint8 v, bytes32 r, bytes32 s) = (28, bytes32(0), bytes32(0));
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
        console.logBytes32(userOpHash);

        // Sign the userOpHash with both ECDSA and MLDSA
        // (uint8 v, bytes32 r, bytes32 s) = vm.sign(ownerPrivateKey, userOpHash);
        uint8 v = 28;
        bytes32 r = 0xb41a6e50820a6b4286f7d55fc444a5e6ebd846cd186cad589a890dab03783b5d;
        bytes32 s = 0x3cd7470306c684a6a962ea778480b16eb5466a28bb04023ebcf49115b4109186;

        // Encode the signature
        userOp.signature = abi.encode(signature, v, r, s);

        // Create an array with a single UserOperation
        PackedUserOperation[] memory ops = new PackedUserOperation[](1);
        ops[0] = userOp;

        // Set up expectation for the Hello event
        vm.expectEmit(true, true, true, true);
        emit TestTarget.Hello("Hello from UserOp");

        // Call handleOps on the EntryPoint
        console.log("A");
        entryPoint.handleOps(ops, payable(owner));
        console.log("B");
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
            preVerificationGas: 100000,
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
