use crate::print_variables;
use std::fmt::Debug;

#[derive(Debug)]
struct Person {
    name: String,
    age: u8,
}

// A unit struct
#[derive(Debug)]
struct Unit;

// A tuple struct
struct Pair(i32, f32);

// A struct with two fields
#[derive(Debug)]
struct Point {
    x: f32,
    y: f32,
}

#[derive(Debug)]
struct Rectangle {
    top_left: Point,
    bottom_right: Point,
}

pub fn structs() {
    let name = String::from("Peter");
    let age = 27;
    let peter = Person { name, age };

    let point: Point = Point { x: 5.2, y: 9.4 };

    let another_point: Point = Point { x: 1.4, ..point };

    let Point { x: left_edge, y: top_edge } = point;
    let _rectangle = Rectangle {
        top_left: Point { x: left_edge, y: top_edge },
        bottom_right: Point { x: 11.3, y: 1.2 },
    };
    let _unit = Unit;
    let pair = Pair(1, 0.1);

    print_variables!(
        "Peter" => peter,
        "Point" => (point.x, point.y),
        "Another Point" => (another_point.x, another_point.y),
        "Rectangle" => _rectangle,
        "Unit" => _unit,
        "Pair" => (pair.0, pair.1)
    )
}
