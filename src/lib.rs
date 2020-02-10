use pyo3::prelude::*;
use pyo3::wrap_pyfunction;
use serde_json::Value;

#[pyfunction]
fn foo() -> usize {
    1337
}

#[pymodule]
fn boxcars_py(_py: Python, m: &PyModule) -> PyResult<()> {
    m.add_wrapped(wrap_pyfunction!(foo))?;
    Ok(())
}

fn convert_to_py(value: Value) -> PyObject {
    match value {}
}
