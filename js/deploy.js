import { execSync } from "child_process";

export function deployOnChain(
  fileName,
  privateKey,
  urlRPC
) {
  if (!privateKey) throw new Error("Provide --privatekey");

  const solFile = `../script/${fileName}.s.sol`;

  execSync(
    `forge script ${solFile} \
      --rpc-url ${urlRPC} \
      --private-key ${privateKey} \
      --broadcast \
      --tc DeployPKContract \
      --priority-gas-price 1`,
    { stdio: "inherit" }
  );
}
