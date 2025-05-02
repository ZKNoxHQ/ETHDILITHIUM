PY = python3
VENV = myenv
PIP = $(VENV)/bin/pip
PYTHON = $(VENV)/bin/python
AUX = *.pyc *.cprof */*.pyc

install:
	$(PY) -m venv $(VENV)
	$(PIP) install -r requirements.txt
	$(PIP) install -e "git+https://github.com/ZKNoxHQ/NTT.git@main#egg=polyntt&subdirectory=assets/pythonref/"

test:
	$(PYTHON) -m unittest $(if $(TEST),dilithium_py.tests.$(TEST),discover -s dilithium_py.tests) -v
	
example:
	# $(PYTHON) -m dilithium_py.example
	$(PYTHON) -m dilithium_py.example_babybear

generate_test_vectors:
	# $(PYTHON) -m dilithium_py.generate_ethdilithium_test_vectors
	# $(PYTHON) -m dilithium_py.generate_dilithium_test_vectors
	$(PYTHON) -m dilithium_py.generate_KAT_example
	forge fmt
	
clean:
	rm -f $(AUX)
	rm -rf __pycache__ */__pycache__
	rm -rf scripts/*.sage.py
	@echo "Clean done"
