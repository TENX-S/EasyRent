tonic::include_proto!("easyrent.command");

use super::RpcResult;
use crate::model::post::{RentPost, HelpPost};
use crate::sql::cmd::*;
use crate::{error::{EasyRentCommandError, Result}, Cmd};
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

impl RpcResult for LoadReply {
    type Value = Option<PostPackage>;
    type Error = EasyRentCommandError;

    fn success(value: Self::Value) -> Self {
        LoadReply {
            post_package: value,
        }
    }

    fn failure(_error: Self::Error) -> Self {
        LoadReply {
            post_package: None,
        }
    }
}

impl RpcResult for RefreshReply {
    type Value = Option<PostPackage>;
    type Error = EasyRentCommandError;

    fn success(value: Self::Value) -> Self {
        RefreshReply {
            post_package: value
        }
    }

    fn failure(_error: Self::Error) -> Self {
        RefreshReply {
            post_package: None,
        }
    }
}

impl RpcResult for SearchReply {
    type Value = PostPackage;
    type Error = EasyRentCommandError;

    fn success(value: Self::Value) -> Self {
        unimplemented!()
    }

    fn failure(error: Self::Error) -> Self {
        unimplemented!()
    }
}

impl RpcResult for LogoutReply {
    type Value = ();
    type Error = EasyRentCommandError;

    fn success(_: ()) -> Self {
        LogoutReply {}
    }

    fn failure(error: Self::Error) -> Self {
        LogoutReply {}
    }
}

#[tonic::async_trait]
impl Cmd for Commander {
    type Value = Option<PostPackage>;

    async fn load(&self, posts: &[String]) -> Result<Self::Value> {
        trace!("Loading post!");
        let rent_posts = sqlx::query(LOAD_RENT_POSTS)
            .bind(posts)
            .map(|row: PgRow| {
                PassedRentPost {
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
                    release_time: row.get("release"),
                    pictures: row.get("pictures"),
                }
            })
            .fetch_all(&self.db_pool)
            .await?;

        let help_posts = sqlx::query(LOAD_HELP_POSTS)
            .bind(posts)
            .map(|row: PgRow|
                PassedHelpPost {
                    name: row.get("name"),
                    phone: row.get("phone"),
                    expected_addr: row.get("expected_addr"),
                    expected_price: row.get("expected_price"),
                    demands: row.get("demands"),
                    uuid: row.get("uuid"),
                    release_time: row.get("release"),
                }
            )
            .fetch_all(&self.db_pool)
            .await?;

        return Ok(Some(PostPackage{
            rent_posts,
            help_posts,
        }));
    }

    async fn refresh(&self, first: bool) -> Result<Self::Value> {
        if first {
            trace!("First Refresh!");
            let rent_posts = sqlx::query(LOAD_INIT_RENT_POSTS)
                .map(|row: PgRow|
                    PassedRentPost {
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
                        release_time: row.get("release"),
                        pictures: row.get("pictures"),
                    }
                )
                .fetch_all(&self.db_pool)
                .await?;

            let help_posts = sqlx::query(LOAD_INIT_HELP_POSTS)
                .map(|row: PgRow|
                    PassedHelpPost {
                        name: row.get("name"),
                        phone: row.get("phone"),
                        expected_addr: row.get("expected_addr"),
                        expected_price: row.get("expected_price"),
                        demands: row.get("demands"),
                        uuid: row.get("uuid"),
                        release_time: row.get("release"),
                    }
                )
                .fetch_all(&self.db_pool)
                .await?;

            return Ok(Some(PostPackage{
                rent_posts,
                help_posts,
            }));
        }
        Ok(None)
    }

    async fn search(&self, query: &str) -> Result<Self::Value> {
        unimplemented!()
    }

    async fn logout(&self, name: &str) -> Result<()> {
        if let Err(e) = sqlx::query(LOGOUT_USER)
            .bind(name)
            .execute(&self.db_pool)
            .await
        {
            error!("{:?}", e);
        }
        Ok(())
    }
}

#[tonic::async_trait]
impl Command for Commander {
    async fn on_load(
        &self,
        request: Request<LoadRequest>,
    ) -> Result<Response<LoadReply>, Status> {
        match self.load(&request.into_inner().exist_posts).await {
            Ok(package) => {
                Ok(Response::new(LoadReply::success(package)))
            }
            Err(e) => {
                Ok(Response::new(LoadReply::failure(EasyRentCommandError::Reason(e.to_string()))))
            }
        }
    }

    async fn on_refresh(
        &self,
        request: Request<RefreshRequest>,
    ) -> Result<Response<RefreshReply>, Status> {
        match self.refresh(request.into_inner().first).await {
            Ok(package) => {
                Ok(Response::new(RefreshReply::success(package)))
            }
            Err(e) => {
                Ok(Response::new(RefreshReply::failure(EasyRentCommandError::Reason(e.to_string()))))
            }
        }
    }

    async fn on_search(
        &self,
        request: Request<SearchRequest>,
    ) -> Result<Response<SearchReply>, Status> {
        unimplemented!()
    }

    async fn on_logout(
        &self,
        request: Request<LogoutRequest>,
    ) -> Result<Response<LogoutReply>, Status> {
        match self.logout(&request.into_inner().name).await {
            Ok(_) => Ok(Response::new(LogoutReply::success(()))),
            Err(e) => Ok(Response::new(LogoutReply::failure(EasyRentCommandError::Reason(e.to_string())))),
        }
    }
}
