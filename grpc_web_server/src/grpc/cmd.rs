tonic::include_proto!("easyrent.admin.command");

use super::RpcResult;
use crate::model::agent::Agent;
use crate::model::post::{RentPost, HelpPost,};
use crate::sql::cmd::*;
use crate::{error::{EasyRentCommandError, Result}, AdminCmd};
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
    pub fn new(db_pool: PgPool) -> Self {
        Commander { db_pool }
    }
}

impl RpcResult for Agents {
    type Value = Vec<UnverifiedAgent>;
    type Error = EasyRentCommandError;

    fn success(value: Self::Value) -> Self {
        Agents {
            agent: value
        }
    }

    fn failure(error: Self::Error) -> Self {
        Agents {
            agent: vec![]
        }
    }
}

impl RpcResult for Posts {
    type Value = Option<PostPackage>;
    type Error = EasyRentCommandError;

    fn success(value: Self::Value) -> Self {
        Posts {
            posts: value,
        }
    }

    fn failure(_error: Self::Error) -> Self {
        Posts {
            posts: None,
        }
    }
}

