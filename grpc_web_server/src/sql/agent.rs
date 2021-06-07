pub const QUERY_AGENT: &str = r#"
    SELECT * FROM agency
    WHERE name = $1;
"#;

pub const REGISTER_AGENT: &str = r#"
    INSERT INTO agency ( corp, corp_id, com_regd_addr, contact, name, password, verified )
    VALUES ( $1, $2, $3, $4, $5, $6, FALSE );
"#;

pub const VERIFY_AGENT: &str = r#"
    UPDATE agency
    SET verified = TRUE
    WHERE name = $1;
"#;
