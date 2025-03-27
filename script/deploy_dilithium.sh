#deploy precomputed tables for falcon field


#deployment script
#!/bin/bash

# Configuration
# Replace with your contract name
#DeployETHFalcon.s.sol, DeployFalcon.s.sol
CONTRACT_NAME="DeployETHFalcon.s.sol"   
PRIVATE_KEY="fill with your own, then delete" 

# Deploy to networks
echo "Deploying $CONTRACT_NAME with Forge..."
#!/bin/bash

# Configuration
# Replace with your private key
PRIVATE_KEY="" #Bots are spying this, painfull to go to faucet again for nothing

PUB_KEY="0x77bcB19f4B4F3c6077399ADE22C366Bf66F3Ac36"

#list of RPC, please update if required, PR welcomed
RPC_SEPOLIAOPTIMISM="https://sepolia.optimism.io"

RPC_LINEASEPOLIA="wss://linea-sepolia-rpc.publicnode.com"

RPC_L1SEPOLIA="wss://ethereum-sepolia-rpc.publicnode.com"

RPC_POLYAMOY="https://polygon-amoy.drpc.org"

RPC_SCROLLSEPOLIA="wss://scroll-sepolia-rpc.publicnode.com "

RPC_ARBITRUMSEPOLIA="https://api.zan.top/arb-sepolia"

RPC_BASESEPOLIA="wss://base-sepolia-rpc.publicnode.com"
RPC_HOLESKYMAIN="https://ethereum-holesky-rpc.publicnode.com"
RPC_ZKSYNCSEPOLIA="https://sepolia.era.zksync.dev"
RPC_MEKONG="https://rpc.mekong.ethpandaops.io"


#your APIKEY to verify contract
API_KEY_ETHERSCAN=""
API_KEY_OPTIMISM=""
#selected API KEY
API_KEY=$API_KEY_ETHERSCAN

#selected RPC

RPC_HOLESKYMAIN="https://ethereum-holesky-rpc.publicnode.com"
RPC=$RPC_HOLESKYMAIN
# Deploy to networks
echo "RPC used: "$RPC
echo "balance:"

cast balance $PUB_KEY --rpc-url $RPC


cast balance 0x77bcB19f4B4F3c6077399ADE22C366Bf66F3Ac36 --rpc-url 	https://rpc.eof-devnet-0.ethpandaops.io


forge script $CONTRACT_NAME --rpc-url $RPC --private-key $PRIVATE_KEY --broadcast --tc Script_Deploy_Falcon --etherscan-api-key $API_KEY --verify --priority-gas-price 1
