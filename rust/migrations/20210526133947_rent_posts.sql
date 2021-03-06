CREATE TABLE IF NOT EXISTS rent_posts (
    id                  BIGSERIAL PRIMARY KEY,
    name                TEXT NOT NULL,
    phone               TEXT NOT NULL,
    room_addr           TEXT NOT NULL,
    room_area           INT NOT NULL,
    room_type           TEXT NOT NULL,
    room_orientation    TEXT NOT NULL,
    room_floor          INT NOT NULL,
    description         TEXT NOT NULL,
    price               INT NOT NULL,
    restriction         TEXT NOT NULL,
    create_by           TEXT NOT NULL,
    uuid                TEXT NOT NULL,
    release_time        TEXT NOT NULL,
    pictures            bytea[] NOT NULL,
    passed              BOOL NOT NULL
)
