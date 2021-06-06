use anyhow::Result;
use dirs_next::data_local_dir;
use easy_rent_sdk::grpc::auth::authenticate_server::AuthenticateServer;
use easy_rent_sdk::grpc::auth::UserAuthenticator;
use easy_rent_sdk::grpc::command::command_server::CommandServer;
use easy_rent_sdk::grpc::command::Commander;
use easy_rent_sdk::grpc::post::emit_server::EmitServer;
use easy_rent_sdk::grpc::post::UserPostManager;
use easy_rent_sdk::grpc::agency::auth::agent_auth_server::AgentAuthServer;
use easy_rent_sdk::grpc::agency::auth::AgencyAuthenticator;
use easy_rent_sdk::grpc::agency::post::agency_post_server::AgencyPostServer;
use easy_rent_sdk::grpc::agency::post::AgencyPostManager;
use easy_rent_sdk::utils::set_panic_hook;
use tonic::transport::Server;
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
    let addr = dotenv::var("LISTEN_ADDR")?.parse()?;
    let db_pool = sqlx::PgPool::connect(&dotenv::var("DATABASE_URL")?).await?;

    trace!("Start to serve at {}", addr);
    Server::builder()
        .add_service(AuthenticateServer::new(UserAuthenticator::new(db_pool.clone())))
        .add_service(EmitServer::new(UserPostManager::new(db_pool.clone())))
        .add_service(CommandServer::new(Commander::new(db_pool.clone())))
        .add_service(AgentAuthServer::new(AgencyAuthenticator::new(db_pool.clone())))
        .add_service(AgencyPostServer::new(AgencyPostManager::new(db_pool.clone())))
        .serve(addr)
        .await?;

    Ok(())
}
