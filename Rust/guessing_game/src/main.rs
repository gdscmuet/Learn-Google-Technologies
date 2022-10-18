// IMPORTS
use rand::Rng;
use std::{cmp::Ordering, io::stdin};

// ENTRY POINT FOR PROJECT
fn main() {
    // GENERATE a number in range of 1 to 100 ( 1 and 100 inclusive )
    let mut secret_number: i32 = rand::thread_rng().gen_range(1..=100); // check appendix 1. below

    print!("\x1B[2J\x1B[1;1H"); // CLEAR terminal

    println!("I dare you to Guess the unlucky number!"); // PROMPT the user

    // from here on out, all the steps below will be executed indefinitely until broken out of, which is commented on line 52

    loop {
        // DEFINE and INITIALIZE variable called guess with a String

        let mut guess = String::new();

        // we are passing in guess with this special syntax to give the read_line function ability to change the value of
        // this variable in the inner scope of the function. By default it's not allowed in rust.
        //check appendix 2.
        stdin()
            .read_line(&mut guess)
            .expect("Failed to read the line!");

        // the following syntax makes sure that guess is not null, it there is any issues with guess, it will throw error
        // check appendix 3.
        let guess: i32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => {
                print!("\x1B[2J\x1B[1;1H");
                println!("Enter a number you dummy!");
                continue;
            }
        };

        // match is basically like switch case

        match guess.cmp(&secret_number) {
            Ordering::Less => {
                print!("\x1B[2J\x1B[1;1H");
                println!("Too small :/")
            }
            Ordering::Greater => {
                print!("\x1B[2J\x1B[1;1H");
                println!("Too big :(")
            }
            Ordering::Equal => {
                // println!("You won the lottery!~ :)");
                // break;
                print!("\x1B[2J\x1B[1;1H");
                println!("The number ran away you dummy!");
                println!("You think you can get a hold of the unlucky number ?");
                println!("Think again!");
                secret_number = rand::thread_rng().gen_range(1..=100);
            }
        }
        println!("Guess again kiddo!");
    }
}

/*

APPENDIX

rust is type safe and memory safe language.

1. mut is short for mutable which is used to identify if the variable value can be changed or not.
2. rust borrow checker guide: https://doc.rust-lang.org/book/ch04-02-references-and-borrowing.html
3. Rust doesn't have the null feature that many other languages have. Null is a value that means there is no value there.
  In languages with null, variables can always be in one of two states: null or not- null.

*/
