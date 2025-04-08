use http_requester::actions::request::{HttpRequest,send_request} ;
use std::fmt::Debug;
use http_requester::print_variables;

#[tokio::main]
async fn main() {
    let mut n = 1;
    while n < 3 {
	    let request = HttpRequest::new("https://129d-38-99-100-7.ngrok-free.app", "GET");
	    
	    print_variables!(
	        "Request" => request
	    );
	   
	    match send_request(&request).await {
	        Ok(response) => {
	            print_variables!(
	                "Response" => response
	            );
	        },
	        Err(error) => {
	            print_variables!(
	                "Error" => error 
	            );
	        }
	    }
        n += 1;
    }
}
