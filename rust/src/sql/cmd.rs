pub const LOAD_INIT_RENT_POSTS: &str = r#"
    SELECT * FROM rent_posts
    WHERE passed = TRUE
    LIMIT 2;
"#;

pub const LOAD_INIT_HELP_POSTS: &str = r#"
    SELECT * FROM help_posts
    WHERE passed = TRUE
    LIMIT 2;
"#;

pub const LOGOUT_USER: &str = r#"
    UPDATE users
    SET online = FALSE
    WHERE name = $1;
"#;

pub const FETCH_ALL_PASSED_RENT_POSTS: &str = r#"
    SELECT * FROM rent_posts
    WHERE passed = TRUE;
"#;

pub const FETCH_ALL_PASSED_HELP_POSTS: &str = r#"
    SELECT * FROM help_posts
    WHERE passed = TRUE;
"#;
