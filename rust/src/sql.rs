pub const REGISTER_USER: &str =
    r#"
    INSERT INTO users ( name, password, create_time, online )
    VALUES ( $1, $2, $3, FALSE );
    "#;

pub const QUERY_USER: &str =
    r#"
    SELECT * FROM users WHERE name = $1;
    "#;

pub const ACTIVATE_USER: &str =
    r#"
    UPDATE users
    SET online = TRUE
    WHERE name = $1;
    "#;
