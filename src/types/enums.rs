// An attribute to hide warnings for unused code.
#![allow(dead_code)]

use crate::print_variables;
use std::fmt::Debug;

enum WebEvent {
    PageLoad,
    PageUnload,
    KeyPress(char),
    Paste(String),
    Click { x: i64, y: i64 },
}

fn inspect(event: WebEvent) {
    match event {
        WebEvent::PageLoad => println!("page loaded"),
        WebEvent::PageUnload => println!("page unloaded"),
        WebEvent::KeyPress(c) => println!("pressed '{}'", c),
        WebEvent::Paste(s) => println!("pasted \"{}\"", s),
        WebEvent::Click { x, y } => {
            println!("clicked at x={}, y={}.", x, y);
        },
    }
}

#[derive(Debug)]
enum VeryVerboseEnumOfThingsToDoWithNumbers {
    Add,
    Substract,
}

// Creates a type alias
type Operations = VeryVerboseEnumOfThingsToDoWithNumbers;

impl VeryVerboseEnumOfThingsToDoWithNumbers {
    fn run(&self, x: i32, y: i32) -> i32 {
        match self {
            Self::Add => x + y,
            Self::Substract => x - y,
        }
    }
}


enum List {
    Cons(u32, Box<List>),
    Nil,
}

// Methods can be attached to an enum
impl List {
    // Create an empty list
    fn new() -> List {
        // `Nil` has type `List`
        List::Nil
    }

    // Consume a list, and return the same list with a new element at its front
    fn prepend(self, elem: u32) -> List {
        // `Cons` also has type List
        List::Cons(elem, Box::new(self))
    }

    // Return the length of the list
    fn len(&self) -> u32 {
        // `self` has to be matched, because the behavior of this method
        // depends on the variant of `self`
        // `self` has type `&List`, and `*self` has type `List`, matching on a
        // concrete type `T` is preferred over a match on a reference `&T`
        // after Rust 2018 you can use self here and tail (with no ref) below as well,
        // rust will infer &s and ref tail. 
        // See https://doc.rust-lang.org/edition-guide/rust-2018/ownership-and-lifetimes/default-match-bindings.html
        match self {
            // Can't take ownership of the tail, because `self` is borrowed;
            // instead take a reference to the tail
            List::Cons(_, tail) => 1 + tail.len(),
            // Base Case: An empty list has zero length
            List::Nil => 0
        }
    }

    // Return representation of the list as a (heap allocated) string
    fn stringify(&self) -> String {
        match self {
            List::Cons(head, tail) => {
                // `format!` is similar to `print!`, but returns a heap
                // allocated string instead of printing to the console
                format!("{}, {}", head, tail.stringify())
            },
            List::Nil => {
                format!("Nil")
            },
        }
    }
}

pub fn enums() {
    let pressed = WebEvent::KeyPress('a');
    // "to_owned()" creates an owned 'string' from a string slice
    let pasted = WebEvent::Paste("my text".to_owned());
    let click = WebEvent::Click { x: 20, y: 20 };
    let load = WebEvent::PageLoad;
    let unload = WebEvent::PageUnload;

    inspect(pressed);
    inspect(pasted);
    inspect(click);
    inspect(load);
    inspect(unload);

    let x = Operations::Add;
    
    let mut list = List::new();

    list = list.prepend(1);
    list = list.prepend(2);
    list = list.prepend(3);


    print_variables!(
        "Enumeration X" => x.run(10, 4),
        "Linked list has length" => list.len(),
        "List" => list.stringify()
    )
    
    
}
