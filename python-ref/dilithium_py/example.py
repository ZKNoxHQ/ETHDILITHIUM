from .keccak_prng.keccak_prng_wrapper import Keccak256PRNG
from .dilithium import Dilithium2, Dilithium3, Dilithium5

for Dilithium in [Dilithium2, Dilithium3, Dilithium5]:

    # An example of Dilithium with Keccak256PRNG everywhere. This uses ZKNOX's NTT
    msg = b"We are ZKNox."

    # Perform signature process
    pk, sk = Dilithium.keygen(_xof=Keccak256PRNG, _xof2=Keccak256PRNG)
    sig = Dilithium.sign(sk, msg, _xof=Keccak256PRNG, _xof2=Keccak256PRNG)
    assert Dilithium.verify(
        pk, msg, sig, _xof=Keccak256PRNG, _xof2=Keccak256PRNG)

    rho, t1 = Dilithium._unpack_pk(pk)
    c_tilde, z, h = Dilithium._unpack_sig(sig)

    # print(h)
    # print()
    # print(z)
    # print(Dilithium.omega)

    rho, K, tr, s1, s2, t0 = Dilithium._unpack_sk(sk)

    # Generate matrix A ∈ R^(kxl) in the NTT domain
    A_hat = Dilithium._expand_matrix_from_seed(rho, _xof=Keccak256PRNG)

    print(A_hat.dim())
