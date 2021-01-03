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
  - Rust.
  - [poetry](https://pypi.org/project/poetry/)

```
# Install dependencies
poetry install
# Build
make
```
