
create database  shop_DB;
use shop_DB;

CREATE TABLE branches (
branch_id INT PRIMARY KEY,
branch_name VARCHAR(100) NOT NULL,
city VARCHAR(50) NOT NULL
);

CREATE TABLE customers (
customer_id INT PRIMARY KEY,
customer_name VARCHAR(100) NOT NULL,
city VARCHAR(50) NOT NULL,
registration_date DATE NOT NULL
);

CREATE TABLE products (
product_id INT PRIMARY KEY,
product_name VARCHAR(100) NOT NULL,
category VARCHAR(50) NOT NULL,
price DECIMAL(10,2) NOT NULL,
stock INT NOT NULL
);

CREATE TABLE employees (
employee_id INT PRIMARY KEY,
employee_name VARCHAR(100) NOT NULL,
salary DECIMAL(10,2) NOT NULL,
branch_id INT NOT NULL,
FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);

CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_id INT NOT NULL,
branch_id INT NOT NULL,
order_date DATE NOT NULL,
payment_mode VARCHAR(30) NOT NULL,
status VARCHAR(30) NOT NULL,
order_total DECIMAL(10,2) NOT NULL,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);

CREATE TABLE order_items (
order_item_id INT PRIMARY KEY,
order_id INT NOT NULL,
product_id INT NOT NULL,
quantity INT NOT NULL,
unit_price DECIMAL(10,2) NOT NULL,
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO branches (branch_id, branch_name, city) VALUES
(1, 'Pune Main', 'Pune'),
(2, 'Mumbai Central', 'Mumbai'),
(3, 'Nashik Branch', 'Nashik'),
(4, 'Nagpur Branch', 'Nagpur');

INSERT INTO customers
(customer_id, customer_name, city, registration_date) VALUES
(101, 'Rahul Patil', 'Pune', '2026-01-15'),
(102, 'Priya Sharma', 'Mumbai', '2026-02-10'),
(103, 'Amit Joshi', 'Pune', '2025-11-20'),
(104, 'Sneha Kulkarni', 'Nashik', '2026-03-05'),
(105, 'Raj Mehta', 'Nagpur', '2025-08-18'),
(106, 'Anjali More', 'Pune', '2026-04-12'),
(107, 'Rohan Deshmukh', 'Mumbai', '2026-05-25'),
(108, 'Neha Shah', 'Nashik', '2025-12-01');

INSERT INTO products
(product_id, product_name, category, price, stock) VALUES
(201, 'Laptop', 'Electronics', 65000, 8),
(202, 'Wireless Mouse', 'Electronics', 1200, 25),
(203, 'Keyboard', 'Electronics', 2500, 15),
(204, 'Office Chair', 'Furniture', 8500, 6),
(205, 'Study Table', 'Furniture', 12000, 12),
(206, 'Printer', 'Electronics', 18000, 5),
(207, 'Notebook Pack', 'Stationery', 500, 40),
(208, 'Pen Drive 64GB', 'Electronics', 1500, 18),
(209, 'Monitor', 'Electronics', 14000, 9),
(210, 'Projector', 'Electronics', 45000, 4);

INSERT INTO employees
(employee_id, employee_name, salary, branch_id) VALUES
(301, 'Amit Patil', 42000, 1),
(302, 'Priya Sharma', 38000, 1),
(303, 'Akash More', 55000, 2),
(304, 'Sneha Joshi', 29000, 2),
(305, 'Rohan Kulkarni', 61000, 3),
(306, 'Anjali Deshmukh', 47000, 3),
(307, 'Raj Shah', 24000, 4),
(308, 'Ayesha Khan', 50000, 4);

INSERT INTO orders
(order_id, customer_id, branch_id, order_date,
payment_mode, status, order_total) VALUES
(401, 101, 1, '2026-01-20', 'UPI', 'Completed', 67400),
(402, 102, 2, '2026-02-12', 'Card', 'Completed', 8500),
(403, 103, 1, '2025-09-10', 'Cash', 'Cancelled', 2500),
(404, 104, 3, '2026-03-08', 'UPI', 'Pending', 18000),
(405, 105, 4, '2025-05-15', 'Card', 'Cancelled', 12000),
(406, 106, 1, '2026-04-15', 'UPI', 'Completed', 15000),
(407, 107, 2, '2026-05-28', 'Cash', 'Completed', 45000),
(408, 108, 3, '2026-06-02', 'UPI', 'Pending', 14000),
(409, 101, 1, '2026-07-10', 'Card', 'Completed', 20500),
(410, 104, 3, '2026-08-05', 'UPI', 'Completed', 9800);
INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price) VALUES
(501, 401, 201, 1, 65000),
(502, 401, 202, 2, 1200),
(503, 402, 204, 1, 8500),
(504, 403, 203, 1, 2500),
(505, 404, 206, 1, 18000),
(506, 405, 205, 1, 12000),
(507, 406, 209, 1, 14000),
(508, 406, 207, 2, 500),
(509, 407, 210, 1, 45000),
(510, 408, 209, 1, 14000),
(511, 409, 203, 2, 2500),
(512, 409, 208, 3, 1500),
(513, 409, 202, 5, 1200),
(514, 410, 204, 1, 8500),
(515, 410, 207, 2, 500),
(516, 410, 202, 1, 1200);

select * from customers;

---------------------- -------------- ------- Part 1: Basic SQL Operations ------------------------------------------------------
-- 1. Display all products.

       select * from products;
       
-- 2. Display all customers from Pune.
         
         select * from customers;
         
-- 3. Display products costing more than Rs. 5,000.
     
     select * 
     from products 
     where price > 5000;
     
-- 4. Display employees earning between Rs. 25,000 and Rs. 50,000.
      
      select * 
      from employees
      where salary between 25000 and 50000;

-- 5. Display orders made using UPI.
       
       select * 
       from orders
       where payment_mode='UPI';
       
-- 6. Display all completed orders.
       
       select * 
       from orders
       where status = 'completed';
       
-- 7. Display products in descending order of price.
       
       select * 
       from  products 
       order by price desc;
       -- limit 5;
-- 8. Display the five most expensive products.
         
       select * 
       from  products 
       order by price desc
       limit 5;
      
-- 9. Display customers registered in the current year.
        select * from customers
        where year(registration_date) ='2026';
        
-- 10. Display employees whose names start with A.
       
       select * 
       from employees
       where employee_name like'A%';
       
-- 11. Display customers whose city is Pune, Mumbai or Nashik.
        
        select * 
        from customers
        where city in ('Pune', 'Mumbai','Nashik');
        
-- 12. Display products where stock is below 10.
          select * 
          from products
          where stock < 10;
-- 13. Increase the price of all Electronics products by 5%.
            UPDATE products
             SET price = price * 1.05
                WHERE category = 'Electronics';
        
-- 14. Update one pending order to completed.
         update orders
         set 
           status = 'completed'
		 where order_id='404';
	   
-- 15. Delete cancelled orders that are older than one year.
        select * from orders;
        

------------------------------------------------ Part 2: Aggregate Function Reports ----------------------------------------

-- 1. Total number of customers.
     select count(customer_id) AS total_customer
     from customers;
-- 2. Total number of products.
      select  count(product_id) AS total_pro
      from products;
-- 3. Total number of completed orders.
       select status , count(order_id) AS total_order
       from orders
       where status='completed';
       
-- 4. Average product price.
      select  avg(price) AS total_avg
      from products;
-- 5. Highest-priced product.
       select * from 
       products
       order by price desc
       limit 1;
-- 6. Lowest employee salary.
        select * from 
         employees
       order by salary asc
       limit 1;
-- 7. Total stock available.
      select  sum(stock) AS total_stock
      from products;
      
-- 8. Number of customers city-wise
        select city , count(customer_id) 
        from customers
        group by city;
-- 9. Number of products category-wise.
       select  category , count(product_id)
       from products
       group by category;
       
-- 10. Average salary branch-wise.
         
         select  employee_name , avg(salary)
         from employees
         group by employee_name;
         
    
-- 11. Total orders payment-mode-wise.
        select payment_mode , count(order_id)
        from orders
        group by payment_mode;
        
-- 12. Total completed orders month-wise.
       select order_date , count(order_id)
       from orders
       group by order_date;
       
-- 13. Total quantity sold for each product.
        select product_id , count(stock)
        from  products
        group by product_id;
        
-- 14. Total revenue generated by each branch.
         select branch_name , sum(branch_id)
         from branches 
         group by branch_name;
         
-- 15. Average order value.
        
        select  avg(order_total) 
        from orders;