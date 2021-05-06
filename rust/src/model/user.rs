use chrono::Local;
use sqlx::{FromRow, PgPool,};
use crate::error::{EasyRentAuthError,Result,};
use crate::Auth;
use tonic::Request;
use crate::grpc::AuthRequest;

#[derive(Debug, FromRow)]
pub struct User {
    id: i64,
    name: String,
    password: String,
    create_time: String,
    online: bool,
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
    pub fn name(mut self, email: &str) -> Self {
        self.name = email.to_string();
        self
    }

    pub fn password(mut self, password: &str) -> Self {
        self.password = password.to_string();
        self
    }

    pub fn online(mut self, status: bool) -> Self {
        self.online = status;
        self
    }
}

#[tonic::async_trait]
impl Auth for User {
    async fn register(&self, pool: &PgPool) -> Result<(), EasyRentAuthError> {
        if let Err(e) = sqlx::query(
            r#"
            INSERT INTO users ( email, password, create_time, online )
            VALUES ( $1, $2, $3, FALSE );
            "#
        )
            .bind(&self.name)
            .bind(&self.password)
            .bind(&self.create_time)
            .execute(pool)
            .await {
            if let Some(error) = e.as_database_error() {
                if let Some(code) = error.code() {
                    if code.as_ref() == "23505" {
                        return Err(EasyRentAuthError::DuplicateName)
                    }
                } else {
                    return Err(EasyRentAuthError::Unknown);
                }
            } else {
                return Err(EasyRentAuthError::Unknown);
            }
        }

        Ok(())
    }

    async fn login(&self, pool: &PgPool) -> Result<(), EasyRentAuthError> {
        match sqlx::query_as::<_, User>(
            r#"
            SELECT * FROM users WHERE name = $1;
            "#
        )
            .bind(&self.name)
            .fetch_one(pool)
            .await {
            Ok(user) => {
                if user.password != self.password {
                    return Err(EasyRentAuthError::MismatchedPassword);
                }
                if let Err(_) = sqlx::query(
                    r#"
                    UPDATE users
                    SET online = TRUE
                    WHERE name = $1;
                    "#
                )
                    .bind(&user.name)
                    .execute(pool)
                    .await {
                    return Err(EasyRentAuthError::Unknown);
                }
            }
            Err(error) => {
                return if matches!(error, sqlx::error::Error::RowNotFound) {
                    Err(EasyRentAuthError::NonexistentUser)
                } else {
                    Err(EasyRentAuthError::Unknown)
                }
            }
        }

        Ok(())
    }
}
