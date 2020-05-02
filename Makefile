SHELL := /bin/bash
MATURIN := maturin
PYTHON := $(shell which python)

.PHONY: build
build: nightly dev-packages
	poetry run $(MATURIN) build --interpreter $(PYTHON)

.PHONY: build-release
build-release: nightly dev-packages
	poetry run $(MATURIN) build --release --interpreter $(PYTHON)

.PHONY: nightly
nightly:
	rustup override set nightly

.PHONY: install
install: nightly dev-packages
	poetry run $(MATURIN) develop --release

.PHONY: publish
publish:
	poetry run $MATURIN publish --interpreter $(PYTHON)

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
