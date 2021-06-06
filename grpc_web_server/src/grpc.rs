pub mod auth;
pub mod post;

pub trait RpcResult {
    type Value;
    type Error;

    fn success(value: Self::Value) -> Self;
    fn failure(error: Self::Error) -> Self;
}
