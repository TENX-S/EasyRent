
pub use anyhow::Result;
use thiserror::Error;

#[derive(Error, Debug)]
pub enum EasyRentAuthError {
    #[error("There is no such user")]
    NonexistentUser,

    #[error("The password is wrong")]
    MismatchedPassword,

    #[error("Duplicate email")]
    DuplicateName,

    #[error("Unverified account")]
    Unverified,

    #[error("Unknown error")]
    Unknown,
}

#[derive(Error, Debug)]
pub enum EasyRentPostError {
    #[error("Unknown error")]
    Unknown,
}
