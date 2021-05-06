use anyhow::Result;
use tonic::transport::Server;
use easy_rent_sdk::grpc::authenticate_server::AuthenticateServer;
use easy_rent_sdk::grpc::auth::Authenticator;

#[tokio::main]
async fn main() -> Result<()> {
    Server::builder()
        .add_service(AuthenticateServer::new(Authenticator::init().await?))
        .serve("127.0.0.1:8080".parse().unwrap())
        .await?;

    Ok(())
}
