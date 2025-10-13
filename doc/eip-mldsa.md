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

While the signature size (2.4kB) and public key size (1.3kB) are larger than other post-quantum candidates such as Falcon FN-DSA, this scheme is more flexible in terms of parameters. It is thus possible to derive a zero-knowledge version of Dilithium, keeping the security of the scheme toegether with an efficient in-circuit verification. This EIP does not dig into details this instance.

ML-DSA has a simpler signer algorithm than FN-DSA, making hardware implementation easier.
Finally, ML-DSA is based on the same mathematical construction as Kyber, the Post-Quantum Key Exchange algorithm standardized by NIST.
All these properties make ML-DSA well-suited for blockchain applications.

In the context of the Ethereum Virtual Machine, a precompile for Keccak256 hash function is already available, making ML-DSA verification much faster when instantiated with an extendable output function derived from Keccak than with SHAKE256, as specified in NIST submission. This EIP specifies two version of ML-DSA enabling two important features: one version being fully compliant with the NIST specification, the other deviating from the standard in order to reduce the gas cost.

<!-- This EIP adds precompiles that enable EVM chains and rollups to adopt PQ resistant signatures -->

## 3. Specification

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "NOT RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in RFC 2119 and RFC 8174.

While ML-DSA can be instantiated for three security levels: NIST level II, III and IV, this EIP only covers NIST level II, corresponding to 128 bits of security.

For the two variants of ML-DSA of this EIP, the following parameters are fixed:
- Polynomial degree: `n = 256`,
- Field modulus: `q = 8380417`,
- Matrix dimensions: `k=4`, `l=4`,
- Bounds of rejection: `γ_1 = 2¹⁷`, `γ_2 = (q-1)/88`,
- Additional parameters: `η = 2`, `τ = 39`, `d = 13`.

These parameters strictly follows NIST standard ML-DSA. More precisely, `q`, `n`, `k`, `l` and `η` are chosen in order to ensure a hard MLWE related problem, and the remaining parameters are chosen for the hardness of MSIS as well as for the efficiency of the scheme.

In terms of storage, ML-DSA public key can be derived by the verifier, making the overall public key of 1312 bytes. However, this increases the verifier cost, making the on-chain verification too expensive from a practical point of view. In this EIP, the verification algorithm takes the public key in raw format, meaning that the storage for the public key is:
- The full matrix `A_hat` of 16 384 bytes,
- `tr` is stored in order to save one hash, with 32 bytes,
- `t1` is stored in the NTT domain in order to save one NTT, with 4096 bytes.

The overall storage for the **public key** is **20512 bytes**. The signature follows the same format as specified in NIST standard: 32 bytes for `c_tilde`, 2304 bytes for the coefficients of `z`, and 84 bytes for `h`. In total, a **signature** requires **2420 bytes**.

### 3.0. Sub-algorithms of ML-DSA

#### Number Theoretic Transform
Polynomial arithmetic is computed efficiency using Number Theoretic Transform (NTT). Efficient polynomial multiplication can be implemented following EIP 7885 (draft). NTT inverse cost is roughly the same as an NTT: $n\log(n)$ additions and $n/2 \log(n)$ multiplications over the field $\mathbb F_q$, where $q=8380417$ and $n=256$.

#### EXtendable Output Function
The verification algorithm requires an eXtendable Output Function (XOF) made from a hash function.
This EIP provides two instantiations of a XOF:
- SHAKE256 is the XOF provided in NIST submission, a sponge construction derived from SHA256. Extracting bytes using SHAKE256 calls the `Keccak_f` permutation:
```python
def SHAKE256_init():
    create an empty sponge state

def SHAKE256_inject(data):
    absorb into Keccak sponge state

def SHAKE256_flip():
    pad input and finalize sponge
    (no fixed-length digest yet)

def SHAKE256_extract(state, length):
    output = []
    while output.size < length:
        block = Keccak_f(state)
        output.append(state_part)
    return first 'length' bytes of output
```
While this construction is standardized, it is expensive when computed in the Ethereum Virtual Machine because `Keccak_f` has no EVM opcode.
- Keccak-PRNG is a XOF that is build from a counter-mode PRNG based on Keccak256. Generating new chunks of bytes requires an incrementing counter.
```python
def KeccakPRNG_init():
    create an empty buffer

def KeccakPRNG_inject(data):
    buffer.append(data)

def KeccakPRNG_flip():
    state = Keccak256(buffer) 
    counter = 0

def KeccakPRNG_extract(state, length):
    output = []
    counter = 0
    while output.size < length:
        block = Keccak256(state || counter)
        output.append(block)
        counter = counter + 1
    return first 'length' bytes of output
```
Precompile of `Keccak256` are available in the Ethereum Virtual Machine, making this XOF very efficient in the EVM.

#### Hints in ML-DSA
ML-DSA requires some hint computation. More precisely, 
```python
def Decompose(r, α):
    """
    Decomposes r modulo q into high and low parts using α.
    Returns (r1, r0) such that r = r1 * α + r0 (mod q)
    """
    r0 = r % α 
    if r - r0 == q - 1:
        r1 = 0
        r0 = r0 - 1
    else:
        r1 = (r - r0) // α
    return r1, r0

def UseHint(h, r, α):
    """
    Computes r1 using a hint bit h and decomposition.
    """
    m = (q - 1) // α
    r1, r0 = Decompose(r, α, q)
    
    if h == 1 and r0 > 0:
        return (r1 + 1) % m
    if h == 1 and r0 ≤ 0:
        return (r1 - 1) % m
    return r1
```
The hint in ML-DSA is a polynomial with coefficients in {0,1}. Another function `sum_hint` is required. It counts the number of non-zero values of the hint.

#### Sample In Ball Challenge
In ML-DSA, a challenge is computed using a XOF.
This algorithm `sample_in_ball` outputs a polynomial with τ small coefficients (in {-1,1}).
The values of the coefficients as well as the position in the coefficients list is obtained using the XOF:

```python
def sample_in_ball(seed, tau, xof_impl=XOF):
    """
    Sample a 256-element array with τ coefficients equal to ±1
    and (256 − τ) coefficients equal to 0.
    """

    Initialize the XOF, inject the seed, and flip.
    
    coeffs = [0 for i in range(256)]
    
    for i in range(256-τ, 256):
        Extract a byte j ≤ i (from the XOF)
        coeffs[i] = coeffs[j]
        coeffs[j] = +1 or -1 (from the XOF)
    return coeffs
```

### 3.1. ML-DSA verification algorithm
```python
def VERIFY_MLDSA(public_key, message, signature) -> bool:
    A_hat, tr, t_1 = pk
    c_tilde, z, h = sig

    if sum_hint(h) > ω:
        return False

    if check_norm_bound(z, γ_1 - β):
        return False

    μ = shake_256(tr+m).extract(64)
    c = sample_in_ball_shake_256(c_tilde, τ)
    # Convert to NTT for computation
    c,z = (c,z).to_ntt()

    Az_minus_ct1 = (A_hat * z - c * t1).from_ntt()

    w_prime = h.use_hint(Az_minus_ct1, 2*γ_2)

    return c_tilde == shake_256(μ + w_prime).extract(32)
```


### 3.2. ML-DSA-ETH verification algorithm
```python
def VERIFY_MLDSA_ETH(public_key, message, signature) -> bool:
    A_hat, tr, t_1 = pk
    c_tilde, z, h = sig

    if sum_hint(h) > ω:
        return False

    if check_norm_bound(z, γ_1 - β):
        return False

    μ = keccak_prng(tr+m).extract(64)
    c = sample_in_ball_keccak_prng(c_tilde, τ)
    # Convert to NTT for computation
    c,z = (c,z).to_ntt()

    Az_minus_ct1 = (A_hat * z - c * t1).from_ntt()

    w_prime = h.use_hint(Az_minus_ct1, 2*γ_2)

    return c_tilde == keccak_prng(μ + w_prime).extract(32)
```

### 3.3. Required checks in ML-DSA(-ETH) verification
```
 if len(ctx) > 255:
    raise ValueError(
        f"ctx bytes must have length at most 255, ctx has length {len(ctx)=}"
    )

# Format the message using the context
m_prime = bytes([0]) + bytes([len(ctx)]) + ctx + m
```

## 4. Precompiled contract specification

### 4.1. ML-DSA precompiled contract 
The precompiled contract VERIFY_MLDSA is proposed with the following input and outputs, which are big-endian values:

- **Input data**
    - 32 bytes for the message
    - 2420 bytes for ML-DSA signature
    - 20512 bytes for the ML-DSA expanded public key
- **Output data**:
   - If the algorithm process succeeds, it returns 1 in 32 bytes format.
    - If the core algorithm process fails, it does not return any output data <span style="text-color:red;">?????</span>.

#### Error Cases
- Invalid input length (not compliant to described input)
- Invalid field element encoding (≥ q)
- Invalid norm  bound 
- Invalid hint check
- Signature verification failure


### 4.2. ML-DSA-ETH precompiled contract 
The precompiled contract VERIFY_MLDSA_ETH is proposed with the following input and outputs, which are big-endian values:

- **Input data**
    - 32 bytes for the message
    - 2420 bytes for ML-DSA-ETH signature
    - 20512 bytes for the ML-DSA-ETH expanded public key
- **Output data**:
   - If the algorithm process succeeds, it returns 1 in 32 bytes format.
    - If the core algorithm process fails, it does not return any output data <span style="text-color:red;">?????</span>.

#### Error Cases
- Invalid input length (not compliant to described input)
- Invalid field element encoding (≥ q)
- Invalid norm  bound 
- Invalid hint check
- Signature verification failure

### 4.3. Precompiled contract gas usage

The cost of the **VERIFY_MLDSA** and **VERIFY_MLDSA_ETH** functions is dominated by the call to two NTTs and one iNTT, and the required hash calls for sampling in the ball (and for μ and the final check).
It represents in average 5 calls to the hash function. Taking linearly the cost of keccak256, and avoiding the context switching it represents 3000 gas.


## 5. Rationale

The ML-DSA scheme was selected as a NIST-standardized post-quantum cryptographic algorithm due to its strong security guarantees and efficiency.

ML-DSA is a signature algorithm build from lattice-based cryptography. Specifically, its hardness relies on the Short Integer Solution (SIS) problem and the Learning With Errors (LWE) problem, which is believed to be hard for both classical and quantum computers.

ML-DSA (based on CRYSTALS-Dilithium) offers a strong balance between security, efficiency, and practicality compared to classical ECC and other post-quantum schemes. Its signature and key sizes remain reasonably small, making it practical for real-world deployments such as Ethereum blockchain. As the main winner of the NIST PQC standardization process, it benefits from a broad community consensus on its security, which is not yet the case for many alternatives. Moreover, its lattice-based structure allows flexible parameter tuning, making it easier to adapt for specialized contexts like zero-knowledge proofs. Schemes like Falcon (FN-DSA, another signature scheme built on top of lattice-based assumptions) have a more rigid parameterization, making zero-knowledge circuits larger, and thus proof computation more expensive.

Given the increasing urgency of transitioning to quantum-resistant cryptographic primitives or even having them ready in the event that research into quantum computers speeds up.


## 6. Backwards Compatibility

In compliance with EIP-7932,  the necessary parameters and structure for its integration are provided. `ALG_TYPE = 0xD1`  uniquely identifies ML-DSA transactions, set MAX_SIZE = 2420 bytes to accommodate the fixed-length signature_info container, and recommend a `GAS_PENALTY` of approximately `3000` gas subject to benchmarking. The verification function follows the EIP-7932 model, parsing the signature_info, recovering the corresponding Dilithium public key, verifying the signature against the transaction payload hash, and deriving the signer’s Ethereum address as the last 20 bytes of keccak256(pubkey). This definition ensures that ML-DSA can be cleanly adopted within the `AlgorithmicTransaction` container specified by EIP-7932.

```python
signature_info = Container[
    # 0xD1 for ML-DSA (NIST-compliant version),
    # 0xD2 for ML-DSA-ETH (EVM-friendly version),
    version: uint8
    # ML-DSA signature
    signature: ByteVector[2420]
    # keccak256(pubkey)[12:]
    pubkey_hash: ByteVector[20]
]
```

In the format of EIP-7932:
- For the NIST-compliant version:
    ```python
    verify(signature_info: bytes, payload_hash: Hash32) -> ExecutionAddress:
        assert len(signature_info) == 699
        version      = signature_info[0]
        signature    = signature_info[1:2421]
        pubkey_hash  = signature_info[2421:2441]
        assert version == 0xD1
        pubkey = lookup_pubkey(pubkey_hash)
        assert VERIFY_MLDSA(pubkey, payload_hash, signature)
        return ExecutionAddress(keccak256(pubkey)[12:])
    ```
- For the EVM-friendly version:
    ```python
    verify(signature_info: bytes, payload_hash: Hash32) -> ExecutionAddress:
        assert len(signature_info) == 699
        version      = signature_info[0]
        signature    = signature_info[1:2421]
        pubkey_hash  = signature_info[2421:2441]
        assert version == 0xD2
        pubkey = lookup_pubkey(pubkey_hash)
        assert VERIFY_MLDSA_ETH(pubkey, payload_hash, signature)
        return ExecutionAddress(keccak256(pubkey)[12:])
    ```

## 7. Test Cases

A set of test vectors for verifying implementations is located in a separate file (to be provided for each opcode). For the NIST compliant version, KATS are reproduced.


## 8. Reference Implementation

An implementation is provided in `assets` (TODO). For the NIST-compliant version, KAT vectors of the NIST submission are valid. 

## 9. Security Considerations

The derivation path to obtain the private key from the seed is (tbd).

## 10. Copyright
Copyright and related rights waived via [CC0](../LICENSE.md).