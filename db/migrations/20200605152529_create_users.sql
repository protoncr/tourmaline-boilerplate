-- +micrate Up
-- SQL in section 'Up' is executed when this migration is applied
CREATE TABLE users(
    id bigserial PRIMARY KEY,
    first_name text NOT NULL,
    last_name text,
    username text,
    language_code text,
    is_bot boolean,
    created_at timestamp,
    updated_at timestamp
);

-- +micrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP TABLE users;