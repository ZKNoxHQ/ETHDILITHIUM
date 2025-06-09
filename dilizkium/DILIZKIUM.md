# PARAMETERS FOR A ZK-FRIENDLY DILITHIUM

We want to modify Dilithium, defined for $q = 8380417$, so that we can create zero-knowledge proofs using the STARK construction, defined over the field with $q = 2013265921$.

## Overview

The parameters we need to set are the following:
* $n$ the extension defining the polynomial ring,
* $k$ and $l$, the dimensions of the matrix and secret key,
* $\eta$ for the size of the coefficients of the secret key,
* $\gamma_1$ defining the norm of the randomness given by $y$ as well as $z$,
* $\gamma_2$ defining how to define Low and High bits,
* $\tau$ for the challenge $c$ set size,
* $\beta = \tau \eta$ (always?).

##### Security
The security of Dilithium can be reduced to (forget the detailed of QROM):
- MSIS problem with parameters $q$, $n$, $k$, $l$, $\zeta' = \min(2\gamma_1 4\gamma2+1)$ or something close to $\zeta'$,
- MLWE problem with $q$, $n$, $k$, $l$, $\eta$

|Problem|Classical sec.|Quantum sec.|Best possible-sec.|
|-|-|-|-|
|Dilithium II MSIS|121|110|86|
|Dilithium II MLWE|124|112|87|

##### Signer time
The choice of parameters influence the probability of getting a signature that works. The signer has a probability of $\exp(256\tau\eta(l/\gamma_1 + k/\gamma_2))$ of getting a passing signature.

|Scheme|Average number of iterations for a signature|
|-|-|
|Dilithium II|4.25|

## Our way of getting parameters

We want to keep a cheap signature verification, so it would be ideal to keep $n=256$, and $k,l$ as small as possible. Fixing $(k,l) = (4,4)$, we have only $\eta$ for increasing the security of MLWE, and experimentation lead to $\eta = 20$, which is way too big.

An alternative is to increase $l=5$ in order to increase the security. Using $(k,l) = (4,5)$ and $\eta=4$ leads to the following security:

|Problem|Classical sec.|Quantum sec.|Best possible-sec.|
|-|-|-|-|
|Dilithium II MLWE|124|112|87|
|ZK-Dilithium II MLWE|124|112|88|

Using a larger value for $\eta$ means that we will need to tweak $\tau, \gamma_1$ and/or $\gamma_2$ in order to keep the number of iterations for the signer small enough.

We decide here to keep $\tau = 39$, and so we need to find $\gamma_1,\gamma_2$ such that $\exp(256\cdot 39\cdot 4(5/\gamma_1+k/\gamma_2))\leq 6$.
We found that with $\gamma_1 = 2^{17}$ and $\gamma_2 = (q-1)/2^{11}$, it requires around 5.4 signing step before generating a passing signature.

|Scheme|Average number of iterations for a signature|
|-|-|
|Dilithium II|4.25|
|ZK-Dilithium II|5.4|

Finally, we compute the MSIS security using these parameters. We obtains something similar to Dilithium II.

|Problem|Classical sec.|Quantum sec.|Best possible-sec.|
|-|-|-|-|
|Dilithium II MSIS|121|110|86|
|ZK-Dilithium II MSIS|124|112|88|



_____

|Version|Dil|ZK1|ZK2|ZK3|ZK4|ZK5|ZK6|ZK7|ZK8|
|-|-|-|-|-|-|-|-|-|-|
|SignIter|4.25|4.25|**1394**|**1945144**|4.96|**24.55**|4.98|5.4|6.35
|SIS Classical|121|190|190|190|181|181|**112**|124|138|
|SIS Quantum|110|172|172|172|164|164|**102**|112|125|
|SIS Plausible|86|134|134|134|128|128|**79**|88|98|
|LWE Classical|124|**81**|**100**|**112**|**114**|124|124|124|124|
|LWE Quantum|112|**74**|**91**|**101**|**103**|112|112|112|112|
|LWE Plausible|87|**58**|**71**|**79**|**80**|88|88|88|88|

<!-- BKZ block-size $b$ to break SIS|417|650|650|650|620|620|385|426|473| -->
<!-- BKZ block-size $b$ to break LWE|424|280|345|383|390|426|426|426|426| -->




_____


## FINAL COMPARISON WITH ALL ATTACKS

## Dilithium
```
{'n': 256, 'k': 4, 'l': 4, 'gamma1': 131072, 'gamma2': 95232.0, 'q': 8380417, 'eta': 2, 'tau': 39, 'zeta': 350209.0, 'zeta_prime': 380929.0, 'pkdrop': 13}
```
##### Weak UF (SIS)
Attack uses block-size 423 and 2304 dimensions, with 0 q-vectors
log2(epsilon) = -84.52, log2 nvector per run 87.78
shortest vector used has length l=7242509.01, q=8380417, `l<q'= 1
```
SIS & 2304 & 423 & 123 & 112 & 87
```
##### Strong UF (SIS)
Attack uses block-size 417 and 2304 dimensions, with 0 q-vectors
log2(epsilon) = -82.72, log2 nvector per run 86.54
shortest vector used has length l=7835854.32, q=8380417, `l<q'= 1
```
SIS & 2304 & 417 & 121 & 110 & 86
```

##### SECRET KEY RECOVERY (LWE)
Primal attacks uses block-size 424 and 977 samples; dim d=2002
```
Primal & 977 & 424 & 124 & 112 & 87
```
Dual attacks uses block-size 422 and 1014 samples; dim d=2038
shortest vector used has length l=7347307.38, q=8380417, `l<q'= 1
log2(epsilon) = -43.78, log2 nvector per run 87.57
```
Dual & 1014 & 422 & 123 & 111 & 87 
```

## Dilithium-ZK
```
{'n': 256, 'k': 4, 'l': 5, 'gamma1': 131072, 'gamma2': 983040.0, 'q': 2013265921, 'eta': 4, 'tau': 39, 'zeta': 2125825.0, 'zeta_prime': 3932161.0, 'pkdrop': 13}
```

##### Weak UF (SIS)
Attack uses block-size 468 and 2560 dimensions, with 0 q-vectors
log2(epsilon) = -92.21, log2 nvector per run 97.12
shortest vector used has length l=47388212.06, q=2013265921, `l<q'= 1
```
SIS & 2560 & 468 & 136 & 124 & 97
```

##### Strong UF (SIS)
Attack uses block-size 426 and 2560 dimensions, with 0 q-vectors
log2(epsilon) = -86.18, log2 nvector per run 88.40
shortest vector used has length l=85708324.96, q=2013265921, `l<q'= 1
```
SIS & 2560 & 426 & 124 & 112 & 88
```

##### SECRET KEY RECOVERY (LWE)
Primal attacks uses block-size 426 and 1017 samples; dim d=2298
```
Primal & 1017 & 426 & 124 & 112 & 88
```
Dual attacks uses block-size 424 and 1024 samples; dim d=2304
shortest vector used has length l=968498746.70, q=2013265921, `l<q'= 1
log2(epsilon) = -43.93, log2 nvector per run 87.99
```
Dual & 1024 & 424 & 124 & 112 & 87 
```
