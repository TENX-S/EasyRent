pub mod error;
pub mod grpc;
pub mod model;
pub mod sql;
pub mod utils;

use error::{EasyRentAuthError, EasyRentPostError, Result};
use model::post::{RentPost, HelpPost};
use model::user::User;
use crate::sql::cmd::{FETCH_ALL_PASSED_RENT_POSTS, FETCH_ALL_PASSED_HELP_POSTS};
use once_cell::sync::Lazy;
use dashmap::DashMap;
use sqlx::PgPool;
use rayon::prelude::*;

static RENT_BASE: Lazy<DashMap<String, String>> = Lazy::new(|| {
    DashMap::new()
});

static HELP_BASE: Lazy<DashMap<String, String>> = Lazy::new(|| {
    DashMap::new()
});

pub async fn init_search_base(db_pool: &PgPool) {
    sqlx::query_as::<_, RentPost>(FETCH_ALL_PASSED_RENT_POSTS)
        .fetch_all(db_pool).await
        .unwrap()
        .into_par_iter()
        .for_each(|p| {
            let text = p.text();
            RENT_BASE.insert(text.0, text.1);
        });

    sqlx::query_as::<_, HelpPost>(FETCH_ALL_PASSED_HELP_POSTS)
        .fetch_all(db_pool).await
        .unwrap()
        .into_par_iter()
        .for_each(|p| {
            let text = p.text();
            HELP_BASE.insert(text.0, text.1);
        });
}

#[tonic::async_trait]
pub trait Auth {
    /// Register an user
    async fn register(&self, user: &User) -> Result<(), EasyRentAuthError>;

    /// Login an user
    async fn login(&self, user: &User) -> Result<(), EasyRentAuthError>;
}

#[tonic::async_trait]
pub trait Poster {
    /// Submit a rent post
    async fn rent(&self, post: &RentPost) -> Result<(), EasyRentPostError>;

    /// Submit a help post
    async fn help(&self, post: &HelpPost) -> Result<(), EasyRentPostError>;
}

#[tonic::async_trait]
pub trait Cmd {
    type Value;

    /// Load some posts, different with the posts already on the phone
    async fn load(&self, exist_posts: &[String]) -> Result<Self::Value>;

    /// Handle refresh request from client
    async fn refresh(&self, first: bool) -> Result<Self::Value>;

    /// Handle search request from client
    async fn search(&self, query: &str, index: i32) -> Result<Self::Value>;

    /// Logout an user
    async fn logout(&self, name: &str) -> Result<()>;
}
