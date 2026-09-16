// Copyright (C) 2026 - ZKNOX
// License: This software is licensed under MIT License
// FILE: js/kat_rsp.js
// Description: parser for the NIST PQCsignKAT_*.rsp format written by
// PQCgenKAT_sign.c of the reference implementation (pq-crystals/dilithium):
//   count = N / seed = / mlen = / msg = / pk = / sk = / smlen = / sm =
// with sm = signature || message.
import { hexToBytes } from './mldsa65.js';

export function parseRsp(text) {
  const vectors = [];
  let cur = null;
  for (const raw of text.split('\n')) {
    const line = raw.trim();
    if (line === '' || line.startsWith('#')) continue;
    const eq = line.indexOf('=');
    if (eq < 0) continue;
    const key = line.slice(0, eq).trim();
    const val = line.slice(eq + 1).trim();
    if (key === 'count') {
      cur = { count: parseInt(val, 10) };
      vectors.push(cur);
      continue;
    }
    if (!cur) continue;
    if (key === 'mlen' || key === 'smlen') cur[key] = parseInt(val, 10);
    else cur[key] = hexToBytes(val);
  }
  return vectors;
}
