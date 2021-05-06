use anyhow::Result;
use dirs_next::data_local_dir;
use easy_rent_sdk::utils::set_panic_hook;
use rayon::prelude::*;
use serde::{Deserialize, Serialize};
use std::path::PathBuf;
use std::{
    fs::{canonicalize, File},
    io::Read,
};
use tracing::*;
use tracing_subscriber::{self, fmt, subscribe::CollectExt, EnvFilter};

#[derive(Debug, Serialize, Deserialize)]
struct Post {
    #[serde(rename = "houseId")]
    house_id: u32,
    publisher: String,
    province: String,
    city: String,
    description: String,

    #[serde(rename = "backroundPath")]
    backround_path: Vec<String>,

    #[serde(rename = "monthlyRent")]
    monthly_rent: u32,

    #[serde(rename = "paymentRestrictions")]
    payment_restrictions: String,

    #[serde(rename = "roomType")]
    room_type: String,

    #[serde(rename = "roomArea")]
    room_area: u32,

    #[serde(rename = "roomFloor")]
    room_floor: u8,

    orientation: String,
}

fn main() -> Result<()> {
    set_panic_hook();
    let (non_blocking, _guard) = tracing_appender::non_blocking(tracing_appender::rolling::hourly(
        data_local_dir()
            .expect("Unable to locate local data path")
            .join("EasyRent"),
        "EasyRentJsonToDB.log",
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

    trace!("Open the assets/info.json.");
    let mut info = File::open("assets/info.json")?;
    let mut info_content = String::new();
    info.read_to_string(&mut info_content)?;

    let mut posts: Vec<Post> = serde_json::from_str(&info_content)?;
    trace!("Serialized the assets/info.json: {} posts", posts.len());

    trace!("Start to transform the relative path to absolute path.");
    posts.par_iter_mut().for_each(|i| {
        i.backround_path = i
            .backround_path
            .par_iter()
            .map(|p| {
                let path = PathBuf::from(p);
                let mut segments = path.iter().collect::<Vec<_>>();
                segments.insert(1, "assets".as_ref());
                canonicalize(segments.iter().collect::<PathBuf>())
                    .unwrap()
                    .to_str()
                    .unwrap()
                    .to_string()
            })
            .collect::<Vec<_>>()
    });

    trace!("Transformation completed");

    Ok(())
}
