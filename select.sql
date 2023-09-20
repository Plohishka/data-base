SELECT id, first_name, last_name FROM users;

SELECT * FROM users
WHERE id = 1500;

SELECT * FROM users
WHERE gender = 'male';

SELECT * FROM users
WHERE gender = 'male' AND is_subscribe;

SELECT * FROM users
WHERE id % 2 = 0 AND gender = 'female' AND is_subscribe = false;

SELECT email FROM users
WHERE is_subscribe;

