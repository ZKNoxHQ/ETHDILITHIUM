from .modules_generic import Module, Matrix
from ..polynomials.polynomials import PolynomialRingDilithium


class ModuleDilithium(Module):
    def __init__(self, q=8380417, n=256):
        self.ring = PolynomialRingDilithium(q, n)
        self.matrix = MatrixDilithium

    def __bit_unpack(self, input_bytes, m, n, alg, packed_len, *args):
        poly_bytes = [
            input_bytes[i: i + packed_len]
            for i in range(0, len(input_bytes), packed_len)
        ]
        matrix = [
            [alg(poly_bytes[n * i + j], *args) for j in range(n)] for i in range(m)
        ]
        return self(matrix)

    def bit_unpack_t0(self, input_bytes, m, n, d=13):
        packed_len = 32 * d
        algorithm = self.ring.bit_unpack_t0
        return self.__bit_unpack(input_bytes, m, n, algorithm, packed_len, d)

    def bit_unpack_t1(self, input_bytes, m, n, d=13):
        # Per-poly bytes = 32 * bit_length((q-1) >> d).
        n_bits = ((self.ring.q - 1) >> d).bit_length()
        packed_len = 32 * n_bits
        algorithm = self.ring.bit_unpack_t1
        return self.__bit_unpack(input_bytes, m, n, algorithm, packed_len, d)

    def bit_unpack_s(self, input_bytes, m, n, eta):
        # Level 2 and 5 parameter set
        if eta == 2:
            packed_len = 96
        # Level 3 parameter set
        elif eta == 4:
            packed_len = 128
        else:
            raise ValueError("Expected eta to be either 2 or 4")
        algorithm = self.ring.bit_unpack_s
        return self.__bit_unpack(input_bytes, m, n, algorithm, packed_len, eta)

    def bit_unpack_w(self, input_bytes, m, n, gamma_2):
        # Level 2 parameter set
        if gamma_2 == 95232:
            packed_len = 192
        # Level 3 and 5 parameter set
        elif gamma_2 == 261888:
            packed_len = 128
        else:
            raise ValueError(
                "Expected gamma_2 to be either (q-1)/88 or (q-1)/32")
        algorithm = self.ring.bit_unpack_w
        return self.__bit_unpack(input_bytes, m, n, algorithm, packed_len, gamma_2)

    def bit_unpack_z(self, input_bytes, m, n, gamma_1):
        # gamma_1 must be a power of 2; per-poly bytes = 32 * gamma_1.bit_length().
        if gamma_1 <= 0 or (gamma_1 & (gamma_1 - 1)) != 0:
            raise ValueError(f"Expected gamma_1 to be a power of 2, got {gamma_1=}")
        packed_len = 32 * gamma_1.bit_length()
        algorithm = self.ring.bit_unpack_z
        return self.__bit_unpack(input_bytes, m, n, algorithm, packed_len, gamma_1)

    def bit_unpack_32(self, input_bytes, m, n, is_ntt=False):
        """
        Unpack a Module element by unpacking all field elements by 32 bits.
        """
        packed_len = 1024
        def algorithm(x): return self.ring.bit_unpack_32(x, is_ntt=True)
        return self.__bit_unpack(input_bytes, m, n, algorithm, packed_len)


class MatrixDilithium(Matrix):
    def __init__(self, parent, matrix_data, transpose=False):
        super().__init__(parent, matrix_data, transpose=transpose)

    def check_norm_bound(self, bound):
        for row in self._data:
            if any(p.check_norm_bound(bound) for p in row):
                return True
        return False

    def power_2_round(self, d):
        """
        Applies `power_2_round` on every element in the
        Matrix to create two matrices.
        """
        m, n = self.dim()

        m1_elements = [[0 for _ in range(n)] for _ in range(m)]
        m0_elements = [[0 for _ in range(n)] for _ in range(m)]

        for i in range(m):
            for j in range(n):
                m1_ele, m0_ele = self[i, j].power_2_round(d)
                m1_elements[i][j] = m1_ele
                m0_elements[i][j] = m0_ele

        return self.parent(m1_elements, transpose=self._transpose), self.parent(
            m0_elements, transpose=self._transpose
        )

    def decompose(self, alpha):
        """
        Applies `power_2_round` on every element in the
        Matrix to create two matrices.
        """
        m, n = self.dim()

        m1_elements = [[0 for _ in range(n)] for _ in range(m)]
        m0_elements = [[0 for _ in range(n)] for _ in range(m)]

        for i in range(m):
            for j in range(n):
                m1_ele, m0_ele = self[i, j].decompose(alpha)
                m1_elements[i][j] = m1_ele
                m0_elements[i][j] = m0_ele

        return self.parent(m1_elements, transpose=self._transpose), self.parent(
            m0_elements, transpose=self._transpose
        )

    def __bit_pack(self, algorithm, *args):
        return b"".join(algorithm(poly, *args) for row in self._data for poly in row)

    def bit_pack_t1(self, d=13):
        algorithm = self.parent.ring.element.bit_pack_t1
        return self.__bit_pack(algorithm, d)

    def bit_pack_t0(self, d=13):
        algorithm = self.parent.ring.element.bit_pack_t0
        return self.__bit_pack(algorithm, d)

    def bit_pack_s(self, eta):
        algorithm = self.parent.ring.element.bit_pack_s
        return self.__bit_pack(algorithm, eta)

    def bit_pack_w(self, gamma_2):
        algorithm = self.parent.ring.element.bit_pack_w
        return self.__bit_pack(algorithm, gamma_2)

    def bit_pack_z(self, gamma_1):
        algorithm = self.parent.ring.element.bit_pack_z
        return self.__bit_pack(algorithm, gamma_1)

    def bit_pack_32(self, is_ntt=False):
        """
        Pack a Module element by packing all its field element by 32 bits
        """
        if is_ntt:
            algorithm = self.parent.ring.element_ntt.bit_pack_32
        else:
            algorithm = self.parent.ring.element.bit_pack_32
        return self.__bit_pack(algorithm)

    def to_ntt(self):
        """
        Convert every element of the matrix into NTT form
        """
        data = [[x.to_ntt() for x in row] for row in self._data]
        return self.parent(data, transpose=self._transpose)

    def from_ntt(self):
        """
        Convert every element of the matrix from NTT form
        """
        data = [[x.from_ntt() for x in row] for row in self._data]
        return self.parent(data, transpose=self._transpose)

    def high_bits(self, alpha, is_ntt=False):
        matrix = [
            [ele.high_bits(alpha, is_ntt=is_ntt) for ele in row] for row in self._data
        ]
        return self.parent(matrix)

    def low_bits(self, alpha, is_ntt=False):
        matrix = [
            [ele.low_bits(alpha, is_ntt=is_ntt) for ele in row] for row in self._data
        ]
        return self.parent(matrix)

    def make_hint(self, other, alpha):
        """
        Figure 3 (Supporting algorithms for Dilithium)
        https://pq-crystals.org/dilithium/data/dilithium-specification-round3-20210208.pdf
        """
        matrix = [
            [p.make_hint(q, alpha) for p, q in zip(r1, r2)]
            for r1, r2 in zip(self._data, other._data)
        ]
        return self.parent(matrix)

    def make_hint_optimised(self, other, alpha):
        """
        Figure 3 (Supporting algorithms for Dilithium)
        https://pq-crystals.org/dilithium/data/dilithium-specification-round3-20210208.pdf
        """
        matrix = [
            [p.make_hint_optimised(q, alpha) for p, q in zip(r1, r2)]
            for r1, r2 in zip(self._data, other._data)
        ]
        return self.parent(matrix)

    def use_hint(self, other, alpha):
        """
        Figure 3 (Supporting algorithms for Dilithium)
        https://pq-crystals.org/dilithium/data/dilithium-specification-round3-20210208.pdf
        """
        matrix = [
            [p.use_hint(q, alpha) for p, q in zip(r1, r2)]
            for r1, r2 in zip(self._data, other._data)
        ]
        return self.parent(matrix)

    def sum_hint(self):
        """
        Helper function to count the number of coeffs == 1
        in all the polynomials of a matrix
        """
        return sum(c for row in self._data for p in row for c in p)
