MATURIN=maturin
TOX=tox

build:
	$(MATURIN) build

develop:
	$(MATURIN) develop

publish:
	$(MATURIN) develop

test:
	$(TOX)
