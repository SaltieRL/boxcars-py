SHELL := /bin/bash
MATURIN := maturin
PYTHON := python

.PHONY: build
build: dev-packages
	poetry run $(MATURIN) build --interpreter $(PYTHON)

.PHONY: build-release
build-release: dev-packages
	poetry run $(MATURIN) build --release --interpreter $(PYTHON)

.PHONY: install
install: dev-packages
	poetry run $(MATURIN) develop --release

.PHONY: publish
publish:
	poetry run $(MATURIN) publish --username __token__ --interpreter $(PYTHON)

.PHONY: clean
clean:
	cargo clean

.PHONY: dev-packages
dev-packages:
	poetry install

.PHONY: test
test: dev-packages install quicktest

.PHONY: bench
bench: dev-packages install
	poetry run pytest --benchmark-compare --benchmark-only tests

.PHONY: quicktest
quicktest:
	poetry run pytest --benchmark-skip tests
