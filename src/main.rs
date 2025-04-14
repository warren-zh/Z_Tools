use std::io;
use chrono::{NaiveDate, Datelike};

fn dispatch_name(name: &str) -> (i32, i32, i32) {
    name.chars().fold((0, 0, 0), |(vowels, consonants, sum), c| {
        let value = match c {
            'a' | 'e' | 'i' | 'o' | 'u' => {
                match c {
                    'a' => 1,
                    'e' => 5,
                    'i' => 9,
                    'o' => 6,
                    'u' => 3,
                    _ => 0,
                }
            },
            'b'..='z' => {
                match c {
                    'b' | 'k' | 't' => 2,
                    'c' | 'l' => 3,
                    'd' | 'm' | 'v' => 4,
                    'f' | 'x' => 6,
                    'g' | 'p' | 'y' => 7,
                    'h' | 'q' | 'z' => 8,
                    'j' | 's' => 1,
                    'n' | 'w' => 5,
                    'r' => 9,
                    _ => 0,
                }
            },
            _ => 0, // ignore other characters
        };
        if "aeiou".contains(c) {
            (vowels + value, consonants, sum + value)
        } else {
            (vowels, consonants + value, sum + value)
        }
    })
}

fn dispatch_birthday(birthday: &str) -> i32 {
    match NaiveDate::parse_from_str(birthday, "%Y-%m-%d") {
        Ok(date) => {
            let year_sum: i32 = date.year().to_string().chars().map(|c| c.to_digit(10).unwrap_or(0) as i32).sum();
            let month_sum: i32 = date.month().to_string().chars().map(|c| c.to_digit(10).unwrap_or(0) as i32).sum();
            let day_sum: i32 = date.day().to_string().chars().map(|c| c.to_digit(10).unwrap_or(0) as i32).sum();
            year_sum + month_sum + day_sum
        },
        Err(e) => {
            println!("Failed to parse date: {}", e);
            0
        }
    }
}

fn numerology_calculator(name_sum: i32, vowel: i32, consonant: i32, birthday_sum: i32) -> (i32, i32, i32, i32) {
    (module_calculator(vowel), module_calculator(consonant), module_calculator(name_sum), module_calculator(birthday_sum))
}

fn module_calculator(mut num: i32) -> i32 {
    while num >= 10 {
        num = num / 10 + num % 10;
    }
    num
}

fn main() {
    let mut user_name = String::new();
    let mut user_birthday = String::new();

    println!("Please enter a name: ");
    io::stdin().read_line(&mut user_name).expect("[Error] Unexpected Input.");
    let user_name = user_name.trim().to_lowercase();

    println!("Please enter your birthday [yyyy-mm-dd]: ");
    io::stdin().read_line(&mut user_birthday).expect("[Error] Unexpected Input.");
    let user_birthday = user_birthday.trim();

    let (vowels, consonants, name_sum) = dispatch_name(&user_name);
    let birthday_sum = dispatch_birthday(user_birthday);

    let (soul_urge_num, personality_num, destiny_num, life_path_num) = numerology_calculator(name_sum, vowels, consonants, birthday_sum);
    println!("生命灵数: {}", life_path_num);
    println!("命运数: {}", destiny_num);
    println!("内心欲望: {}", soul_urge_num);
    println!("性格数: {}", personality_num);
    println!("天赋数: {0}/{1}", birthday_sum, life_path_num);
}
