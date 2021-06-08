pub mod error;
pub mod grpc;
pub mod model;
pub mod sql;
pub mod utils;

use grpc::cmd::{UnverifiedRentPost, UnverifiedHelpPost};
use error::{EasyRentAuthError, EasyRentPostError, EasyRentCommandError, Result};
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

#[tonic::async_trait]
pub trait AdminCmd {
    async fn on_load_unverified_agents(&self) -> Result<Vec<Agent>, EasyRentCommandError>;
    async fn on_load_unverified_rent_posts(&self) -> Result<Vec<UnverifiedRentPost>, EasyRentCommandError>;
    async fn on_load_unverified_help_posts(&self) -> Result<Vec<UnverifiedHelpPost>, EasyRentCommandError>;
    async fn on_pass_agent(&self, name: &str) -> Result<(), EasyRentCommandError>;
    async fn on_pass_rent_post(&self, uuid: &str) -> Result<(), EasyRentCommandError>;
    async fn on_pass_help_post(&self, uuid: &str) -> Result<(), EasyRentCommandError>;
}
