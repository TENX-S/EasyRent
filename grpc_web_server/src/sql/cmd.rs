pub const FETCH_ALL_UNVERIFIED_AGENTS: &str = r#"
    SELECT * from agency
    WHERE verified = FALSE;
"#;

pub const FETCH_ALL_UNVERIFIED_RENT_POSTS: &str = r#"
    SELECT * FROM rent_posts
    WHERE passed = FALSE;
"#;

pub const FETCH_ALL_UNVERIFIED_HELP_POSTS: &str = r#"
    SELECT * FROM help_posts
    WHERE passed = FALSE;
"#;

pub const VERIFY_AGENT: &str = r#"
    UPDATE agency
    SET verified = TRUE
    WHERE name = $1;
"#;

pub const VERIFY_RENT_POST: &str = r#"
    UPDATE rent_posts
    set passed = TRUE
    WHERE uuid = $1;
"#;

pub const VERIFY_HELP_POST: &str = r#"
    UPDATE help_posts
    set passed = TRUE
    WHERE uuid = $1;
"#;
