tonic::include_proto!("easyrent.post");

use super::RpcResult;
use crate::model::post::{RentPost, HelpPost};
use crate::sql::post::*;
use crate::{error::{EasyRentPostError, Result}, Poster};
use emit_server::Emit;
use sqlx::PgPool;
use tonic::{Request, Response, Status};
use tracing::*;

#[derive(Debug)]
pub struct PostManager {
    db_pool: PgPool,
}

impl RpcResult for SubmitReply {
    type Error = EasyRentPostError;

    fn success() -> Self {
        SubmitReply {
            success: true,
        }
    }

    fn failure(_error: Self::Error) -> Self {
        SubmitReply {
            success: false,
        }
    }
}

impl PostManager {
    pub fn new(db_pool: PgPool) -> Self {
        PostManager { db_pool }
    }
}

#[tonic::async_trait]
impl Poster for PostManager {
    async fn rent(&self, post: &RentPost) -> Result<(), EasyRentPostError> {
        if let Err(e) = sqlx::query(ADD_RENT_POST)
            .bind(&post.name)
            .bind(&post.phone)
            .bind(&post.room_addr)
            .bind(&post.room_area)
            .bind(&post.room_type)
            .bind(&post.room_orientation)
            .bind(&post.room_floor)
            .bind(&post.description)
            .bind(&post.price)
            .bind(&post.restriction)
            .bind(&post.create_by)
            .bind(&post.uuid)
            .bind(&post.release_time)
            .bind(&post.pictures)
            .execute(&self.db_pool)
            .await
        {
            error!("{:?}", e);
            return Err(EasyRentPostError::Unknown);
        }
        Ok(())
    }

    async fn help(&self, post: &HelpPost) -> Result<(), EasyRentPostError> {
        if let Err(e) = sqlx::query(ADD_HELP_POST)
            .bind(&post.name)
            .bind(&post.phone)
            .bind(&post.expected_addr)
            .bind(&post.expected_price)
            .bind(&post.demands)
            .bind(&post.create_by)
            .bind(&post.uuid)
            .bind(&post.release_time)
            .execute(&self.db_pool)
            .await
        {
            error!("{:?}", e);
            return Err(EasyRentPostError::Unknown);
        }
        Ok(())
    }
}


#[tonic::async_trait]
impl Emit for PostManager {
    async fn on_rent(
        &self,
        request: Request<SubmitRentRequest>,
    ) -> Result<Response<SubmitReply>, Status> {
        let rent_addr = request.remote_addr();
        let post: RentPost = request.into();
        info!("Get a rent request from {:?}\n{:#?}", rent_addr, post);

        match self.rent(&post).await {
            Ok(_) => {
                Ok(Response::new(SubmitReply::success()))
            }
            Err(e) => {
                Ok(Response::new(SubmitReply::failure(e)))
            }
        }

    }

    async fn on_help(
        &self,
        request: Request<SubmitHelpRequest>,
    ) -> Result<Response<SubmitReply>, Status> {
        let help_addr = request.remote_addr();
        let post: HelpPost = request.into();
        info!("Get a help request from {:?}\n{:#?}", help_addr, post);

        match self.help(&post).await {
            Ok(_) => {
                Ok(Response::new(SubmitReply::success()))
            }
            Err(e) => {
                Ok(Response::new(SubmitReply::failure(e)))
            }
        }
    }
}
