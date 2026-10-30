// Copyright (C) 2026 - ZKNOX
// License: This software is licensed under MIT License
// FILE: js/mldsa87.js
// Description: ML-DSA-87 (FIPS 204, security category 5) signer for the
// ZKNOX_dilithium87 verifier: key generation and signing through
// @noble/post-quantum, and the expansion of a FIPS 204 public key into the
// on-chain form the verifier reads from the calldata of every verification:
//
//     aHat[i][j] = ExpandA(rho)[i][j]  (NTT domain, as produced by RejNTTPoly)
//     t1[i]      = NTT(t1_i * 2^13)    (NTT domain)
//     tr         = SHAKE256(pk, 64)
//   each polynomial is 32 words of eight 32-bit fields (coefficient 8m + f in
//   field f of word m) behind a length word of 32. The key is one flat run of
//   67,680 bytes: polynomial f < 56 is aHat[f / 7][f % 7], f >= 56 is
//   t1[f - 56], then a length word of 64 and tr (encodePublicKey87).
//   ZKNOX_dilithium87.setKey(key) checks the length and returns it unchanged:
//   it is the `pk` argument of verify, nothing is stored on chain.
//
// Same layout as ML-DSA-65 (js/mldsa65.js), with k = 8 rows of l = 7 columns.
// The signature handed to the verifier is the plain 4627-byte FIPS 204
// encoding c~ (64) || z (4480) || h (83), exactly as returned by noble.

import { ml_dsa87 } from '@noble/post-quantum/ml-dsa.js';
import { shake256 } from '@noble/hashes/sha3.js';
import { ethers } from 'ethers';
import { ntt, polyShiftD } from './ntt_mldsa.js';
import { recoverAhat, compact_module_256 } from './utils_mldsa.js';

export const PARAMS = {
  name: 'ML-DSA-87',
  K: 8,
  L: 7,
  ETA: 2,
  TAU: 60,
  BETA: 120,
  GAMMA1: 1 << 19,
  GAMMA2: (8380417 - 1) / 32,
  OMEGA: 75,
  LAMBDA: 256,
  CTILDE_BYTES: 64,
  PK_BYTES: 2592,
  SK_BYTES: 4896,
  SIG_BYTES: 4627,
};

const RHO_BYTES = 32;
const T1_POLY_BYTES = 320; // 256 coefficients of 10 bits

export function hexToBytes(hex) {
  if (hex.startsWith('0x')) hex = hex.slice(2);
  if (hex.length % 2) throw new Error('odd hex length');
  return Uint8Array.from(hex.match(/.{2}/g) ?? [], (b) => parseInt(b, 16));
}

export function bytesToHex(bytes) {
  return '0x' + Buffer.from(bytes).toString('hex');
}

/** Key generation. `seed` is an optional 32-byte xi (FIPS 204 Alg. 1); random if omitted. */
export function keygen(seed) {
  const { publicKey, secretKey } = ml_dsa87.keygen(seed);
  return { publicKey, secretKey };
}

/**
 * Signing, FIPS 204 Alg. 2 (ML-DSA.Sign, the "external" pure interface):
 *   M' = 0x00 || len(ctx) || ctx || M.
 * @param msg Uint8Array message
 * @param secretKey 4896-byte secret key
 * @param opts { context?: Uint8Array (<= 255 bytes), deterministic?: boolean, rnd?: Uint8Array(32) }
 *   deterministic (rnd = 0^32) by default; { deterministic: false } for the
 *   hedged variant (fresh 32 random bytes) or a 32-byte rnd of your own.
 * @return the 4627-byte signature
 */
export function sign(msg, secretKey, opts = {}) {
  const context = opts.context ?? new Uint8Array(0);
  if (context.length > 255) throw new Error('context must be at most 255 bytes');
  let extraEntropy;
  if (opts.rnd !== undefined) extraEntropy = opts.rnd;
  else if (opts.deterministic === false) extraEntropy = undefined;
  else extraEntropy = false;
  return ml_dsa87.sign(msg, secretKey, { context, extraEntropy });
}

/** Off-chain verification (FIPS 204 Alg. 3), for checks before sending on-chain. */
export function verify(sig, msg, publicKey, context = new Uint8Array(0)) {
  return ml_dsa87.verify(sig, msg, publicKey, { context });
}

/** Poly decoder for t1: 10-bit coefficients, little-endian bit packing (FIPS 204 SimpleBitUnpack). */
function polyDecode10Bits(bytes) {
  const poly = new Int32Array(256);
  let r = 0n;
  for (let i = 0; i < bytes.length; i++) r |= BigInt(bytes[i]) << BigInt(8 * i);
  const mask = (1n << 10n) - 1n;
  for (let i = 0; i < 256; i++) poly[i] = Number((r >> BigInt(i * 10)) & mask);
  return poly;
}

/**
 * pkDecode (FIPS 204 Alg. 23) for ML-DSA-87 plus tr = SHAKE256(pk, 64).
 * @param {Uint8Array} publicKey 2592 bytes
 * @returns {rho, t1, tr}
 */
export function decodePublicKey87(publicKey) {
  const { K } = PARAMS;
  if (publicKey.length !== RHO_BYTES + K * T1_POLY_BYTES) {
    throw new Error(`Invalid ML-DSA-87 publicKey length ${publicKey.length}, expected ${PARAMS.PK_BYTES}`);
  }
  const rho = publicKey.slice(0, RHO_BYTES);
  const t1 = [];
  for (let i = 0; i < K; i++) {
    const offset = RHO_BYTES + i * T1_POLY_BYTES;
    t1.push(polyDecode10Bits(publicKey.slice(offset, offset + T1_POLY_BYTES)));
  }
  const tr = shake256(new Uint8Array(publicKey), { dkLen: 64 });
  return { rho, t1, tr };
}

/**
 * Expansion of a FIPS 204 public key into the on-chain form.
 * @returns { aHat: bigint[8][7][32], t1Hat: bigint[8][32], tr: Uint8Array(64) }
 */
export function expandPublicKey87(publicKey) {
  const { K, L } = PARAMS;
  const { rho, t1, tr } = decodePublicKey87(publicKey);
  const A = recoverAhat(rho, K, L); // ExpandA: A_hat[i][j] = RejNTTPoly(rho || j || i)
  const aHat = compact_module_256(A, 32);
  const t1Ntt = t1.map((p) => Array.from(ntt(polyShiftD(p)))); // NTT(t1 * 2^d)
  const t1Hat = compact_module_256([t1Ntt], 32)[0];
  return { aHat, t1Hat, tr };
}

/** Flat key layout read by readPubKeyCalldata87 (ZKNOX_dilithium87_core_packed.sol). */
export const POLY_BYTES87 = 1056; // [32][32 words], used in place as a uint256[32]
export const KEY_POLYS87 = 64; // 56 of A plus 8 of t1
export const KEY_BYTES87 = KEY_POLYS87 * POLY_BYTES87 + 96; // 67,680, tr included

const word = (v) => BigInt(v).toString(16).padStart(64, '0');

/** One polynomial as the verifier reads it: a length word of 32, then its 32 words. */
function encodePoly87(poly) {
  if (poly.length !== 32) throw new Error(`a polynomial is 32 words, got ${poly.length}`);
  return word(32) + poly.map(word).join('');
}

/**
 * The 64 polynomials of the expanded key in reading order: flat index f < 56 is
 * aHat[f / 7][f % 7], f >= 56 is t1[f - 56].
 */
export function flattenKeyPolys87(expanded) {
  const { aHat, t1Hat } = expanded;
  if (aHat.length !== 8 || t1Hat.length !== 8) throw new Error('ML-DSA-87 expands to 8 rows of A and 8 t1 polynomials');
  for (const row of aHat) {
    if (row.length !== 7) throw new Error('ML-DSA-87 rows of A have 7 polynomials');
  }
  return [...aHat.flat(), ...t1Hat];
}

/**
 * The expanded public key as the verifier takes it: the 64 polynomials in
 * reading order, then tr. Nothing is deployed on chain; this is the `pk`
 * argument of every verification.
 * @returns hex string of KEY_BYTES87 bytes
 */
export function encodePublicKey87(expanded) {
  const polys = flattenKeyPolys87(expanded);
  if (polys.length !== KEY_POLYS87) throw new Error(`expected 64 polynomials, got ${polys.length}`);
  if (expanded.tr.length !== 64) throw new Error('tr must be 64 bytes');
  const body = polys.map(encodePoly87).join('') + word(64) + ethers.hexlify(expanded.tr).slice(2);
  if (body.length / 2 !== KEY_BYTES87) throw new Error(`key is ${body.length / 2} bytes, expected ${KEY_BYTES87}`);
  return '0x' + body;
}

/** publicKey (2592 bytes) -> the verifier's `pk` argument, in one call. */
export function publicKeyToBlob87(publicKey) {
  return encodePublicKey87(expandPublicKey87(publicKey));
}

/**
 * Splits a signature into its three fields (for Signature structs in tests).
 */
export function splitSignature87(sig) {
  if (sig.length !== PARAMS.SIG_BYTES) throw new Error(`signature must be ${PARAMS.SIG_BYTES} bytes`);
  return {
    cTilde: sig.slice(0, 64),
    z: sig.slice(64, 4544),
    h: sig.slice(4544, 4627),
  };
}
