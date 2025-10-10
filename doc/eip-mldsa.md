---
eip: ????
title: Precompile for ML-DSA signature verification
description: Proposal to add precompiled contracts that perform signature verifications using the NIST-standard ML-DSA (Module Lattice Digital Signature Algorithm) family of lattice-based signatures, in two instantiations: NIST-style SHAKE256-based XOF and an EVM-friendly Keccak-PRNG-based XOF. The public key format is modified to store one polynomial already in the NTT/evaluation domain to save NTT for verifiers.
author: Renaud Dubois, Simon Masson (adapted for ML-DSA)
discussions-to: ...
status: Draft
type: Standards Track
category: Core
created: ????-??-??
---

# ML-DSA EIP

## 1. Abstract
This proposal adds precompiled contracts that perform signature verifications using the NIST-standard module-lattice signature scheme. Two instantiations are supported:

* **ML-DSA** — NIST-compliant instantiation built on top of SHAKE256 (fully compatible with the ML-DSA standard),
* **ML-DSA-ETH** — an EVM-friendly instantiation optimized for reduced on-chain verification:
    - The eXtendable Output Function (XOF) used in the algorithm is replaced by a Keccak-based counter PRNG (leveraging the native `KECCAK256` precompile), to reduce gas and make on-chain verification cheaper.
    - The public-key encoding is slightly modified: the polynomial `t1` is stored in the NTT domain in order to skip one NTT for the on-chain verification. This is a *representation* change only, meaning that public key can be also represented as in NIST standard ML-DSA. The conversion with standard public key encodings can be converted offline (or validated by the precompile with a pre-step).

Two OPCODES are specified:
- `VERIFY_MLDSA` — verifies a ML-DSA signature compliant to NIST standard.
- `VERIFY_MLDSA_ETH` — verifies a ML-DSA-ETH signature more efficiently, deviating from the NIST standard.

## 2. Motivation


Quantum computers pose a long-term risk to classical cryptographic algorithms. In particular, signature algorithms based on the hardness of the Elliptic Curve Discrete Logarithm Problem (ECDLP) such as secp256k1, are widely used in Ethereum and threaten by quantum algorithms. This exposes potentially on-chain assets and critical infrastructure to quantum adversaries.

Integrating post-quantum signature schemes is crucial to future-proof Ethereum and other EVM-based environments. It shall be noted that infrastructure for post-quantum signatures should be deployed before quantum adversaries are known to be practical because it takes on the order of years for existing applications to integrate.

Dilithium, a lattice-based scheme standardized by NIST as ML-DSA, offers high security against both classical and quantum adversaries. As the main winner of the standardization, the scheme has been selected as the main alternative to elliptic curve signature algorithms, making it a serious option for Ethereum.

While the signature size (2.4kB) and public key size (1.3kB) are larger than other post-quantum candidates such as FALCON, this scheme is more flexible in terms of parameters. It is thus possible to derive a zero-knowledge version of Dilithium, keeping the security of the scheme with an efficient in-circuit verification. This EIP does not dig into details this instance.
Also, ML-DSA has a simpler signer algorithm, making hardware implementation easier.
Finally, ML-DSA is based on the same mathematical construction as Kyber, the Post-Quantum Key Exchange standardized by NIST.
All these properties make ML-DSA well-suited for blockchain applications.

In the context of the Ethereum Virtual Machine, a precompile for Keccak256 hash function is already available, making ML-DSA verification much faster when instantiated with an extendable output function derived from Keccak than with SHAKE256, as specified in NIST submission. This EIP specifies two version of ML-DSA enabling two important features: one version being fully compliant with the NIST specification, the other deviating from the standard in order to reduce the gas cost.

<!-- This EIP adds precompiles that enable EVM chains and rollups to adopt PQ resistant signatures -->

## 3. Specification

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "NOT RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in RFC 2119 and RFC 8174.

While ML-DSA can be instantiated for three security levels: NIST level II, III and IV, this EIP only covers NIST level II, corresponding to 128 bits of security.

For the two variants of ML-DSA of this EIP, the following parameters are fixed:
- Polynomial degree `n = 256`
- Field modulus `q = 8380417`
- Matrix dimensions: `k=4`, `l=4`
- `γ_1 = 2**17`, `γ_2 = (q-1)/88`, `η = 2`, `τ = 39`,
- `ζ = 350209`, `ζ' = 380929`, `d = 13`.

These parameters strictly follows NIST standard ML-DSA. More precisely, `q`, `n`, `k`, `l` and `η` are chosen in order to ensure a hard MLWE related problem, and the remaining parameters are chosen for the hardness of MSIS.

ML-DSA requires the following storage:
- 2420 bytes for the signature
- 1312 bytes for the public key.


### 3.1. ML-DSA verificationalgorithm
TODO

### 3.2. ML-DSA-ETH verification algorithm
TODO

### 3.3. Required checks in ML-DSA(-ETH) verification
TODO

## 4. Precompiled contract specification

### 4.1. ML-DSA precompiled contract 

### 4.2. ML-DSA-ETH precompiled contract 

### 4.3. Precompiled contract gas usage

## 5. Rationale


---------------------------------


> **Note:** exact byte sizes for public keys and signatures depend on chosen parameter set and the canonical packing. Replace the example sizes and placeholders below with values from the ML-DSA reference implementation you adopt.

### 3.1 High-level verification split & interplay with sampling
ML-DSA verification requires:

1. Parsing the public key `pk = (rho, t1)` (packaged with `t1` compressed). In our modified **NTT-aware** public-key encoding, we store:
   - `rho` (seed, typically 32 bytes),
   - `t1`: a vector of `k` polynomials compressed as usual,
   - **one polynomial of `t` or one precomputed evaluation** (call it `t_ntt_0`) stored already in NTT/evaluation domain (this polynomial corresponds to one row/column chosen by implementer; keep format fixed).
2. Reconstructing the message digest and Fiat–Shamir challenge `c` from the message and public-seed and optionally parts of the signature.
3. Running the core verification that:
   - decompresses signature components (`z`, `h`/`w1`/hints),
   - performs necessary NTT multiplications (one of the public polynomials already in NTT to save one transform),
   - checks norms and hints,
   - returns success/failure.

Splitting the hash/challenge computation from numeric algebra allows two XOF instantiations. **Important note:** ML-DSA signing uses randomized sampling (centered binomial / sampling in a ball) in the signing algorithm. In verification, however, only the challenge `c` (sparse vector/polynomial) is needed. Because `sample_in_ball` and rejection sampling are used only during signing, the verifier only requires the same challenge derivation function (Fiat–Shamir output) as used by signing; if you change the XOF from SHAKE256 to KeccakPRNG you must ensure signers used the same XOF. In particular, if you want to use the KeccakPRNG instantiation in the EVM, you must ensure **all signatures verified under that mode were produced using the matching KeccakPRNG behavior**.

### 3.2 Precompile names / opcodes

We suggest the following precompiles (names are examples):

- `MLDSA_HASH_TO_CHALLENGE` (NIST SHAKE256-based XOF) — computes Fiat–Shamir challenge `c` (sparse indices ± signs or other canonical encoding).
- `ETH_MLDSA_HASH` (KeccakPRNG-based XOF) — same functionality, implemented using Keccak256 counter-mode PRNG for EVM efficiency.
- `MLDSA_CORE` — core verification algorithm. Expects the `c` produced by one of the two hash precompiles.

### 3.3 Pseudocode (verification flow)

The following pseudo-code shows the verification flow. This is *conceptual* and matches the split described above.

```python
# High-level verification wrapper (NIST mode)
def mldsa_verify_sha(message: bytes, signature: bytes, pubkey: bytes) -> bool:
    # 1. Compute the Fiat-Shamir challenge using SHAKE256
    c = MLDSA_HASH_TO_CHALLENGE(message, signature, pubkey)
    # 2. Run core verification
    return MLDSA_CORE(signature, pubkey, c)

# EVM-friendly wrapper (Keccak PRNG)
def mldsa_verify_keccak(message: bytes, signature: bytes, pubkey: bytes) -> bool:
    c = ETH_MLDSA_HASH(message, signature, pubkey)
    return MLDSA_CORE(signature, pubkey, c)
