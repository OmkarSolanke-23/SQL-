
create database joins_db;

use joins_db;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);

INSERT INTO customers VALUES
(1, 'Omkar', 'Pune'),
(2, 'Sagar', 'Mumbai'),
(3, 'Ved', 'Nashik'),
(4, 'Rahul', 'Pune'),
(5, 'Priya', 'Delhi'),
(6, 'Amit', 'Nagpur');

select * from  customers;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(100),
    amount DECIMAL(10,2)
);

INSERT INTO orders VALUES
(101, 1, 'Laptop', 55000),
(102, 1, 'Mouse', 800),
(103, 2, 'Keyboard', 1500),
(104, 2, 'Monitor', 12000),
(105, 3, 'Laptop Bag', 2500),
(106, 4, 'Headphones', 3000),
(107, 4, 'Keyboard', 1800),
(108, 7, 'Webcam', 2200);

select * from orders;

select customers.customer_name , orders.order_id
from customers
left join orders
on customers.customer_id = orders.customer_id;


