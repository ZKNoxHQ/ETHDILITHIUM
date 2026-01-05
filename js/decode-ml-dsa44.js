// decode-ml-dsa44.js
import { shake256 } from '@noble/hashes/sha3.js';

/**
 * Minimal NTT and polynomial helpers
 * (we only need identity for decoding t1)
 */
const N = 256;
const newPoly = () => new Int32Array(N);

/**
 * Poly decoder for t1: Dilithium DSA44 uses 10-bit coefficients
 */
function polyDecode10Bits(bytes) {
  const n = 256; // number of coefficients
  const poly = newPoly();
  let r = 0n;
  // convert bytes to BigInt little-endian
  for (let i = 0; i < bytes.length; i++) r |= BigInt(bytes[i]) << BigInt(8 * i);

  const mask = (1 << 10) - 1; // 10 bits
  for (let i = 0; i < n; i++) {
    poly[i] = Number((r >> BigInt(i * 10)) & BigInt(mask));
  }
  return poly;
}

/**
 * Decode ML-DSA-44 public key
 * @param {Uint8Array} publicKey
 * @returns {rho, t1, tr}
 */
export function decodePublicKey(publicKey) {
  const RHO_BYTES = 32;
  const K = 4; // ML-DSA-44 parameter
  const T1_POLY_BYTES = 320; // 256*10 bits = 2560 bits = 320 bytes per polynomial

  if (publicKey.length !== RHO_BYTES + K * T1_POLY_BYTES)
    throw new Error('Invalid publicKey length');

  // Slice rho
  const rho = publicKey.slice(0, RHO_BYTES);

  // Decode t1 polynomials
  const t1 = [];
  for (let i = 0; i < K; i++) {
    const offset = RHO_BYTES + i * T1_POLY_BYTES;
    const polyBytes = publicKey.slice(offset, offset + T1_POLY_BYTES);
    t1.push(polyDecode10Bits(polyBytes));
  }

  // Generate TR (64 bytes) from publicKey
  const tr = shake256(new Uint8Array(publicKey), { dkLen: 64 }); // returns Uint8Array directly

  return { rho, t1, tr };
}
