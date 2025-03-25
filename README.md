# ETHDILITHIUM
Gas optimization of Dilithium and its Ethereum adaptation.

## Introduction
TODO: explain difference Dilithium and ETHDilithium. Basically what is in #Issue 7.

## How to run it
TODO: explain how to generate signatures and verify it using solidity

```
cd python-ref
make generate_test_vectors
cd ..
forge test -vv
```
## Results
|Signature verification | Gas cost|Status|
|-|-|-|
|Dilithium|10.7M|WIP|
|ETHDilithium|6.9M|WIP|

Note that these versions save compression and use larger signatures and public keys. TODO develop this

## Authors
Renaud Dubois, Simon Masson.

Acknowledgements: Giacomo Pope for the [original](https://github.com/GiacomoPope/dilithium-py/) python implementation.