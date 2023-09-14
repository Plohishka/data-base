DROP TABLE books;

CREATE TABLE books(
    name varchar(300),
    author varchar(300),
    type varchar(150),
    pages int,
    year date,
    publisher varchar(256)
);

DROP TABLE users;

CREATE TABLE users (
    id serial PRIMARY KEY,
    first_name varchar(256) NOT NULL CHECK (first_name != ''),
    last_name varchar(256) NOT NULL CHECK (first_name != ''),
    email varchar(300) NOT NULL UNIQUE CHECK (first_name != ''),
    birthday date CHECK (birthday < current_date),
    gender varchar(100) CHECK (first_name != '')
);

ALTER TABLE users 
ADD COLUMN height numeric(3,2);

ALTER TABLE users
ADD COLUMN weight numeric(5,2) CHECK (weight > 0);

ALTER TABLE users
ADD CONSTRAINT "early_date" CHECK (birthday > '1990-01-01');

ALTER TABLE users 
ADD CONSTRAINT "to_high_user" CHECK (height <= 4.0);

ALTER TABLE users
DROP COLUMN weight;

ALTER TABLE users
DROP CONSTRAINT "to_high_user";

INSERT INTO users (first_name, last_name, email, birthday, gender, height, weight) VALUES 
('Clark', 'Kent', 'super@man.com', '2022-09-09', 'male', '2.04', '75'),
('Iron', 'Man', 'tony@stark.com', '1991-02-02', 'male', '1.98', '68.4'),
('Spider', 'Man', 'spider@man.com', '1998-10-10', 'male', '1.67', '68');


INSERT INTO messages VALUES 
('hello text', 'test user', NULL, false);

INSERT INTO messages (author, body) VALUES 
('test user', 'hello text'),
('test user2', 'hello to you');


CREATE TABLE products(
    id serial PRIMARY KEY,
    name varchar(100) NOT NULL CHECK (name != ''),
    category varchar(100),
    price numeric(10,2) NOT NULL CHECK (price > 0),
    quantity int CHECK (quantity > 0)
);

INSERT INTO products (name, price, quantity)
VALUES 
('Samsung', 100, 5),
('iPhone', 500, 1),
('Sony', 200, 3);


CREATE TABLE orders(
    id serial PRIMARY KEY,
    created_at timestamp DEFAULT current_timestamp,
    customer_id int REFERENCES users(id)
);

INSERT INTO orders (customer_id) VALUES
(3), (3), (4), (3), (5);

CREATE TABLE orders_to_products(
    product_id int REFERENCES products(id),
    order_id int REFERENCES orders(id),
    quantity int CHECK (quantity > 0),
    PRIMARY KEY (product_id, order_id)
);

INSERT INTO orders_to_products (product_id, order_id, quantity) VALUES
(1, 6, 1),
(2, 6, 1),
(3, 6, 1);


/*  CHAT  */


CREATE TABLE messages (
id serial PRIMARY KEY,    
body text NOT NULL CHECK (body != ''),
author_id int REFERENCES users(id),
chat_id int REFERENCES chats(id),
created_at timestamp NOT NULL CHECK (created_at <= current_timestamp) DEFAULT current_timestamp,
is_read boolean NOT NULL DEFAULT false
);


CREATE TABLE chats (
    id serial PRIMARY KEY,
    chat_name varchar(256) NOT NULL CHECK (chat_name != ''),
    created_at timestamp NOT NULL CHECK (created_at <= current_timestamp) DEFAULT current_timestamp
);



CREATE TABLE chats_to_users (
    chat_id int REFERENCES chats(id),
    user_id int REFERENCES users(id),
    PRIMARY KEY (chat_id, user_id)
);

INSERT INTO chats (chat_name) VALUES
('First chat');

INSERT INTO chats_to_users VALUES
(5, 3), (5, 4), (5, 5);

INSERT INTO messages (body, author_id, chat_id) VALUES
('Heello', 3, 5),
('Hey', 4, 5),
('So', 5, 5);

