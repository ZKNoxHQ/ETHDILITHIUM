PY = python3
VENV = myenv
PIP = $(VENV)/bin/pip
PYTHON = $(VENV)/bin/python
AUX = *.pyc *.cprof */*.pyc

install:
	$(PY) -m venv $(VENV)
	$(PIP) install pycryptodome
	$(PIP) install -e "git+https://github.com/ZKNoxHQ/NTT.git@main#egg=polyntt&subdirectory=assets/pythonref/"

test:
	$(PYTHON) -m unittest $(if $(TEST),dilithium_py.tests.$(TEST),discover -s dilithium_py.tests) -v
	
	
clean:
	rm -f $(AUX)
	rm -rf __pycache__ */__pycache__
	rm -rf scripts/*.sage.py
	@echo "Clean done"
