# Poseidon sponge-based Sponge, mirroring the Keccak256PRNG interface.
# Supports three fields: BN254, BabyBear, and KoalaBear.
# All use hardcoded constants (no galois/numpy dependency at runtime).
#
# Uses the standard sponge construction: absorb input, then squeeze output
# by repeatedly reading the rate portion and permuting.
#
# BN254:     t=3  (rate=2, capacity=1), 32 bytes per field element
# BabyBear:  t=17 (rate=8, capacity=9), 4 bytes per field element
# KoalaBear: t=17 (rate=8, capacity=9), 4 bytes per field element

from .poseidon_constants import (
    P as P_BN254, MDS_MATRIX as MDS_BN254, ROUND_CONSTANTS as RC_BN254,
    HALF_FULL_ROUNDS as HFR_BN254, PARTIAL_ROUNDS as PR_BN254, ALPHA as ALPHA_BN254,
)
from .poseidon_constants_small import (
    P_BB, MDS_MATRIX_BB, ROUND_CONSTANTS_BB,
    HALF_FULL_ROUNDS_BB, PARTIAL_ROUNDS_BB, ALPHA_BB, T_BB, RATE_BB,
    P_KB, MDS_MATRIX_KB, ROUND_CONSTANTS_KB,
    HALF_FULL_ROUNDS_KB, PARTIAL_ROUNDS_KB, ALPHA_KB, T_KB, RATE_KB,
)

MAX_BUFFER_SIZE = 4096


# ---------------------------------------------------------------------------
# Generic Poseidon permutation
# ---------------------------------------------------------------------------

def _poseidon_permutation(state, p, alpha, t, half_full_rounds, partial_rounds, mds, rc):
    rc_counter = 0

    # First half full rounds
    for _ in range(half_full_rounds):
        for i in range(t):
            state[i] = (state[i] + rc[rc_counter]) % p
            rc_counter += 1
            state[i] = pow(state[i], alpha, p)
        new_state = [0] * t
        for i in range(t):
            for j in range(t):
                new_state[i] = (new_state[i] + mds[i][j] * state[j]) % p
        state = new_state

    # Partial rounds
    for _ in range(partial_rounds):
        for i in range(t):
            state[i] = (state[i] + rc[rc_counter]) % p
            rc_counter += 1
        state[0] = pow(state[0], alpha, p)
        new_state = [0] * t
        for i in range(t):
            for j in range(t):
                new_state[i] = (new_state[i] + mds[i][j] * state[j]) % p
        state = new_state

    # Second half full rounds
    for _ in range(half_full_rounds):
        for i in range(t):
            state[i] = (state[i] + rc[rc_counter]) % p
            rc_counter += 1
            state[i] = pow(state[i], alpha, p)
        new_state = [0] * t
        for i in range(t):
            for j in range(t):
                new_state[i] = (new_state[i] + mds[i][j] * state[j]) % p
        state = new_state

    return state


# ---------------------------------------------------------------------------
# Generic Poseidon Sponge
# ---------------------------------------------------------------------------

class _PoseidonSpongeBase:
    """Base class for Poseidon sponge Sponge.

    Uses the standard sponge construction:
      - absorb: XOR input field elements into the rate portion, permute
      - squeeze: read rate elements, permute, repeat

    Subclasses set: _P, _ALPHA, _T, _RATE, _HFR, _PR, _MDS, _RC,
                    _FE_BYTES (bytes per input field element encoding),
                    _FE_OUT_BYTES (bytes per output field element).
    """

    def __init__(self, a=None, b=None):
        self.buffer = bytearray(MAX_BUFFER_SIZE)
        self.buffer_len = 0
        self.finalized = False

        # Full sponge state (t field elements)
        self._sponge = [0] * self._T

        # Output buffer for partial squeeze reads
        self._out_buf = b''
        self._out_pos = 0

        if b is None:
            if a is not None:
                self.inject(a)

    @classmethod
    def new(cls):
        return cls()

    def _permute(self, state):
        return _poseidon_permutation(
            state, self._P, self._ALPHA, self._T,
            self._HFR, self._PR, self._MDS, self._RC)

    def _bytes_to_field_elements(self, data: bytes) -> list:
        elements = []
        fe_bytes = self._FE_BYTES
        for i in range(0, len(data), fe_bytes):
            chunk = data[i:i + fe_bytes]
            if len(chunk) < fe_bytes:
                chunk = chunk + b'\x00' * (fe_bytes - len(chunk))
            val = int.from_bytes(chunk, 'big')
            elements.append(val)
        return elements

    def _absorb(self, elements):
        """Absorb field elements into the sponge state."""
        rate = self._RATE
        # Pad to multiple of rate
        if len(elements) % rate != 0:
            elements = elements + [0] * (rate - len(elements) % rate)

        for i in range(0, len(elements), rate):
            for j in range(rate):
                self._sponge[j] = (self._sponge[j] + elements[i + j]) % self._P
            self._sponge = self._permute(self._sponge)

    def _squeeze_block(self) -> bytes:
        """Read rate elements from state, then permute for the next squeeze."""
        block = b''
        for j in range(self._RATE):
            block += self._sponge[j].to_bytes(self._FE_OUT_BYTES, 'big')
        self._sponge = self._permute(self._sponge)
        return block

    def inject(self, data: bytes):
        if self.finalized:
            raise ValueError("Cannot inject after finalizing")
        if len(data) + self.buffer_len > MAX_BUFFER_SIZE:
            raise ValueError("Buffer overflow")
        self.buffer[self.buffer_len:self.buffer_len + len(data)] = data
        self.buffer_len += len(data)

    def flip(self):
        if self.finalized:
            raise ValueError("Already finalized")

        elements = self._bytes_to_field_elements(
            bytes(self.buffer[:self.buffer_len]))
        self._absorb(elements)
        self.finalized = True
        self._out_buf = b''
        self._out_pos = 0

    def extract(self, length: int) -> bytes:
        if not self.finalized:
            raise ValueError("Sponge not finalized")

        output = bytearray()
        offset = 0

        # Use remaining bytes from previous squeeze
        if self._out_pos < len(self._out_buf):
            available = len(self._out_buf) - self._out_pos
            to_copy = min(length, available)
            output.extend(self._out_buf[self._out_pos:self._out_pos + to_copy])
            self._out_pos += to_copy
            offset += to_copy

        while offset < length:
            self._out_buf = self._squeeze_block()
            self._out_pos = 0

            remaining = length - offset
            to_copy = min(remaining, len(self._out_buf))
            output.extend(self._out_buf[:to_copy])
            self._out_pos = to_copy
            offset += to_copy

        return bytes(output)

    # Compatibility with SHAKE256 / Keccak256PRNG interface
    def update(self, data: bytes):
        self.inject(data)

    def read(self, length: int) -> bytes:
        return self.extract(length)

    def absorb(self, data: bytes):
        self.inject(data)

    def __call__(self, input_bytes):
        self.absorb(input_bytes)
        return self


# ---------------------------------------------------------------------------
# BN254 Poseidon Sponge (t=3, rate=2, 32 bytes/element)
# ---------------------------------------------------------------------------

class PoseidonSponge(_PoseidonSpongeBase):
    _P = P_BN254
    _ALPHA = ALPHA_BN254
    _T = 3
    _RATE = 2
    _HFR = HFR_BN254
    _PR = PR_BN254
    _MDS = MDS_BN254
    _RC = RC_BN254
    _FE_BYTES = 31       # input: 31 bytes to stay below field prime
    _FE_OUT_BYTES = 32   # output: full 32-byte field element


# ---------------------------------------------------------------------------
# BabyBear Poseidon Sponge (t=17, rate=8, 4 bytes/element)
# ---------------------------------------------------------------------------

class PoseidonBabyBearSponge(_PoseidonSpongeBase):
    _P = P_BB
    _ALPHA = ALPHA_BB
    _T = T_BB
    _RATE = RATE_BB
    _HFR = HALF_FULL_ROUNDS_BB
    _PR = PARTIAL_ROUNDS_BB
    _MDS = MDS_MATRIX_BB
    _RC = ROUND_CONSTANTS_BB
    _FE_BYTES = 4
    _FE_OUT_BYTES = 4


# ---------------------------------------------------------------------------
# KoalaBear Poseidon Sponge (t=17, rate=8, 4 bytes/element)
# ---------------------------------------------------------------------------

class PoseidonKoalaBearSponge(_PoseidonSpongeBase):
    _P = P_KB
    _ALPHA = ALPHA_KB
    _T = T_KB
    _RATE = RATE_KB
    _HFR = HALF_FULL_ROUNDS_KB
    _PR = PARTIAL_ROUNDS_KB
    _MDS = MDS_MATRIX_KB
    _RC = ROUND_CONSTANTS_KB
    _FE_BYTES = 4
    _FE_OUT_BYTES = 4
