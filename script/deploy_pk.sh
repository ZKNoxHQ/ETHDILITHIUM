#!/bin/bash

# Configuration
CONTRACT_NAME="DeployPKContract.s.sol"   

PRIVATE_KEY=$1
PUB_KEY="0x9140286CDA95d59fa5f29ecb11dDe1F817999F9E"

API_KEY=$2
RPC="wss://ethereum-sepolia-rpc.publicnode.com"

# Deploy to network
echo "Deploying $CONTRACT_NAME with Forge..."
echo "RPC used: "$RPC
echo "balance:"

cast balance $PUB_KEY --rpc-url $RPC

forge script $CONTRACT_NAME --rpc-url $RPC --private-key $PRIVATE_KEY --broadcast --tc DeployPKContract --etherscan-api-key $API_KEY --verify --priority-gas-price 1

# # with ledger
# forge script $CONTRACT_NAME --rpc-url $RPC --ledger --broadcast --tc Script_Deploy_Dilithium --etherscan-api-key $API_KEY_OPTIMISM --verify --priority-gas-price 1
