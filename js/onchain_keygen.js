import { ml_dsa44 } from '@noble/post-quantum/ml-dsa.js';
import { decodePublicKey } from './decode-ml-dsa44.js';
import { recoverAhat } from './decode-Ahat.js';
import { compact_module_256 } from './utils.js';
import { deployOnChain } from "./deploy.js";
import { generateSolidityFile } from './generateSolidityFile.js';


function parseArgs() {
  const args = process.argv.slice(2);
  const out = {};
  for (let i = 0; i < args.length; i++) {
    if (args[i].startsWith("--")) {
      const key = args[i].slice(2);
      const val = args[i + 1]?.startsWith("--") ? true : args[++i];
      out[key] = val ?? true;
    }
  }
  return out;
}

function hexToU8(hex) {
  if (hex.startsWith("0x")) hex = hex.slice(2);
  if (hex.length !== 64) {
    throw new Error("Seed must be 32 bytes (64 hex chars)");
  }
  return Uint8Array.from(
    hex.match(/.{2}/g).map(b => parseInt(b, 16))
  );
}


const args = parseArgs();
const privateKey = args.privatekey;
const rpcurl = args.rpcurl;

const seed = hexToU8(args.seed);
const { publicKey, secretKey } = ml_dsa44.keygen(seed);
const { rho, t1, tr } = decodePublicKey(publicKey);

const A_hat = recoverAhat(rho, 4, 4);
const A_hat_compact = compact_module_256(A_hat, 32);
const t1_compact = compact_module_256([t1], 32);

if (!privateKey) {
  console.error("Missing --privatekey");
  process.exit(1);
}

generateSolidityFile(
  A_hat_compact,
  t1_compact,
  tr,
);

deployOnChain("Deploy_MLDSA_PK", privateKey, rpcurl);
