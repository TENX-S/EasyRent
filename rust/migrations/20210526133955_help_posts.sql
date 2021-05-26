CREATE TABLE IF NOT EXISTS help_posts (
    id                  BIGSERIAL PRIMARY KEY,
    name                TEXT NOT NULL,
    phone               TEXT NOT NULL,
    expected_addr       TEXT NOT NULL,
    expected_price      INT NOT NULL,
    demands             TEXT NOT NULL,
    create_by           TEXT NOT NULL,
    uuid                TEXT NOT NULL,
    release_time        TEXT NOT NULL,
    passed              BOOL NOT NULL
)

