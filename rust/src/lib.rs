pub mod error;
pub mod grpc;
pub mod model;
pub mod sql;
pub mod utils;

use error::{EasyRentAuthError, EasyRentPostError, Result};
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

#[tonic::async_trait]
pub trait Cmd {
    type Value;

    /// Load some posts, different with the posts already on the phone
    async fn load(&self, exist_posts: &[String]) -> Result<Self::Value>;

    /// Handle refresh request from client
    async fn refresh(&self, first: bool) -> Result<Self::Value>;

    /// Handle search request from client
    async fn search(&self, query: &str, index: i32) -> Result<Self::Value>;

    /// Logout an user
    async fn logout(&self, name: &str) -> Result<()>;
}
