SELECT * , (
    CASE
        WHEN is_subscribe = TRUE
            THEN 'subscribes'
        WHEN is_subscribe = FALSE
            THEN 'not subscribe'
        ELSE 'undefined'
    END        
)
FROM users;


ALTER TABLE orders
ADD COLUMN status boolean;

UPDATE orders
SET status = false;

UPDATE orders
SET status = true
WHERE id % 3 = 0;

SELECT *, (
    CASE
        WHEN status = TRUE
            THEN 'done'
        WHEN status = FALSE
            THEN 'processing'
        ELSE 'new'    
    END            
) 
FROM orders;

SELECT *, (
    CASE extract("month" from birthday)
        WHEN 1 THEN 'winter'
        WHEN 2 THEN 'winter'
        WHEN 3 THEN 'spring'
        WHEN 4 THEN 'spring'
        WHEN 5 THEN 'spring'
        WHEN 6 THEN 'summer'
        WHEN 7 THEN 'summer'
        WHEN 8 THEN 'summer'
        WHEN 9 THEN 'fall'
        WHEN 10 THEN 'fall'
        WHEN 11 THEN 'fall'
        WHEN 12 THEN 'winter'
    ELSE 'uncnown'    
END    
) AS "birth season"
FROM users;

SELECT * , (
    CASE 
        WHEN extract("year" from age(birthday)) >= 18
            THEN 'adult'
        ELSE 'minor'   
    END
) AS age
FROM users;

----------1----------

SELECT brand, (
    CASE
        WHEN brand = 'iPhone'
            THEN 'Apple'
        ELSE 'Other'
    END         
) AS manufacturer
FROM products;

-----------2-----------

SELECT brand, price, (
    CASE
        WHEN price > 9000
            THEN 'flagman'
        WHEN price < 1000
            THEN 'cheep'    
        ELSE 'middle'
    END         
) AS price_category
FROM products;

---------3--------------

SELECT u.id, u.email, count(o.id), (
    CASE
        WHEN count(o.id) > 3
            THEN 'regular customer'
        WHEN count(o.id) BETWEEN 1 AND 3
            THEN 'activ client'
        ELSE 'new client'
    END             
) AS status
FROM users AS u
JOIN orders AS o
ON u.id = o.customer_id
GROUP BY u.id, u.email;

-------------COALESCE---------------

SELECT id, brand, model, price, COALESCE(category, 'smartphone') AS category
FROM products;

---------GREATEST, LEAST-----------

SELECT *, LEAST(price, 500) sale_price
FROM products;

SELECT *, GREATEST(price, 500) new_price
FROM products;


--------------IN, NOT IN, SOME/ANY, EXISTS----------

SELECT *
FROM users AS u
WHERE u.id NOT IN (
    SELECT o.customer_id
    FROM orders AS o
);

SELECT *
FROM products AS p
WHERE p.id NOT IN (
    SELECT otp.product_id
    FROM orders_to_products AS otp
);

------EXISTS-------

SELECT *
FROM users
WHERE id = 290;

SELECT EXISTS
    (SELECT *
    FROM users
    WHERE id = 290);


SELECT EXISTS (
    SELECT o.customer_id
    FROM orders AS o
    WHERE id = 1500
); 

SELECT u.id, u.email, (EXISTS (
    SELECT o.customer_id
    FROM orders AS o))
FROM users AS u;    












