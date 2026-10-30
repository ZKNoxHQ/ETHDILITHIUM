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
  `encodePublicKey65(expanded)` → the 38,112-byte on-chain key (hex),
  `publicKeyToBlob65(publicKey)` → the same, from a 1952-byte public key.
* **Command line** — `js/sign65.js`:
  ```
  node js/sign65.js keygen [seedHex]                 # {publicKey, secretKey}
  node js/sign65.js setkey <publicKeyHex>            # {setKeyData}: the pk of verify
  node js/sign65.js sign <skHex> <msgHex> [ctxHex] [--hedged]
  node js/sign65.js sign-hash <skHex> <hash32Hex>    # for verify(pk, bytes32, sig)
  node js/sign65.js verify <pkHex> <msgHex> <sigHex> [ctxHex]
  ```
* **On-chain key**: the expanded ML-DSA-65 key is passed in the calldata of
  every verification, 38,112 bytes: the 30 + 6 polynomials (A row by row, then
  t1), each a length word of 32 and 32 words of eight 32-bit fields, then a
  length word of 64 and tr. Nothing is deployed per key;
  `ZKNOX_dilithium65.setKey(key)` checks the length and returns `key`, the `pk`
  argument of `verify`, which the caller binds to an account with keccak256.
  The signature is the plain 3309-byte FIPS 204 encoding returned by `sign`.
* **Hardware signer** — the public key returned by the ECML-Signer Ledger app
  (ZKNoxHQ/ecml-signer, ML-DSA-65 with P2 = `0x01`) goes through
  `publicKeyToBlob65` (or `node js/sign65.js setkey`) like any other; its
  signatures of a 32-byte hash are checked by `verify(pk, bytes32, sig)`
  as they come.
* **Checks** — `node js/test_mldsa65.js` (from the repository root) replays the
  NIST vectors of `test/KAT/`: ACVP keyGen (25), sigGen external/pure (30,
  deterministic and hedged), sigVer external/pure (15), and the 100 signatures
  of `PQCsignKAT_Dilithium3.rsp`.
* **Test vectors of the Solidity suite** — `node js/gen_test_vectors65.js [rspCounts]`
  writes `test/dilithium65KATS.t.sol` (KAT count 0, literal) and
  `test/KAT/mldsa65_vectors.json` / `mldsa65_kat0.json` (ACVP sigVer vectors,
  the first `rspCounts` KAT counts, signer vectors, each with its on-chain key).

# ML-DSA-87 signer (`mldsa87.js`)

ML-DSA-87 (FIPS 204, security category 5) for the `ZKNOX_dilithium87`
verifier, on `@noble/post-quantum` (`ml_dsa87`), same interface as
`mldsa65.js`.

* **Library**: `js/mldsa87.js`: `keygen(seed?)`, `sign(msg, secretKey, opts)`
  (deterministic by default), `verify(sig, msg, publicKey, context)`,
  `expandPublicKey87(publicKey)`, `encodePublicKey87(expanded)` → the
  67,680-byte on-chain key (hex), `publicKeyToBlob87(publicKey)` → the same,
  from a 2592-byte public key.
* **Command line**: `js/sign87.js`, the commands of `sign65.js`
  (`keygen`, `pubkey`, `setkey`, `sign`, `sign-hash`, `verify`).
* **On-chain key**: 67,680 bytes, the 56 + 8 polynomials (A row by row, seven
  per row, then t1), each a length word of 32 and 32 words of eight 32-bit
  fields, then a length word of 64 and tr. `ZKNOX_dilithium87.setKey(key)`
  checks the length and returns `key`. The signature is the plain 4627-byte
  FIPS 204 encoding returned by `sign`.
* **Checks**: `node js/test_mldsa87.js` replays ACVP keyGen (25), sigGen
  external/pure (30), sigVer external/pure (15) and the 100 signatures of
  `PQCsignKAT_Dilithium5.rsp`.
* **Test vectors of the Solidity suite**: `node js/gen_test_vectors87.js [rspCounts]`
  writes `test/dilithium87KATS.t.sol` (KAT count 0, hex literals) and
  `test/KAT/mldsa87_vectors.json` / `mldsa87_kat0.json`.
