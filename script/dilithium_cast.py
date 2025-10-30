# /script/dilithium_cast.py
import json
import localdeps
import subprocess
from dilithium_py.dilithium.default_parameters import Dilithium2 as D

rpc = "wss://ethereum-sepolia-rpc.publicnode.com"
contract_address = "0x9B26cBD1643ba392a9a040529c0035693a4f6806"

# Public key, signature and message from the Ledger signer
# with DILITHIUM in the KAT format
with open("data_ethdilithium.json", "r") as f:
    data = json.load(f)
pk = bytes.fromhex(data["pk"])
sig = bytes.fromhex(data["sig"])
msg = bytes.fromhex(data["msg"])

ρ, t1 = D._unpack_pk(pk)
A_hat = D._expand_matrix_from_seed(ρ)
tr = D._h(pk, 64)

A_hat_compact = A_hat.compact_256(32)
t1_compact = t1.compact_256(32)

# parsing signature for DILITHIUM contract format
sig = sig[:]
z_bytes = sig[D.c_tilde_bytes: -(D.k + D.omega)]
h_bytes = sig[-(D.k + D.omega):]
c_tilde, z, h = D._unpack_sig(sig)

contract_call = "verify((uint256[][][],bytes,uint256[][]),bytes,(bytes,bytes,bytes),bytes)"
input_pk = "({}, 0x{}, {})".format(
    A_hat_compact,
    tr.hex(),
    [elt[0] for elt in t1_compact]
)
input_msg = "0x{}".format(
    msg.hex()
)
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
print("STDERR:", result.stderr)
print("RETURN CODE:", result.returncode)
