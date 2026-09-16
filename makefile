DIRSIGNER = 'pythonref'
PYTHON=pythonref/myenv/bin/python
CORES := $(shell nproc)

# INSTALL

install: install_signer install_verifier

install_signer:
	make -C $(DIRSIGNER) install

install_verifier:
	foundryup
	forge install ZKNOXHQ/InterfaceVerifier
	forge install 0xsequence/sstore2

# GENERATION OF TEST VECTORS

gen_test_vectors:
	make -C $(DIRSIGNER) generate_test_vectors

# ML-DSA-65: from the NIST files of test/KAT (js signer, no python)
gen_test_vectors65:
	node js/gen_test_vectors65.js 10


# TESTS

test: test_signer test_verifier

test_slow: test_signer test_verifier_slow

test_signer:
	make -C $(DIRSIGNER) test

# ML-DSA-65 js signer against the NIST vectors (ACVP keyGen/sigGen/sigVer, PQCsignKAT_Dilithium3.rsp)
test_signer65:
	node js/test_mldsa65.js

# ML-DSA-65 verifier: NIST KAT, NIST ACVP sigVer vectors, kernels
test_verifier65:
	FOUNDRY_PROFILE=lite forge test -j$(CORES) -vv --match-path "test/dilithium65*"

test_verifier:
	FOUNDRY_PROFILE=lite forge test -j$(CORES) -vv

test_verifier_slow:
	forge test -j$(CORES) -vv

bench:
	forge test test/benchmarks.t.sol -j$(CORES) -vv | grep -E "^\[PASS\] test|Gas used:" | sed -E 'N;s/^\[PASS\] test([^()]*)\(\).*\n.*Gas used:[[:space:]]*([0-9]+)/\1 \2/'
