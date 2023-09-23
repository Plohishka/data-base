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

----------------------------------


SELECT id, first_name || ' ' || last_name AS full_name
FROM users;

SELECT id, concat(first_name, ' ', last_name) AS full_name
FROM users;

SELECT id, concat(first_name, ' ',last_name) AS full_name
FROM users
WHERE char_length(concat(first_name || ' ' || last_name)) > 10;

SELECT * FROM (
    SELECT id, concat(first_name, ' ', last_name) AS full_name
    FROM users
) AS fn 
WHERE char_length(fn.full_name) > 10;

----------------------------------------------

CREATE TABLE workers (
    id serial PRIMARY KEY,
    name varchar(256) NOT NULL CHECK (name != ''),
    salary numeric(10,2) NOT NULL CHECK (salary > 0),
    birthday date CHECK (birthday < current_date)
);

INSERT INTO workers (name, birthday, salary) VALUES
('Oleg', '1990-01-01', 300);

INSERT INTO workers (name, salary) VALUES
('Yaroslava', 1200);

INSERT INTO workers (name, birthday, salary) VALUES
('Sasha', '1985-05-25', 1000),
('Masha', '1995-11-08', 900);

UPDATE workers
SET salary = 500
WHERE name = 'Oleg' AND birthday = '1990-01-01';

UPDATE workers
SET salary = 700
WHERE salary > 500;

UPDATE workers
SET birthday = '1999-01-01'
WHERE id BETWEEN 2 AND 5;

UPDATE workers
SET name = 'Zhenya', salary = 900
WHERE name = 'Sasha';

SELECT * FROM workers
WHERE salary > 400;

SELECT * FROM workers
WHERE id = 4;

SELECT salary, extract("years" from age(birthday)) FROM workers
WHERE name = 'Zhenya';

SELECT * FROM workers
WHERE name = 'Petya';

SELECT * FROM workers
WHERE extract("years" from age(birthday)) = 27 OR salary > 800;

SELECT * FROM workers
WHERE extract("years" from age(birthday)) BETWEEN 25 AND 35; 

SELECT * FROM workers
WHERE extract("month" from birthday) = 1; 

DELETE FROM workers
WHERE id = 4;

DELETE FROM workers
WHERE name = 'Oleg';

DELETE FROM workers
WHERE extract("years" from age(birthday)) > 30;

SELECT * FROM workers;


-----------------------------------

SELECT max(height)
FROM users;

SELECT avg(height)
FROM users;

SELECT count(*)
FROM users  
WHERE gender = 'female';

SELECT avg(weight)
FROM users
WHERE gender = 'male';

SELECT avg(weight), gender
FROM users
GROUP BY gender;

SELECT avg(weight)
FROM users
WHERE birthday > '2000-01-01';

SELECT avg(weight), gender
FROM users
WHERE extract('year' from age(birthday)) > 25
GROUP BY gender;

---

SELECT avg(extract('year' from age(birthday)))
FROM users;

SELECT max(extract('year' from age(birthday))), min(extract('year' from age(birthday))), gender
FROM users
GROUP BY gender;

SELECT count(*)
FROM users
WHERE birthday > '1999-01-01';

SELECT count(*)
FROM users
WHERE first_name ILIKE 'WILLIAM';

SELECT count(*) 
FROM users
WHERE extract('year' from age(birthday)) BETWEEN 20 AND 30;

SELECT count(*)
FROM users
WHERE height > 1.5;

SELECT count(*), customer_id
FROM orders
GROUP BY customer_id;

SELECT avg(price), brand
FROM products
GROUP BY brand;

SELECT sum(quantity)
FROM products;

SELECT sum(quantity)
FROM orders_to_products;


----------------------------

SELECT * FROM users
ORDER BY id ASC;

SELECT * FROM users
ORDER BY id DESC;

SELECT * FROM users
ORDER BY first_name ASC;

SELECT * FROM users
ORDER BY height, birthday;

SELECT * FROM products
ORDER BY quantity;

SELECT * FROM products
ORDER BY price DESC
LIMIT 5;

----------------

SELECT *, extract('years' from age(birthday)) FROM users
ORDER BY extract('years' from age(birthday)), first_name DESC;

SELECT * FROM (
    SELECT *, extract('years' from age(birthday)) AS age
    FROM users
) AS u_w_age
ORDER BY u_w_age.age, first_name DESC;

SELECT * FROM products
ORDER BY price;


SELECT extract('years' from age(birthday)), count(*)
FROM users
GROUP BY extract('years' from age(birthday))
ORDER BY extract('years' from age(birthday));

SELECT count(*), age FROM (
    SELECT *,  extract('years' from age(birthday)) AS age FROM users 
) AS u_w_age
GROUP BY age
HAVING count(*) >= 5
ORDER BY age;

SELECT sum(quantity), brand FROM products
GROUP BY brand
HAVING sum(quantity) > 50000
ORDER BY sum(quantity);


----------------///////////////////////////---------------------------

CREATE TABLE a 
(
    v varchar(3),
    t int
);

CREATE TABLE b (
    v varchar(3)
);

INSERT INTO a VALUES
('XXX', 1), ('XXY', 1), ('XXZ', 1),
('XYX', 2), ('XYY', 2), ('XYZ', 2),
('YXX', 3), ('YXY', 3), ('YXZ', 3);

INSERT INTO b VALUES
('ZXX'), ('XXX'), ('ZXZ'), ('YXZ'), ('YXY');

---UNION---------

SELECT v FROM a UNION
SELECT * FROM b;

---INTERSECT------------

SELECT v FROM a
INTERSECT
SELECT * FROM b;

------EXCEPT---------------

SELECT v FROM a
EXCEPT
SELECT * FROM b;

-------------------------------------

INSERT INTO users (first_name, last_name, email, birthday, gender) VALUES 
('Tester1', 'Tester1', 'test@test', '1990-02-02', 'male'),
('Tester2', 'Tester2', 'test2@test', '1990-02-02', 'male'),
('Tester3', 'Tester3', 'test3@test', '1990-02-02', 'male');

SELECT * FROM users
ORDER BY users DESC;

SELECT id FROM users INTERSECT
SELECT customer_id FROM orders;

SELECT id FROM users
EXCEPT
SELECT customer_id FROM orders;

---------JOIN---------------

SELECT * FROM a, b
WHERE a.v = b.v;

SELECT a.v AS "id", a.t AS "price", b.v AS "fone_id"
FROM a, b
WHERE a.v = b.v;

SELECT * 
FROM a JOIN b ON a.v = b.v;

SELECT u.*, o.id AS order_id 
FROM users AS u 
JOIN orders AS o
ON o.customer_id = u.id
WHERE u.id = 1865;

SELECT p.brand, p.model, otp.order_id
FROM products AS p
JOIN orders_to_products AS otp
ON p.id = otp.order_id
WHERE otp.order_id = 11;




