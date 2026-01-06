import { ethers } from 'ethers';

const ACCOUNT_FACTORY_ABI = [
    "function createAccount(bytes calldata preQuantumPubKey, bytes calldata postQuantumPubKey) external returns (address)",
    "function getAddress(bytes calldata preQuantumPubKey, bytes calldata postQuantumPubKey) public view returns (address)",
    "function entryPoint() public view returns (address)",
    "function preQuantumLogic() public view returns (address)",
    "function postQuantumLogic() public view returns (address)",
    "function hybridVerifierLogic() public view returns (address)"
];

/**
 * Deploy an ERC4337 account using the PKContract address
 */
export async function deployERC4337Account(
    factoryAddress,
    preQuantumPubKey,
    pkContractAddress,
    providerUrl,
    privateKey
) {
    try {
        console.log("\n🏭 Deploying ERC4337 Account...");
        console.log("- Factory address:", factoryAddress);
        console.log("- Pre-quantum public key:", preQuantumPubKey);
        console.log("- Post-quantum PK contract:", pkContractAddress);
        
        const provider = new ethers.JsonRpcProvider(providerUrl);
        const wallet = new ethers.Wallet(privateKey, provider);
        
        const balance = await provider.getBalance(wallet.address);
        console.log("\n💰 Deployer Info:");
        console.log("- Address:", wallet.address);
        console.log("- Balance:", ethers.formatEther(balance), "ETH");
        
        const network = await provider.getNetwork();
        console.log("- Network:", network.name, `(Chain ID: ${network.chainId})`);
        
        // Connect to factory
        const factory = new ethers.Contract(factoryAddress, ACCOUNT_FACTORY_ABI, wallet);
        
        // Get factory configuration
        console.log("\n🔧 Factory Configuration:");
        const entryPoint = await factory.entryPoint();
        const preQuantumLogic = await factory.preQuantumLogic();
        const postQuantumLogic = await factory.postQuantumLogic();
        const hybridVerifierLogic = await factory.hybridVerifierLogic();
        
        console.log("- EntryPoint:", entryPoint);
        console.log("- Pre-quantum logic:", preQuantumLogic);
        console.log("- Post-quantum logic:", postQuantumLogic);
        console.log("- Hybrid verifier logic:", hybridVerifierLogic);
        
        // Encode the post-quantum public key (PKContract address)
        // The contract expects bytes, so we encode the address
        const postQuantumPubKey = ethers.AbiCoder.defaultAbiCoder().encode(
            ['address'],
            [pkContractAddress]
        );
        
        // Calculate the expected account address
        const expectedAddress = await factory.getAddress(preQuantumPubKey, postQuantumPubKey);
        console.log("\n📍 Expected account address:", expectedAddress);
        
        // Check if account already exists
        const code = await provider.getCode(expectedAddress);
        if (code !== '0x') {
            console.log("✅ Account already exists at this address!");
            return {
                success: true,
                address: expectedAddress,
                alreadyExists: true
            };
        }
        
        // Estimate gas
        console.log("\n⛽ Estimating gas...");
        const estimatedGas = await factory.createAccount.estimateGas(
            preQuantumPubKey,
            postQuantumPubKey
        );
        console.log("- Estimated gas:", estimatedGas.toString());
        
        const feeData = await provider.getFeeData();
        const gasCostWei = estimatedGas * feeData.gasPrice;
        console.log("- Gas price:", ethers.formatUnits(feeData.gasPrice, "gwei"), "gwei");
        console.log("- Estimated cost:", ethers.formatEther(gasCostWei), "ETH");
        
        // Deploy the account
        console.log("\n🚀 Creating ERC4337 account...");
        const tx = await factory.createAccount(
            preQuantumPubKey,
            postQuantumPubKey,
            {
                gasLimit: estimatedGas * 120n / 100n
            }
        );
        
        const txHash = tx.hash;
        console.log("- Transaction hash:", txHash);
        
        // Determine block explorer URL
        let explorerUrl = "";
        if (network.chainId === 1n) {
            explorerUrl = `https://etherscan.io/tx/${txHash}`;
        } else if (network.chainId === 11155111n) {
            explorerUrl = `https://sepolia.etherscan.io/tx/${txHash}`;
        }
        
        if (explorerUrl) {
            console.log("- Block explorer:", explorerUrl);
        }
        
        console.log("- Waiting for confirmation...");
        
        // Wait with polling
        let receipt = null;
        let attempts = 0;
        const maxAttempts = 60;
        
        while (!receipt && attempts < maxAttempts) {
            try {
                receipt = await provider.getTransactionReceipt(txHash);
                if (!receipt) {
                    attempts++;
                    const elapsed = attempts * 5;
                    process.stdout.write(`\r  Waiting... ${elapsed}s elapsed`);
                    await new Promise(resolve => setTimeout(resolve, 5000));
                }
            } catch (error) {
                attempts++;
                await new Promise(resolve => setTimeout(resolve, 5000));
            }
        }
        
        process.stdout.write('\r');
        
        if (!receipt) {
            console.log("\n⚠️  Transaction is taking longer than expected");
            console.log("Check status at:", explorerUrl || txHash);
            return {
                success: false,
                pending: true,
                transactionHash: txHash,
                expectedAddress
            };
        }
        
        if (receipt.status === 0) {
            console.log("\n❌ Transaction failed (reverted)");
            return {
                success: false,
                error: "Transaction reverted",
                transactionHash: txHash
            };
        }
        
        console.log("\n✅ ERC4337 Account created successfully!");
        console.log("- Account address:", expectedAddress);
        console.log("- Block number:", receipt.blockNumber);
        console.log("- Gas used:", receipt.gasUsed.toString());
        console.log("- Actual cost:", ethers.formatEther(receipt.gasUsed * receipt.gasPrice), "ETH");
        
        // Verify the deployment
        console.log("\n🔍 Verifying deployment...");
        const deployedCode = await provider.getCode(expectedAddress);
        const isDeployed = deployedCode !== '0x';
        console.log("- Account deployed:", isDeployed ? "✓" : "✗");
        
        return {
            success: true,
            address: expectedAddress,
            transactionHash: txHash,
            blockNumber: receipt.blockNumber,
            gasUsed: receipt.gasUsed.toString(),
            actualCost: ethers.formatEther(receipt.gasUsed * receipt.gasPrice)
        };
        
    } catch (error) {
        console.error("\n❌ Account creation failed:", error.message);
        return {
            success: false,
            error: error.message
        };
    }
}
