pub const LOGOUT_USER: &str = r#"
    UPDATE users
    SET online = FALSE
    WHERE name = $1;
"#;
