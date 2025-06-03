# Polynomial multiplication for M31

Implementation of the polynomial multiplication in $\mathbb F_p[x]/(x^{256} +1)$ where $p = 2^{31}-1$.

## Steps
1. Compute an isomorphism $$f:\mathbb F_p[x]/(x^{256} +1) \simeq \mathbb F_{p^2}[y]/(y^{128} +1)$$ by mapping $x\mapsto \omega x$ where $\omega$ is a 512-th root of unity. This morphism $f$ is multiplicative: $f(a\times b) = f(a) \times f(b)$.
2. Compute $f(a)\times f(b)$ using a NTT multiplication. The field $\mathbb F_{p^2}$ has a $2$-adicity of $32$ as $2^{32} \mid p^2-1$. We use here up to the $2$-adicity $9$ (as in Dilithium).
3. The final result is obtained using $f^{-1}$.

## Conclusion
$$a\times b = f^{-1}(\text{intt}(\text{ntt}(f(a)) \cdot \text{ntt}(f(b))))$$

## Cost
* Three evaluations of $f$ (twice) and $f^{-1}$ (once): $3n$ $\mathbb F_{p^2}$ multiplications,
* Two NTTs and one iNTT: $2n\log(n) + n\log(n) + n$ $\mathbb F_{p^2}$ multiplications,
* One multiplication in the frequency domain: $n$ $\mathbb F_{p^2}$ multiplications.

**NB:** $n=2^7$ in this cost estimation! If we compare with BabyBear:
- M31: $3n + 3n\log(n) + n + n = 5n + 3n\log(n) = 3328$ $\mathbb F_{p^2}$ mult $\approx 9984$ mult mod p using Karatsuba.
- BB: $2n\log(n) + n\log(n) + n + n = 3n\log(n) + 2n$ but this time $n=2^8$ so $6656$ mult mod p, but these are more expensive.