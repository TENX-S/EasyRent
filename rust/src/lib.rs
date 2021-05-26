pub mod error;
pub mod grpc;
pub mod model;
pub mod sql;
pub mod utils;

use error::{EasyRentAuthError, EasyRentPostError, EasyRentCommandError, Result};
use model::post::{RentPost, HelpPost};
use model::user::User;

#[tonic::async_trait]
pub trait Auth {
    /// Register an user
    async fn register(&self, user: &User) -> Result<(), EasyRentAuthError>;

    /// Login an user
    async fn login(&self, user: &User) -> Result<(), EasyRentAuthError>;
}

#[tonic::async_trait]
pub trait Poster {
    /// Submit a rent post
    async fn rent(&self, post: &RentPost) -> Result<(), EasyRentPostError>;

    /// Submit a help post
    async fn help(&self, post: &HelpPost) -> Result<(), EasyRentPostError>;
}
