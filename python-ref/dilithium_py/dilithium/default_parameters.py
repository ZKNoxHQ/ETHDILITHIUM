from .dilithium import Dilithium
from .dilithium_eth import ETHDilithium
from polyntt.field.prime_field import PrimeField
from polyntt.field.m31 import M31ExtensionField

DEFAULT_PARAMETERS = {
    "dilithium2": {
        "d": 13,
        "k": 4,
        "l": 4,
        "eta": 2,
        "tau": 39,
        "omega": 80,
        "gamma_1": 131072,  # 2^17
        "gamma_2": 95232,  # (q-1)/88
    },
    "dilithium3": {
        "d": 13,
        "k": 6,
        "l": 5,
        "eta": 4,
        "tau": 49,
        "omega": 55,
        "gamma_1": 524288,  # 2^19
        "gamma_2": 261888,  # (q-1)/32
    },
    "dilithium5": {
        "d": 13,
        "k": 8,
        "l": 7,
        "eta": 2,
        "tau": 60,
        "omega": 75,
        "gamma_1": 524288,  # 2^19
        "gamma_2": 261888,  # (q-1)/32
    },
}

Dilithium2 = Dilithium(DEFAULT_PARAMETERS["dilithium2"])
Dilithium3 = Dilithium(DEFAULT_PARAMETERS["dilithium3"])
Dilithium5 = Dilithium(DEFAULT_PARAMETERS["dilithium5"])

ETHDilithium2 = ETHDilithium(DEFAULT_PARAMETERS["dilithium2"])
ETHDilithium2BabyBear = ETHDilithium(
    {
        "d": 13,
        "k": 4,
        "l": 5,
        "eta": 4,
        "tau": 39,
        "omega": 80,
        "gamma_1": 131072,  # 2^17
        "gamma_2": 983040,  # (q-1)/2^11,
    },
    F=PrimeField(2013265921),
    n=256
)
ETHDilithium2KoalaBear = ETHDilithium(
    {
        "d": 13,
        "k": 4,
        "l": 5,
        "eta": 4,
        "tau": 39,
        "omega": 80,
        "gamma_1": 131072,  # 2^17
        "gamma_2": 1040384,  # (q-1)/2^11,
    },
    F=PrimeField(2130706433),
    n=256
)

ETHDilithium2M31 = ETHDilithium(
    {
        "d": 16,
        "k": 4,
        "l": 5,
        "eta": 4,
        "tau": 39,
        "omega": 80,
        "gamma_1": 2**21,
        "gamma_2": 1015839,  # (q-1)/(2*7*151),
    },
    F=M31ExtensionField(),  # 2**31 - 1
    n=256
)
