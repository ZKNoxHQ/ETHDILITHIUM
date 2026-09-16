# Deploy a PKContract

## Prerequisites
Deploying a PKContract requires the installation of `noble` library
```
npm install @noble/hashes
npm install @noble/post-quantum
```

## Deploying a generated public key
In order to deploy an ERC4337 account using MLDSA (NIST version) and ECDSA on-chain using javascript, simply run
```
node execute.js <wallet_private_key>
```
Note that for now, this deploys a dummy MLDSA key whose seed is `deadbeef...deadbeef`, on Arbitrum Sepolia.

## Deploying a signed transaction
TODO
# ML-DSA-65 signer (`mldsa65.js`)

ML-DSA-65 (FIPS 204, security category 3) for the `ZKNOX_dilithium65` verifier,
on `@noble/post-quantum` (`ml_dsa65`). No Python needed.

* **Library** — `js/mldsa65.js`:
  `keygen(seed?)`, `sign(msg, secretKey, {context, deterministic, rnd})`
  (deterministic by default), `verify(sig, msg, publicKey, context)`,
  `expandPublicKey65(publicKey)` (A_hat = ExpandA(rho), t1 = NTT(t1 * 2^13)
  with the FIPS 204 NTT of `js/ntt_mldsa.js`, tr = SHAKE256(pk, 64)),
  `encodePublicKeyBlob65(expanded)` → `{halves, setKeyData}`,
  `publicKeyToBlob65(publicKey)` → the `setKey` argument.
* **Command line** — `js/sign65.js`:
  ```
  node js/sign65.js keygen [seedHex]                 # {publicKey, secretKey}
  node js/sign65.js setkey <publicKeyHex>            # {setKeyData, half0, half1}
  node js/sign65.js sign <skHex> <msgHex> [ctxHex] [--hedged]
  node js/sign65.js sign-hash <skHex> <hash32Hex>    # for verify(pk, bytes32, sig)
  node js/sign65.js verify <pkHex> <msgHex> <sigHex> [ctxHex]
  ```
* **On-chain key**: the expanded ML-DSA-65 key (30 + 6 polynomials, 36,864
  bytes of words) is above the EIP-170 size of one SSTORE2 contract, so it is
  two halves of the same shape (rows 0..2 / 3..5 of A, t1[0..2] / t1[3..5],
  tr in both, 20,160 bytes each). `ZKNOX_dilithium65.setKey(half0 || half1)`
  writes both (~8.7M gas) and returns the two pointer addresses (40 bytes),
  the `pk` argument of `verify`. The signature is the plain 3309-byte FIPS 204
  encoding returned by `sign`.
* **Checks** — `node js/test_mldsa65.js` (from the repository root) replays the
  NIST vectors of `test/KAT/`: ACVP keyGen (25), sigGen external/pure (30,
  deterministic and hedged), sigVer external/pure (15), and the 100 signatures
  of `PQCsignKAT_Dilithium3.rsp`.
* **Test vectors of the Solidity suite** — `node js/gen_test_vectors65.js [rspCounts]`
  writes `test/dilithium65KATS.t.sol` (KAT count 0, literal) and
  `test/KAT/mldsa65_vectors.json` / `mldsa65_kat0.json` (ACVP sigVer vectors,
  the first `rspCounts` KAT counts, signer vectors, each with its on-chain key).
