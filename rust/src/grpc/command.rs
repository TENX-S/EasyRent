tonic::include_proto!("easyrent.command");

use super::RpcResult;
use crate::{RENT_BASE, HELP_BASE};
use crate::sql::cmd::*;
use crate::{error::{EasyRentCommandError, Result}, Cmd};
use command_server::Command;
use sqlx::Row;
use sqlx::{PgPool, postgres::PgRow};
use tonic::{Request, Response, Status};
use tracing::*;

#[derive(Debug)]
pub struct Commander {
    db_pool: PgPool,
}

impl Commander {
    pub async fn new(db_pool: PgPool) -> Self {
        Commander { db_pool }
    }
}

impl RpcResult for LoadReply {
    type Value = Option<PostPackage>;
    type Error = EasyRentCommandError;

    fn success(value: Self::Value) -> Self {
        LoadReply {
            post_package: value,
        }
    }

    fn failure(_error: Self::Error) -> Self {
        LoadReply {
            post_package: None,
        }
    }
}

impl RpcResult for RefreshReply {
    type Value = Option<PostPackage>;
    type Error = EasyRentCommandError;

    fn success(value: Self::Value) -> Self {
        RefreshReply {
            post_package: value
        }
    }

    fn failure(_error: Self::Error) -> Self {
        RefreshReply {
            post_package: None,
        }
    }
}

impl RpcResult for SearchReply {
    type Value = Option<PostPackage>;
    type Error = EasyRentCommandError;

    fn success(value: Self::Value) -> Self {
        SearchReply {
            post_package: value
        }
    }

    fn failure(_error: Self::Error) -> Self {
        SearchReply {
            post_package: None
        }
    }
}

impl RpcResult for LogoutReply {
    type Value = ();
    type Error = EasyRentCommandError;

    fn success(_: ()) -> Self {
        LogoutReply {}
    }

    fn failure(_: Self::Error) -> Self {
        LogoutReply {}
    }
}

#[tonic::async_trait]
impl Cmd for Commander {
    type Value = Option<PostPackage>;

    async fn load(&self, posts: &[String]) -> Result<Self::Value> {
        trace!("Loading rent post!");
        let r_sql;
        if posts.is_empty() {
            r_sql = r#"
            SELECT * FROM rent_posts
            WHERE passed = TRUE
            LIMIT 2;"#.to_string();
        } else {
            let param: String = posts
                .iter()
                .map(|p| format!("'{}'", p))
                .collect::<Vec<_>>()
                .join(", ");
            r_sql = format!(r#"
            SELECT * FROM rent_posts
            WHERE passed = TRUE AND uuid NOT IN ({})
            LIMIT 2;"#, param.as_str());
        }
        trace!("{}", r_sql);
        let rent_posts = sqlx::query(&r_sql)
            .map(|row: PgRow| {
                PassedRentPost {
                    name: row.get("name"),
                    phone: row.get("phone"),
                    room_addr: row.get("room_addr"),
                    room_area: row.get("room_area"),
                    room_type: row.get("room_type"),
                    room_orientation: row.get("room_orientation"),
                    room_floor: row.get("room_floor"),
                    description: row.get("description"),
                    price: row.get("price"),
                    restriction: row.get("restriction"),
                    uuid: row.get("uuid"),
                    release_time: row.get("release_time"),
                    pictures: row.get("pictures"),
                }
            })
            .fetch_all(&self.db_pool)
            .await?;
        trace!("Fetch {} rent posts", rent_posts.len());

        trace!("Loading help post!");
        let h_sql;
        if posts.is_empty() {
            h_sql = r#"
            SELECT * FROM help_posts
            WHERE passed = TRUE
            LIMIT 2;"#.to_string();
        } else {
            let param: String = posts
                .iter()
                .map(|p| format!("'{}'", p))
                .collect::<Vec<_>>()
                .join(", ");
            h_sql = format!(r#"
            SELECT * FROM help_posts
            WHERE passed = TRUE AND uuid NOT IN ({})
            LIMIT 2;"#, param.as_str());
        }
        trace!("{}", h_sql);
        let help_posts = sqlx::query(&h_sql)
            .map(|row: PgRow|
                PassedHelpPost {
                    name: row.get("name"),
                    phone: row.get("phone"),
                    expected_addr: row.get("expected_addr"),
                    expected_price: row.get("expected_price"),
                    demands: row.get("demands"),
                    uuid: row.get("uuid"),
                    release_time: row.get("release_time"),
                }
            )
            .fetch_all(&self.db_pool)
            .await?;
        trace!("Fetch {} help posts", help_posts.len());

        Ok(Some(PostPackage{
            rent_posts,
            help_posts,
        }))
    }

    async fn refresh(&self, first: bool) -> Result<Self::Value> {
        if first {
            trace!("First refresh!");
            let rent_posts = sqlx::query(LOAD_INIT_RENT_POSTS)
                .map(|row: PgRow|
                    PassedRentPost {
                        name: row.get("name"),
                        phone: row.get("phone"),
                        room_addr: row.get("room_addr"),
                        room_area: row.get("room_area"),
                        room_type: row.get("room_type"),
                        room_orientation: row.get("room_orientation"),
                        room_floor: row.get("room_floor"),
                        description: row.get("description"),
                        price: row.get("price"),
                        restriction: row.get("restriction"),
                        uuid: row.get("uuid"),
                        release_time: row.get("release_time"),
                        pictures: row.get("pictures"),
                    }
                )
                .fetch_all(&self.db_pool)
                .await?;
            trace!("Fetch {} rent posts", rent_posts.len());

            let help_posts = sqlx::query(LOAD_INIT_HELP_POSTS)
                .map(|row: PgRow|
                    PassedHelpPost {
                        name: row.get("name"),
                        phone: row.get("phone"),
                        expected_addr: row.get("expected_addr"),
                        expected_price: row.get("expected_price"),
                        demands: row.get("demands"),
                        uuid: row.get("uuid"),
                        release_time: row.get("release_time"),
                    }
                )
                .fetch_all(&self.db_pool)
                .await?;
            trace!("Fetch {} help posts", help_posts.len());

            return Ok(Some(PostPackage{
                rent_posts,
                help_posts,
            }));
        }
        Ok(None)
    }

    async fn search(&self, query: &str, index: i32) -> Result<Self::Value> {
        trace!("{:#?}", RENT_BASE);
        trace!("[SEARCH] : query: {}, index: {}", query, index);
        let mut result = Vec::new();
        if index == 0 {
            RENT_BASE.clone().into_iter().for_each(|(u, t)| {
                if t.contains(query) {
                    result.push(u);
                }
            });
            trace!("{:#?}", result);
            let param = result.iter().map(|u| format!(r#"'{}'"#, u)).collect::<Vec<_>>().join(", ");
            if result.is_empty() {
                return Ok(None);
            }
            let s_sql = format!(r#"
                SELECT * from rent_posts
                WHERE uuid IN ({})
                LIMIT 1;
            "#, param);
            trace!("[SEARCH] : {} ", s_sql);
            let rent_posts = sqlx::query(&s_sql)
            .map(|row: PgRow| {
                PassedRentPost {
                    name: row.get("name"),
                    phone: row.get("phone"),
                    room_addr: row.get("room_addr"),
                    room_area: row.get("room_area"),
                    room_type: row.get("room_type"),
                    room_orientation: row.get("room_orientation"),
                    room_floor: row.get("room_floor"),
                    description: row.get("description"),
                    price: row.get("price"),
                    restriction: row.get("restriction"),
                    uuid: row.get("uuid"),
                    release_time: row.get("release_time"),
                    pictures: row.get("pictures"),
                }
            })
            .fetch_all(&self.db_pool)
            .await?;
            trace!("[SEARCH] : Fetch {} rent posts", rent_posts.len());
            Ok(Some(
                PostPackage {
                    rent_posts,
                    help_posts: vec![],
                }
            ))
        } else if index == 1 {
            HELP_BASE.clone().into_iter().for_each(|(u, t)| {
                if t.contains(query) {
                    result.push(u);
                }
            });
            trace!("{:#?}", result);
            let param = result.iter().map(|u| format!(r#"'{}'"#, u)).collect::<Vec<_>>().join(", ");
            if result.is_empty() {
                return Ok(None);
            }
            let s_sql = format!(r#"
                SELECT * from help_posts
                WHERE uuid IN ({})
                LIMIT 1;"#, param);
            trace!("[SEARCH] : {} ", s_sql);
            let help_posts = sqlx::query(&s_sql)
            .map(|row: PgRow|
                PassedHelpPost {
                    name: row.get("name"),
                    phone: row.get("phone"),
                    expected_addr: row.get("expected_addr"),
                    expected_price: row.get("expected_price"),
                    demands: row.get("demands"),
                    uuid: row.get("uuid"),
                    release_time: row.get("release_time"),
                }
            )
            .fetch_all(&self.db_pool)
            .await?;
            trace!("[SEARCH] : Fetch {} help posts", help_posts.len());
            Ok(Some(
                PostPackage {
                    rent_posts: vec![],
                    help_posts,
                }
            ))
        } else {
            return Err(anyhow::anyhow!(EasyRentCommandError::Unknown));
        }
    }

    async fn logout(&self, name: &str) -> Result<()> {
        if let Err(e) = sqlx::query(LOGOUT_USER)
            .bind(name)
            .execute(&self.db_pool)
            .await
        {
            error!("{:?}", e);
        }
        Ok(())
    }
}

#[tonic::async_trait]
impl Command for Commander {
    async fn on_load(
        &self,
        request: Request<LoadRequest>,
    ) -> Result<Response<LoadReply>, Status> {
        match self.load(&request.into_inner().exist_posts).await {
            Ok(package) => {
                Ok(Response::new(LoadReply::success(package)))
            }
            Err(_) => {
                Ok(Response::new(LoadReply::failure(EasyRentCommandError::Unknown)))
            }
        }
    }

    async fn on_refresh(
        &self,
        request: Request<RefreshRequest>,
    ) -> Result<Response<RefreshReply>, Status> {
        match self.refresh(request.into_inner().first).await {
            Ok(package) => {
                Ok(Response::new(RefreshReply::success(package)))
            }
            Err(_) => {
                Ok(Response::new(RefreshReply::failure(EasyRentCommandError::Unknown)))
            }
        }
    }

    async fn on_search(
        &self,
        request: Request<SearchRequest>,
    ) -> Result<Response<SearchReply>, Status> {
        let search = request.into_inner();
        match self.search(&search.query, search.index).await {
            Ok(value) => Ok(Response::new(SearchReply::success(value))),
            Err(_) => Ok(Response::new(SearchReply::failure(EasyRentCommandError::Unknown)))
        }
    }

    async fn on_logout(
        &self,
        request: Request<LogoutRequest>,
    ) -> Result<Response<LogoutReply>, Status> {
        match self.logout(&request.into_inner().name).await {
            Ok(_) => Ok(Response::new(LogoutReply::success(()))),
            Err(_) => Ok(Response::new(LogoutReply::failure(EasyRentCommandError::Unknown))),
        }
    }
}
