use crate::grpc::auth::AuthRequest;
use chrono::Local;
use sqlx::FromRow;
use tonic::Request;

#[derive(Debug, FromRow)]
pub struct User {
    id: i64,
    pub name: String,
    pub password: String,
    pub create_time: String,
}

impl From<Request<AuthRequest>> for User {
    fn from(auth_request: Request<AuthRequest>) -> User {
        let request = auth_request.into_inner();
        User {
            id: 0i64,
            name: request.name.clone(),
            password: request.password.clone(),
            create_time: Local::now().format("%Y-%m-%d %H:%M:%S").to_string(),
        }
    }
}
