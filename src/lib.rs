use pyo3::prelude::*;
use pyo3::wrap_pyfunction;

#[pyfunction]
fn foo() -> usize {
    1337
}

#[pymodule]
fn boxcars_py(_py: Python, m: &PyModule) -> PyResult<()> {
    m.add_wrapped(wrap_pyfunction!(foo))?;
    Ok(())
}
