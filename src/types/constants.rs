use crate::print_variables;
use std::fmt::Debug;

static LANGUAGE: &str = "Rust";
const THRESHOLD: i32 = 10;

fn is_big(n: i32) -> bool {
    n > THRESHOLD
}

pub fn constants() {
    let n = 16;

    print_variables!(
        "Static Language" => LANGUAGE,
        "Constant Threshold" => THRESHOLD,
        "Comparison" => is_big(n)
    )
}
