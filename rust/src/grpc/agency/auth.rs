tonic::include_proto!("easyrent.agency.auth");

use super::super::RpcResult;
use crate::model::agent::Agent;
use crate::{error::{EasyRentAuthError, Result}, AgencyAuth};
use agent_auth_server::AgentAuth;
use sqlx::PgPool;
use tonic::{Request, Response, Status};
use tracing::*;

pub struct AgencyAuthenticator {
    db_pool: PgPool,
}

impl AgencyAuthenticator {
    pub fn new(db_pool: PgPool) -> Self {
        AgencyAuthenticator {
            db_pool
        }
    }
}

#[tonic::async_trait]
impl AgentAuth for AgencyAuthenticator {
    async fn on_login(&self, request: Request<LoginRequest>) ->Result<tonic::Response<LoginReply>,tonic::Status> {
        unimplemented!()
    }

    async fn on_register(&self, request:tonic::Request<RegisterRequest>) ->Result<tonic::Response<RegisterReply>,tonic::Status> {
        unimplemented!()
    }
}

#[tonic::async_trait]
impl AgencyAuth for AgencyAuthenticator {
    async fn login(&self, name: &str, password: &str) -> Result<(), EasyRentAuthError> {
        unimplemented!()
    }

    async fn register(&self, name: &Agent) -> Result<(), EasyRentAuthError> {
        unimplemented!()
    }
}
