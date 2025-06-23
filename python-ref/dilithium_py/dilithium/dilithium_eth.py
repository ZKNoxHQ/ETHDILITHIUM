from dilithium_py.dilithium.dilithium import Dilithium

from ..keccak_prng.keccak_prng_wrapper import Keccak256PRNG
from ..shake.shake_wrapper import shake128, shake256
from polyntt.field.prime_field import PrimeField


class ETHDilithium(Dilithium):
    def __init__(self, parameter_set, F=PrimeField(8380417), n=256):
        super().__init__(parameter_set, F, n)

    @staticmethod
    def _pack_pk(A_hat, tr, t1_new):
        return A_hat.bit_pack_32(is_ntt=True) + tr + t1_new.bit_pack_32(is_ntt=True)

    def _pack_sig(self, c_tilde, z, h, c_ntt):
        gamma_1_minus_z = self.M(
            [[(self.gamma_1 - elt) for elt in row] for row in z._data])
        return c_tilde + gamma_1_minus_z.bit_pack_32() + self._pack_h(h) + c_ntt.bit_pack_32()

    def _unpack_pk(self, pk_bytes):
        # A_hat is a matrix 4x4 of elements of 256 coefficients of 32 bits
        # 4 * 4 * 256 * 32/8  = 16384 bytes
        # 4 * 5 * 256 * 32/8  = 20480 bytes if we consider (k,l) = (4,5)?

        a_hat_bytes = pk_bytes[:self.k * self.l * 256 * 4]
        a_hat = self.M.bit_unpack_32(a_hat_bytes, self.k, self.l, is_ntt=True)
        # tr is 32 bytes
        tr = pk_bytes[self.k * self.l * 256 *
                      4: self.k * self.l * 256 * 4 + 32]
        # t1_new is 4 * 256 * 32/8 = 4096B
        t1_new_bytes = pk_bytes[self.k * self.l * 256 * 4 + 32:]
        t1_new = self.M.bit_unpack_32(t1_new_bytes, self.k, 1, is_ntt=True)
        return a_hat, tr, t1_new

    def _unpack_sig(self, sig_bytes):
        # c_tilde is 32 bytes
        c_tilde = sig_bytes[:32]
        # z is l Fq²⁵⁶ elements and q is 4 bytes long
        z_bytes = sig_bytes[32: 32 + self.l * 256*4]
        # h is k Fq²⁵⁶ elements and q is 4 bytes long
        h_bytes = sig_bytes[32 + self.l * 256*4: -256*4]
        c_ntt_bytes = sig_bytes[-256*4:]

        gamma_minus_z = self.M.bit_unpack_32(z_bytes, self.l, 1)
        z = self.M(
            [[(self.gamma_1 - elt) for elt in row] for row in gamma_minus_z._data])
        h = self._unpack_h(h_bytes)
        c_ntt = self.R.bit_unpack_32(c_ntt_bytes, is_ntt=True)
        return c_tilde, z, h, c_ntt

    def _expand_matrix_from_seed(self, rho, _xof=shake128):
        """
        Helper function which generates a element of size
        k x l from a seed `rho`.
        """
        if self.M.ring.q == 2**31-1:
            A_data = [[[0, 0] for _ in range(self.l)] for _ in range(self.k)]
            for i in range(self.k):
                for j in range(self.l):
                    A_data[i][j][0] = self.R.rejection_sample_ntt_poly_32bit(
                        rho, i, j, _xof=_xof)
                    A_data[i][j][1] = self.R.rejection_sample_ntt_poly_32bit(
                        rho, i, j, _xof=_xof)
            return self.M(A_data)
        else:
            A_data = [[0 for _ in range(self.l)] for _ in range(self.k)]
            for i in range(self.k):
                for j in range(self.l):
                    A_data[i][j] = self.R.rejection_sample_ntt_poly_32bit(
                        rho, i, j, _xof=_xof)
            return self.M(A_data)

    def keygen(self, _xof=Keccak256PRNG, _xof2=Keccak256PRNG):
        """
        Generates a public-private keyair
        """
        # Random seed
        zeta = self.random_bytes(32)

        # Expand with an XOF (SHAKE256)
        seed_bytes = self._h(zeta, 128, _xof=_xof)

        # Split bytes into suitable chunks
        rho, rho_prime, K = seed_bytes[:32], seed_bytes[32:96], seed_bytes[96:]

        # Generate matrix A ∈ R^(kxl) in the NTT domain
        A_hat = self._expand_matrix_from_seed(rho, _xof=_xof2)

        # Generate the error vectors s1 ∈ R^l, s2 ∈ R^k
        s1, s2 = self._expand_vector_from_seed(rho_prime)
        s1_hat = s1.to_ntt()

        # Matrix
        print("A_hat", A_hat.dim())
        print("s1_hat", s1_hat.dim())
        t = (A_hat @ s1_hat).from_ntt() + s2

        t1, t0 = t.power_2_round(self.d)
        t1_new = t1.scale(1 << self.d).to_ntt()

        in_for_tr = rho + t1.bit_pack_32()
        tr = self._h(in_for_tr, 32, _xof=_xof)

        # Pack up the bytes
        pk = self._pack_pk(A_hat, tr, t1_new)

        sk = self._pack_sk(rho, K, tr, s1, s2, t0)
        return pk, sk

    def sign(self, sk_bytes, m, _xof=Keccak256PRNG, _xof2=Keccak256PRNG):
        """
        Generates a signature for a message m from a byte-encoded private key
        """
        # unpack the secret key
        rho, K, tr, s1, s2, t0 = self._unpack_sk(sk_bytes)

        # Generate matrix A ∈ R^(kxl) in the NTT domain
        A_hat = self._expand_matrix_from_seed(rho, _xof=_xof2)
        # Set seeds and nonce (kappa)
        mu = self._h(tr + m, 64, _xof=_xof)
        kappa = 0
        rho_prime = self._h(K + mu, 64, _xof=_xof)

        # Precompute NTT representation
        s1 = s1.to_ntt()
        s2 = s2.to_ntt()
        t0 = t0.to_ntt()

        alpha = self.gamma_2 << 1
        while True:
            y = self._expand_mask_vector(rho_prime, kappa)
            y_hat = y.to_ntt()

            # increment the nonce
            kappa += self.l
            w = (A_hat @ y_hat).from_ntt()

            # Extract out both the high and low bits
            w1, w0 = w.decompose(alpha)

            # Create challenge polynomial
            w1_bytes = w1.bit_pack_w(self.gamma_2)
            c_tilde = self._h(mu + w1_bytes, 32, _xof=_xof)
            c = self.R.sample_in_ball(c_tilde, self.tau, _xof=_xof)

            # Store c in NTT form
            c_ntt = c.to_ntt()

            z = y + (s1.scale(c_ntt)).from_ntt()
            if z.check_norm_bound(self.gamma_1 - self.beta):
                continue

            w0_minus_cs2 = w0 - s2.scale(c_ntt).from_ntt()
            if w0_minus_cs2.check_norm_bound(self.gamma_2 - self.beta):
                continue

            c_t0 = t0.scale(c_ntt).from_ntt()
            if c_t0.check_norm_bound(self.gamma_2):
                continue

            w0_minus_cs2_plus_ct0 = w0_minus_cs2 + c_t0
            h = w0_minus_cs2_plus_ct0.make_hint_optimised(w1, alpha)
            if h.sum_hint() > self.omega:
                continue

            return self._pack_sig(c_tilde, z, h, c_ntt)

    def verify(self, pk_bytes, m, sig_bytes, _xof=Keccak256PRNG):
        """
        Verifies a signature for a message m from a byte encoded public key and
        signature
        """
        A_hat, tr, t1_new = self._unpack_pk(pk_bytes)
        c_tilde, z, h, c_ntt = self._unpack_sig(sig_bytes)

        if h.sum_hint() > self.omega:
            return False

        if z.check_norm_bound(self.gamma_1 - self.beta):
            return False

        mu = self._h(tr + m, 64, _xof=_xof)
        z = z.to_ntt()

        Az_minus_ct1 = (A_hat @ z) - t1_new.scale(c_ntt)
        Az_minus_ct1 = Az_minus_ct1.from_ntt()

        w_prime = h.use_hint(Az_minus_ct1, 2 * self.gamma_2)
        w_prime_bytes = w_prime.bit_pack_w(self.gamma_2)

        return c_tilde == self._h(mu + w_prime_bytes, 32, _xof=_xof)
