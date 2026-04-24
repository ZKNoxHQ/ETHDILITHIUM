# Poseidon sponge over the KoalaBear field (LeanSpec Poseidon1 PARAMS_16),
# mirroring the Keccak256PRNG interface. Uses the standard sponge construction:
# absorb input, then squeeze output by reading the rate portion and permuting.
#
# KoalaBear: t=16 (rate=8, capacity=8), 4 bytes per field element.

from .poseidon_constants import (
    P, ALPHA, T, RATE, HALF_FULL_ROUNDS, PARTIAL_ROUNDS,
    MDS_MATRIX, ROUND_CONSTANTS,
)

MAX_BUFFER_SIZE = 4096


def _poseidon_permutation(state, p, alpha, t, half_full_rounds, partial_rounds, mds, rc):
    rc_counter = 0

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


class PoseidonKoalaBearSponge:
    """Poseidon1 sponge over KoalaBear (LeanSpec PARAMS_16).

    t=16, rate=8, capacity=8, 4 input bytes / 4 output bytes per field element.
    """

    _FE_BYTES = 4
    _FE_OUT_BYTES = 4

    def __init__(self, a=None, b=None):
        self.buffer = bytearray(MAX_BUFFER_SIZE)
        self.buffer_len = 0
        self.finalized = False

        self._sponge = [0] * T

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
            state, P, ALPHA, T,
            HALF_FULL_ROUNDS, PARTIAL_ROUNDS, MDS_MATRIX, ROUND_CONSTANTS)

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
        if len(elements) % RATE != 0:
            elements = elements + [0] * (RATE - len(elements) % RATE)

        for i in range(0, len(elements), RATE):
            for j in range(RATE):
                self._sponge[j] = (self._sponge[j] + elements[i + j]) % P
            self._sponge = self._permute(self._sponge)

    def _squeeze_block(self) -> bytes:
        block = b''
        for j in range(RATE):
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
