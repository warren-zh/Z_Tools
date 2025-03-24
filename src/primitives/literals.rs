use crate::print_variables;
use std::fmt::Debug;

pub fn literals() {
    let addition;
    addition = 1u32 + 2;
    
    let subtraction;
    subtraction = 1i32 - 2; // If 1i32 -> 1u32, arithematic overflow
    
    let scientific_notation;
    scientific_notation = -2.5e-3;

    let logic_notation;
    logic_notation = true && false;
    // logic_notation = !true;
    // logic_notation = true || false;

    let bitwise_notation;
    bitwise_notation = 0b0011u32 & 0b0101;

    let large_number = 1_000_000u32;

    print_variables!(
        "Addtion Result" => addition,
        "Subtraction Result" => subtraction,
        "Scientific Notation" => scientific_notation,
        "Logic Notation" => logic_notation,
        "Bitwise Notation" => bitwise_notation,
        "Large Number" => large_number
    )
}
