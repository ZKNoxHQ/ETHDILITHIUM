#!/bin/bash

# Configuration
CONTRACT_NAME="DeployDilithiumInternal.s.sol"   

PRIVATE_KEY=$1
PUB_KEY="0x9140286CDA95d59fa5f29ecb11dDe1F817999F9E"

API_KEY=$2
RPC="wss://ethereum-sepolia-rpc.publicnode.com"
# RPC="https://api.zan.top/arb-sepolia"

# Deploy to network
echo "Deploying $CONTRACT_NAME with Forge..."
echo "RPC used: "$RPC
echo "balance:"

cast balance $PUB_KEY --rpc-url $RPC

forge script $CONTRACT_NAME \
--rpc-url $RPC \
--private-key $PRIVATE_KEY \
--broadcast \
--tc Script_Deploy_Dilithium_Internal \
--etherscan-api-key $API_KEY \
--verify \
--resume


# # with ledger
# forge script $CONTRACT_NAME --rpc-url $RPC --ledger --broadcast --tc Script_Deploy_Dilithium --etherscan-api-key $API_KEY_OPTIMISM --verify --priority-gas-price 1
