tonic::include_proto!("easyrent.auth");

use super::RpcResult;
use crate::model::user::User;
use crate::sql::user::*;
use crate::{error::{EasyRentAuthError, Result}, Auth};
use authenticate_server::Authenticate;
use sqlx::PgPool;
use tonic::{Request, Response, Status};
use tracing::*;

#[derive(Debug)]
pub struct Authenticator {
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

impl Authenticator {
    pub fn new(db_pool: PgPool) -> Self {
        Authenticator { db_pool }
    }
}

#[tonic::async_trait]
impl Auth for Authenticator {
    async fn login(&self, user: &User) -> Result<(), EasyRentAuthError> {
        match sqlx::query_as::<_, User>(QUERY_USER)
            .bind(&user.name)
            .fetch_one(&self.db_pool)
            .await
        {
            Ok(query) => {
                if query.password != user.password {
                    error!("Incorrect password of user: {}", user.name);
                    return Err(EasyRentAuthError::MismatchedPassword);
                }
                if let Err(error) = sqlx::query(ACTIVATE_USER)
                    .bind(&user.name)
                    .execute(&self.db_pool)
                    .await
                {
                    error!(
                        "Unable to transform the status of user: {}\n{:#?}",
                        user.name, error
                    );
                    return Err(EasyRentAuthError::Unknown);
                }
            }
            Err(error) => {
                return if matches!(error, sqlx::error::Error::RowNotFound) {
                    error!("User {} doesn't exist", user.name);
                    Err(EasyRentAuthError::NonexistentUser)
                } else {
                    error!("{:?}", error);
                    Err(EasyRentAuthError::Unknown)
                }
            }
        }
        trace!("Login successfully: {}", user.name);

        Ok(())
    }

    async fn register(&self, user: &User) -> Result<(), EasyRentAuthError> {
        if let Err(e) = sqlx::query(REGISTER_USER)
            .bind(&user.name)
            .bind(&user.password)
            .bind(&user.create_time)
            .execute(&self.db_pool)
            .await
        {
            if let Some(error) = e.as_database_error() {
                if let Some(code) = error.code() {
                    if code.as_ref() == "23505" {
                        error!("Duplicate user: {}", user.name);
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
        trace!("Register successfully: {}", user.name);

        Ok(())
    }
}

#[tonic::async_trait]
impl Authenticate for Authenticator {
    async fn on_login(
        &self,
        request: Request<AuthRequest>,
    ) -> Result<Response<LoginReply>, Status> {
        let user_addr = request.remote_addr();
        let user: User = request.into();
        info!("Get a login request from {:?}\n{:#?}", user_addr, user);
        match self.login(&user).await {
            Ok(_) => Ok(Response::new(LoginReply::success(()))),
            Err(e) => match e {
                EasyRentAuthError::NonexistentUser => Ok(Response::new(LoginReply::failure(
                    AuthError::NonexistentUser,
                ))),
                EasyRentAuthError::MismatchedPassword => Ok(Response::new(LoginReply::failure(
                    AuthError::MismatchedPassword,
                ))),
                _ => Ok(Response::new(LoginReply::failure(AuthError::Unknown))),
            },
        }
    }

    async fn on_register(
        &self,
        request: Request<AuthRequest>,
    ) -> Result<Response<RegisterReply>, Status> {
        let user_addr = request.remote_addr();
        let user: User = request.into();
        info!("Got a register request from {:?}\n{:#?}", user_addr, user);
        match self.register(&user).await {
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
