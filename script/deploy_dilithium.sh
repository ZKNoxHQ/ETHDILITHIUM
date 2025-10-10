#deployment script
#!/bin/bash

# Configuration
# Replace with your contract name
#DeployETHFalcon.s.sol, DeployFalcon.s.sol
CONTRACT_NAME="DeployETHDilithium.s.sol"   

# Deploy to networks
echo "Deploying $CONTRACT_NAME with Forge..."
#!/bin/bash

# Configuration
PRIVATE_KEY=$1

PUB_KEY="0x9140286CDA95d59fa5f29ecb11dDe1F817999F9E"

# #list of RPC, please update if required, PR welcomed
# RPC_SEPOLIAOPTIMISM="https://sepolia.optimism.io"

# RPC_LINEASEPOLIA="wss://linea-sepolia-rpc.publicnode.com"

# RPC_L1SEPOLIA="wss://ethereum-sepolia-rpc.publicnode.com"

# RPC_POLYAMOY="https://polygon-amoy.drpc.org"

# RPC_SCROLLSEPOLIA="wss://scroll-sepolia-rpc.publicnode.com "

# RPC_ARBITRUMSEPOLIA="https://api.zan.top/arb-sepolia"

# RPC_BASESEPOLIA="wss://base-sepolia-rpc.publicnode.com"
# RPC_HOLESKYMAIN="https://ethereum-holesky-rpc.publicnode.com"
# RPC_ZKSYNCSEPOLIA="https://sepolia.era.zksync.dev"
# RPC_MEKONG="https://rpc.mekong.ethpandaops.io"


#your APIKEY to verify contract
API_KEY_ETHERSCAN="8S6BUAJMGQ1JU89RHSR4FW772JJW11NTR8"
API_KEY_OPTIMISM=""
#selected API KEY
API_KEY=$API_KEY_ETHERSCAN

# #selected RPC

# RPC_HOLESKYMAIN="https://ethereum-holesky-rpc.publicnode.com"
# RPC=$RPC_HOLESKYMAIN

RPC="https://holesky.gateway.tenderly.co"
# Deploy to networks
echo "RPC used: "$RPC
echo "balance:"

cast balance $PUB_KEY --rpc-url $RPC

forge script $CONTRACT_NAME --rpc-url $RPC --private-key $PRIVATE_KEY --broadcast --tc $CONTRACT_NAME --etherscan-api-key $API_KEY --verify --priority-gas-price 1
