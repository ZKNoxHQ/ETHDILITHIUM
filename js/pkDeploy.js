import { ethers } from 'ethers';

export const PK_CONTRACT_ABI = [
    "constructor(bytes memory _publicKeyData)",
    "function getPublicKey() external view returns (tuple(uint256[][][] aHat, bytes tr, uint256[][] t1))"
];

export function preparePublicKeyForDeployment(A_hat_compact, trHex, t1_compact) {
    if (!trHex.startsWith('0x')) {
        throw new Error('tr must be a hex string starting with 0x');
    }
    
    const trBytes = ethers.getBytes(trHex);
    if (trBytes.length !== 64) {
        throw new Error(`tr must be exactly 64 bytes, got ${trBytes.length} bytes`);
    }
    
    console.log("📊 Public Key Dimensions:");
    console.log("- A_hat:", A_hat_compact.length, "×", A_hat_compact[0]?.length, "×", A_hat_compact[0]?.[0]?.length);
    console.log("- t1:", t1_compact.length, "×", t1_compact[0]?.length);
    console.log("- tr:", trBytes.length, "bytes");
    
    // Convert all BigInt values to strings for proper encoding
    const A_hat_stringified = A_hat_compact.map(row => 
        row.map(col => 
            col.map(val => val.toString())
        )
    );
    
    const t1_stringified = t1_compact.map(row => 
        row.map(val => val.toString())
    );
    
    // Encode each component as bytes
    const abiCoder = ethers.AbiCoder.defaultAbiCoder();
    const aHatEncoded = abiCoder.encode(["uint256[][][]"], [A_hat_stringified]);
    const t1Encoded = abiCoder.encode(["uint256[][]"], [t1_stringified]);
    
    // Combine all three into single bytes parameter
    // Pass trBytes directly (not trHex) to avoid double encoding
    const publicKeyData = abiCoder.encode(
        ["bytes", "bytes", "bytes"],
        [aHatEncoded, trBytes, t1Encoded]
    );
    
    return publicKeyData;
}

export async function deployPublicKey(publicKeyData, contractBytecode, providerUrl, privateKey) {
    try {
        const provider = new ethers.JsonRpcProvider(providerUrl);
        const wallet = new ethers.Wallet(privateKey, provider);
        
        const balance = await provider.getBalance(wallet.address);
        console.log("\n💰 Deployer Info:");
        console.log("- Address:", wallet.address);
        console.log("- Balance:", ethers.formatEther(balance), "ETH");
        
        const network = await provider.getNetwork();
        console.log("- Network:", network.name, `(Chain ID: ${network.chainId})`);
        
        const factory = new ethers.ContractFactory(
            PK_CONTRACT_ABI,
            contractBytecode,
            wallet
        );
        
        console.log("\n⛽ Estimating gas...");
        const deployTx = await factory.getDeployTransaction(publicKeyData);
        const estimatedGas = await provider.estimateGas(deployTx);
        console.log("- Estimated gas:", estimatedGas.toString());
        
        const feeData = await provider.getFeeData();
        const gasCostWei = estimatedGas * feeData.gasPrice;
        console.log("- Gas price:", ethers.formatUnits(feeData.gasPrice, "gwei"), "gwei");
        console.log("- Estimated cost:", ethers.formatEther(gasCostWei), "ETH");
        
        console.log("\n🚀 Deploying PKContract with SSTORE2 optimization...");
        const contract = await factory.deploy(publicKeyData, {
            gasLimit: estimatedGas * 120n / 100n
        });
        
        const txHash = contract.deploymentTransaction().hash;
        console.log("- Transaction hash:", txHash);
        console.log("- Waiting for confirmation...");
        
        const receipt = await contract.deploymentTransaction().wait();

        const address = await contract.getAddress();
        console.log("\n✅ PKContract deployed successfully!");
        console.log("- Contract address:", address);
        console.log("- Block number:", receipt.blockNumber);
        console.log("- Gas used:", receipt.gasUsed.toString());
        console.log("- Actual cost:", ethers.formatEther(receipt.gasUsed * receipt.gasPrice), "ETH");
        
        console.log("\n🔍 Verifying deployment...");
        const storedPubKey = await contract.getPublicKey();
        console.log("✅ Public key retrieved:");
        console.log("- A_hat:", storedPubKey.aHat.length, "×", storedPubKey.aHat[0]?.length, "×", storedPubKey.aHat[0]?.[0]?.length);
        console.log("- t1:", storedPubKey.t1.length, "×", storedPubKey.t1[0]?.length);
        console.log("- tr:", storedPubKey.tr.length, "bytes");
        
        return {
            success: true,
            address,
            transactionHash: txHash,
            blockNumber: receipt.blockNumber,
            gasUsed: receipt.gasUsed.toString(),
            actualCost: ethers.formatEther(receipt.gasUsed * receipt.gasPrice),
            contract
        };
        
    } catch (error) {
        console.error("\n❌ Deployment failed:", error.message);
        return {
            success: false,
            error: error.message
        };
    }
}

export async function readPublicKey(contractAddress, providerUrl) {
    const provider = new ethers.JsonRpcProvider(providerUrl);
    const contract = new ethers.Contract(contractAddress, PK_CONTRACT_ABI, provider);
    
    console.log("📖 Reading public key from:", contractAddress);
    const pubKey = await contract.getPublicKey();
    
    console.log("✅ Public key retrieved:");
    console.log("- A_hat:", pubKey.aHat.length, "×", pubKey.aHat[0]?.length, "×", pubKey.aHat[0]?.[0]?.length);
    console.log("- t1:", pubKey.t1.length, "×", pubKey.t1[0]?.length);
    console.log("- tr:", pubKey.tr.length, "bytes");
    
    return {
        A_hat: pubKey.aHat,
        tr: pubKey.tr,
        t1: pubKey.t1
    };
}