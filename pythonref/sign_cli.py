#!myenv/bin/python

import argparse
import subprocess
from dilithium_py.dilithium.default_parameters import Dilithium2
from dilithium_py.keccak_prng.keccak_prng_wrapper import Keccak256PRNG
from eth_abi import encode
from dilithium_py.keccak import KeccakHash


def save_pk(pk, filename, version):
    with open(filename, "w") as f:
        f.write("# public key\n")
        f.write("pk = {}\n".format(pk.hex()))
        f.write("version = {}\n".format(version))


def save_sk(sk, filename, version):
    with open(filename, "w") as f:
        f.write("# private key\n")
        f.write("sk = {}\n".format(sk.hex()))
        f.write("version = {}\n".format(version))


def save_signature(sig, filename):
    with open(filename, "w") as f:
        f.write(sig.hex())


def load_pk(filename):
    with open(filename, "r") as f:
        data = f.read()
    variables = dict(line.split(" = ")
                     # first line is a comment
                     for line in data.splitlines()[1:])
    return bytes.fromhex(variables["pk"]), variables["version"]


def load_sk(filename):
    with open(filename, "r") as f:
        data = f.read()
    variables = dict(line.split(" = ")
                     # first line is a comment
                     for line in data.splitlines()[1:])
    return bytes.fromhex(variables['sk']), variables['version']


def load_signature(filename):
    with open(filename, "r") as f:
        signature = f.read()
    return bytes.fromhex(signature)


def signature(sk, data, version, deterministic=False):
    if version == 'MLDSA':
        return Dilithium2.sign(sk, data, deterministic=False)
    elif version == 'MLDSAETH':
        return Dilithium2.sign(sk, data, deterministic=False, _xof=Keccak256PRNG, _xof2=Keccak256PRNG)
    else:
        print("Version not implemented.")


def transaction_hash(nonce, to, data, value):
    K = KeccakHash(rate=200-(512 // 8), dsbyte=0x01)
    packed = encode(
        # seem that `to` is considered as uint256
        ["uint256", "uint160", "bytes", "uint256"],
        [nonce, to, data, value]
    )
    K.absorb(packed)
    K.pad()
    return K.squeeze(32)


def deploy_onchain(A_hat_compact, t1_compact, tr, privatekey, apikey, version):
    print("Solidity deployment")

    SOL = """
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/ZKNOX_PKContract.sol";
import {BaseScript} from "./BaseScript.sol";

contract DeployPKContract is BaseScript {
function run() external returns (address) {
    vm.startBroadcast();

    // Example of public key
    uint256[][][] memory A_hat = new uint256[][][](4);
    for (uint256 i = 0; i < 4; i++) {
        A_hat[i] = new uint256[][](4);
        for (uint256 j = 0; j < 4; j++) {
            A_hat[i][j] = new uint256[](32);
        }
    }
    """
    for ii in range(4):
        for jj in range(4):
            for kk in range(32):
                SOL += "A_hat[{}][{}][{}] = uint256({});\n".format(
                    ii, jj, kk, A_hat_compact[ii][jj][kk])
    SOL += "bytes memory tr = hex\"{}\";\n".format(tr.hex())
    SOL += """uint256[][] memory t1 = new uint256[][](4);
    for (uint256 i = 0; i < 4; i++) {
        t1[i] = new uint256[](32);
    }
    """
    for ii in range(4):
        for jj in range(32):
            SOL += "t1[{}][{}] = uint256({});\n".format(
                ii,
                jj,
                t1_compact[ii][0][jj]
            )

    SOL += """
    // Deploy PKContract
    PKContract pk = new PKContract(A_hat, tr, t1);

    console.log("Deployed PKContract at:", address(pk));

    vm.stopBroadcast();
    return address(pk);
}
}
"""
    sol_file = open("../script/Deploy_{}_PK.s.sol".format(version), 'w')
    sol_file.write(SOL)
    sol_file.close()

    if not privatekey:
        print("Error: Provide --privatekey")
        return
    if not apikey:
        print("Error: Provide --apikey")
        return

    result = subprocess.run(
        [
            "forge",
            "script",
            "../script/Deploy_{}_PK.s.sol".format(version),
            "--rpc-url",
            "https://api.zan.top/arb-sepolia",
            "--private-key",
            privatekey,
            "--broadcast",
            "--tc",
            "DeployPKContract",
            "--etherscan-api-key",
            apikey,
            "--verify",
            "--priority-gas-price",
            "1"
        ],
        capture_output=True,
        text=True
    )
    print(result.stdout)
    print(result.stderr)


def verify_signature(pk, data, sig, version):
    if version == 'MLDSA':
        return Dilithium2.verify(pk, data, sig)
    elif version == 'MLDSAETH':
        return Dilithium2.verify(pk, data, sig, _xof=Keccak256PRNG, _xof2=Keccak256PRNG)
    else:
        print("Version not implemented.")
        return False


def verify_signature_on_chain(pk, data, sig, contract_address, rpc, version):
    msg = "0x" + data.hex()
    if version == 'MLDSA':
        ρ, t1 = Dilithium2._unpack_pk(pk)
        A_hat = Dilithium2._expand_matrix_from_seed(ρ)
        tr = Dilithium2._h(pk, 64)

        A_hat_compact = A_hat.compact_256(32)
        t1_compact = t1.compact_256(32)

    elif version == 'MLDSAETH':
        # parsing public key for ETHDILITHIUM contract format
        A_hat, tr, t1 = Dilithium2.pk_for_eth(pk)
        A_hat_compact = A_hat.compact_256(32)
        t1_compact = t1.compact_256(32)

    else:
        print("Version not implemented.")
        return False

    # parsing signature for contract format
    sig = sig[:]
    z_bytes = sig[Dilithium2.c_tilde_bytes: -
                  (Dilithium2.k + Dilithium2.omega)]
    h_bytes = sig[-(Dilithium2.k + Dilithium2.omega):]
    c_tilde, z, h = Dilithium2._unpack_sig(sig)

    contract_call = "verify((uint256[][][],bytes,uint256[][]),bytes,(bytes,bytes,bytes),bytes)"
    input_pk = "({}, 0x{}, {})".format(
        A_hat_compact,
        tr.hex(),
        [elt[0] for elt in t1_compact]
    )
    input_msg = msg
    input_sig = "(0x{}, 0x{}, 0x{})".format(
        c_tilde.hex(),
        z_bytes.hex(),
        h_bytes.hex()
    )
    input_ctx = "0x"

    command = "cast call \"{}\" \"{}\" \"{}\" \"{}\" \"{}\" \"{}\" --rpc-url \"{}\"".format(
        contract_address,
        contract_call,
        input_pk,
        input_msg,
        input_sig,
        input_ctx,
        rpc)

    result = subprocess.run(
        command,
        shell=True,
        capture_output=True,
        text=True
    )
    print("STDOUT:", result.stdout)
    # print("STDERR:", result.stderr)
    # print("RETURN CODE:", result.returncode)


def verify_signature_on_chain_send(pk, data, sig, contract_address, rpc, private_key, version):

    msg = "0x" + data.hex()
    if version == 'MLDSA':
        ρ, t1 = Dilithium2._unpack_pk(pk)
        A_hat = Dilithium2._expand_matrix_from_seed(ρ)
        tr = Dilithium2._h(pk, 64)

        A_hat_compact = A_hat.compact_256(32)
        t1_compact = t1.compact_256(32)

    elif version == 'MLDSAETH':
        # parsing public key for ETHDILITHIUM contract format
        A_hat, tr, t1 = Dilithium2.pk_for_eth(pk)
        A_hat_compact = A_hat.compact_256(32)
        t1_compact = t1.compact_256(32)

    else:
        print("Version not implemented.")
        return False

    # parsing signature for contract format
    sig = sig[:]
    z_bytes = sig[Dilithium2.c_tilde_bytes: -
                  (Dilithium2.k + Dilithium2.omega)]
    h_bytes = sig[-(Dilithium2.k + Dilithium2.omega):]
    c_tilde, z, h = Dilithium2._unpack_sig(sig)

    contract_call = "verify((uint256[][][],bytes,uint256[][]),bytes,(bytes,bytes,bytes),bytes)"
    input_pk = "({}, 0x{}, {})".format(
        A_hat_compact,
        tr.hex(),
        [elt[0] for elt in t1_compact]
    )
    input_msg = msg
    input_sig = "(0x{}, 0x{}, 0x{})".format(
        c_tilde.hex(),
        z_bytes.hex(),
        h_bytes.hex()
    )
    input_ctx = "0x"

    command = "cast send --private-key {} \"{}\" \"{}\" \"{}\" \"{}\" \"{}\" \"{}\" --rpc-url \"{}\"".format(
        private_key,
        contract_address,
        contract_call,
        input_pk,
        input_msg,
        input_sig,
        input_ctx,
        rpc)

    result = subprocess.run(
        command,
        shell=True,
        capture_output=True,
        text=True
    )
    print("STDOUT:", result.stdout)
    print("STDERR:", result.stderr)
    print("RETURN CODE:", result.returncode)


def cli():
    parser = argparse.ArgumentParser(description="CLI for MLDSA Signature")
    parser.add_argument("action", choices=["keygen", "keygenonchainsend",  "sign", "signledger", "verify", "verifyonchain", "verifyonchainsend"],
                        help="Action to perform")
    parser.add_argument("--version", type=str,
                        help="Version to use (MLDSA or MLDSAETH)")
    # parser.add_argument("--nonce", type=str,
    #                     help="nonce in hexadecimal to sign the transaction")
    # parser.add_argument("--to", type=str,
    #                     help="Destination in hexadecimal address for the transaction")
    parser.add_argument("--data", type=str,
                        help="Data to be signed in hexadecimal")
    # parser.add_argument("--value", type=str,
    #                     help="Value in hexadecimal for the transaction")
    parser.add_argument("--privkey", type=str,
                        help="Private key file for signing")
    parser.add_argument("--seed", type=str,
                        help="Seed for keygen")
    parser.add_argument("--pubkey", type=str,
                        help="Public key file for verification")
    parser.add_argument("--contractaddress", type=str,
                        help="Contract address for on-chain verification")
    parser.add_argument("--rpc", type=str,
                        help="RPC for on-chain verification")
    parser.add_argument("--privatekey", type=str,
                        help="Ethereum ECDSA private key for sending a transaction")
    parser.add_argument("--apikey", type=str,
                        help="Ethereum API key for sending a transaction")
    parser.add_argument("--signature", type=str, help="Signature to verify")

    args = parser.parse_args()

    if args.action == "keygen":
        if not args.version:
            print("Error: Provide --version")
            return
        if args.version == "MLDSA":
            pk, sk = Dilithium2.keygen()
        else:
            pk, sk = Dilithium2.keygen(_xof=Keccak256PRNG, _xof2=Keccak256PRNG)
        save_pk(pk, "public_key.pem", args.version)
        save_sk(sk, "private_key.pem", args.version)
        print("Keys generated and saved.")

    if args.action == "keygenonchainsend":
        if not args.version:
            print("Error: Provide --version")
            return

        if not args.seed:
            from seed import seed
        else:
            seed = args.seed
        if args.version == "MLDSA":
            pk, sk = Dilithium2.key_derive(seed=seed)
            ρ, t1 = Dilithium2._unpack_pk(pk)
            A_hat = Dilithium2._expand_matrix_from_seed(ρ)
            tr = Dilithium2._h(pk, 64)
        else:
            pk, sk = Dilithium2.key_derive(
                seed=seed, _xof=Keccak256PRNG, _xof2=Keccak256PRNG)
            A_hat, tr, t1 = Dilithium2.pk_for_eth(pk)

        # Compact PK for Solidity
        A_hat_compact = A_hat.compact_256(32)
        t1_compact = t1.compact_256(32)

        save_pk(pk, "public_key.pem", args.version)
        save_sk(sk, "private_key.pem", args.version)
        print("Keys generated and saved.")

        deploy_onchain(A_hat_compact, t1_compact, tr,
                       args.privatekey, args.apikey, args.version)

    elif args.action == "sign":
        if not args.data or not args.privkey:
            print("Error: Provide --data, and --privkey")
            return
        [sk, version] = load_sk(args.privkey)
        sig = signature(sk, bytes.fromhex(args.data), version)
        save_signature(sig, 'sig')
        print("Signature is saved.")

    elif args.action == 'signledger':
        if not args.data:
            print("Error: Provide --data")
            return
        result = subprocess.run(
            ["node", "../ledger/dilithium-apdu.js", args.data],
            capture_output=True,
            text=True
        )
        print(result.stdout)

    # elif args.action == "sign_tx":
    #     if not args.data or not args.privkey or not args.nonce or not args.to or not args.value:
    #         print(
    #             "Error: Provide --data, --privkey, --nonce, --to and --value")
    #         return
    #     tx_hash = transaction_hash(
    #         int(args.nonce, 16),
    #         int(args.to, 16),
    #         bytes.fromhex(args.data),
    #         int(args.value, 16)
    #     )
    #     print(tx_hash)
    #     [sk, version] = load_sk(args.privkey)
    #     pk = PublicKey(512, sk.h)
    #     sig = signature(sk, tx_hash, args.version)
    #     assert (verify_signature(pk, tx_hash, sig))
    #     print_signature_transaction(sig, pk, tx_hash, version)

    elif args.action == "verify":
        if not args.data or not args.pubkey or not args.signature:
            print("Error: Provide --data, --pubkey, and --signature")
            return
        [pk, version] = load_pk(args.pubkey)
        sig = load_signature(args.signature)
        if verify_signature(pk, bytes.fromhex(args.data), sig, version):
            print("Signature is valid.")
        else:
            print("Invalid signature.")

    elif args.action == "verifyonchain":
        if not args.data or not args.pubkey or not args.signature or not args.rpc or not args.contractaddress:
            print(
                "Error: Provide --data, --pubkey, --signature, --contractaddress and --rpc")
            return
        [pk, version] = load_pk(args.pubkey)
        sig = load_signature(args.signature)
        verify_signature_on_chain(
            pk, bytes.fromhex(args.data), sig, args.contractaddress, args.rpc, version)

    elif args.action == "verifyonchainsend":
        if not args.data or not args.pubkey or not args.signature or not args.rpc or not args.contractaddress or not args.privatekey:
            print(
                "Error: Provide --data, --pubkey, --signature, --contractaddress, --rpc and --privatekey")
            return
        [pk, version] = load_pk(args.pubkey)
        sig = load_signature(args.signature)
        verify_signature_on_chain_send(
            pk, bytes.fromhex(args.data), sig, args.contractaddress, args.rpc, args.privatekey, version)


if __name__ == "__main__":
    cli()
