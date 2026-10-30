#!/bin/bash

# Configuration
CONTRACT_NAME="DeployDilithium87.s.sol"

PRIVATE_KEY=$1
PUB_KEY="0x9140286CDA95d59fa5f29ecb11dDe1F817999F9E"

API_KEY=$2
RPC="wss://ethereum-sepolia-rpc.publicnode.com"
# RPC="https://api.zan.top/arb-sepolia"

# The Keccak-f[1600] helper must exist on the chain (once): forge script
# DeployF1600Helper.s.sol --ffi --broadcast ..., then export its address:
#   export F1600_HELPER=0x...
# ZKNOX_dilithium87 binds it by code hash at construction (the same helper as
# ZKNOX_dilithium). test/KAT/mldsa87_kat0.json (js/gen_test_vectors87.js) is
# read for the on-chain KAT check; export KAT_CHECK=false to skip it.
#
# Nothing is installed per key: the expanded key travels in the calldata of
# every verification (67,680 bytes), so the deployment is the verifier alone.
: "${F1600_HELPER:?set F1600_HELPER to the deployed Keccak-f[1600] helper address}"

# Deploy to network
echo "Deploying $CONTRACT_NAME with Forge..."
echo "RPC used: "$RPC
echo "balance:"

cast balance $PUB_KEY --rpc-url $RPC

forge script $CONTRACT_NAME \
--rpc-url $RPC \
--private-key $PRIVATE_KEY \
--broadcast \
--tc Script_Deploy_Dilithium87 \
--etherscan-api-key $API_KEY \
--verify \
--resume
