use crate::grpc::post::{SubmitRentRequest, SubmitHelpRequest,};
use crate::grpc::agency::post::{RentRequest, HelpRequest};
use sqlx::FromRow;
use tonic::Request;

#[derive(Debug, FromRow)]
pub struct RentPost {
    pub id: i64,
    pub name: String,
    pub phone: String,
    pub room_addr: String,
    pub room_area: i32,
    pub room_type: String,
    pub room_orientation: String,
    pub room_floor: i32,
    pub description: String,
    pub price: i32,
    pub restriction: String,
    pub create_by: String,
    pub uuid: String,
    pub release_time: String,
    pub pictures: Vec<Vec<u8>>,
}

impl From<Request<SubmitRentRequest>> for RentPost {
    fn from(submit_rent_request: Request<SubmitRentRequest>) -> Self {
        let request = submit_rent_request.into_inner();
        RentPost {
            id: 0i64,
            name: request.name,
            phone: request.phone,
            room_addr: request.room_addr,
            room_area: request.room_area,
            room_type: request.room_type,
            room_orientation: request.room_orientation,
            room_floor: request.room_floor,
            description: request.description,
            price: request.price,
            restriction: request.restriction,
            create_by: request.create_by,
            uuid: request.uuid,
            release_time: request.release_time,
            pictures: request.pictures,
        }
    }
}

impl From<Request<RentRequest>> for RentPost {
    fn from(rent_request: Request<RentRequest>) -> Self {
        let request = rent_request.into_inner();
        RentPost {
            id: 0i64,
            name: request.name,
            phone: request.phone,
            room_addr: request.room_addr,
            room_area: request.room_area,
            room_type: request.room_type,
            room_orientation: request.room_orientation,
            room_floor: request.room_floor,
            description: request.description,
            price: request.price,
            restriction: request.restriction,
            create_by: request.create_by,
            uuid: request.uuid,
            release_time: request.release_time,
            pictures: request.pictures,
        }
    }
}

#[derive(Debug, FromRow)]
pub struct HelpPost {
    id: i64,
    pub name: String,
    pub phone: String,
    pub expected_addr: String,
    pub expected_price: i32,
    pub demands: String,
    pub create_by: String,
    pub uuid: String,
    pub release_time: String,
}

impl From<Request<SubmitHelpRequest>> for HelpPost {
    fn from(submit_help_request: Request<SubmitHelpRequest>) -> Self {
        let request = submit_help_request.into_inner();
        HelpPost {
            id: 0i64,
            name: request.name,
            phone: request.phone,
            expected_addr: request.expected_addr,
            expected_price: request.expected_price,
            demands: request.demands,
            create_by: request.create_by,
            uuid: request.uuid,
            release_time: request.release_time,
        }
    }
}

impl From<Request<HelpRequest>> for HelpPost {
    fn from(help_request: Request<HelpRequest>) -> Self {
        let request = help_request.into_inner();
        HelpPost {
            id: 0i64,
            name: request.name,
            phone: request.phone,
            expected_addr: request.expected_addr,
            expected_price: request.expected_price,
            demands: request.demands,
            create_by: request.create_by,
            uuid: request.uuid,
            release_time: request.release_time,
        }
    }
}

