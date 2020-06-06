-- +micrate Up
-- SQL in section 'Up' is executed when this migration is applied
CREATE TABLE chat_members(
    id bigserial PRIMARY KEY,

    chat_id bigserial,
    user_id bigserial,
    
    created_at timestamp,
    updated_at timestamp,

    FOREIGN KEY(chat_id) REFERENCES chats(id),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

-- +micrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP TABLE chat_members;