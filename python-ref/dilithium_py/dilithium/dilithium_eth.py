import os

from dilithium_py.dilithium.dilithium import Dilithium
from ..modules.modules import ModuleDilithium

from ..shake.shake_wrapper import shake128, shake256


class ETHDilithium(Dilithium):
    def __init__(self, parameter_set):
        super().__init__(parameter_set)

    @staticmethod
    def _pack_pk(A_hat, tr, t1_new):
        return A_hat.bit_pack_a_hat() + tr + t1_new.bit_pack_t1_new()

    def _pack_c_ntt(self, c_ntt):
        return c_ntt.bit_pack_c_ntt()

    def _pack_sig(self, c_tilde, z, h, c_ntt):
        return c_tilde + z.bit_pack_z_32(self.gamma_1) + self._pack_h(h) + self._pack_c_ntt(c_ntt)

    def _unpack_pk(self, pk_bytes):
        # A_hat is a matrix 4x4 of elements of 256 coefficients of 32 bits
        # 4 * 4 * 256 * 32/8  = 16384 bytes
        a_hat_bytes = pk_bytes[:16384]
        # TODO CHANGE `4, 4` FOR OTHER LEVEL OF SECURITY
        a_hat = self.M.bit_unpack_a_hat(a_hat_bytes, 4, 4)

        tr = pk_bytes[16384:16384+32]

        t1_new_bytes = pk_bytes[16384+32:]
        t1_new = self.M.bit_unpack_t1_new(t1_new_bytes, self.k, 1)
        return a_hat, tr, t1_new

    def _unpack_sig(self, sig_bytes):
        c_tilde = sig_bytes[:32]
        z_bytes = sig_bytes[32: 32 + 4 * 1024]
        h_bytes = sig_bytes[32 + 4 * 1024: -1024]
        c_ntt_bytes = sig_bytes[-1024:]

        z = self.M.bit_unpack_z_32(z_bytes, self.l, 1, self.gamma_1)
        h = self._unpack_h(h_bytes)
        c_ntt = self.R.bit_unpack_c_ntt(c_ntt_bytes)
        return c_tilde, z, h, c_ntt

    def keygen(self, _xof=shake256, _xof2=shake128):
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

        # Matrix multiplication
        t = (A_hat @ s1_hat).from_ntt() + s2

        t1, t0 = t.power_2_round(self.d)
        t1_new = t1.scale(1 << self.d).to_ntt()

        in_for_tr = rho + t1.bit_pack_t1()
        tr = self._h(in_for_tr, 32, _xof=_xof)

        # Pack up the bytes
        pk = self._pack_pk(A_hat, tr, t1_new)

        sk = self._pack_sk(rho, K, tr, s1, s2, t0)
        return pk, sk

    def sign(self, sk_bytes, m, _xof=shake256, _xof2=shake128):
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

    def verify(self, pk_bytes, m, sig_bytes, _xof=shake256, _xof2=shake128):
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
