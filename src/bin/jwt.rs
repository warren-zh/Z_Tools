extern crate base64;
extern crate serde_json;
extern crate chrono;
extern crate colored;

use std::io;
use serde_json::Value;
use chrono::{TimeZone, Utc, Duration};
use colored::*;
use base64::{Engine as _, alphabet, engine::{self, general_purpose}};

const CUSTOM_ENGINE: engine::GeneralPurpose =
    engine::GeneralPurpose::new(&alphabet::URL_SAFE, general_purpose::NO_PAD);

fn decode_base64(s: &str) -> Result<String, base64::DecodeError> {
    let mut buffer = Vec::<u8>::new();
    CUSTOM_ENGINE.decode_vec(s, &mut buffer).unwrap();
    Ok(String::from_utf8_lossy(&buffer).to_string())
}

fn decode_jwt(jwt: &str) -> Result<(String, String), base64::DecodeError> {
    let parts: Vec<&str> = jwt.split('.').collect();
    if parts.len() != 3 {
        return Err(base64::DecodeError::InvalidByte(0, 0));
    }
    let header = decode_base64(parts[0])?;
    let payload = decode_base64(parts[1])?;
    Ok((header, payload))
}

fn main() {
    loop {
        println!("Choose an option:");
        println!("1. Decode JWT");
        println!("2. Decode Base64 string");
        println!("3. Encode to Base64");
        println!("4. Exit");
    
        let mut choice = String::new();
        io::stdin().read_line(&mut choice).expect("Failed to read line");

        match choice.trim().as_ref() {
            "1" => decode_jwt_prompt(),
            "2" => decode_b64_prompt(),
            "3" => encode_b64_prompt(),
            "4" => break,
            _ => println!("Invalid choice!"),
        }
    }
}

fn decode_b64_prompt() {
    let mut b64_string = String::new();
    println!("\nEnter a Base64 encoded string:");
    io::stdin().read_line(&mut b64_string).expect("Failed to read line");
    b64_string = b64_string.trim().to_string();

    match base64::decode(&b64_string) {
        Ok(decoded) => {
            let decoded_str = String::from_utf8_lossy(&decoded);
            println!("\nDecoded String: {}\n", decoded_str.green());
        },
        Err(e) => {
            println!("Error decoding Base64: {:?}\n", e);
        }
    }
}

fn decode_jwt_prompt() {
    let mut jwt = String::new();
    println!("\nEnter a JWT token:");
    io::stdin().read_line(&mut jwt).expect("Failed to read line");
    jwt = jwt.trim().to_string();

    match decode_jwt(&jwt) {
        Ok((header, payload)) => {
            let parsed_payload: Value = serde_json::from_str(&payload).unwrap();
            let pretty_payload = serde_json::to_string_pretty(&parsed_payload).unwrap();

            let exp_value = parsed_payload["exp"].as_u64().unwrap_or(0);
            let iat_value = parsed_payload["iat"].as_u64().unwrap_or(0);
            
            let exp_datetime = Utc.timestamp_opt(exp_value as i64, 0).single().unwrap_or(Utc::now());
            let iat_datetime = Utc.timestamp_opt(iat_value as i64, 0).single().unwrap_or(Utc::now());

            let token_lifespan = Duration::seconds((exp_value - iat_value) as i64);
            let lifespan_readable = format!("{} hours, {} minutes, {} seconds",
                token_lifespan.num_hours(), 
                token_lifespan.num_minutes() % 60, 
                token_lifespan.num_seconds() % 60);

            println!("\nHeader: {}", header.green());
            println!("Payload: {}", pretty_payload.green());
            println!("Issued Time: {}", iat_datetime.to_string().yellow());
            println!("Expiration Time: {}", exp_datetime.to_string().yellow());
            println!("Token Lifespan: {}", lifespan_readable.blue());
            if Utc::now() > exp_datetime {
                println!("Expired: {}", "True".red());
            } else {
                println!("Expired: {}", "False".green());
            }
            println!("\n");
        }
        Err(e) => {
            println!("Error decoding JWT: {:?}", e);
        }
    }
}

fn encode_b64_prompt() {
    let mut string_to_encode = String::new();
    println!("\nEnter a string to Base64 encode:");
    io::stdin().read_line(&mut string_to_encode).expect("Failed to read line");
    string_to_encode = string_to_encode.trim().to_string();

    // Use standard base64 encoding
    let encoded = base64::encode(&string_to_encode);
    println!("\nBase64 Encoded String: {}", encoded.green());
    println!("\n");
}
