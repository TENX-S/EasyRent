tonic::include_proto!("easyrent.agency.post");

use agency_post_server::AgencyPost;
use super::RpcResult;
use crate::model::post::{RentPost, HelpPost};
use crate::sql::post::*;
use crate::{error::{EasyRentPostError, Result}, Poster};
use sqlx::PgPool;
use tonic::{Request, Response, Status};
use tracing::*;

#[derive(Debug)]
pub struct AgencyPostManager {
    db_pool: PgPool,
}

impl RpcResult for SubmitReply {
    type Value = ();
    type Error = EasyRentPostError;

    fn success(_: ()) -> Self {
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

impl AgencyPostManager {
    pub fn new(db_pool: PgPool) -> Self {
        AgencyPostManager { db_pool }
    }
}

#[tonic::async_trait]
impl Poster for AgencyPostManager {
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
        trace!("Post : {} submit successfully!", post.uuid);
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
        trace!("Post : {} submit successfully!", post.uuid);
        Ok(())
    }
}


#[tonic::async_trait]
impl AgencyPost for AgencyPostManager {
    async fn on_rent(
        &self,
        request: Request<RentRequest>,
    ) -> Result<Response<SubmitReply>, Status> {
        let rent_addr = request.remote_addr();
        let post: RentPost = request.into();
        let fields = vec![
            format!("name : {}", post.name),
            format!("phone : {}", post.phone),
            format!("addr : {}", post.room_addr),
            format!("roomArea : {}", post.room_area.to_string()),
            format!("roomType : {}", post.room_type),
            format!("roomOrientation : {}", post.room_orientation),
            format!("roomFloor : {}", post.room_floor.to_string()),
            format!("description : {}", post.description),
            format!("price : {}", post.price.to_string()),
            format!("restriction : {}", post.restriction),
            format!("createBy : {}", post.create_by),
            format!("uuid : {}", post.uuid),
            format!("releaseTime : {}", post.release_time),
            format!("picture numbers: {}", post.pictures.len()),
        ];
        info!("Get a rent request from {:?}\n{:#?}", rent_addr, fields);

        match self.rent(&post).await {
            Ok(_) => {
                Ok(Response::new(SubmitReply::success(())))
            }
            Err(e) => {
                Ok(Response::new(SubmitReply::failure(e)))
            }
        }
    }

    async fn on_help(
        &self,
        request: Request<HelpRequest>,
    ) -> Result<Response<SubmitReply>, Status> {
        let help_addr = request.remote_addr();
        let post: HelpPost = request.into();
        info!("Get a help request from {:?}\n{:#?}", help_addr, post);

        match self.help(&post).await {
            Ok(_) => {
                Ok(Response::new(SubmitReply::success(())))
            }
            Err(e) => {
                Ok(Response::new(SubmitReply::failure(e)))
            }
        }
    }
}
