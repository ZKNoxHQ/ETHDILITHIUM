export function compact_module_256(data, m) {
  const res = [];
  for (const row of data) {
    const res0 = [];
    for (const p of row) {
      res0.push(compact_poly_256(p, m));
    }
    res.push(res0);
  }
  return res;
}

export function compact_poly_256(coeffs, m) {
  if (m >= 256) throw new Error('m must be less than 256');
  if ((coeffs.length * m) % 256 !== 0)
    throw new Error('Total bits must be divisible by 256');

  // Ensure everything is BigInt
  const a = Array.from(coeffs, (x) => {
    if (typeof x === 'bigint') return x;
    if (typeof x === 'number') return BigInt(Math.floor(x));
    throw new Error(`Element ${x} cannot be converted to BigInt`);
  });

  for (const elt of a) {
    if (elt >= (1n << BigInt(m))) throw new Error(`Element ${elt} too large for ${m} bits`);
  }

  const n = (a.length * m) / 256;
  const b = new Array(n).fill(0n);

  for (let i = 0; i < a.length; i++) {
    const idx = Math.floor((i * m) / 256);
    const shift = BigInt((i % (256 / m)) * m);
    b[idx] |= a[i] << shift;
  }

  return b;
}
