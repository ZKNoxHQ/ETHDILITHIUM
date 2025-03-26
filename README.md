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
    # TODO makefile
    ```
* **Tests:**
    ```bash
    # TODO makefile
    ```

TODO: explain how to generate signatures and verify it using solidity
```
cd python-ref
make generate_test_vectors
cd ..
forge test -vv
```

## BENCHMARKS

|Signature verification | Gas cost|Status|
|-|-|-|
|Dilithium|10.7M|WIP|
|ETHDilithium|6.9M|WIP|

Note that these versions save compression and use larger signatures and public keys. TODO develop this

## EXAMPLE 
TODO

## DEPLOYMENTS
TODO

## CONCLUSION
TODO

----

_Acknowledgements._ Giacomo Pope for the [original](https://github.com/GiacomoPope/dilithium-py/) python implementation.
