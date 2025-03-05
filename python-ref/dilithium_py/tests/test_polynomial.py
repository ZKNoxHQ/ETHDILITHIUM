import unittest
from random import randint
from dilithium_py.polynomials.polynomials_generic import Polynomial, PolynomialRing
from dilithium_py.polynomials.polynomials import PolynomialRingDilithium, PolynomialDilithium
from polyntt.poly import Poly


class TestPolynomialRing(unittest.TestCase):
    R = PolynomialRingDilithium()

    def test_ntt_constants_vs_zknox(self):
        p = Poly([randint(1, self.R.q) for i in range(256)], self.R.q)
        self.assertEqual(self.R.ntt_zetas, p.NTT.ψ_rev)

    def test_ntt_vs_zknox(self):
        coefficients = [randint(1, self.R.q) for i in range(256)]
        p1 = PolynomialDilithium(
            self.R, coefficients)
        p2 = Poly(coefficients, self.R.q)
        self.assertEqual(p1.to_ntt().coeffs, p2.ntt())
