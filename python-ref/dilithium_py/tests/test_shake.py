from hashlib import shake_128, shake_256
from dilithium_py.shake.shake_wrapper import Shake, shake128, shake256
from Crypto.Hash.SHAKE128 import SHAKE128_XOF
from Crypto.Hash.SHAKE256 import SHAKE256_XOF

import unittest
import random


class TestShakeHashlib(unittest.TestCase):
    def hashlib_test_long_calls(self, Shake, shake_hashlib):
        absorb_bytes = b"testing_shake_long"
        for l in [1, 100, 1000, 2000, 5000, 1_000_000]:
            Shake.absorb(absorb_bytes)
            self.assertEqual(shake_hashlib(
                absorb_bytes).digest(l), Shake.read(l))

    def hashlib_test_many_calls(self, Shake, shake_hashlib):
        absorb_bytes = b"testing_shake_one"
        for l in [1, 100, 1000, 2000, 5000, 1_000_000]:
            Shake.absorb(absorb_bytes)
            output = b"".join([Shake.read(1) for _ in range(l)])
            self.assertEqual(shake_hashlib(absorb_bytes).digest(l), output)

    def test_hashlib_shake128(self):
        self.hashlib_test_long_calls(shake128, shake_128)
        self.hashlib_test_many_calls(shake128, shake_128)

    def test_hashlib_shake256(self):
        self.hashlib_test_long_calls(shake256, shake_256)
        self.hashlib_test_many_calls(shake256, shake_256)


class TestShakeCrypto(unittest.TestCase):
    def pycryptodome_test_read_chunks(self, Shake, ShakeCrypto):
        absorb_bytes = b"testing_shake_chunks"
        chunk = random.randint(50, 100)
        Shake.absorb(absorb_bytes)
        ShakeCrypto.update(absorb_bytes)
        for _ in range(1000):
            self.assertEqual(Shake.read(chunk), ShakeCrypto.read(chunk))

    def test_pycryptodome_shake(self):
        self.pycryptodome_test_read_chunks(shake128, SHAKE128_XOF())
        self.pycryptodome_test_read_chunks(shake256, SHAKE256_XOF())

    def test_simon(self):
        from binascii import unhexlify as unhx
        input = unhx("8b806e2aa93ea5ddc4dcd2b1a60234c75712006ea457526528f02ca66933297965735da00717a4776b415e8cbf6a1c6c06cd1409005d3d6a38b345207532989c870458e57594cf92ade1aaad1474502aa81e6569529ba7855a1a7005e8595c464ed2c2514a12a8e0793c04718dde184a4285a0c668641ec010cd067624573855b27cc94712059839e808002a176c461a7d4f62561ab265497a745b6208d675699d831c5c8995162778e5296c89b7559d93488db4240b29504b526592a0395cd6a451e18d40c0ad0221381f292968aa1ce0c6298cf6551b7742d42a7e4fc07499657dc0505c0dc69d94e029dee29869b74a80a3a5c350a94d52a0075276d4c251694aad9554850a69549d08098746a105738892e594e170ade5711d0d383adb593267636c4c580c02113489d384c6981659280c64448951e92d29f88957097a5690165b4714c21071da061cc077920dd348e96a9ecd937a95f6009e724d62b938a7973cd0740e6567845ff21c105a405d12649e2539ebd9781e2840d8271de750624b977ca8444a05d6648326759228ad88730e8c12616944100a254a567105e0b87d992658e239211d5610c5e0ad4634a423f239d1da40e0da4da959228c33909407acd56324668851d8453108395aa7370592d71543f33c937252d5531107b4150f810e03840c425420e7b70697674c1af0111310052b15a655432d690a8012a881da4928d6b35acdd44542a15ec293590844912bd921a01092e6380156315d1f277040b204de3879e1a1a1e0f74953b369d70a125b0a149f96940023619eca301ce834d763606a2340d6f44c1d8361477911def678d4aa90c33388612571eb496ed49700e6743604b714a3f4881e114d45093c4d597e1a68315fd6600223980eb83800534644e380eb737855e6611174184a868c90b562629925d952888213a5d3b945a5a26821371da0993e9d667c075580535659a84635634a640577a50b4968518a3414206d64c679179808ca666612f08c09794da6491ca7b985047792d773a6dd7344db0788c3397e5749a2cdc15554082c03440e2315919ac8694f9475dc836c11169062225acc997d20d46910e96dc18748d7627216ea3015368d25552ae032525141a51cd4589ae871e4a73cc5d070cc33720050ad117939999249")
        s = Shake(shake_256, 136)
        s.absorb(input+input)
        # s.absorb(input)
        print(s.read(32).hex())

        t = SHAKE256_XOF()
        t.update(input)
        t.update(input)
        print(t.read(32).hex())
