pub mod auth;
pub mod command;
pub mod post;
pub mod agency;
pub mod admin;

pub trait RpcResult {
    type Value;
    type Error;

    fn success(value: Self::Value) -> Self;
    fn failure(error: Self::Error) -> Self;
}
