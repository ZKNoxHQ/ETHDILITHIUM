DIRSIGNER = 'pythonref'
PYTHON=pythonref/myenv/bin/python
CORES := $(shell nproc)

# INSTALL

install: install_signer install_verifier

install_signer:
	make -C $(DIRSIGNER) install

install_verifier:
	foundryup

# GENERATION OF TEST VECTORS

gen_test_vectors:
	make -C $(DIRSIGNER) generate_test_vectors


# TESTS

test: test_signer test_verifier

test_slow: test_signer test_verifier_slow

test_signer:
	make -C $(DIRSIGNER) test

test_verifier:
	FOUNDRY_PROFILE=lite forge test -j$(CORES) -vv

test_verifier_slow:
	forge test -j$(CORES) -vv
