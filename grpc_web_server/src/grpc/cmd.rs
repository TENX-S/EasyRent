tonic::include_proto!("easyrent.admin.command");

use super::RpcResult;
use crate::model::agent::Agent;
use crate::sql::cmd::*;
use crate::{error::{EasyRentCommandError, Result}, AdminCmd};
use command_server::Command;
use sqlx::Row;
use sqlx::{PgPool, postgres::PgRow};
use tonic::{Request, Response, Status};
use tracing::*;


#[derive(Debug)]
pub struct Commander {
    db_pool: PgPool,
}

impl Commander {
    pub fn new(db_pool: PgPool) -> Self {
        Commander { db_pool }
    }
}

impl RpcResult for Agents {
    type Value = Vec<UnverifiedAgent>;
    type Error = EasyRentCommandError;

    fn success(value: Self::Value) -> Self {
        Agents {
            agent: value
        }
    }

    fn failure(_: Self::Error) -> Self {
        Agents {
            agent: vec![]
        }
    }
}

impl RpcResult for RentPosts {
    type Value = Vec<UnverifiedRentPost>;
    type Error = EasyRentCommandError;

    fn success(value: Self::Value) -> Self {
        RentPosts {
            rent_posts: value
        }
    }

    fn failure(_error: Self::Error) -> Self {
        RentPosts {
            rent_posts: vec![],
        }
    }
}

impl RpcResult for HelpPosts {
    type Value = Vec<UnverifiedHelpPost>;
    type Error = EasyRentCommandError;

    fn success(value: Self::Value) -> Self {
        HelpPosts {
            help_posts: value
        }
    }

    fn failure(_error: Self::Error) -> Self {
        HelpPosts {
            help_posts: vec![],
        }
    }
}

impl RpcResult for PassReply {
    type Value = ();
    type Error = EasyRentCommandError;

    fn success(_: Self::Value) -> Self {
        PassReply {
            success: true
        }
    }

    fn failure(_: Self::Error) -> Self {
        PassReply {
            success: false
        }
    }
}

#[tonic::async_trait]
impl AdminCmd for Commander {
    async fn on_load_unverified_agents(&self) -> Result<Vec<Agent>, EasyRentCommandError> {
        trace!("Load unverified agents!");
        match sqlx::query_as::<_, Agent>(FETCH_ALL_UNVERIFIED_AGENTS).fetch_all(&self.db_pool).await {
            Ok(value) => {
                trace!("Fetched {} unverified agents", value.len());
                Ok(value)
            }
            Err(_) => {
                error!("When fetching unverified agents");
                Err(EasyRentCommandError::Unknown)
            }
        }
    }

    async fn on_load_unverified_rent_posts(&self) -> Result<Vec<UnverifiedRentPost>, EasyRentCommandError> {
        trace!("Load unverified rent posts");
        match sqlx::query(FETCH_ALL_UNVERIFIED_RENT_POSTS)
            .map(|row: PgRow|
                UnverifiedRentPost {
                    name: row.get("name"),
                    phone: row.get("phone"),
                    room_addr: row.get("room_addr"),
                    room_area: row.get("room_area"),
                    room_type: row.get("room_type"),
                    room_orientation: row.get("room_orientation"),
                    room_floor: row.get("room_floor"),
                    description: row.get("description"),
                    price: row.get("price"),
                    restriction: row.get("restriction"),
                    uuid: row.get("uuid"),
                    release_time: row.get("release_time"),
                    pictures: row.get("pictures"),
                }
            )
            .fetch_all(&self.db_pool).await {
                Ok(value) => {
                    trace!("Fetched {} unverified rent posts", value.len());
                    Ok(value)
                }
                Err(_) => {
                    error!("When fetching unverified rent posts");
                    Err(EasyRentCommandError::Unknown)
                }
            }
    }

    async fn on_load_unverified_help_posts(&self) -> Result<Vec<UnverifiedHelpPost>, EasyRentCommandError> {
        trace!("Load unverified help posts");
        match sqlx::query(FETCH_ALL_UNVERIFIED_HELP_POSTS)
            .map(|row: PgRow|
                UnverifiedHelpPost {
                    name: row.get("name"),
                    phone: row.get("phone"),
                    expected_addr: row.get("expected_addr"),
                    expected_price: row.get("expected_price"),
                    demands: row.get("demands"),
                    uuid: row.get("uuid"),
                    release_time: row.get("release_time"),
                })
            .fetch_all(&self.db_pool).await {
                Ok(value) => {
                    trace!("Fetched {} unverified help posts", value.len());
                    Ok(value)
                }
                Err(_) => {
                    error!("When fetching unverified help posts");
                    Err(EasyRentCommandError::Unknown)
                }
            }
    }

    async fn on_pass_agent(&self, name: &str) -> Result<(), EasyRentCommandError> {
        if let Err(_) = sqlx::query(VERIFY_AGENT).bind(name).execute(&self.db_pool).await {
            error!("When verify the agent: {}", name);
            return Err(EasyRentCommandError::Unknown);
        }
        trace!("Verify the agent: {}", name);

        Ok(())
    }
    async fn on_pass_rent_post(&self, uuid: &str) -> Result<(), EasyRentCommandError> {
        if let Err(_) = sqlx::query(VERIFY_RENT_POST).bind(uuid).execute(&self.db_pool).await {
            error!("When verify the rent post: {}", uuid);
            return Err(EasyRentCommandError::Unknown);
        }
        trace!("Verify the rent post: {}", uuid);

        Ok(())
    }

    async fn on_pass_help_post(&self, uuid: &str) -> Result<(), EasyRentCommandError> {
        if let Err(_) = sqlx::query(VERIFY_HELP_POST).bind(uuid).execute(&self.db_pool).await {
            error!("When verify the help post: {}", uuid);
            return Err(EasyRentCommandError::Unknown);
        }
        trace!("Verify the help post: {}", uuid);

        Ok(())
    }
}

#[tonic::async_trait]
impl Command for Commander {
    async fn load_unverified_agents(&self, _: Request<LoadAgentsRequest>) ->Result<Response<Agents>,tonic::Status> {
        match self.on_load_unverified_agents().await {
            Ok(value) => {
                let mut results = Vec::new();
                value
                    .into_iter()
                    .for_each(|a| {
                        results.push(UnverifiedAgent {
                            corp: a.corp,
                            corp_id: a.corp_id,
                            com_regd_addr: a.com_regd_addr,
                            contact: a.contact,
                            name: a.name,
                        });
                    });
                Ok(Response::new(Agents::success(results)))
            }
            Err(_) => {
                Ok(Response::new(Agents::failure(EasyRentCommandError::Unknown)))
            }
        }
    }

    async fn load_unverified_rent_posts(&self, _: Request<LoadRentPostsRequest>) -> Result<Response<RentPosts>,Status> {
        match self.on_load_unverified_rent_posts().await {
            Ok(value) => {
                Ok(Response::new(RentPosts::success(value)))
            }
            Err(_) => {
                Ok(Response::new(RentPosts::failure(EasyRentCommandError::Unknown)))
            }
        }
    }

    async fn load_unverified_help_posts(&self, _: Request<LoadHelpPostsRequest>) -> Result<Response<HelpPosts>, Status> {
        match self.on_load_unverified_help_posts().await {
            Ok(value) => {
                Ok(Response::new(HelpPosts::success(value)))
            }
            Err(_) => {
                Ok(Response::new(HelpPosts::failure(EasyRentCommandError::Unknown)))
            }
        }
    }

    async fn pass_agent(&self, request: Request<PassAgentRequest>) ->Result<Response<PassReply>,Status> {
        match self.on_pass_agent(&request.into_inner().name).await {
            Ok(_) => Ok(Response::new(PassReply::success(()))),
            Err(_) => Ok(Response::new(PassReply::failure(EasyRentCommandError::Unknown))),
        }
    }

    async fn pass_rent_post(&self, request: Request<PassPostRequest>) ->Result<Response<PassReply>, Status> {
        match self.on_pass_rent_post(&request.into_inner().uuid).await {
            Ok(_) => Ok(Response::new(PassReply::success(()))),
            Err(_) => Ok(Response::new(PassReply::failure(EasyRentCommandError::Unknown))),
        }
    }

    async fn pass_help_post(&self, request: Request<PassPostRequest>) ->Result<Response<PassReply>, Status> {
        match self.on_pass_help_post(&request.into_inner().uuid).await {
            Ok(_) => Ok(Response::new(PassReply::success(()))),
            Err(_) => Ok(Response::new(PassReply::failure(EasyRentCommandError::Unknown))),
        }
    }
}
