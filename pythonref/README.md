# Dilithium Python


Implementation based on [this repository](https://github.com/GiacomoPope/dilithium-py/). We use the NTT implemented by ZKNOX [here](https://github.com/zkNoxHQ/ntt).

:warning: This is a work in progress. Do not use in production.

## Install
```bash
make install
```

## Test
```bash
make test
```

## Example

We provide an example of {keygen/signature/verification/verification on chain} for both ML-DSA (FIPS-204) and our EVM-friendly version. The contracts are available on Sepolia testnet.

### Example with ML-DSA (NIST-compliant)
```bash
# key generation
# pk and sk are saved into files
./sign_cli.py keygen --version ML-DSA
# signing a message using the previously saved private_key.pem
# the signature is saved into a file
./sign_cli.py sign --data "deadbeef" --privkey private_key.pem
# verify locally the signature
./sign_cli.py verify --data "deadbeef" --pubkey public_key.pem --signature sig
# verify on-chain the signature
./sign_cli.py verifyonchain --data "deadbeef" --pubkey public_key.pem --signature sig --contractaddress 0x9B26cBD1643ba392a9a040529c0035693a4f6806 --rpc "wss://ethereum-sepolia-rpc.publicnode.com"
```
This should output:
```
STDOUT: 0x0000000000000000000000000000000000000000000000000000000000000001

STDERR: 
RETURN CODE: 0
```

### Example with ML-DSA-ETH (EVM-friendly)
```bash
# key generation
# pk and sk are saved into files
./sign_cli.py keygen --version ML-DSA-ETH
# signing a message using the previously saved private_key.pem
# the signature is saved into a file
./sign_cli.py sign --data "cafe" --privkey private_key.pem
# verify locally the signature
./sign_cli.py verify --data "cafe" --pubkey public_key.pem --signature sig
# verify on-chain the signature
./sign_cli.py verifyonchain --data "cafe" --pubkey public_key.pem --signature sig --contractaddress 0x4E086d551a2FA9269193056616ac8bd63cf5bE15 --rpc "wss://ethereum-sepolia-rpc.publicnode.com"
```
This should output:
```
STDOUT: 0x0000000000000000000000000000000000000000000000000000000000000001

STDERR: 
RETURN CODE: 0
```

### With a ledger
It is possible to use our Ledger app in order to compute signatures.

In order to install the app (make sure the Ledger is connected and unlocked):
```
make install-ledger
```
For signing with the ledger, (don't forget to open the MLDSA app):
```bash
./sign_cli.py signledger --data "1234" 
```
Note that for now, the key generation use a fixed seed, and so every one would get the same keys ;-).

This produces a `sig` file and a `public_key.pem` file. Verifying the signature is exactly the same as before:
```bash
 ./sign_cli.py verify --data "cafe" --pubkey public_key.pem --signature sig
```
This should produce:
```
Signature is valid.
```
