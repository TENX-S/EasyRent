CREATE TABLE IF NOT EXISTS agency (
    id              BIGSERIAL PRIMARY KEY,
    corp            TEXT   NOT NULL,
    corp_id         TEXT   NOT NULL,
    com_regd_addr   TEXT   NOT NULL,
    name            TEXT   UNIQUE NOT NULL,
    password        TEXT   NOT NULL,
    verified        BOOL   NOT NULL
);
