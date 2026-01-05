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

For example, in order to generate the MLDSA key with seed `cafe..cafe`, together with the Ethereum account of private key `0x00..01` (but it has no fund, don't use it!), on Sepolia L1:
```
node onchain_keygen.js \
--seed 0xcafecafecafecafecafecafecafecafecafecafecafecafecafecafecafecafe \
--rpcurl wss://ethereum-sepolia-rpc.publicnode.com \
--privatekey 0x0000000000000000000000000000000000000000000000000000000000000001
```

## Deploying a signed transaction
TODO