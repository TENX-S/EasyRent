CREATE TABLE IF NOT EXISTS users (
    id          BIGSERIAL PRIMARY KEY,
    name        TEXT    UNIQUE NOT NULL,
    password    TEXT    NOT NULL,
    create_time TEXT    NOT NULL,
    online      BOOL    NOT NULL
);
