pub mod auth;
pub mod post;
pub mod command;

pub trait RpcResult {
    type Error;

    fn success() -> Self;
    fn failure(error: Self::Error) -> Self;
}
