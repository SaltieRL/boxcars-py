# Boxcars-py

Python bindings for the [Boxcars](https://github.com/nickbabcock/boxcars) Rocket League replay parser.

## Installation

Only tested on linux.
You have to compile it yourself if you are using Windows.

```
pip install boxcars-py
```

## Usage

```py
from boxcars_py import parse_replay

with open("your_replay.replay", "rb") as f:
  buf = f.read()
  f.close()

replay = parse_replay(buf)
# Use the parsed replay here
```

## Building from source

__Requirements__
  - Rust Nightly. Minium supported version: 1.42.0-nightly 2020-01-21
  - [maturin](https://pypi.org/project/maturin/)
  - [tox](https://pypi.org/project/tox) for testing

```
make
# make develop will install the crate in the current virtualenv
make develop
```
