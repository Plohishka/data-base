CREATE SCHEMA new_schema;

CREATE TABLE new_schema.users (
    id serial PRIMARY KEY,
    first_name varchar(200) NOT NULL,
    last_name varchar(200) NOT NULL
);

CREATE TABLE new_schema.tasks (
    id serial PRIMARY KEY,
    user_id int REFERENCES new_schema.users(id),
    body text NOT NULL,
    is_done boolean DEFAULT false,
    deadline timestamp NOT NULL
);

ALTER TABLE new_schema.tasks
ALTER COLUMN deadline SET DEFAULT current_timestamp;

INSERT INTO new_schema.users (first_name, last_name) VALUES
('Iron', 'Man'),
('Thor', 'Odinsson'),
('Black', 'Widow'),
('The', 'Halk');

INSERT INTO new_schema.tasks (user_id, body) VALUES
(1, 'Greate iron suite'),
(2, 'Drink beer'),
(3, 'Get dress'),
(1, 'Go to party');

UPDATE new_schema.tasks
SET is_done = TRUE
WHERE user_id = 1;

ALTER TABLE new_schema.tasks
ADD CONSTRAINT "too_early_deadline" CHECK (deadline > '1900-01-01');

ALTER TABLE new_schema.tasks
ALTER COLUMN body TYPE varchar(500);

CREATE TYPE task_status
AS ENUM ('new', 'done', 'processing', 'expired');

ALTER TABLE new_schema.tasks 
RENAME COLUMN is_done TO status;

ALTER TABLE new_schema.tasks
ALTER COLUMN status DROP DEFAULT;

ALTER TABLE new_schema.tasks
ALTER COLUMN status
TYPE task_status USING (
    CASE status
        WHEN TRUE THEN 'new'
        WHEN FALSE THEN 'done'
        ELSE 'processing'
    END    
)::task_status;












