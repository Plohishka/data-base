CREATE TABLE employees (
    id serial PRIMARY KEY,
    name varchar(200),
    position varchar(200),
    car_aviability boolean
);

INSERT INTO employees (name, position, car_aviability) VALUES
('John', 'HR', false),
('Jane', 'Sales', false),
('Jake', 'Developer', false),
('Andy', 'Driver', true);

SELECT * FROM employees;

CREATE TABLE positions (
    name varchar(200) PRIMARY KEY,
    car_aviability boolean
);

INSERT INTO positions VALUES
('HR', false), ('Sales', false), ('Developer', false), ('Driver', true);

SELECT * FROM positions;

ALTER TABLE employees
DROP COLUMN car_aviability;

ALTER TABLE employees
ADD CONSTRAINT "position_fkey" FOREIGN KEY (position) REFERENCES
positions (name);


SELECT e.id, e.name, e.position, p.car_aviability
FROM employees AS e
JOIN positions AS p
ON e.position = p.name;


DROP TABLE employees;
DROP TABLE positions;


----///////////////-----------

CREATE TABLE employees(
    id serial PRIMARY KEY,
    name varchar(200),
    department varchar(200),
    department_phone varchar(10)
);

INSERT INTO employees (name, department) VALUES
('John Doe', 'HR'),
('Jane Smith', 'Sales'),
('Andy Worhol', 'Manager');

SELECT * FROM employees;

CREATE TABLE departments(
    name varchar(200) PRIMARY KEY,
    department_phone varchar(200)
);

INSERT INTO departments VALUES
('HR', '555-231'),
('Sales', '23-456'),
('Manager', '345-567');

SELECT * FROM departments;

ALTER TABLE employees
DROP COLUMN department_phone;

ALTER TABLE employees
ADD CONSTRAINT "department_fkey" FOREIGN KEY (department) REFERENCES
departments(name);


SELECT e.id, e.name, e.department, d.department_phone
FROM employees AS e
JOIN departments AS d
ON e.department = d.name;

-------------///////////////-------------------



/* 

teachers 1:n students
students m:n subjects
teachers 1:1 subjects

 */

 CREATE TABLE students (
    id serial PRIMARY KEY,
    name varchar(200)
 );

 CREATE TABLE teachers (
    id serial PRIMARY KEY,
    name varchar(200)
 );

 CREATE TABLE subjects (
    name varchar(200) PRIMARY KEY
 );

 CREATE TABLE students_to_teachers (
    teacher_id int REFERENCES teachers(id),
    student_id int REFERENCES students(id)
 );

CREATE TABLE teachers_to_subjects (
    teacher_id int REFERENCES teachers(id),
    subject varchar REFERENCES subjects(name)
);


--------------------------------------------------------------------------------

CREATE TABLE restaurants (
    id serial PRIMARY KEY
);

CREATE TABLE delivery_services (
    id serial PRIMARY KEY
);

CREATE TABLE restaurants_to_delivery (
    restaurant_id int REFERENCES restaurants(id),
    delivery_id int REFERENCES delivery_services(id)
);

CREATE TABLE pizzas (
    pizza_type varchar(200) PRIMARY KEY NOT NULL
);

CREATE TABLE restaurans_to_pizzas (
    restauran_id int REFERENCES restaurants(id),
    pizza varchar REFERENCES pizzas(pizza_type)
);


INSERT INTO restaurants_to_delivery VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(3, 1);

INSERT INTO restaurans_to_pizzas VALUES 
(1, 'pepperoni'),
(1, 'sea');




-------------////////////////---------------------










