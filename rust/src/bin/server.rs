use anyhow::Result;
use dashmap::DashMap;
use easy_rent::authenticate_server::{Authenticate, AuthenticateServer};
use easy_rent::{AuthRequest, LoginFailedReason, LoginReply, RegisterFailedReason, RegisterReply};
use lazy_static::lazy_static;
use tonic::{transport::Server, Request, Response, Status};

pub mod easy_rent {
    tonic::include_proto!("easyrent");
}

lazy_static! {
    #[derive(Debug)]
    static ref MOCK_USERS: DashMap<String, String> = {
        let users = DashMap::new();
        users.insert("1599934734@qq.com".into(), "123123".into());
        users
    };
}

#[derive(Debug, Default)]
pub struct Authenticator {}

#[tonic::async_trait]
impl Authenticate for Authenticator {
    async fn on_login(
        &self,
        request: Request<AuthRequest>,
    ) -> Result<Response<LoginReply>, Status> {
        println!("Got a login request from {:?}", request.remote_addr());

        let login_request = request.into_inner();
        println!("Login: {:#?}", login_request);
        let name = login_request.name;
        let password = login_request.password;
        if let Some(inner_password) = MOCK_USERS.get(&name) {
            if password == inner_password.to_string() {
                Ok(Response::new(LoginReply {
                    success: true,
                    failed_reason: None,
                }))
            } else {
                Ok(Response::new(LoginReply {
                    success: false,
                    failed_reason: Some(LoginFailedReason::WrongPassword.into()),
                }))
            }
        } else {
            Ok(Response::new(LoginReply {
                success: false,
                failed_reason: Some(LoginFailedReason::InexistentUser.into()),
            }))
        }
    }

    async fn on_register(
        &self,
        request: Request<AuthRequest>,
    ) -> Result<Response<RegisterReply>, Status> {
        println!("Got a register request from {:?}", request.remote_addr());
        let register_request = request.into_inner();
        println!("Register: {:#?}", register_request);
        let name = register_request.name;
        let password = register_request.password;

        if MOCK_USERS.contains_key(&name) {
            Ok(Response::new(RegisterReply {
                success: false,
                failed_reason: Some(RegisterFailedReason::DuplicatedUser.into()),
            }))
        } else {
            MOCK_USERS.insert(name, password);
            println!("Adding new user!");
            println!("{:#?}", MOCK_USERS);
            Ok(Response::new(RegisterReply {
                success: true,
                failed_reason: None,
            }))
        }
    }
}

#[tokio::main]
async fn main() -> Result<()> {
    Server::builder()
        .add_service(AuthenticateServer::new(Authenticator::default()))
        .serve("127.0.0.1:8080".parse().unwrap())
        .await?;

    Ok(())
}
