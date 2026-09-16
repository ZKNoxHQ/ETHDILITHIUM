// Copyright (C) 2026 - ZKNOX
// License: This software is licensed under MIT License
// FILE: js/ntt_mldsa.js
// Description: FIPS 204 NTT (Algorithm 41) over Z_q[X]/(X^256 + 1), q = 8380417,
// as needed to put t1 * 2^d of a public key into the NTT domain for the
// on-chain verifiers (the coefficient ordering is the one of FIPS 204, the same
// as the one produced by ExpandA / RejNTTPoly, so A_hat and t1_hat are used
// as they are by ZKNOX_dilithium*.sol).

export const Q = 8380417;
export const N = 256;
export const D = 13;
const ZETA = 1753; // 512-th root of unity mod q

function modpow(b, e) {
  let r = 1n;
  let base = BigInt(b) % BigInt(Q);
  let ee = BigInt(e);
  while (ee > 0n) {
    if (ee & 1n) r = (r * base) % BigInt(Q);
    base = (base * base) % BigInt(Q);
    ee >>= 1n;
  }
  return Number(r);
}

function bitrev8(m) {
  let r = 0;
  for (let i = 0; i < 8; i++) r |= ((m >> i) & 1) << (7 - i);
  return r;
}

// zetas[k] = zeta^{brv(k)} mod q, k = 0..255 (FIPS 204, Section 7.5)
export const ZETAS = (() => {
  const z = new Int32Array(N);
  for (let k = 0; k < N; k++) z[k] = modpow(ZETA, bitrev8(k));
  return z;
})();

function mulmod(a, b) {
  return Number((BigInt(a) * BigInt(b)) % BigInt(Q));
}

/**
 * Forward NTT, FIPS 204 Algorithm 41. Input: 256 coefficients in [0, q).
 * Output: a new Int32Array with the coefficients of the NTT domain in [0, q).
 */
export function ntt(w) {
  if (w.length !== N) throw new Error('ntt: expected 256 coefficients');
  const wHat = Int32Array.from(w, (x) => ((x % Q) + Q) % Q);
  let m = 0;
  for (let len = 128; len >= 1; len >>= 1) {
    for (let start = 0; start < N; start += 2 * len) {
      m += 1;
      const z = ZETAS[m];
      for (let j = start; j < start + len; j++) {
        const t = mulmod(z, wHat[j + len]);
        wHat[j + len] = (wHat[j] - t + Q) % Q;
        wHat[j] = (wHat[j] + t) % Q;
      }
    }
  }
  return wHat;
}

/**
 * Inverse NTT, FIPS 204 Algorithm 42 (used by the self-tests only).
 */
export function nttInv(wHat) {
  if (wHat.length !== N) throw new Error('nttInv: expected 256 coefficients');
  const w = Int32Array.from(wHat, (x) => ((x % Q) + Q) % Q);
  let m = N;
  for (let len = 1; len < N; len <<= 1) {
    for (let start = 0; start < N; start += 2 * len) {
      m -= 1;
      const z = (Q - ZETAS[m]) % Q; // -zeta^{brv(m)}
      for (let j = start; j < start + len; j++) {
        const t = w[j];
        w[j] = (t + w[j + len]) % Q;
        w[j + len] = mulmod(z, (t - w[j + len] + Q) % Q);
      }
    }
  }
  const f = 8347681; // 256^-1 mod q
  for (let j = 0; j < N; j++) w[j] = mulmod(f, w[j]);
  return w;
}

/** t1 * 2^d mod q, coefficient-wise (FIPS 204 Alg. 3, step 5: NTT(t1 * 2^d)). */
export function polyShiftD(t1) {
  return Int32Array.from(t1, (x) => Number((BigInt(x) << BigInt(D)) % BigInt(Q)));
}
