use crate::print_variables;
use std::fmt::Debug;
use std::mem;

fn slice(slice: &[i32]) {
    print_variables!(
        "Slice [0]" => slice[0],
        "Slice Length" => slice.len()
    )
}

pub fn arrays() {
    let fixed_size_array: [i32; 5] = [1, 2, 3, 4, 5];
    let ys: [i32; 500] = [0; 500];
    
    // let empty_array: [u32; 0] = [];
    // assert_eq!(&empty_array, &[]);

    print_variables!(
        "Fixed Size Array" => fixed_size_array,
        "Array Length" => fixed_size_array.len(),
        "Array Stack Allocated" => mem::size_of_val(&fixed_size_array),
        "Initialized YS" => ys,
        "YS Length" => ys.len()
    );

    slice(&ys[1 .. 4]);

    for i in 0..fixed_size_array.len() + 1 { // Oops, one element too far!
        match fixed_size_array.get(i) {
            Some(xval) => println!("{}: {}", i, xval),
            None => println!("Slow down! {} is too far!", i),
        }
    }
}
