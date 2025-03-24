use std::fmt::Debug;
/*
pub fn print_variables(vars: &[(&str, &dyn Debug)]) {
    for (name, value) in vars {
        println!("{} = {:?}", name, value);
    }
}
*/

#[macro_export]
macro_rules! print_variables {
    ($( $name:expr => $value:expr ),*) => {
        {
            let vars: &[(&str, &dyn Debug)] = &[
                $( ($name, &$value as &dyn Debug) ),*
            ];
            for (name, value) in vars {
                println!("{} = {:?}", name, value);
            }
        }
    };
}
