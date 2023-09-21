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

SELECT * FROM users
WHERE first_name = 'William';

SELECT * FROM users
WHERE first_name IN ('Ernest', 'Clark', 'William');

SELECT * FROM users
WHERE id IN (1, 10, 100, 1000);

SELECT * FROM users
WHERE id > 1500 AND id < 1800;

SELECT * FROM users
WHERE id BETWEEN 1500 AND 1800;



SELECT * FROM users
WHERE first_name LIKE 'K%';

SELECT * FROM users
WHERE first_name LIKE '_____';

SELECT * FROM users
WHERE first_name LIKE '%a';

UPDATE users
SET weight = 60
WHERE id BETWEEN 1420 AND 1470;

UPDATE users
SET weight = 70
WHERE id % 5 = 0;




SELECT first_name, extract("years" from age(birthday)) FROM users;

SELECT age(birthday) FROM users;

SELECT * FROM users
WHERE extract("years" from age(birthday)) > 25;

SELECT email FROM users
WHERE gender = 'male' AND (extract("years" from age(birthday)) BETWEEN 18 AND 60);

SELECT * FROM users
WHERE extract("months" from birthday) = 10;

SELECT email FROM users
WHERE extract("days" from birthday) = 1 AND extract("months" from birthday) = 11;

UPDATE users
SET height = 2.0
WHERE extract("years" from age(birthday)) > 60;

UPDATE users
SET weight = 80
WHERE gender = 'male' AND (extract("years" from age(birthday)) BETWEEN 30 AND 50);



SELECT * FROM users AS u
WHERE u.id = 1500;

---  pagination ---

SELECT *
FROM users
LIMIT 10;


SELECT * FROM users
LIMIT 10 
OFFSET 10;


SELECT * FROM orders
LIMIT 50
OFFSET 100;
