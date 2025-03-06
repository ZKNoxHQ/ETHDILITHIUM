# Dilithium Python


Implementation based on [this repository](https://github.com/GiacomoPope/dilithium-py/). We use the NTT implemented by ZKNOX [here](https://github.com/zkNoxHQ/ntt) and the first task is to replace SHAKE by Keccak_prng.

:warning: This is a work in progress. Do not use in production.

## Install
```bash
make install
```

## Test
```bash
make test
```

## Example

We provide an example in [this file](dilithium_py/example.py) of a signature:
```python
from .keccak_prng.keccak_prng_wrapper import Keccak256PRNG
from .dilithium import Dilithium2

# An example of Dilithium with Keccak256PRNG everywhere. This uses ZKNOX's NTT
msg = b"We are ZKNox."

# Perform signature process
pk, sk = Dilithium2.keygen(_xof=Keccak256PRNG, _xof2=Keccak256PRNG)
sig = Dilithium2.sign(sk, msg, _xof=Keccak256PRNG, _xof2=Keccak256PRNG)
assert Dilithium2.verify(
    pk, msg, sig, _xof=Keccak256PRNG, _xof2=Keccak256PRNG)
```
This can be run using
```bask
make example
``` 