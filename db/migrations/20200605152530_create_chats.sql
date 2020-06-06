-- +micrate Up
-- SQL in section 'Up' is executed when this migration is applied
CREATE TABLE chats(
    id bigserial PRIMARY KEY,
    type text NOT NULL,
    title text,
    username text,
    first_name text,
    last_name text,
    description text,

    created_at timestamp,
    updated_at timestamp
);

-- +micrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP TABLE chats;