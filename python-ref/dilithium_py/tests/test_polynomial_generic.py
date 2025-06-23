import unittest
from random import randint
from polyntt.polynomial.polynomial import PolynomialRing
from polyntt.field.prime_field import PrimeField


class TestPolynomialRing(unittest.TestCase):
    F = PrimeField(11)
    R = PolynomialRing(F, 5)

    def test_gen(self):
        self.assertTrue(self.R.gen() == self.R([0, 1]))

    def test_random(self):
        for _ in range(100):
            f = self.R.random()
            self.assertEqual(type(f), self.R.element)
            self.assertTrue(len(f.coeffs) <= self.R.n)
            self.assertTrue(all([c.coeffs < self.R.F.p for c in f.coeffs]))

    # def test_non_list_error(self):
    #     self.assertRaises(TypeError, lambda: self.R("1"))

    # def test_long_list_error(self):
    #     self.assertRaises(ValueError, lambda: self.R([0] * (self.R.n + 1)))

    def test_string_format(self):
        self.assertEqual(
            str(self.R),
            "Univariate Polynomial Ring in x over Finite Field of size 11^1 with modulus x^5 + 1",
        )


class TestPolynomial(unittest.TestCase):
    F = PrimeField(11)
    R = PolynomialRing(F, 5)

    def test_getitem(self):
        x = self.R.gen().coeffs
        self.assertEqual(x[0], self.R.F(0))
        self.assertEqual(x[1], self.R.F(1))

    def test_is_zero(self):
        self.assertTrue(self.R(0).is_zero())
        self.assertFalse(self.R(1).is_zero())

    def test_is_constant(self):
        self.assertTrue(self.R(0).is_constant())
        self.assertTrue(self.R(1).is_constant())
        self.assertFalse(self.R.gen().is_constant())

    def test_reduce_coefficients(self):
        for _ in range(100):
            # Create non-canonical coefficients
            coeffs = [randint(-2 * self.R.F.p, 3 * self.R.F.p)
                      for _ in range(self.R.n)]
            f = self.R(coeffs)
            self.assertTrue(
                all([0 <= c.coeffs < self.R.F.p for c in f.coeffs]))

    def test_equality(self):
        for _ in range(100):
            f1 = self.R.random()
            f2 = -f1
            self.assertEqual(f1, f1)
            # We don't cover the case of f1 being zero, as it's incredibly unlikely to happen
            if f1.is_zero():
                self.assertTrue(f1 == f2)  # pragma: no cover
            else:
                self.assertFalse(f1 == f2)

        # self.assertTrue(self.R(0) == 0)
        # self.assertTrue(self.R(1) == self.R.F.p + 1)
        # self.assertTrue(self.R(self.R.F.p - 1) == -1)
        # self.assertTrue(self.R(0) != 1)
        # self.assertFalse(self.R(self.R.F.p - 1) == "a")

    # def test_add_failure(self):
    #     f1 = self.R.random()
    #     self.assertRaises(NotImplementedError, lambda: f1 + "a")

    # def test_sub_failure(self):
    #     f1 = self.R.random()
    #     self.assertRaises(NotImplementedError, lambda: f1 - "a")

    # def test_mul_failure(self):
    #     f1 = self.R.random()
    #     self.assertRaises(NotImplementedError, lambda: f1 * "a")

    # def test_pow_failure(self):
    #     f1 = self.R.random()
    #     self.assertRaises(TypeError, lambda: f1 ** "a")

    def test_add_polynomials(self):
        zero = self.R(0)
        for _ in range(100):
            f1 = self.R.random()
            f2 = self.R.random()
            f3 = self.R.random()

            self.assertEqual(f1 + zero, f1)
            self.assertEqual(f1 + f2, f2 + f1)
            self.assertEqual(f1 + (f2 + f3), (f1 + f2) + f3)

            f2 = f1
            f2 += f1
            self.assertEqual(f1 + f1, f2)

    def test_sub_polynomials(self):
        zero = self.R(0)
        for _ in range(100):
            f1 = self.R.random()
            f2 = self.R.random()
            f3 = self.R.random()

            self.assertEqual(f1 - zero, f1)
            self.assertEqual(f3 - f3, zero)
            self.assertEqual(f3 - zero, f3)
            self.assertEqual(zero - f3, -f3)
            self.assertEqual(f1 - f2, -(f2 - f1))
            self.assertEqual(f1 - (f2 - f3), (f1 - f2) + f3)

            f2 = f1
            f2 -= f1
            self.assertEqual(f2, zero)

    def test_mul_polynomials(self):
        zero = self.R(0)
        one = self.R(1)
        for _ in range(100):
            f1 = self.R.random()
            f2 = self.R.random()
            f3 = self.R.random()
            self.assertEqual(f1 * zero, zero)
            self.assertEqual(f1 * one, f1)
            self.assertEqual(f1 * f2, f2 * f1)
            self.assertEqual(f1 * (f2 * f3), (f1 * f2) * f3)
            self.assertEqual(self.R(2) * f1, f1 + f1)
            self.assertEqual(self.R(2) * f1, f1 * self.R(2))

            f2 = f1
            f2 *= f2
            self.assertEqual(f1 * f1, f2)

    # def test_pow_polynomials(self):
    #     one = self.R(1)
    #     for _ in range(100):
    #         f1 = self.R.random()

    #         self.assertEqual(one, f1**0)
    #         self.assertEqual(f1, f1**1)
    #         self.assertEqual(f1 * f1, f1**2)
    #         self.assertEqual(f1 * f1 * f1, f1**3)
    #         self.assertRaises(ValueError, lambda: f1 ** (-1))

    def test_print(self):
        self.assertEqual(
            str(self.R(0)), "(0) + (0)·X + (0)·X^2 + (0)·X^3 + (0)·X^4")
        self.assertEqual(
            str(self.R(1)), "(1) + (0)·X + (0)·X^2 + (0)·X^3 + (0)·X^4")
        self.assertEqual(str(self.R.gen()),
                         "(0) + (1)·X + (0)·X^2 + (0)·X^3 + (0)·X^4")
        self.assertEqual(str(self.R([1, 2, 3, 4, 1])),
                         "(1) + (2)·X + (3)·X^2 + (4)·X^3 + (1)·X^4")
