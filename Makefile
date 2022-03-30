 #* Poetry
.PHONY: poetry-download
poetry-download:
	@curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | $(PYTHON) -
 
.PHONY: poetry-remove
poetry-remove:
	@curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | $(PYTHON) - --uninstall
 
#* Installation
.PHONY: install
install:
	@poetry install
 
#* Security
.PHONY: sec
sec:
	@poetry run pip-audit

#* Run Local
.PHONY: run-local
run-local:
	@poetry run mkdocs serve

#* Build
.PHONY: build
	@poetry run mkdocs build

#* Cleaning
.PHONY: pycache-remove
pycache-remove:
	@find . | grep -E "(_pycache_|\.pyc|\.pyo$$)" | xargs rm -rf
 
.PHONY: dsstore-remove
dsstore-remove:
	@find . | grep -E ".DS_Store" | xargs rm -rf
 
.PHONY: mypycache-remove
mypycache-remove:
	@find . | grep -E ".mypy_cache" | xargs rm -rf
 
.PHONY: ipynbcheckpoints-remove
ipynbcheckpoints-remove:
	@find . | grep -E ".ipynb_checkpoints" | xargs rm -rf
 
.PHONY: pytestcache-remove
pytestcache-remove:
	@find . | grep -E ".pytest_cache" | xargs rm -rf
 
.PHONY: build-remove
build-remove:
	@rm -rf build/
 
.PHONY: cleanup
cleanup: pycache-remove dsstore-remove mypycache-remove ipynbcheckpoints-remove pytestcache-remove
