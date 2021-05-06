use anyhow::Result;
use tonic::transport::Server;
use dirs_next::data_local_dir;
use easy_rent_sdk::grpc::authenticate_server::AuthenticateServer;
use easy_rent_sdk::grpc::auth::Authenticator;
use easy_rent_sdk::utils::set_panic_hook;
use tracing::*;
use tracing_subscriber::{self, fmt, subscribe::CollectExt, EnvFilter};

#[tokio::main]
async fn main() -> Result<()> {
    set_panic_hook();
    let (non_blocking, _guard) = tracing_appender::non_blocking(tracing_appender::rolling::hourly(
        data_local_dir()
            .expect("Unable to locate local data path")
            .join("EasyRent"),
        "EasyRentServer.log",
    ));

    tracing::collect::set_global_default(
        tracing_subscriber::registry()
            .with(EnvFilter::from_default_env().add_directive(tracing::Level::TRACE.into()))
            .with(
                fmt::Subscriber::new()
                    .pretty()
                    .with_thread_ids(true)
                    .with_thread_names(true)
                    .with_writer(std::io::stdout),
            )
            .with(
                fmt::Subscriber::new()
                    .with_ansi(false)
                    .with_thread_ids(true)
                    .with_thread_names(true)
                    .with_writer(non_blocking),
            ),
    )?;

    trace!("Start to serve at ");

    Server::builder()
        .add_service(AuthenticateServer::new(Authenticator::init().await?))
        .serve("127.0.0.1:8080".parse().unwrap())
        .await?;

    Ok(())
}
