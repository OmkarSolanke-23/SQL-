
CREATE DATABASE practice_store;
USE practice_store;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    age INT
);

INSERT INTO customers VALUES
(1, 'Rahul', 'Pune', 25),
(2, 'Priya', 'Mumbai', 28),
(3, 'Amit', 'Delhi', 22),
(4, 'Sneha', 'Pune', 30),
(5, 'Vikram', 'Nashik', 27),
(6, 'Neha', 'Mumbai', 24);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 60000),
(102, 'Mobile', 'Electronics', 30000),
(103, 'Headphones', 'Electronics', 3000),
(104, 'Keyboard', 'Accessories', 1500),
(105, 'Mouse', 'Accessories', 800),
(106, 'Chair', 'Furniture', 7000),
(107, 'Table', 'Furniture', 12000);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO orders VALUES
(1001, 1, 101, 1, '2026-01-10', 'Completed'),
(1002, 2, 102, 2, '2026-01-12', 'Completed'),
(1003, 1, 103, 3, '2026-01-15', 'Pending'),
(1004, 3, 104, 2, '2026-02-01', 'Completed'),
(1005, 4, 106, 1, '2026-02-05', 'Cancelled'),
(1006, 5, 107, 1, '2026-02-10', 'Completed'),
(1007, 2, 105, 4, '2026-02-15', 'Completed'),
(1008, 6, 102, 1, '2026-03-01', 'Pending'),
(1009, 4, 101, 1, '2026-03-05', 'Completed'),
(1010, 5, 103, 2, '2026-03-10', 'Completed');

-- Q1. Display all customers from Pune.
        select * from customerS
        where city = 'pune';
-- Q2. Find products with price greater than 10,000.

         select * from products
         where price > 10000;

-- Q3. Display all completed orders.

        select * from orders
        where  status = 'completed';
        
-- Display:

-- customer_name | product_name | quantity
    select * from customers;
    select * from products;
    select * from orders;
    
    select customers.customer_name , 
            products.product_name , 
            orders.quantity
	from customers
	inner join orders On 
    customers.customer_id  = orders.customer_id
    inner join products on 
    products .product_id = orders.product_id;
    
    

-- Q5. Display customer name, product name and order date.
     select * from customers;
    select * from products;
    select * from orders;
    
    select customers.customer_name , 
            products.product_name , 
            orders.order_date
	from customers
	inner join orders On 
    customers.customer_id  = orders.customer_id
    inner join products on 
    products .product_id = orders.product_id;
     

-- Q6. Find all orders placed by customers from Mumbai.
       select customers.customer_name , 
               customers.city,
                products.product_name , 
                orders.order_date
	from customers
	inner join orders On 
    customers.customer_id  = orders.customer_id
    inner join products on 
    products .product_id = orders.product_id
    where city = 'Mumbai';
    
    
-- Q7. Find the number of orders placed by each customer.
     
        select * from customers;
        select * from orders;
        
	select customers.customer_name, 
	      count(orders.order_id)
	from customers
	inner join orders On 
    customers.customer_id  = orders.customer_id
    group by 
    customers.customer_id , customers.customer_name;

-- Q8. Find customers who placed more than 1 order.
         
         select * from orders;
         select * from customers;
         
          select customers.customer_name, 
	      count(orders.order_id)
	from customers
	inner join orders On 
    customers.customer_id  = orders.customer_id
    group by 
    customers.customer_id , customers.customer_name
    having  count(orders.order_id) > 1;
    
         

-- Q9. Find the total quantity ordered for each product.
          
          select * from orders;
          select * from products;
           
           select products.product_name ,
                   sum(orders.quantity)
			from orders
            inner join products on
            orders.product_id = products.product_id
            group by
            products.product_id ,  products.product_name;
            
          

-- Q10. Find products whose total ordered quantity is greater than 2.
--        
select * from orders;
          select * from products;
           
           select products.product_name ,
                   sum(orders.quantity)
			from orders
            inner join products on
            orders.product_id = products.product_id
            group by
            products.product_id ,  products.product_name
            having   sum(orders.quantity) > 2; 
            
	
-- Q11. Find products whose price is greater than the average product price.
     
     select product_name  , price
     from products
     where price > (
      select avg(price)
      from products
     );

-- Q12. Find the most expensive product.
         
          select product_name  , price
     from products
     where price = (
      select max(price)
      from products
     );

-- Q13. Find customers who placed an order for a Laptop.
         
         select * from customers;
         select * from orders;
         select * from products;
         
		SELECT customer_name
        FROM customers
        WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    WHERE product_id = (
        SELECT product_id
        FROM products
        WHERE product_name = 'Laptop'
    )
);
        
     

-- Q14. Find products that are more expensive than the price of a Mouse.
       
       select product_name , price
       from products
       where price > (
          
          select price
          from products
          where product_name = 'mouse'
       );
       
      -- Q15. Find the customer who has placed the highest number of orders.
              
              select * from customers;
              select * from orders;
              
              SELECT customers.customer_name,
       COUNT(orders.order_id) AS order_count
FROM customers
INNER JOIN orders
    ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.customer_name
HAVING COUNT(orders.order_id) = (
    SELECT MAX(order_count)
    FROM (
        SELECT COUNT(order_id) AS order_count
        FROM orders
        GROUP BY customer_id
    ) AS order_counts
); 
             
            