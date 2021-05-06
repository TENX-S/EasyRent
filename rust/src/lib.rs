pub mod model;
pub mod error;
pub mod grpc;
pub mod utils;

use error::{EasyRentAuthError, Result};
use sqlx::PgPool;

#[tonic::async_trait]
pub trait Auth {
    /// Register an user
    async fn register(&self, pool: &PgPool) -> Result<(), EasyRentAuthError>;

    /// Login an user
    async fn login(&self, pool: &PgPool) -> Result<(), EasyRentAuthError>;
}
