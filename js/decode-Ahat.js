import { shake128 } from '@noble/hashes/sha3.js';

function RejectionSamplePoly(rho, i, j, N = 256, q = 8380417) {
  const seed = new Uint8Array(rho.length + 2);
  seed.set(rho, 0);
  seed[rho.length] = j;
  seed[rho.length + 1] = i;

  const xof = shake128.create();
  xof.update(seed);

  const r = new Int32Array(N);
  let j_idx = 0;

  while (j_idx < N) {
    const buf = new Uint8Array(3 * 64); // read many candidates at once
    xof.xofInto(buf);

    for (let k = 0; j_idx < N && k <= buf.length - 3; k += 3) {
      let t = buf[k] | (buf[k + 1] << 8) | (buf[k + 2] << 16);
      t &= 0x7fffff;
      if (t < q) r[j_idx++] = t;
    }
  }

  return r; // optionally wrap in NTT later
}

export function recoverAhat(rho, K, L) {
  const A_hat = [];
  for (let i = 0; i < K; i++) {
    const row = [];
    for (let j = 0; j < L; j++) {
      row.push(RejectionSamplePoly(rho, i, j));
    }
    A_hat.push(row);
  }
  return A_hat;
}
