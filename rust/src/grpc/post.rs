tonic::include_proto!("easyrent.post");

use crate::error::EasyRentPostError;
use post_server::Post;
use sqlx::PgPool;
use tonic::Response;
use tracing::*;

use super::RpcResult;
#[derive(Debug)]
pub struct PostManager {
    db_pool: PgPool,
}

impl PostManager {
    pub fn new(db_pool: PgPool) -> Self {
        PostManager { db_pool }
    }
}

impl RpcResult for SubmitReply {
    type Error = EasyRentPostError;

    fn success() -> Self {
        unimplemented!()
    }

    fn failure(error: Self::Error) -> Self {
        unimplemented!()
    }
}

#[tonic::async_trait]
impl Post for PostManager {
    async fn on_rent(
        &self,
        request: tonic::Request<SubmitRentRequest>,
    ) -> Result<tonic::Response<SubmitReply>, tonic::Status> {
        trace!("{:#?}", request.into_inner());
        Ok(Response::new(SubmitReply {
            success: true
        }))
    }

    async fn on_help(
        &self,
        request: tonic::Request<SubmitHelpRequest>,
    ) -> Result<tonic::Response<SubmitReply>, tonic::Status> {
        unimplemented!()
    }
}
