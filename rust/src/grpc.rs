pub mod auth;
pub mod command;
pub mod post;

pub trait RpcResult {
    type Error;

    fn success() -> Self;
    fn failure(error: Self::Error) -> Self;
}

// macro_rules! impl_rpc_result {
//     ($target: ty, $error: ty) => {
//         impl RpcResult for $target {
//             type Error = $error;
//             fn success() -> Self {
//                 LoginReply {
//                     success: true,
//                     error: None,
//                 }
//             }
//
//             fn failure(error: AuthError) -> Self {
//                 LoginReply {
//                     success: false,
//                     error: Some(error.into()),
//                 }
//             }
//         }
//     };
// }
