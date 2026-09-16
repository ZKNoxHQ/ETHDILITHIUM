// Copyright (C) 2026 - ZKNOX
// License: This software is licensed under MIT License
// FILE: js/mldsa65.js
// Description: ML-DSA-65 (FIPS 204, security category 3) signer for the
// ZKNOX_dilithium65 verifier: key generation and signing through
// @noble/post-quantum, and the expansion of a FIPS 204 public key into the
// on-chain form the verifier reads in place from its SSTORE2 blobs:
//
//     aHat[i][j] = ExpandA(rho)[i][j]  (NTT domain, as produced by RejNTTPoly)
//     t1[i]      = NTT(t1_i * 2^13)    (NTT domain)
//     tr         = SHAKE256(pk, 64)
//   each polynomial is 32 words of eight 32-bit fields (coefficient 8m + f in
//   field f of word m). The 36 polynomials are above the EIP-170 size of one
//   SSTORE2 contract, so the key is two halves of the same shape,
//     half_h = abi.encode(abi.encode(uint256[3][5][32] aHat[3h..3h+2]), bytes tr,
//                         abi.encode(uint256[3][32] t1[3h..3h+2]))     (20,160 bytes)
//   ZKNOX_dilithium65.setKey(half0 || half1) writes both and returns the two
//   pointer addresses (40 bytes), the `pk` argument of verify.
//
// The signature handed to the verifier is the plain 3309-byte FIPS 204
// encoding c~ (48) || z (3200) || h (61), exactly as returned by noble.

import { ml_dsa65 } from '@noble/post-quantum/ml-dsa.js';
import { shake256 } from '@noble/hashes/sha3.js';
import { ethers } from 'ethers';
import { ntt, polyShiftD } from './ntt_mldsa.js';
import { recoverAhat, compact_module_256 } from './utils_mldsa.js';

export const PARAMS = {
  name: 'ML-DSA-65',
  K: 6,
  L: 5,
  ETA: 4,
  TAU: 49,
  BETA: 196,
  GAMMA1: 1 << 19,
  GAMMA2: (8380417 - 1) / 32,
  OMEGA: 55,
  LAMBDA: 192,
  CTILDE_BYTES: 48,
  PK_BYTES: 1952,
  SK_BYTES: 4032,
  SIG_BYTES: 3309,
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
  const { publicKey, secretKey } = ml_dsa65.keygen(seed);
  return { publicKey, secretKey };
}

/**
 * Signing, FIPS 204 Alg. 2 (ML-DSA.Sign, the "external" pure interface):
 *   M' = 0x00 || len(ctx) || ctx || M.
 * @param msg Uint8Array message
 * @param secretKey 4032-byte secret key
 * @param opts { context?: Uint8Array (<= 255 bytes), deterministic?: boolean, rnd?: Uint8Array(32) }
 *   deterministic (rnd = 0^32) by default: the same input always gives the
 *   same signature, which is what the test vectors need; pass
 *   { deterministic: false } for the hedged variant (fresh 32 random bytes)
 *   or a 32-byte rnd of your own.
 * @return the 3309-byte signature
 */
export function sign(msg, secretKey, opts = {}) {
  const context = opts.context ?? new Uint8Array(0);
  if (context.length > 255) throw new Error('context must be at most 255 bytes');
  let extraEntropy;
  if (opts.rnd !== undefined) extraEntropy = opts.rnd;
  else if (opts.deterministic === false) extraEntropy = undefined;
  else extraEntropy = false;
  return ml_dsa65.sign(msg, secretKey, { context, extraEntropy });
}

/** Off-chain verification (FIPS 204 Alg. 3), for checks before sending on-chain. */
export function verify(sig, msg, publicKey, context = new Uint8Array(0)) {
  return ml_dsa65.verify(sig, msg, publicKey, { context });
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
 * pkDecode (FIPS 204 Alg. 23) for ML-DSA-65 plus tr = SHAKE256(pk, 64).
 * @param {Uint8Array} publicKey 1952 bytes
 * @returns {rho, t1, tr}
 */
export function decodePublicKey65(publicKey) {
  const { K } = PARAMS;
  if (publicKey.length !== RHO_BYTES + K * T1_POLY_BYTES) {
    throw new Error(`Invalid ML-DSA-65 publicKey length ${publicKey.length}, expected ${PARAMS.PK_BYTES}`);
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
 * @returns { aHat: bigint[6][5][32], t1Hat: bigint[6][32], tr: Uint8Array(64) }
 */
export function expandPublicKey65(publicKey) {
  const { K, L } = PARAMS;
  const { rho, t1, tr } = decodePublicKey65(publicKey);
  const A = recoverAhat(rho, K, L); // ExpandA: A_hat[i][j] = RejNTTPoly(rho || j || i)
  const aHat = compact_module_256(A, 32);
  const t1Ntt = t1.map((p) => Array.from(ntt(polyShiftD(p)))); // NTT(t1 * 2^d)
  const t1Hat = compact_module_256([t1Ntt], 32)[0];
  return { aHat, t1Hat, tr };
}

export const HALF_BYTES = 20160;

/**
 * One half of the on-chain key (readPubKeyPacked65 / _readHalfPacked65):
 *   abi.encode(bytes abi.encode(uint256[3][5][32] rows), bytes tr, bytes abi.encode(uint256[3][32] t1Polys)).
 * @returns hex string of HALF_BYTES bytes
 */
export function encodeKeyHalf65(aHatRows, tr, t1Polys) {
  if (aHatRows.length !== 3 || t1Polys.length !== 3) throw new Error('a half holds 3 rows of A and 3 polynomials of t1');
  if (tr.length !== 64) throw new Error('tr must be 64 bytes');
  const abi = ethers.AbiCoder.defaultAbiCoder();
  const aHatEncoded = abi.encode(['uint256[][][]'], [aHatRows.map((r) => r.map((c) => c.map((v) => v.toString())))]);
  const t1Encoded = abi.encode(['uint256[][]'], [t1Polys.map((r) => r.map((v) => v.toString()))]);
  const half = abi.encode(['bytes', 'bytes', 'bytes'], [aHatEncoded, tr, t1Encoded]);
  if ((half.length - 2) / 2 !== HALF_BYTES) throw new Error(`half is ${(half.length - 2) / 2} bytes, expected ${HALF_BYTES}`);
  return half;
}

/**
 * The two halves and the setKey argument (their concatenation).
 * @returns { halves: [hex, hex], setKeyData: hex }
 */
export function encodePublicKeyBlob65(expanded) {
  const { aHat, t1Hat, tr } = expanded;
  const halves = [0, 1].map((h) => encodeKeyHalf65(aHat.slice(3 * h, 3 * h + 3), tr, t1Hat.slice(3 * h, 3 * h + 3)));
  return { halves, setKeyData: halves[0] + halves[1].slice(2) };
}

/** publicKey (1952 bytes) -> setKey argument (half0 || half1) as hex, in one call. */
export function publicKeyToBlob65(publicKey) {
  return encodePublicKeyBlob65(expandPublicKey65(publicKey)).setKeyData;
}

/**
 * Splits a signature into its three fields (for Signature structs in tests).
 */
export function splitSignature65(sig) {
  if (sig.length !== PARAMS.SIG_BYTES) throw new Error(`signature must be ${PARAMS.SIG_BYTES} bytes`);
  return {
    cTilde: sig.slice(0, 48),
    z: sig.slice(48, 3248),
    h: sig.slice(3248, 3309),
  };
}
