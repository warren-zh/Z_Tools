use crate::print_variables;
use std::fmt::Debug;

pub fn tuples() {
    let long_tuple = (1u8, 2u16, 3u32, 4u64,
                      -1i8, -2i16, -3i32, -4i64,
                      0.1f32, 0.2f64,
                      'a', true);
    let tuple_of_tuples = ((1u8, 2u16, 2u32), (4u64, -1i8), -2i16);

    let tuple = (1, "hello", 4.5, true);
    let (a, b, c, d) = tuple;

    print_variables!(
        "Long Tuple" => long_tuple,
        "Long Tuple 1" => long_tuple.1,
        "Tuple of Tuples" => tuple_of_tuples,
        "Tuple Destruction" => (a, b, c, d)
    )
}
