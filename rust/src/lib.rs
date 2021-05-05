pub mod model;
pub mod error;

use error::{EasyRentAuthError, Result};
use sqlx::PgPool;

pub mod grpc {
    tonic::include_proto!("easyrent");
}

#[tonic::async_trait]
pub trait Auth {
    /// Register an user
    async fn register(&self, pool: &PgPool) -> Result<(), EasyRentAuthError>;

    /// Login an user
    async fn login(&self, pool: &PgPool) -> Result<(), EasyRentAuthError>;
}
