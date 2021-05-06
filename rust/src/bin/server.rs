use anyhow::Result;
use tonic::{transport::Server, Request, Response, Status};
use easy_rent_sdk::grpc::authenticate_server::{Authenticate, AuthenticateServer};
use easy_rent_sdk::grpc::{AuthRequest, LoginReply, RegisterReply, AuthError};
use easy_rent_sdk::{Auth, error::EasyRentAuthError};
use easy_rent_sdk::model::user::User;
use sqlx::PgPool;

#[derive(Debug)]
pub struct Authenticator {
    db_pool: PgPool,
}

trait RpcResult {
    type Reply;
    fn success() -> Self::Reply;
    fn failure(e: AuthError) -> Self::Reply;
}

impl RpcResult for LoginReply {
    type Reply = LoginReply;

    fn success() -> Self {
        LoginReply {
            success: true,
            error: None,
        }
    }

    fn failure(e: AuthError) -> Self {
        LoginReply {
            success: false,
            error: Some(e.into()),
        }
    }
}

impl RpcResult for RegisterReply {
    type Reply = RegisterReply;
    fn success() -> Self {
        RegisterReply {
            success: true,
            error: None,
        }
    }

    fn failure(e: AuthError) -> Self {
        RegisterReply {
            success: false,
            error: Some(e.into()),
        }
    }
}

impl Authenticator {
    async fn init() -> Result<Self> {
        Ok(Authenticator {
            db_pool: PgPool::connect(&dotenv::var("DATABASE_URL")?).await?
        })
    }
}

#[tonic::async_trait]
impl Authenticate for Authenticator {
    async fn on_login(
        &self,
        request: Request<AuthRequest>,
    ) -> Result<Response<LoginReply>, Status> {
        println!("Got a login request from {:?}", request.remote_addr());

        let user: User = request.into();
        match user.login(&self.db_pool).await {
            Ok(_) => Ok(Response::new(LoginReply::success())),
            Err(e) => match e {
                EasyRentAuthError::NonexistentUser => Ok(Response::new(LoginReply::failure(AuthError::NonexistentUser))),
                EasyRentAuthError::MismatchedPassword => Ok(Response::new(LoginReply::failure(AuthError::MismatchedPassword))),
                _  => Ok(Response::new(LoginReply::failure(AuthError::Unknown))),
            }
        }
    }

    async fn on_register(
        &self,
        request: Request<AuthRequest>,
    ) -> Result<Response<RegisterReply>, Status> {
        println!("Got a register request from {:?}", request.remote_addr());

        let user: User = request.into();

        match user.register(&self.db_pool).await {
            Ok(_) => Ok(Response::new(RegisterReply::success())),
            Err(e) => match e {
                EasyRentAuthError::DuplicateName => Ok(Response::new(RegisterReply::failure(AuthError::DuplicatedName))),
                _ => Ok(Response::new(RegisterReply::failure(AuthError::Unknown))),
            }
        }
    }
}

#[tokio::main]
async fn main() -> Result<()> {
    Server::builder()
        .add_service(AuthenticateServer::new(Authenticator::init().await?))
        .serve("127.0.0.1:8080".parse().unwrap())
        .await?;

    Ok(())
}
