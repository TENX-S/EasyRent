tonic::include_proto!("easyrent.command");

use command_server::Command;
use crate::error::EasyRentCommandError;
use sqlx::PgPool;

use super::RpcResult;
#[derive(Debug)]
pub struct Commander {
    db_pool: PgPool,
}

impl Commander {
    pub fn new(db_pool: PgPool) -> Self {
        Commander {
            db_pool
        }
    }
}

impl RpcResult for RefreshReply {

    type Error = EasyRentCommandError;

    fn success() -> Self {
        unimplemented!()
    }

    fn failure(error: Self::Error) -> Self {
        unimplemented!()
    }
}

#[tonic::async_trait]
impl Command for Commander {
    async fn on_refresh(&self, request:tonic::Request<RefreshRequest>) ->Result<tonic::Response<RefreshReply>,tonic::Status> {
        unimplemented!()
    }

    async fn on_fetch(&self, request:tonic::Request<FetchRequest>) ->Result<tonic::Response<FetchReply>,tonic::Status> {
        unimplemented!()
    }

    async fn on_logout(&self, request:tonic::Request<LogoutRequest>) ->Result<tonic::Response<LogoutReply>,tonic::Status> {
        unimplemented!()
    }
}