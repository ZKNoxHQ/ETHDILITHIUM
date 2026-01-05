import fs from "fs";
import { execSync } from "child_process";

export function generateSolidityFile(
  A_hat_compact,
  t1_compact,
  tr,
) {

  const trHex = Array.from(tr)
    .map(b => b.toString(16).padStart(2, "0"))
    .join("");

  let SOL = `
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/ZKNOX_PKContract.sol";
import {BaseScript} from "./BaseScript.sol";

contract DeployPKContract is BaseScript {
function run() external returns (address) {
    vm.startBroadcast();

    // Example of public key
    uint256[][][] memory A_hat = new uint256[][][](4);
    for (uint256 i = 0; i < 4; i++) {
        A_hat[i] = new uint256[][](4);
        for (uint256 j = 0; j < 4; j++) {
            A_hat[i][j] = new uint256[](32);
        }
    }
`;

  // Fill A_hat
  for (let i = 0; i < 4; i++) {
    for (let j = 0; j < 4; j++) {
      for (let k = 0; k < 32; k++) {
        SOL += `    A_hat[${i}][${j}][${k}] = uint256(${A_hat_compact[i][j][k]});\n`;
      }
    }
  }

  // tr
  SOL += `    bytes memory tr = hex"${trHex}";\n`;

  // t1 allocation
  SOL += `
    uint256[][] memory t1 = new uint256[][](4);
    for (uint256 i = 0; i < 4; i++) {
        t1[i] = new uint256[](32);
    } 
`;

  // Fill t1
  for (let i = 0; i < 4; i++) {
    for (let j = 0; j < 32; j++) {
      SOL += `    t1[${i}][${j}] = uint256(${t1_compact[0][i][j]});\n`;
    }
  }

  SOL += `
    PKContract pk = new PKContract(A_hat, tr, t1);
    console.log("Deployed PKContract at:", address(pk));

    vm.stopBroadcast();
    return address(pk);
}
}
`;
  const solFile = `../script/Deploy_MLDSA_PK.s.sol`;
  fs.writeFileSync(solFile, SOL);
  execSync(`forge fmt`);
  console.log(`Solidity file ${solFile} saved.`);
}
