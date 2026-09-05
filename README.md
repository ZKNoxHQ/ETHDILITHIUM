# ETHDILITHIUM

ETHDILITHIUM gathers experiments around DILITHIUM adaptations for the ETHEREUM ecosystem. DILITHIUM signature scheme is a post-quantum digital signature algorithm.


## SPECIFICATION
The repo implements two version of DILITHIUM: one follows the NIST released implementation, and another is tunned for Ethereum Virtual Machine constraints. 
TODO write specifications (help with #Issue7).

## INSTALLATION
**This is an experimental work, not audited: DO NOT USE IN PRODUCTION, LOSS OF FUND WILL OCCUR**

The repo contains a solidity verifier and a python signer.

* **Installation:**
    ```bash
    make install
    ```
    (or `make install_signer` or `make install_verifier`)
* **Generation of test vectors:**
    ```bash
    make gen_test_vectors
    ```
    Generate the test vectors of `test/ZKNOX_dilithium.t.sol` and `test/ZKNOX_ethdilithium.t.sol`.
* **Tests:**
    ```bash
    make test
    ```
     (or `make test_signer` or `make test_verifier`)

## BENCHMARKS

```bash
make bench
```

|Signature verification | Gas cost|Status|
|-|-|-|
|Dilithium|8.1M| :white_check_mark: (NIST MLDSA KAT pass)|
|ETHDilithium|4.9M| :white_check_mark: (MLDSAETH KAT pass)|

### Experimental: packed verifier (branch `exp/packed-verifier`)

Same interface, same key blob and signature formats, same KATs, on a packed
4x64-bit-lane layout end to end (Montgomery NTT, matrix-vector product on the
stored key, SWAR decode and hints), the NIST variant hashing through an
external Keccak-f[1600] helper contract bound by code hash. Measured with
`make bench` on the branch (solc 0.8.30 via-IR, `optimizer_runs = 1000000`):

|Signature verification | Gas cost|Status|
|-|-|-|
|Dilithium|1,196,707 (6.8x)| :white_check_mark: (NIST MLDSA KAT pass)|
|ETHDilithium|847,709 (5.7x)| :white_check_mark: (MLDSAETH KAT pass)|
|nttFw / nttInv (256 coefficients)|48,152 / 50,881 (was 181,666 / 215,127)| |

For reference, fireblocks-labs/evm-ml-dsa-verifier measures 1,224,368 on
ML-DSA-44 with the same helper. The NIST variant's constructor takes the
helper address (deployed once per chain, `script/DeployF1600Helper.s.sol`);
the ETH variant is unchanged in interface. See `VERSION.md` and
`DECISIONS.md` on the branch for the measurements, the bounds and what was
tried and rejected.

Dilithium is an implementation of the NIST standardized signature scheme, where the public key is expanded in order to save computations.
ETHDilithium is an alternative version with a cheaper hash function. Precomputations in the public key has been done in order to accelerate the verification. 

## EXAMPLE 
An example of key generation, signature and verification in python is provided in the directory `pythonref/`.
It is also possible to verify a signature on-chain on Sepolia Testnet. See [here](pythonref/README.md#example) for more details.
Locally, a signature verification can also be verified in Solidity, as illustrated in [this file](test/ZKNOX_dilithiumKATS.t.sol) with a KAT vector from the NIST submission. Further examples will be available in Kohaku project (Ethereum Foundation).

## DEPLOYMENTS
The deployed contracts on Sepolia (L1 and Arbitrum) are provided [here](https://github.com/ethereum/kohaku/blob/master/packages/pq-account/deployments/deployments.json), for Kohaku project.

## CONCLUSION
This repo provides an optimized version of DILITHIUM. Order of magnitudes were gained compared to other implementations. Despite those efforts, it is not feasible to reach the same cost as [Falcon](https://github.com/ZKNoxHQ/ETHFALCON) post-quantum signature. The implementation takes advantage of the NTT implementation of [this repository](https://github.com/ZKNoxHQ/NTT). The main reason for adopting Dilithium for Ethereum is the simplicity and efficiency of the signer algorithm for hardware wallet. 

----

_Acknowledgements._ Giacomo Pope for the [original](https://github.com/GiacomoPope/dilithium-py/) python implementation.
