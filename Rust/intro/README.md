Author: NizTheDev
Date: 16/Oct/22

This is an intro project to rust.

Purpose of this is to explain the structure of rust programming language.

Prerequistites:

1. cargo // it is a package manager for rust just like npm is for nodejs.
2. rust // installation guide here: https://www.rust-lang.org/tools/install

How to run this project:

`cargo run` in the root folder of this project

Creating a similar project:
`cargo init` in the folder where you want to create the project

Basic Project Structure:

Executing `cargo init` will initialize a basic rust project which consists of the following

1. 'src' folder containing main.rs
2. Cargo.lock file
3. Cargo.toml file

Cargo.toml contains the project information and the dependencies of the project.

Cargo.lock is auto generated according to the Cargo.toml when the project is run.

By default the entry point of any rust project is src/main.rs

Rust files have .rs extention

After the prject is run with `cargo run`, the target folder is created in the root directory of the rust project which contains the binaries ( executables ).

You can also compile an individual rust file with `rustc` ( rust compiler ).

Make sure to add target folder in .gitignore file.

To get started in rust, go ahead and change the `Hello, world!` in the main.rs with your name.

For any tech related queries feel free to reach me out through nizthedev.web.app

Happy Coding!
