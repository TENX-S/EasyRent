pub mod error;
pub mod grpc;
pub mod model;
pub mod sql;
pub mod utils;

use error::{EasyRentAuthError, EasyRentPostError, Result};
use model::post::{RentPost, HelpPost};
use model::agent::Agent;

#[tonic::async_trait]
pub trait Poster {
    /// Submit a rent post
    async fn rent(&self, post: &RentPost) -> Result<(), EasyRentPostError>;

    /// Submit a help post
    async fn help(&self, post: &HelpPost) -> Result<(), EasyRentPostError>;
}

#[tonic::async_trait]
pub trait AgencyAuth {
    /// Register an agent
    async fn register(&self, agent: &Agent) -> Result<(), EasyRentAuthError>;

    /// Login an agent
    async fn login(&self, name: &str, password: &str) -> Result<(), EasyRentAuthError>;
}
