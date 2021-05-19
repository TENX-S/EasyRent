pub mod error;
pub mod grpc;
pub mod model;
pub mod sql;
pub mod utils;

use error::{EasyRentAuthError, Result};
use model::user::User;

#[tonic::async_trait]
pub trait Auth {
    /// Register an user
    async fn register(&self, user: &User) -> Result<(), EasyRentAuthError>;

    /// Login an user
    async fn login(&self, user: &User) -> Result<(), EasyRentAuthError>;
}
