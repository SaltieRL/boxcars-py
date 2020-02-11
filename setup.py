#!/usr/bin/env python
import sys

from setuptools import setup
from setuptools_rust import RustExtension, Binding

setup_requires = ["setuptools-rust"]
install_requires = []

setup(
    name="boxcars_py",
    version="0.1.0",
    classifiers=[
        "License :: MIT License",
        "Programming Language :: Python",
        "Programming Language :: Rust",
    ],
    rust_extensions=[RustExtension("boxcars_py", path="Cargo.toml", binding=Binding.PyO3, debug=False)],
    install_requires=install_requires,
    setup_requires=setup_requires,
    include_package_data=True,
    zip_safe=False,
)
