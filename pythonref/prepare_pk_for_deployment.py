from eth_abi import encode
from typing import List
import sys
from dilithium_py.dilithium.default_parameters import Dilithium2 as D
from dilithium_py.shake.shake_wrapper import shake128, shake256
from dilithium_py.keccak_prng.keccak_prng_wrapper import Keccak256PRNG


def prepare_public_key_for_deployment(
    A_hat_compact: List[List[List[int]]],
    tr_hex: str,
    t1_compact: List[List[int]]
) -> bytes:
    """
    Prepare MLDSA-44 public key components for Solidity deployment.
    
    Args:
        A_hat_compact: 4x4x32 matrix of integers
        tr_hex: 64-byte hash as hex string
        t1_compact: 4x32 matrix of integers
    
    Returns:
        bytes: ABI-encoded public key data ready for Solidity
    
    Raises:
        ValueError: If tr_hex format is invalid or not 64 bytes
    """
    
    # Convert hex to bytes
    tr_bytes = bytes.fromhex(tr_hex)
    
    if len(tr_bytes) != 64:
        raise ValueError(f'tr must be exactly 64 bytes, got {len(tr_bytes)} bytes')
    
    # Convert all integer values to ensure proper encoding
    # Note: Python handles big integers natively, but we ensure they're ints
    A_hat_stringified = [
        [
            [int(val) for val in col]
            for col in row
        ]
        for row in A_hat_compact
    ]
    
    t1_stringified = [
        [int(val) for val in row]
        for row in t1_compact
    ]
    
    # Encode each component as bytes using eth_abi
    # Note: eth_abi expects type strings without nested array syntax for dynamic arrays
    a_hat_encoded = encode(['uint256[][][]'], [A_hat_stringified])
    t1_encoded = encode(['uint256[][]'], [t1_stringified])
    
    # Combine all three into single bytes parameter
    # Pass tr_bytes directly (not tr_hex) to avoid double encoding
    public_key_data = encode(
        ['bytes', 'bytes', 'bytes'],
        [a_hat_encoded, tr_bytes, t1_encoded]
    )
    
    return public_key_data

def flat_public_key(
    A_hat_compact: List[List[List[int]]],
    tr_bytes: bytes,
    t1_compact: List[List[int]]
) -> bytes:
    """
    The expanded ML-DSA-44 public key in the calldata layout of ZKNOX_dilithium
    (DECISIONS.md ADR-010, the layout of the ML-DSA-65 key): 20 polynomials,
    each a 32-byte length word of 32 then its 32 words (A[i][j] at (4i + j) *
    1056, t1[i] at (16 + i) * 1056), then tr as a length word of 64 and its 64
    bytes. 21,216 bytes. This is what setKey takes and what every verification
    carries; encodePubKeyFlat (ZKNOX_dilithium_core_packed.sol) builds the same
    bytes from the three arrays.
    """
    if len(tr_bytes) != 64:
        raise ValueError(f'tr must be exactly 64 bytes, got {len(tr_bytes)} bytes')
    polys = [A_hat_compact[i][j] for i in range(4) for j in range(4)] + list(t1_compact)
    if len(polys) != 20 or any(len(p) != 32 for p in polys):
        raise ValueError('expected 16 + 4 polynomials of 32 words')
    out = bytearray()
    for poly in polys:
        out += (32).to_bytes(32, 'big')
        for w in poly:
            out += int(w).to_bytes(32, 'big')
    out += (64).to_bytes(32, 'big') + tr_bytes
    assert len(out) == 20 * 1056 + 96
    return bytes(out)


if sys.argv[1] == 'ETH':
    xof = Keccak256PRNG
    xof2 = Keccak256PRNG
elif sys.argv[1] == 'NIST':
    xof = shake256
    xof2 = shake128

seed = bytes.fromhex(sys.argv[2])

pk, sk = D.key_derive(seed, _xof=xof, _xof2=xof2)

ρ, t1 = D._unpack_pk(pk)
A_hat = D._expand_matrix_from_seed(ρ, _xof=xof2)
tr = D._h(pk, 64, _xof=xof)

t1 = t1.scale(1 << D.d).to_ntt()

A_hat_compact = A_hat.compact_256(32)
t1_compact_raw = t1.compact_256(32)
t1_compact = [row[0] for row in t1_compact_raw]

# output format: `flat` (the calldata key of ZKNOX_dilithium, default in NIST
# mode) or `abi` (the ABI-encoded SSTORE2 blob of ZKNOX_ethdilithium, default
# in ETH mode)
fmt = sys.argv[3] if len(sys.argv) > 3 else ('abi' if sys.argv[1] == 'ETH' else 'flat')
if fmt == 'flat':
    print(flat_public_key(A_hat_compact, tr, t1_compact).hex())
elif fmt == 'abi':
    print(prepare_public_key_for_deployment(A_hat_compact, tr.hex(), t1_compact).hex())
else:
    raise SystemExit(f'unknown format {fmt!r}: flat or abi')

