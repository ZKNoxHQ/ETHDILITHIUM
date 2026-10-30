#!/usr/bin/env node
// Copyright (C) 2026 - ZKNOX
// License: This software is licensed under MIT License
// FILE: js/sign87.js
// Description: command-line front end of js/mldsa87.js (ML-DSA-87).
//
//   node js/sign87.js keygen [seedHex32]
//       -> {"publicKey", "secretKey"} (hex), random seed if none given
//   node js/sign87.js pubkey <secretKeyHex>
//       -> the public key of a secret key
//   node js/sign87.js setkey <publicKeyHex>
//       -> {"setKeyData"} : the expanded key, 67,680 bytes, the `pk` argument
//          of ZKNOX_dilithium87.verify (setKey returns it unchanged)
//   node js/sign87.js sign <secretKeyHex> <messageHex> [ctxHex] [--hedged]
//       -> {"signature"} : 4627 bytes, deterministic unless --hedged
//   node js/sign87.js sign-hash <secretKeyHex> <hash32Hex>
//       -> the signature checked by verify(pk, bytes32 hash, signature)
//          (the 32-byte hash is the message, empty context)
//   node js/sign87.js verify <publicKeyHex> <messageHex> <signatureHex> [ctxHex]
//       -> {"valid": true|false} (off-chain, FIPS 204 Alg. 3)
import { keygen, sign, verify, hexToBytes, bytesToHex, expandPublicKey87, encodePublicKey87 } from './mldsa87.js';
import { ml_dsa87 } from '@noble/post-quantum/ml-dsa.js';

function out(o) {
  console.log(JSON.stringify(o, null, 2));
}

const [cmd, ...args] = process.argv.slice(2);
switch (cmd) {
  case 'keygen': {
    const seed = args[0] ? hexToBytes(args[0]) : undefined;
    if (seed && seed.length !== 32) throw new Error('seed must be 32 bytes');
    const { publicKey, secretKey } = keygen(seed);
    out({ publicKey: bytesToHex(publicKey), secretKey: bytesToHex(secretKey) });
    break;
  }
  case 'pubkey': {
    out({ publicKey: bytesToHex(ml_dsa87.getPublicKey(hexToBytes(args[0]))) });
    break;
  }
  case 'setkey': {
    out({ setKeyData: encodePublicKey87(expandPublicKey87(hexToBytes(args[0]))) });
    break;
  }
  case 'sign': {
    const hedged = args.includes('--hedged');
    const a = args.filter((x) => x !== '--hedged');
    const sig = sign(hexToBytes(a[1]), hexToBytes(a[0]), {
      context: a[2] ? hexToBytes(a[2]) : new Uint8Array(0),
      deterministic: !hedged,
    });
    out({ signature: bytesToHex(sig) });
    break;
  }
  case 'sign-hash': {
    const hash = hexToBytes(args[1]);
    if (hash.length !== 32) throw new Error('hash must be 32 bytes');
    out({ signature: bytesToHex(sign(hash, hexToBytes(args[0]), { deterministic: true })) });
    break;
  }
  case 'verify': {
    const ctx = args[3] ? hexToBytes(args[3]) : new Uint8Array(0);
    let valid;
    try {
      valid = verify(hexToBytes(args[2]), hexToBytes(args[1]), hexToBytes(args[0]), ctx);
    } catch (e) {
      valid = false;
    }
    out({ valid });
    break;
  }
  default:
    console.error('usage: node js/sign87.js keygen|pubkey|setkey|sign|sign-hash|verify ... (see the file header)');
    process.exit(1);
}
