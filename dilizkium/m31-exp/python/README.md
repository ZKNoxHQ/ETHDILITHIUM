# Polynomial multiplication for M31

Implementation of the polynomial multiplication in $\mathbb F_p[x]/(x^{256} +1)$ where $p = 2^{31}-1$.

## Steps
1. Compute an isomorphism $$f:\mathbb F_p[x]/(x^{256} +1) \simeq \mathbb F_{p^2}[y]/(y^{128} +1)$$ by mapping $x\mapsto \omega x$ where $\omega$ is a 512-th root of unity. This morphism $f$ is multiplicative: $f(a\times b) = f(a) \times f(b)$.
2. Compute $f(a)\times f(b)$ using a NTT multiplication. The field $\mathbb F_{p^2}$ has a $2$-adicity of $32$ as $2^{32} \mid p^2-1$.
3. The final result is obtained using $f^{-1}$.

## Conclusion
$$a\times b = f^{-1}(\text{intt}(\text{ntt}(f(a)) \cdot \text{ntt}(f(b))))$$

## Cost
* Three evaluations of $f$ (twice) and $f^{-1}$ (once): $3n$ $\mathbb F_{p^2}$ multiplications,
* Two NTTs and one iNTT: $3n\log(n)$?
* One multiplication in the frequency domain: $n$ $\mathbb F_{p^2}$ multiplication.

**NB:** n is $2^7$ in this cost estimation!