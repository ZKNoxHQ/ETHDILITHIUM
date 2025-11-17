# Documentation of the Hybrid verification

## Goal of the project
We want to be able to verify hybrid signatures in a 4337 contract, where:
1. a classic ECDSA signature is verified using `ecrecover` precompile, checked with an ethereum address
2. a post-quantum signature is verified using MLDSA, the post-quantum standard (FIPS 204).

## Structure of the verification

### Public key contract
Each user stores in a `PKContract` on-chain:
- an Ethereum address for the verification of (1) above,
- an expanded MLDSA public key of 20+kB for the verification of (2) above.

### HybridVerifier contract
A contract `ZKNOX_HybridVerifier` takes as inputs:
- a `PKContract` address called `authorized_HybridPublicKey`,
- a `ZKNOX_Dilithium` address called `CoreAddress`.

The contract contains a function `isValid(bytes memory digest, Signature memory sig, uint8 v, bytes32 r, bytes32 s)`.
This function:
- Fetches the expanded MLDSA public key stored in `authorized_HybridPublicKey`,
- Verifies the MLDSA signature with the `verify` function stored in the contract `CoreAddress`, w.r.t. the expanded public key
- Fetches the Ethereum address stored in `authorized_HybridPublicKey`,
- Verifies the classic signature `(v,r,s)` using `ecrecover` w.r.t. the Ethereum address. 

### MLDSA contract
A contract `ZKNOX_dilithium` verifies a MLDSA signature with respect to a public key and a message. This contract is refered as `CoreAddress` above.

## Contract deployments

### PKContract
We provide one PKContract at `0x6F6739B758e447F541D7F3c069289864568c702E` (see [here](https://sepolia.arbiscan.io/address/0x6F6739B758e447F541D7F3c069289864568c702E#code)).

In order to deploy other `PKContract` (i.e. another user MLDSA public key and ETH address), it is possible to run:
```
cd script
./deploy_pk.sh <secret_key> <api_key>
```
In order to have a different PKContract, you need to modify the values of `script/DeployPKContract.s.sol` in order to have another MLDSA public key and/or another Ethereum address.

### ZKNOX_Dilithium
The contract for the MLDSA verification is stored at `0x86f94e417CB8Df20ba29Bd1c0ca04cFDd4442a96` (see [here](https://sepolia.arbiscan.io/address/0x86f94e417CB8Df20ba29Bd1c0ca04cFDd4442a96#code)).

Deploying this contract is similar to PKContract, but with `deploy_dilithium.sh`. However, it should not be needed here.

### ZKNOX_HybridVerifier
This contract is not deployed yet, because it is simply the starting point for the 4337 contract.

It is possible to test it with the file `test/ZKNOX_hybrid.t.sol`.
In this file, you can see the pointer to the two contracts `PKContract` and `ZKNOX_dilithium` deployed above.
You can also find two signatures: one is computed using MLDSA, and the other one with ECDSA. They are computed using Python (the code is in `pythonref/`). I can help generating new signatures if needed, but I don't detail it here.

You can test it with:
```bash
forge test -j16 test/ZKNOX_hybrid.t.sol --rpc-url https://api.zan.top/arb-sepolia -vv
```
This takes more than 8 minutes to run.... but it passes!
```
Ran 1 test for test/ZKNOX_hybrid.t.sol:TestHybridVerifier
[PASS] testHybridVerify() (gas: 17609703)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 513.27s (502.54s CPU time)
```
Note that verifying a MLDSA signature takes 15.3M gas, so this is the order of magnitude of gas that we expect.

Running in `FOUNDRY_PROFILE=lite` reduces by a hundred of seconds, but it is still too slow.