use anyhow::Result;
use dirs_next::data_local_dir;
use easy_rent_sdk::utils::set_panic_hook;
use rand::{Rng, thread_rng};
use rayon::prelude::*;
use serde::{Deserialize, Serialize};
use std::path::PathBuf;
use std::{
    fs::{canonicalize, File},
    io::Read,
};
use tracing::*;
use tracing_subscriber::{self, fmt, subscribe::CollectExt, EnvFilter};
use easy_rent_sdk::{model::post::RentPost, sql::post::ADD_RENT_POST};
use faker_rand::en_us::internet::Email;

#[derive(Debug, Serialize, Deserialize, Clone)]
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

    #[serde(skip)]
    email: String,
}

fn random_phone_number() -> String {
    let possible_header_prefixes = vec![13, 14, 15, 16, 17, 18, 19];
    let rand_num = || {
        thread_rng().gen_range(0..=9)
    };
    let last = rand_num().to_string();
    let header = possible_header_prefixes[thread_rng().gen_range(0..=6)].to_string() + &last;
    let mut suffix = String::new();
    for _ in 0..8 {
        suffix += &rand_num().to_string();
    }
    header + &suffix
}

fn random_time() -> String {
    let years = vec![2019, 2020, 2021];
    let months = (1..=12).collect::<Vec<_>>();
    let days = |upper_bound| (1..=upper_bound).collect::<Vec<_>>();

    let hours = (0..=23).collect::<Vec<_>>();
    let minutes = (0..=59).collect::<Vec<_>>();
    let seconds = (0..=59).collect::<Vec<_>>();

    let rnd_y = years[thread_rng().gen_range(0..=2)].to_string();
    let rnd_month = months[thread_rng().gen_range(0..11)].to_string();
    let rnd_d: String;

    if rnd_y == 2020.to_string() {
        if rnd_month == 2.to_string() {
            let all_days = days(29);
            rnd_d = all_days[thread_rng().gen_range(0..=28)].to_string();
        } else if ["1", "3", "5", "7", "8", "10", "12"].contains(&rnd_month.as_ref()) {
            let all_days = days(31);
            rnd_d = all_days[thread_rng().gen_range(0..=30)].to_string();
        } else {
            let all_days = days(30);
            rnd_d = all_days[thread_rng().gen_range(0..=29)].to_string();
        }
    } else {
        if rnd_month == 2.to_string() {
            let all_days = days(28);
            rnd_d = all_days[thread_rng().gen_range(0..=27)].to_string();
        } else if ["1", "3", "5", "7", "8", "10", "12"].contains(&rnd_month.as_ref()) {
            let all_days = days(31);
            rnd_d = all_days[thread_rng().gen_range(0..=30)].to_string();
        } else {
            let all_days = days(30);
            rnd_d = all_days[thread_rng().gen_range(0..=29)].to_string();
        }
    }

    let rnd_h = hours[thread_rng().gen_range(0..=23)].to_string();

    let rnd_minute = minutes[thread_rng().gen_range(0..=59)].to_string();

    let rnd_s = seconds[thread_rng().gen_range(0..59)].to_string();

    format!("{}-{:0>2}-{:0>2} {:0>2}:{:0>2}:{:0>2}", rnd_y, rnd_month, rnd_d, rnd_h, rnd_minute, rnd_s)

}

impl From<Post> for RentPost {
    fn from(post: Post) -> Self {
        let name = post.publisher.clone();
        let phone = random_phone_number();
        let room_addr: String = [post.province.clone(), post.city.clone()].join("");
        let pictures = post
            .backround_path
            .iter()
            .map(|p| {
                let mut bytes = vec![];
                File::open(p).unwrap().read_to_end(&mut bytes).unwrap();
                bytes
            })
            .collect();
        RentPost {
            id: 0i64,
            name,
            phone,
            room_addr,
            room_area: post.room_area as i32,
            room_type: post.room_type.clone(),
            room_orientation: post.orientation.clone(),
            room_floor: post.room_floor as i32,
            description: post.description.clone(),
            price: post.monthly_rent as i32,
            restriction: post.payment_restrictions.clone(),
            create_by: post.email,
            uuid: uuid::Uuid::new_v4().to_string(),
            release_time: random_time(),
            pictures,
        }

    }
}

#[tokio::main]
async fn main() -> Result<()> {
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
        i.email = thread_rng().gen::<Email>().to_string();
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

    let rent_posts = posts
        .par_iter()
        .map(|p| {
            let r: RentPost = p.clone().into();
            r
        })
        .collect::<Vec<_>>();

    let db_pool = sqlx::PgPool::connect(&dotenv::var("DATABASE_URL")?).await?;

    for post in &rent_posts {
        if let Err(e) = sqlx::query(ADD_RENT_POST)
            .bind(&post.name)
            .bind(&post.phone)
            .bind(&post.room_addr)
            .bind(&post.room_area)
            .bind(&post.room_type)
            .bind(&post.room_orientation)
            .bind(&post.room_floor)
            .bind(&post.description)
            .bind(&post.price)
            .bind(&post.restriction)
            .bind(&post.create_by)
            .bind(&post.uuid)
            .bind(&post.release_time)
            .bind(&post.pictures)
            .execute(&db_pool)
            .await
        {
            error!("{:?}", e);
        }
    }

    // let fields = rent_posts
    //     .iter()
    //     .map(|r|
    //         vec![
    //             r.name.clone(),
    //             r.phone.clone(),
    //             r.room_addr.clone(),
    //             r.room_area.to_string().clone(),
    //             r.room_type.clone(),
    //             r.room_orientation.clone(),
    //             r.room_floor.to_string().clone(),
    //             r.description.clone(),
    //             r.price.to_string().clone(),
    //             r.restriction.clone(),
    //             r.create_by.clone(),
    //             r.uuid.clone(),
    //             r.release_time.clone(),
    //         ]
    //     )
    //     .collect::<Vec<_>>();
    // trace!("{:#?}", fields);

    trace!("Transformation completed");

    Ok(())
}
