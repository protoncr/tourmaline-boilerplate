-- +micrate Up
-- SQL in section 'Up' is executed when this migration is applied
CREATE DATABASE telegram_bot; 

-- +micrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP DATABASE telegram_bot;