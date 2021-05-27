pub const ADD_RENT_POST: &str = r#"
    INSERT INTO rent_posts ( name, phone, room_addr, room_area, room_type, room_orientation, room_floor, description, price, restriction, create_by, uuid, release_time, pictures, passed )
    VALUES ( $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, FALSE );
"#;

pub const ADD_HELP_POST: &str = r#"
    INSERT INTO help_posts ( name, phone, expected_addr, expected_price, demands, create_by, uuid, release_time, passed )
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8, FALSE);
"#;

pub const PASS_RENT_POST: &str = r#"
    UPDATE rent_posts
    SET passed = TRUE
    WHERE name = $1;
"#;

pub const PASS_HELP_POST: &str = r#"
    UPDATE help_posts
    SET passed = TRUE
    WHERE name = $1;
"#;

pub const FETCH_ALL_RENT_POSTS: &str = r#"
    SELECT * FROM rent_posts;
"#;

pub const FETCH_ALL_HELP_POSTS: &str = r#"
    SELECT * FROM help_posts;
"#;

pub const FETCH_ALL_PASSED_RENT_POSTS: &str = r#"
    SELECT * FROM rent_posts
    WHERE passed = TRUE;
"#;

pub const FETCH_ALL_PASSED_HELP_POSTS: &str = r#"
    SELECT * FROM help_posts
    WHERE passed = TRUE;
"#;
