use anyhow::Result;
use rayon::prelude::*;
use serde::{Deserialize, Serialize};
use std::path::PathBuf;
use std::{
    fs::{canonicalize, File},
    io::Read,
};
use tracing::{info, trace};
use tracing_subscriber;

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
    tracing_subscriber::fmt()
        .pretty()
        .with_thread_names(true)
        .with_max_level(tracing::Level::TRACE)
        .init();

    trace!("Open the assets/info.json.");
    let mut info = File::open("assets/info.json")?;
    let mut info_content = String::new();
    info.read_to_string(&mut info_content)?;

    let mut posts: Vec<Post> = serde_json::from_str(&info_content)?;
    trace!("Serialized the assets/info.json: {} posts", posts.len());

    trace!("Start to transform the relative path to absolute one.");
    posts.par_iter_mut().for_each(|i| {
        i.backround_path = i
            .backround_path
            .par_iter()
            .map(|p| {
                let path = PathBuf::from(p);
                let mut segements = path.iter().collect::<Vec<_>>();
                segements.insert(1, "assets".as_ref());
                canonicalize(segements.iter().collect::<PathBuf>())
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
