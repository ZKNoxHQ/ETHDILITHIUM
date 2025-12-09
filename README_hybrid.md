# Documentation  for hybrid verification

## Structure of the contracts
We design a 4337 account that lets us verify two signatures rather than only one.
The goal is to enable post-quantum signatures while keeping the current ECDSA verification.
Each user creates a 4337 account contract which contains:
- a `pre_quantum_pubkey` that is simply the current Ethereum address, a hash of an ECDSA public key,
- a `post_quantum_pubkey`, an address of a `PKContract`, storing the MLDSA public key (each user creates a contract for storing his public key),
- a `pre_quantum_logic_contract_address` telling that the pre-quantum key needs to use `ecrecover`,
- a `post_quantum_logic_contract_address` containing the address of the contract where the logic is written (for now, it can be MLDSA or MLDSA-ETH)
- an Hybrid Verifier contract `hybrid_verifier` that contains the logic for verifying both signature.

## Example
Consider Alice, Bob and Charly. They all want to enable hybrid signatures, but Alice prefers NIST standard for MLDSA, Bob rather chooses MLDSA-ETH for the gas efficiency, and Charly wants to use the P256 curve for ECDSA (and MLDSA). Then, the following contracts are created:
```
Alice PKContract:
    storing the MLDSA public key into a contract
Alice 4337 contract:
    refers to Alice's Ethereum address,
    the address of her PKContract,
    the address of MLDSA logic contract

Bob PKContract: 
    storing the MLDSA-ETH public key into a contract
Bob 4337 contract: 
    refers to Bob's Ethereum address,
    the address of his PKContract,
    the address of MLDSA-ETH logic contract

Charly PKContract: 
    storing the MLDSA public key into a contract
Charly 4337 contract: 
    refers to Charly's Ethereum address,
    the 896 bytes Falcon public key bytes (?), or rather a hash if Epervier,
    the address of FALCON logic contract, or rather Epervier recovery logic contract
```
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

- Alice PKContract: https://sepolia.arbiscan.io/address/0xa3b09ef2a08f5ef5eb1c091d41a47a39ecb87433,
- Bob PKContract: https://sepolia.arbiscan.io/address/0x63f86064666ae6653044d11f2486caef47392ed4,
- TODO HybridVerifierContract
- TODO ECDSAContract
- TODO FalconContract
- TODO EpervierContract

## TODO
- [ ] Write contract for the pre-quantum logic.
- [ ] Explain how to deploy contracts for PKContract, for ERC4337.
- [ ] Implement the version with a HW wallet.
- [ ] Write tests with Falcon and Epervier.