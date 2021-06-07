use crate::grpc::post::{SubmitRentRequest, SubmitHelpRequest,};
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

impl RentPost {
    pub fn text(&self) -> (String, String) {
        (self.uuid.clone(), vec![self.name.as_str(), self.phone.as_str(), self.room_addr.as_str(), self.room_area.to_string().as_str(),
        self.room_type.as_str(), self.room_orientation.as_str(), self.description.as_str(), self.price.to_string().as_str(),
        self.release_time.as_str()].join(" "))
    }
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

impl HelpPost {
    pub fn text(&self) -> (String, String) {
        (self.uuid.clone(), vec![self.name.as_str(), self.phone.as_str(), self.expected_addr.as_str(),
        self.expected_price.to_string().as_str(), self.demands.to_string().as_str(), self.release_time.as_str()].join(" "))
    }
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
