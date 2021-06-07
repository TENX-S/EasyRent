tonic::include_proto!("easyrent.agency.auth");

use super::RpcResult;
use crate::model::agent::Agent;
use crate::sql::agent::*;
use crate::{error::{EasyRentAuthError, Result}, AgencyAuth};
use agent_auth_server::AgentAuth;
use sqlx::PgPool;
use tonic::{Request, Response, Status};
use tracing::*;

#[derive(Debug)]
pub struct AgencyAuthenticator {
    db_pool: PgPool,
}

impl RpcResult for LoginReply {
    type Value = ();
    type Error = AuthError;

    fn success(_: ()) -> Self {
        LoginReply {
            success: true,
            error: None,
        }
    }

    fn failure(error: AuthError) -> Self {
        LoginReply {
            success: false,
            error: Some(error.into()),
        }
    }
}

impl RpcResult for RegisterReply {
    type Value = ();
    type Error = AuthError;

    fn success(_: ()) -> Self {
        RegisterReply {
            success: true,
            error: None,
        }
    }

    fn failure(error: Self::Error) -> Self {
        RegisterReply {
            success: false,
            error: Some(error.into()),
        }
    }
}

impl AgencyAuthenticator {
    pub fn new(db_pool: PgPool) -> Self {
        AgencyAuthenticator {
            db_pool
        }
    }
}

#[tonic::async_trait]
impl AgencyAuth for AgencyAuthenticator {
    async fn login(&self, name: &str, password: &str) -> Result<(), EasyRentAuthError> {
        match sqlx::query_as::<_, Agent>(QUERY_AGENT)
            .bind(name)
            .fetch_one(&self.db_pool)
            .await
        {
            Ok(agent) => {
                if agent.password != password {
                    error!("Incorrect password of agent: {}", name);
                    return Err(EasyRentAuthError::MismatchedPassword);
                }
                if !agent.verified {
                    error!("Unverified agent: {}", name);
                    return Err(EasyRentAuthError::Unverified);
                }
            }
            Err(error) => {
                return if matches!(error, sqlx::error::Error::RowNotFound) {
                    error!("Agent {} doesn't exist", name);
                    Err(EasyRentAuthError::NonexistentUser)
                } else {
                    error!("{:?}", error);
                    Err(EasyRentAuthError::Unknown)
                }
            }
        }
        trace!("Login successfully: {}", name);
        Ok(())
    }

    async fn register(&self, agent: &Agent) -> Result<(), EasyRentAuthError> {
        if let Err(e) = sqlx::query(REGISTER_AGENT)
            .bind(&agent.corp)
            .bind(&agent.corp_id)
            .bind(&agent.com_regd_addr)
            .bind(&agent.contact)
            .bind(&agent.name)
            .bind(&agent.password)
            .execute(&self.db_pool)
            .await
        {
            if let Some(error) = e.as_database_error() {
                if let Some(code) = error.code() {
                    if code.as_ref() == "23505" {
                        error!("Duplicate agent: {}", agent.name);
                        return Err(EasyRentAuthError::DuplicateName);
                    }
                } else {
                    error!("Unable to get the error code of {:?}", error);
                    return Err(EasyRentAuthError::Unknown);
                }
            } else {
                error!("{:?}", e);
                return Err(EasyRentAuthError::Unknown);
            }
        }
        trace!("Register successfully: {}", agent.name);

        Ok(())
    }
}

#[tonic::async_trait]
impl AgentAuth for AgencyAuthenticator {
    async fn on_login(&self, request: Request<LoginRequest>) ->Result<Response<LoginReply>, Status> {
        let agent_addr = request.remote_addr();
        let login_request = request.into_inner();
        info!("Get a login request from {:?}\n{:#?}", agent_addr, login_request);
        match self.login(&login_request.name, &login_request.password).await {
            Ok(_) => Ok(Response::new(LoginReply::success(()))),
            Err(e) => match e {
                EasyRentAuthError::NonexistentUser => Ok(Response::new(LoginReply::failure(
                    AuthError::NonexistentUser,
                ))),
                EasyRentAuthError::MismatchedPassword => Ok(Response::new(LoginReply::failure(
                    AuthError::MismatchedPassword,
                ))),
                EasyRentAuthError::Unverified => Ok(Response::new(LoginReply::failure(
                    AuthError::Unverified,
                ))),
                _ => Ok(Response::new(LoginReply::failure(AuthError::Unknown))),
            },
        }
    }

    async fn on_register(&self, request: Request<RegisterRequest>) ->Result<Response<RegisterReply>, Status> {
        let agent_addr = request.remote_addr();
        let agent: Agent = request.into();
        info!("Got a register request from {:?}\n{:#?}", agent_addr, agent);
        match self.register(&agent).await {
            Ok(_) => Ok(Response::new(RegisterReply::success(()))),
            Err(e) => match e {
                EasyRentAuthError::DuplicateName => Ok(Response::new(RegisterReply::failure(
                    AuthError::DuplicatedName,
                ))),
                _ => Ok(Response::new(RegisterReply::failure(AuthError::Unknown))),
            },
        }
    }
}
