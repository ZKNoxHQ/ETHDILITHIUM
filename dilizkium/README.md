# ZK version of DILITHIUM

## Motivation
In the context of zero-knowledge proofs, it is useful to keep circuits defined over specific fields. In the context of post-quantum security, the main construction used in practice is called STARK. We target here the scheme based on the field Babybear where $q = 2013265921$. We eventually want to consider $q = 2^{31} - 1$, but the polynomial multiplication needs to be computed differently.

In the context of a signature verification, the operations are defined over the field of definition of DILITHIUM. This field can be modified but it changes the security estimation of the signature scheme. Here, we propose an instantiation of a parameter set that fulfils NIST level II. **This is an experimental work and is still under investigation.**

While this work could be adapted in order to derive FALZKON, a zero-knowledge version of FALCON, it seems to be easier to derive parameters for DILIZKIUM from a security point of view, but also from an implementation perspective. The main security concern for FALZKON is the fact that this scheme is threatened by overstretching attacks. Increasing $q$ to $32$ bits will probably affect the security of the scheme, and finding fitting parameters might be tricky.

## DILITHIUM in a nutshell
This section recalls the different steps of DILITHIUM. The parameters are detailed at the end of the section.

##### Key generation
* $A$ is a matrix $k\times l$ of polynomials,
* $s_1$ is $l$ polynomials with coefficients bounded by $\eta$,
* $s_2$ is $k$ polynomials with coefficients bounded by $\eta$.

The public key is given by $A$ and $t = As_1 + s_2$. The secret key is $s_1,s_2$.

##### Signing algorithm

Find $y$ such that:
* $\|y\|_\infty \leq \gamma_1-1$
* $w_1 := \text{HighBits}(Ay, 2\gamma_2)$ and $c := \text H(M||w_1)\in B_\tau$,
* $z := y+cs_1$
until $\|z\|_\infty < \gamma_1-\beta$ and $\|\text{LowBits}(Ay-cs_2,2\gamma_2)\| < \gamma_2-\beta$.

The signature is given by $z$ and $c$.

##### Verification
* $w_1' = \text{HighBits}(Az-ct, 2\gamma_2)$
* if $\|z\|_\infty < \gamma_1-\beta$ and $c = \text H(M, w_1')$: return TRUE; else: return FALSE. 

##### Parameters
DILITHIUM depends on many parameters we list here:
* $q$ the prime field characteristic
* $n$ the extension defining the polynomial ring,
* $k$ and $l$, the dimensions of the matrix and secret key,
* $\eta$ for the size of the coefficients of the secret key,
* $\gamma_1$ defining the norm of the randomness given by $y$ as well as $z$,
* $\gamma_2$ defining how to define Low and High bits,
* $\tau$ for the challenge $c$ set size,
* $\beta = \tau \eta$ (always?).

```
??? d for pk compression ???
    13 in Dilithium
    in order to get 23 - 13 = 10-bit coefficients for pk
    Tied to the security of SelfTargetMSIS

??? ω ???
```

## Efficiency and security 
The above parameters are interdependent and changing one may affect others. Hence, this may change the soundness and/or the security of the signature scheme.

The security of the scheme is reduced to:
* MLWE: Module Learning With Error,
  - primal: dimension m*d where d = 256 l + m + 1 and m ≤ 256 k
  - dual: dimension m*d where d = 256 l and m ≤ 256 k
* MSIS: Module Short Integer Solution,
  - with $k,l,\zeta'$ where $\zeta' = \max(2(\gamma_1-\beta), 4\gamma_2+2)$,
* SelfTargetMSIS: a problem related to MSIS with a hash function.
  - with $H, k, l+1, \zeta$ where $\zeta = \max(\gamma_1-\beta, 2\gamma_2+1+2^{d-1}\tau)$.
* A last term $2^{-254}$ that I don't understand. Will this change when $q$ is modified?


More precisely, the security reduction is given in Equation 6 of the specification.
The security can be estimated using [this script](https://github.com/pq-crystals/security-estimates).

The efficiency is directly affected by the size of $q$ and the structure of the polynomial ring. The other parameters may also affect the efficiency. For example, the rejection method needs to be done in average $\exp(256\beta (l/\gamma_1 + k/\gamma_2))$. In practice, this value is bounded by 5 for NIST submission parameters.


## DILIZKIUM

We target an instance where $q$ is set to $2013265921$.
We consider for now $n=256$ so that we keep as close as possible from DILITHIUM. I had a look at QROM-secure Dilithium, but unfortunately $q\equiv 1 \bmod 8$ and I think it requires to be $5\bmod 8$ in order to have the QROM security proof (?).

As in DILITHIUM, we set $k=l=4$ and once all the parameters are set, increasing $k$ and $l$ should lead to an increase of security. We are not really interested in this for now, but increasing k,l by one gives roughly 30 bits of security, but also 300 more bytes for the public key, and 700 more bytes for the signature (at least in DILITHIUM).

We also set $\tau$ so that the hash function outputs has between $128$ and $256$ bits. $\tau = 39$ as in Dilithium seems to be a good choice and nothing is affected by our change of prime $q$. Using this choice, we have the same $\beta = 78$.

In order to choose $\gamma_1$ and $\gamma_2$, we look at the number of iterations in the singing algorithm together with the obtained security.
$\gamma_1$ can be set at $2^{17}$ as in Dilithium, and then we need to carefully select $\gamma_2$:

$$\exp(256 \beta (l/\gamma_1 + k/\gamma_2)) \leq 5
\iff
l/\gamma_1 + k/\gamma_2 \leq \frac {\ln 5}{256\beta}
$$

$$\iff \gamma_2 \leq \frac{256k\beta\gamma_1}{\gamma_1\ln 4 - 256 l \beta}
$$
Using $\gamma_1 = 2^{17}$, $\beta = 78$ and $k=l=4$, we get
$$\gamma_2 \leq 1319$$

But such small value of $\gamma_2$, MSIS(?) will be broken! We need to try different choices of $\gamma_1$?
* $\gamma_1$ needs to be small enough so that doesn't leak the secret.
* $\gamma_1$ needs to be large enough so that forge is not possible.
* Lowering γ1 makes the signing algorithm requiring more repetitions.
And in the same time:
* $\gamma_2$ is a divisor of $q-1$? Or no?
* Lowering $\gamma_2$ makes the signing algorithm requiring more repetitions?
* It also affects the security of SelfTargetMSIS.


----
Solving lattice with BKZ of block size b: complexity 2^{0.2xx b}.
https://cryptojedi.org/papers/newhope-20190710.pdf section 6.3 for finding the b... seems smocky!

Found this
https://estimate-all-the-lwe-ntru-schemes.github.io/docs/
for estimating LWE and NTRU :-)

Estimation for Dilithium Round 3 by Léo Ducas:
https://github.com/lducas/leaky-LWE-Estimator/tree/NIST-round3


Note sur la rejection:
S'il n'y a pas de rejection, à partir de T signatures (z1,c1), ... ,(zT,cT), on peut calculer :
1/T * sum(zi*conj(ci))
    = 1/T * sum((yi + ci*s1) * conj(ci))
    = 1/T * sum(yi * conj(ci)) + s1 * 1/T * sum(ci*conj(ci))
    = 1/T * sum(yi) * sum(conj(ci)) + s1 * 4N/3 (because yi, ci independant, and see intermediate results for the second part)
    = 0 + s1 *4N/3

With T large enough, we can recover s1!
