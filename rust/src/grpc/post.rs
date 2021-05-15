tonic::include_proto!("easyrent.post");

use post_server::Post;
use crate::error::EasyRentPostError;
use sqlx::PgPool;

use super::RpcResult;
#[derive(Debug)]
pub struct PostManager {
    db_pool: PgPool,
}

impl PostManager {
    pub fn new(db_pool: PgPool) -> Self {
        PostManager {
            db_pool
        }
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
    async fn on_submit(&self, request: tonic::Request<SubmitRequest>) -> Result<tonic::Response<SubmitReply>, tonic::Status> {
        unimplemented!()
    }
}
