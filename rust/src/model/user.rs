use chrono::Local;
use sqlx::FromRow;
use tonic::Request;
use crate::grpc::auth::AuthRequest;

#[derive(Debug, FromRow)]
pub struct User {
    id: i64,
    pub name: String,
    pub password: String,
    pub create_time: String,
    pub online: bool,
}

impl From<Request<AuthRequest>> for User {
    fn from(auth_request: Request<AuthRequest>) -> User {
        let request = auth_request.into_inner();

        User::default()
            .name(&request.name)
            .password(&request.password)
    }
}

impl Default for User {
    fn default() -> Self {
        User {
            id: 0,
            name: "".to_string(),
            password: "".to_string(),
            create_time: Local::now().format("%Y-%m-%d %H:%M:%S").to_string(),
            online: false,
        }
    }
}

impl User {
    pub fn name(self, email: &str) -> Self {
        let mut user = self;
        user.name = email.to_string();
        user
    }

    pub fn password(self, password: &str) -> Self {
        let mut user = self;
        user.password = password.to_string();
        user
    }
}
