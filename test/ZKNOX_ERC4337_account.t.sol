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
            c_tilde: "356ab9ad27c1c1b1deac04e66e573f8d3d9911fdb961a4ac5d224609effd35cd",
            z: "f39e7ccdcd0b057682ad89e8d45e33ca4db9ed9063f1177e2eb00e824a0a67c4419fbe5b788a8f67a6bc31db9afa0992a4872efd0efa802edc02c0a5fdee569160752520a87fa3a8be57a9843579385a0df872dee904a6231d497ffd4336fdc2414901a097691a796e344fb87bdbeace694e351a1db73224f8fafd1d2ed5721aeeb46eb3321f51409b118f5677fe40963ec075319d3d4d8a7c6f078e67a6c7d5fb3d9d98555a77076701e2b69851445841b6272ba335b9610b3402e25bb75cc1ae65a927e458348add56df94b1188d4f866b699fdd58bd560494aca22b969603f0877c70bc027705d3f4551b6d431458ed6c14b8935809226de9ee1761c7873941b100793e4fb7785fb0c8af17bf9702a93c1b8f5bcce672317538944fdd1ee36975e92a426e7d2ab80e6c11730aaafe6516aa4f7a57470f87ba55aca42e343ac1290205ced3e3ad3bfe44871b7ceb77b1a8518f8f79325751f6681e72e03b4b7a6518c36262eb7c2a7318982762523ca8076d2fc0daa68bc207dc0ae3114723515ff01945767aacabe9e0972621b92efd61f124edf3e5a7cb7434137ab2a5b1805570b3a02dcbe60e8b25825e860ec7b08432457ae19b53d8342bfb4931e3d508ee4b212b28345759929e0b7f9ba9484e394afed1b011358b5b86b4f120fc0c8ffb3560097f51b2b63ac61aa5704521e808c1fed331cb4125a43ac22680bcf2996673a5f6e53cdab628bba2b3c846f8bf40997cff29aa676273e559d7a22b13cc24161955ef57d5a4352b03e2b3121984b6998d76d5158eb27721387d1f3be03a006567156656c0bc4c7cd883c72083ca35f497449955e27eeb0622bbf178817aa65d7d47cb5a5f27d27bd4760a921be5d7e8f7eaa7cce62333862df66156604ef6b0896b11f4129205361862621ce235f9605063aaebefe2a0432b0cb74c8b714c905900178799e965e895be99a94f49b0c244081ee2caba7c656380143a251b5d5862eda1a808dba2c7dc7e0b05d24e719c501a2cb9c9344064113f9cca8e796db739a6daec31abebf068e3a80ec34efa355d529664ced67e205b362830ff6f9b68d73195320e18ca099bec99a0ed46ecb4c982c6129cf433ec94fc6e19a2660852f40a71d3d257beba85dcc8b59c028aecce50817017514b1ef62c69498600ec86fbd647b08bdd4e84e02ac98bd1ae418ef75c5a152cca9426bf0b1729ab443900ac6ea96dfa9e4edab1b3c49c6e416654d7108822b070a5e733b5a39e44dde05899693440619cbd56d3526a541d8f1f6bb8d3dac56c0124e6f9cfc1bd45bc53cbcadb80a80449cd6768ec6c104e674b3b6f8b5ac00fad22ad68430ba6d594e3dd1fc60ed6e8e4363231e7c5fdf341a533598e6a0499f54670e7bbc7bae8a18a475e8bb0ec66f5d57398507634f5f1213f3dca41291b4a5a88215fc59423546aee54364ef1cb8e7eb5a3e2cf590dda7561d29d27b30f111d1064e1ac8c749672b70915692a535f95bee56a487bf170b08fd12e50ccba301452a3a4a5f14acbe00c1e3de52a9875a0fa341867e38f66dd1da239301de601eb62f58cdb31ada4f846098c28ed87c0cfa7609db87571a639c1bd723f071b520de777d0735867e7c1987082bd444d9e463e119d6514ef1063e6e921302e02efe019e92c6cd275158e40c012949dca59b17478de82a28c05cd3bc42235ce31c94df8c88735ebea5042f8a32c34602ee01122bf246ef4462bea9fac37f3a55a144efd183aafecf90c5bdaacd0c31168be1929401a34226d1714738fe3e4b239037f3fe0284235632dfe4f35c6174c4e13a315bc3446a8ea8daf06c3043aedfe19e34555eacc556a79905c39e41f2aaeeae078029122dc99a121c3b982447ee045d19c1b367b41251fb3c3b11437edc6257eda45aea903f522a8a40784b5d624f3871b7926bd8b42835de73dde8fa2757ae26ebfa976c70bc6f7e066fd6620a1d5a7f1b635e5386b8b0008591a300f857f1b3151f89bdc38e5ec8387c2af67700720d028ddaacee95971e405e265b598e38b8e801ef295e3553b4bb869c7749a5634813f9df9dbaf9c0e8f850af4d68893bff2e2b93ea8093d7e5b7b72f56e95befc6e381196cda249a424a32c8d766cb381e23b50dcf7f6bfdd5db3376e04b05c9b68bdf5212137e59d5aa1b90023fa263df6212b6a70be41d9c578cff7c378b48aff1e4a8f5344ae2f18ab28200a5b826bfa11a0b58a7e0d751424c59a7a3498b2617b02ca390b7794bd2c53abed7b0373971b43dbf80151060e05e077f9c0f82494e43b29e9ee54f2fbdacb6f0f4cd9e86680361e9858207183c3ba0edd3792860c1a223e22587f2a45c65ce9fc5c9277cfecd0fabee38e26e3c4cf7c75bce1b7171d412a33f05670dc641869e574d38d3f07f0afbeec3107113725a6f4d7dc2211f2f7a96704110ff2464dc670eac4a3e07782e0abdc332683d8dbfc06ac9d6e06179f15780454b4d77786ed3ae7659c2d0aa07388f428ac5b5dcb63960c7be231a046b7cd8787446cf8c999d6c49690b97a81268c5cfba9ccc123570dd37ddb51de4aa0a6ebb6e2118514ebe7a03de2942db59c36842dcb3117d21fbe8fb8c954f393202acc2e5b0f0a8307b285704550ded85f1fe2cdef61da0e78240a3589cf85e705b0e5a4c942b7a9438fd6fddfc20a83cc4b06a12ad18749bceaa5762050f4787856c57762e933d6cf5e076861e2142e1b0ed48e8994c418231e892d7be749abe83c2c4b1183ccd0222b159ac8042a7e028deefdfd4c261e4f5bd02ad945aaef5e47396858eaa62682df80b1292ca2a9f4936cf40df102d82ca296d86d764bb6a38a44aaebc31330e18bb003a454d64c256a3befb933cf048a02eef7c32bd6937b00641e4bace916c6f379ae1c93a31c199df030882d8aba7e8b2e0ab48994f975390c4b1324f96af2a3431130da4a3394022e5e63865db07e83e26784436af168bcd5fd0666bfd160c5bea2dbea4b1cbf061484d1443572e1697b0fc9688a4290fa76b24a77cf8e1015bb5aad53dbe6b29099bcbe3b115be8c9f1c66326cd651ce7d5612c7cd2202b64fc2c792700da4555a0b3ee9d2bd4270f035680c6ed046f9740b339525bb34952d7e24f159b0708188d8b6d92b4023e72044fe624d76d2d8d7a5c2207f39ce93003fbfd1039191b698933c1720fa593d49e8888d7cb7dafe9f271809c058b409a7edba20741642991bbebd924d41ebc2013bcdfccc40e4726f6",
            h: "1f2e334b6c92bfd2d403091d213032467479808397acc0c2c5cdd2e1e901080a4453555e607700474a69828385959ea3acbde0f800000000000000000000000000000000000000000000000000000000091d2634"
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

        console.logBytes32(userOpHash);

        // Sign the userOpHash with both ECDSA and MLDSA
        uint8 v = 27;
        bytes32 r = 0xf3dca64e6b3105948382a1799b7b0a8746f5e103aadbc40b9ae870e701ec7c8a;
        bytes32 s = 0x6078562164b0cfe00ca155a65041c7b50f7a4bd4bc4067e48a24a85a289beccb;

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

        console.log(validationData);

        // Check that validation failed (1 = SIG_VALIDATION_FAILED)
        assertEq(validationData, 1, "Invalid signature should fail");
    }

    function test_Execute() public {
        // Create a UserOperation
        PackedUserOperation memory userOp = _createUserOp();

        // Generate the userOpHash
        bytes32 userOpHash = entryPoint.getUserOpHash(userOp);

        // Sign the userOpHash with both ECDSA and MLDSA
        // (uint8 v, bytes32 r, bytes32 s) = vm.sign(ownerPrivateKey, userOpHash);
        uint8 v = 27;
        bytes32 r = 0xf3dca64e6b3105948382a1799b7b0a8746f5e103aadbc40b9ae870e701ec7c8a;
        bytes32 s = 0x6078562164b0cfe00ca155a65041c7b50f7a4bd4bc4067e48a24a85a289beccb;

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
