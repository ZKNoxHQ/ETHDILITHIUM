// Copyright (C) 2026 - ZKNOX
// License: This software is licensed under MIT License
// FILE: js/test_mldsa65.js
// Description: checks the JS signer against the NIST vectors stored in
// test/KAT/ (run with `node js/test_mldsa65.js` from the repository root):
//   - ACVP ML-DSA-65 keyGen: keygen(seed) reproduces (pk, sk)
//   - ACVP ML-DSA-65 sigGen (external, pure): deterministic and hedged (rnd)
//     signatures reproduced byte for byte
//   - ACVP ML-DSA-65 sigVer (external, pure): the expected verdicts
//   - PQCsignKAT_Dilithium3.rsp (NIST reference implementation): every
//     signature verifies against its message and public key
import fs from 'fs';
import { keygen, sign, verify, hexToBytes, bytesToHex } from './mldsa65.js';
import { parseRsp } from './kat_rsp.js';

const KAT = 'test/KAT';
let failures = 0;
function check(cond, what) {
  if (!cond) {
    failures++;
    console.log('FAIL', what);
  }
}

// keyGen
{
  const d = JSON.parse(fs.readFileSync(`${KAT}/ACVP_ML-DSA-65_keyGen-FIPS204.json`, 'utf8'));
  let n = 0;
  for (const g of d.testGroups) {
    for (const t of g.tests) {
      const { publicKey, secretKey } = keygen(hexToBytes(t.seed));
      check(bytesToHex(publicKey) === '0x' + t.pk.toLowerCase(), `keyGen tcId ${t.tcId} pk`);
      check(bytesToHex(secretKey) === '0x' + t.sk.toLowerCase(), `keyGen tcId ${t.tcId} sk`);
      n++;
    }
  }
  console.log(`ACVP keyGen: ${n} vectors`);
}

// sigGen, external interface, pure (M' = 0x00 || len(ctx) || ctx || M)
{
  const d = JSON.parse(fs.readFileSync(`${KAT}/ACVP_ML-DSA-65_sigGen-FIPS204.json`, 'utf8'));
  let n = 0;
  for (const g of d.testGroups) {
    if (g.signatureInterface !== 'external' || g.preHash !== 'pure') continue;
    for (const t of g.tests) {
      const opts = { context: hexToBytes(t.context) };
      if (g.deterministic) opts.deterministic = true;
      else opts.rnd = hexToBytes(t.rnd);
      const sig = sign(hexToBytes(t.message), hexToBytes(t.sk), opts);
      check(bytesToHex(sig) === '0x' + t.signature.toLowerCase(), `sigGen tcId ${t.tcId} (deterministic=${g.deterministic})`);
      n++;
    }
  }
  console.log(`ACVP sigGen (external, pure): ${n} vectors`);
}

// sigVer, external interface, pure
{
  const d = JSON.parse(fs.readFileSync(`${KAT}/ACVP_ML-DSA-65_sigVer-FIPS204.json`, 'utf8'));
  let n = 0;
  for (const g of d.testGroups) {
    if (g.signatureInterface !== 'external' || g.preHash !== 'pure') continue;
    for (const t of g.tests) {
      let ok;
      try {
        ok = verify(hexToBytes(t.signature), hexToBytes(t.message), hexToBytes(t.pk), hexToBytes(t.context));
      } catch (e) {
        ok = false;
      }
      check(ok === t.testPassed, `sigVer tcId ${t.tcId} expected ${t.testPassed} (${t.reason})`);
      n++;
    }
  }
  console.log(`ACVP sigVer (external, pure): ${n} vectors`);
}

// NIST reference implementation KAT (.rsp): sm = signature || message, empty context
{
  const vecs = parseRsp(fs.readFileSync(`${KAT}/PQCsignKAT_Dilithium3.rsp`, 'utf8'));
  let n = 0;
  for (const v of vecs) {
    const sig = v.sm.slice(0, 3309);
    const msgInSm = v.sm.slice(3309);
    check(Buffer.compare(Buffer.from(msgInSm), Buffer.from(v.msg)) === 0, `rsp count ${v.count}: sm = sig || msg`);
    check(verify(sig, v.msg, v.pk), `rsp count ${v.count} verifies`);
    n++;
  }
  console.log(`PQCsignKAT_Dilithium3.rsp: ${n} vectors`);
}

if (failures) {
  console.log(`${failures} failure(s)`);
  process.exit(1);
}
console.log('all ML-DSA-65 signer checks passed');
