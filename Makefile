SHELL := /bin/bash

.PHONY: build
build: nightly dev-packages
	poetry run maturin build

.PHONY: build-release
build-release: nightly dev-packages
	poetry run maturin build --release

.PHONY: nightly
nightly:
	rustup override set nightly

.PHONY: install
install: nightly dev-packages
	poetry run maturin develop --release

.PHONY: publish
publish:
	poetry run maturin publish

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
