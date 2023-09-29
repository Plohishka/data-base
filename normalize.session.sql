CREATE TABLE customers (
    id serial PRIMARY KEY,
    name varchar(200) NOT NULL CHECK (name != ''),
    address text NOT NULL,
    telepfone varchar(20) NOT NULL
);

CREATE TABLE orders (
    order_code serial PRIMARY KEY,
    customer_id int REFERENCES customers(id),
    contract_number int NOT NULL,
    contract_date timestamp DEFAULT current_timestamp,
    product_id int REFERENCES products(product_code),
    quantity_plan int NOT NULL
);

CREATE TABLE products (
    product_code serial PRIMARY KEY,
    name varchar(200) NOT NULL CHECK (name != ''),
    price numeric(10,2) NOT NULL CHECK (price > 0)
);

CREATE TABLE shipments (
    code serial PRIMARY KEY,
    order_code int REFERENCES orders(order_code),
    shipment_date timestamp DEFAULT current_timestamp
);

CREATE TABLE products_to_shipments (
    product_id int REFERENCES products(product_code),
    shipment_code int REFERENCES shipments(code),
    quantity int NOT NULL,
    PRIMARY KEY (product_id, shipment_code)
)




