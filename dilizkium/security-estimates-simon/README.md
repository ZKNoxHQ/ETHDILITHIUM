# security-estimates

We start from Dilithium NIST II parameters and try to reach the same security when we change q:
```
q = 8380417
n = 256
k = 4
l = 4
γ1 = 2¹⁷
γ2 = (q-1)/88
τ = 39
η = 2
pkdrop = 13
```
Once we move to `q = 2013265921`, the MLWE security is highly affected, as it depends on n, l, k, η, q. 
Here, q is large and so it reduces the security.
If we want to **keep n, l, k**,  then we can change η but this affects the number of repetitions before getting a signature: exp(+256ητ(l/γ1 + k/γ2)).
First, we try to take γ1,γ2 of the same size as in Dilithium:
γ1 = 2¹⁷
γ2 = (q-1)/2⁸/15

```
k = 4
l = 4
q = 2013265921
τ = 39
γ1 = 2**17
γ2 = (q-1)/(2**8*15)
for η in range(2,7):
    β = τ*η
    print(numerical_approx(exp(β * 256 * (l/γ1 + k/γ2))))
```
This outputs:
```
2.14195454290360
3.13483996520374
4.58796926386539
6.71468470474392
9.82722160743858
```
and so if we fix γ1,γ2 like this, we can go up to η=4...
Reducing γ1,γ2 would let us increase η.