# Documentation  for hybrid verification

We design a 4337 account that lets us verify two signatures rather than only one.
The goal is to enable post-quantum signatures while keeping the current ECDSA verification.

## Fixed contracts

### Pre-quantum logic contracts
- `ZKNOX_ECDSA.sol`: verifies an ECDSA signature on Ethereum using the precompile `ecrecover`,
- `ZKNOX_P256VERIFY.sol`:  verifies an ECDSA signature on P256 using the precompile `p256verifiy`.

### Post-quantum logic contracts
- `ZKNOX_dilithium.sol`: verifies a MLDSA signature,
- `ZKNOX_ethdilithium.sol`: verifies a MLDSAETH signature.

### Hybrid verifier contract
- `ZKNOX_hybrid.sol`: verifies two signatures (one is pre-quantum, one is post-quantum).

## User contracts
Each user owns a 4337 account contract which contains:
- a `pre_quantum_pubkey` in `bytes`; it can be an ethereum address (20 bytes) or a P256 point (64 bytes)
- a `post_quantum_pubkey` in `bytes`; for MLDSA(ETH), we rather provide the address of a `PKContract`
- a `pre_quantum_logic_contract_address` referring to one of the two pre-quantum fixed contracts above,
- a `post_quantum_logic_contract_address` referring to one of the two post-quantum fixed contracts above,
- a `hybrid_verifier_logic_contract_address` referring to the hybrid verifier contract above.

Note: for MLDSA, this requires an extra contract `PKContract` storing the MLDSA public key.

### Example
In order to create a Hybrid ERC4337 account with P256 and MLDSAETH, one needs to:
1. Create a `PKContract` storing his MLDSAETH public key,
2. Create a `ZKNOX_ERC4337_account` with inputs:
    - the bytes of the P256 public key (64 bytes)
    - the bytes of the address of the PKContract containing his MLDSAETH public key (20 bytes)
    - the address of the `P256VERIFY` contract
    - the address of the `ethdilithium` contract
    - the address of the `hybrid` contract.


## How to run
In order to run the tests, it is required to install the requirements for both Solidity and python (the python signer is used inside the Solidity tests):
```
make install
```
Then, run the tests as follows:
- Hybrid verifier:
    ```
    forge test test/ZKNOX_hybrid.t.sol  -vv
    ```
- ERC4337 account (ECDSA+MLDSA):
    ```
    forge test test/ZKNOX_ERC4337_account.t.sol -vv
    ```
- ERC4337 account (ECDSA+MLDSAETH):
    ```
    forge test test/ZKNOX_ERC4337_account_with_eth.t.sol -vv
    ```
- ERC4337 account (P256VERIFY+MLDSA):
    ```
    forge test test/ZKNOX_ERC4337_account_with_p256.t.sol -vv
    ```

####################
WIP DEPLOYMENT
NOT WRITTEN YET
STOP READING HERE ;-)
####################





## Structure of the verification

### Public key contract
Each user stores in a `PKContract` on-chain, a MLDSA expanded public key (20512kB).
We provide two examples of contracts:
- one for MLDSA: https://sepolia.arbiscan.io/address/0xa3b09ef2a08f5ef5eb1c091d41a47a39ecb87433#code,
- one for MLDSAETH: https://sepolia.arbiscan.io/address/0x63f86064666ae6653044d11f2486caef47392ed4#code

These two contracts have the same structure, and the difference is in the `Contract Creation Code` that actually contain the matrix `A_hat`, the bytes `tr` and the vector `t1` in expanded form. This format is required with the current MLDSA(ETH) verification logic.

### HybridVerifier contract
A (unique) contract `ZKNOX_HybridVerifier` contains a function `isValid`, taking as inputs:
- an address pointing to a `PKContract`,
- an address pointing to a contract with the core verifier algorithm, here `ZKNOX_Dilithium` or `ZKNOX_ETHDilithium`, and later it could be `ZKNOX_Falcon` or `ZKNOX_Epervier`.

The contract contains a function
```
function isValid(
    bytes memory pre_quantum_pubkey,
    bytes memory post_quantum_pubkey,
    address pre_quantum_logic_contract_address,
    address post_quantum_logic_contract_address,
    bytes memory digest,
    bytes memory pre_quantum_sig,
    bytes memory post_quantum_sig
)
```
This function does the following:
- Verifies the ECDSA signature `(v,r,s)` by checking the `pre_quantum_pubkey` using the logic of `pre_quantum_logic_contract_address`,
- Fetches the expanded MLDSA public key stored at the address `post_quantum_pubkey`,
- Verifies the post-quantum signature with the logic of the contract `post_quantum_logic_contract_address`, w.r.t. the expanded public key at `post_quantum_pubkey`,

## Contract deployments

- Alice PKContract: https://sepolia.arbiscan.io/address/0x59c2d92f4a259c59e4f9de3b80df32b731e1be46#code,
- Bob PKContract: https://sepolia.arbiscan.io/address/0x4ef169a40e4665ffe515dccc7937955d3d9de19c#code,
- TODO HybridVerifierContract
- ECDSAContract: https://sepolia.arbiscan.io/address/0xae7b7ecebb895b0db67aa58307e506f0f3d5f38e#code
- P256VContract: https://sepolia.arbiscan.io/address/0x5121c85e5151b96ca633afb267a15398fc4b835b#code
- MLDSA contract: https://sepolia.arbiscan.io/address/0x540c7d278cf043bd3b182a464acdc188984660c9#code
- MLDSAETH contract: TODO
- TODO FalconContract
- TODO EpervierContract

## TODO
- [ ] Write contract for the pre-quantum logic.
- [ ] Explain how to deploy contracts for PKContract, for ERC4337.
- [ ] Implement the version with a HW wallet.
- [ ] Write tests with Falcon and Epervier.