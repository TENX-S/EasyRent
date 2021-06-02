use sqlx::FromRow;
use crate::grpc::agency::auth::RegisterRequest;
use tonic::Request;

#[derive(Debug, FromRow)]
pub struct Agent {
    pub corp: String,
    pub corp_id: String,
    pub com_regd_addr: String,
    pub name: String,
    pub password: String,
}

impl From<Request<RegisterRequest>> for Agent {
    fn from(regd_req: Request<RegisterRequest>) -> Self {
        let req = regd_req.into_inner();
        Agent {
            corp: req.corp,
            corp_id: req.corp_id,
            com_regd_addr: req.com_regd_addr,
            name: req.name,
            password: req.password,
        }
    }
}
