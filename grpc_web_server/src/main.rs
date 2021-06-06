use anyhow::Result;
use dirs_next::data_local_dir;
use tonic::transport::Server;
use tracing::*;
use tracing_subscriber::{self, fmt, subscribe::CollectExt, EnvFilter};
use grpc_web_server::utils::set_panic_hook;
use grpc_web_server::grpc::auth::AgencyAuthenticator;
use grpc_web_server::grpc::post::AgencyPostManager;
use grpc_web_server::grpc::auth::agent_auth_server::AgentAuthServer;
use grpc_web_server::grpc::post::agency_post_server::AgencyPostServer;

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
    let config = tonic_web::config().allow_origins(vec![format!("http://{}", addr)]);

    Server::builder()
        .add_service(config.enable(AgentAuthServer::new(AgencyAuthenticator::new(db_pool.clone()))))
        .add_service(config.enable(AgencyPostServer::new(AgencyPostManager::new(db_pool.clone()))))
        .serve(addr)
        .await?;

    Ok(())

}
