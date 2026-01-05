# Deploy a PKContract

## Prerequisites
Deploying a PKContract requires the installation of `noble` library
```
npm install @noble/hashes
npm install @noble/post-quantum
```

## Deploying a generated public key
In order to deploy a PKContract using MLDSA (NIST version) on-chain using javascript, simply run
```
node onchain_keygen.js \
--seed <mldsa_32_bytes_seed> \
--rpcurl <rpc_url> \
--privatekey <wallet_private_key>
```

## Deploying a signed transaction
TODO