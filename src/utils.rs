use std::fmt::Debug;
use std::error::Error;

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

#[derive(Debug)]
pub struct ErrorHandler {
    message: String,
}

impl ErrorHandler {
    pub fn new(message: String) -> Self {
        ErrorHandler { message }
    }
}

impl std::fmt::Display for ErrorHandler {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{}", self.message)
    }
}

impl Error for ErrorHandler{}

/* example on how to use the error handler
fn read_file(path: &str) -> Result<String, MyError> {
    let mut file = File::open(path)?;
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;
    Ok(contents)
}

fn main() {
    match read_file("example.txt") {
        Ok(contents) => println!("{}", contents),
        Err(err) => println!("Error: {}", err),
    }
}
*/
