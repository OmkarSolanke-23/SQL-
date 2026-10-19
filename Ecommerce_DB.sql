
create database ecommerce_DB;

use ecommerce_DB;



create table category (
    category_id int primary key,
    category_name varchar(50) not null
);

insert into category values
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Footwear'),
(4, 'Home Appliances'),
(5, 'Books'),
(6, 'Beauty'),
(7, 'Sports');


-- =========================================
-- 2. PRODUCT TABLE
-- =========================================

create table product (
    product_id int primary key,
    product_name varchar(100) not null,
    category_id int,
    price decimal(10,2),
    stock int,
    brand varchar(50),
    rating decimal(2,1),
    foreign key (category_id) references category(category_id)
);

insert into product values 
(101, 'iPhone 15', 1, 69999.00, 15, 'Apple', 4.7),
(102, 'Samsung Galaxy S24', 1, 74999.00, 10, 'Samsung', 4.6),
(103, 'HP Laptop', 1, 55999.00, 8, 'HP', 4.3),
(104, 'Boat Headphones', 1, 1999.00, 35, 'Boat', 4.2),
(105, 'Levis Jeans', 2, 2999.00, 20, 'Levis', 4.1),
(106, 'Nike T-Shirt', 2, 1999.00, 25, 'Nike', 4.4),
(107, 'Puma Shoes', 3, 4999.00, 12, 'Puma', 4.5),
(108, 'Nike Running Shoes', 3, 6999.00, 7, 'Nike', 4.7),
(109, 'Prestige Mixer', 4, 3499.00, 14, 'Prestige', 4.0),
(110, 'Philips Air Fryer', 4, 8999.00, 6, 'Philips', 4.5),
(111, 'Atomic Habits', 5, 599.00, 30, 'Penguin', 4.8),
(112, 'Rich Dad Poor Dad', 5, 499.00, 40, 'Plata', 4.7),
(113, 'Face Wash', 6, 399.00, 50, 'Nivea', 4.2),
(114, 'Sunscreen SPF 50', 6, 699.00, 45, 'Lakme', 4.4),
(115, 'Cricket Bat', 7, 2499.00, 10, 'SG', 4.6);


-- =========================================
-- 3. CUSTOMER TABLE
-- =========================================

create table customer (
    customer_id int primary key,
    customer_name varchar(50) not null,
    email varchar(100) unique,
    phone varchar(15),
    city varchar(50),
    state varchar(50),
    gender varchar(10),
    age int
);

insert into customer values
(1, 'Rahul Sharma', 'rahul@gmail.com', '9876543210', 'Pune', 'Maharashtra', 'Male', 24),
(2, 'Priya Patil', 'priya@gmail.com', '9876543211', 'Mumbai', 'Maharashtra', 'Female', 22),
(3, 'Amit Joshi', 'amit@gmail.com', '9876543212', 'Nashik', 'Maharashtra', 'Male', 29),
(4, 'Sneha Kulkarni', 'sneha@gmail.com', '9876543213', 'Chh. SambhajiNagar', 'Maharashtra', 'Female', 25),
(5, 'Rohan Deshmukh', 'rohan@gmail.com', '9876543214', 'Nagpur', 'Maharashtra', 'Male', 31),
(6, 'Neha Shah', 'neha@gmail.com', '9876543215', 'Ahmedabad', 'Gujarat', 'Female', 27),
(7, 'Vikas Verma', 'vikas@gmail.com', '9876543216', 'Delhi', 'Delhi', 'Male', 35),
(8, 'Anjali Mehta', 'anjali@gmail.com', '9876543217', 'Mumbai', 'Maharashtra', 'Female', 23),
(9, 'Karan Singh', 'karan@gmail.com', '9876543218', 'Bangalore', 'Karnataka', 'Male', 28),
(10, 'Pooja More', 'pooja@gmail.com', '9876543219', 'Pune', 'Maharashtra', 'Female', 26);


-- =========================================
-- 4. ORDERS TABLE
-- =========================================

create table orders (
    order_id int primary key,
    customer_id int,
    order_date date,
    order_status varchar(20),
    payment_method varchar(30),
    shipping_city varchar(50),
    total_amount decimal(10,2),
    foreign key (customer_id) references customer(customer_id)
);

insert into orders values
(1001, 1, '2026-08-01', 'Delivered', 'UPI', 'Pune', 69999.00),
(1002, 2, '2026-08-03', 'Delivered', 'Credit Card', 'Mumbai', 4998.00),
(1003, 3, '2026-08-05', 'Shipped', 'UPI', 'Nashik', 74999.00),
(1004, 4, '2026-08-07', 'Delivered', 'Debit Card', 'Chh. SambhajiNagar', 599.00),
(1005, 5, '2026-08-10', 'Cancelled', 'UPI', 'Nagpur', 8999.00),
(1006, 6, '2026-08-12', 'Delivered', 'Cash on Delivery', 'Ahmedabad', 8998.00),
(1007, 7, '2026-08-15', 'Shipped', 'Credit Card', 'Delhi', 55999.00),
(1008, 8, '2026-08-18', 'Delivered', 'UPI', 'Mumbai', 4297.00),
(1009, 9, '2026-08-20', 'Pending', 'UPI', 'Bangalore', 2499.00),
(1010, 10, '2026-08-22', 'Delivered', 'Credit Card', 'Pune', 2398.00),
(1011, 1, '2026-08-25', 'Delivered', 'UPI', 'Pune', 6999.00),
(1012, 2, '2026-08-27', 'Shipped', 'UPI', 'Mumbai', 8999.00),
(1013, 3, '2026-08-28', 'Delivered', 'Debit Card', 'Nashik', 499.00),
(1014, 4, '2026-08-29', 'Pending', 'UPI', 'Chh. SambhajiNagar', 1999.00),
(1015, 5, '2026-08-30', 'Delivered', 'Credit Card', 'Nagpur', 4498.00);


-- =========================================
-- 5. ORDER ITEM TABLE
-- =========================================

create table order_item (
    order_item_id int primary key,
    order_id int,
    product_id int,
    quantity int,
    unit_price decimal(10,2),
    foreign key (order_id) references orders(order_id),
    foreign key (product_id) references product(product_id)
);

insert into order_item values
(1, 1001, 101, 1, 69999.00),
(2, 1002, 105, 1, 2999.00),
(3, 1002, 106, 1, 1999.00),
(4, 1003, 102, 1, 74999.00),
(5, 1004, 111, 1, 599.00),
(6, 1005, 110, 1, 8999.00),
(7, 1006, 108, 1, 6999.00),
(8, 1006, 104, 1, 1999.00),
(9, 1007, 103, 1, 55999.00),
(10, 1008, 109, 1, 3499.00),
(11, 1008, 113, 2, 399.00),
(12, 1009, 115, 1, 2499.00),
(13, 1010, 106, 1, 1999.00),
(14, 1010, 113, 1, 399.00),
(15, 1011, 108, 1, 6999.00),
(16, 1012, 110, 1, 8999.00),
(17, 1013, 112, 1, 499.00),
(18, 1014, 106, 1, 1999.00),
(19, 1015, 115, 1, 2499.00),
(20, 1015, 104, 1, 1999.00);


-- Display all products.
      select * from product;
-- Display only product_name, price, and brand.
     select product_name, price , brand from product;
-- Find products with price greater than ₹5,000.
      select * from product
      where price > 5000;
-- Find products with stock less than 10.
	 select * from product 
      where stock < 10;
-- Find products belonging to Electronics.
     
     select product.product_name 
     from product
     inner join category ON 
     product.category_id = category.category_id
     where category_name = 'Electronics';
-- Find customers from Mumbai.
     select * from customer
     where city ='mumbai';
-- Find female customers.
     select * from customer
     where gender = 'female';
-- Find orders with status Delivered.
        select * from  orders
         where order_status = 'Delivered';
        
-- Find orders between ₹5,000 and ₹20,000.
    select * from orders
	where total_amount between 5000 and 20000;
-- Find products with rating greater than 4.5.
    select * from product 
    where rating > 4.5;
    
    -- ORDER BY & LIMIT
-- Display products from highest to lowest price.
       select  * from product 
       order by price desc;
-- Display products from lowest to highest price.
   select  * from product 
       order by price asc;
-- Find the 3 most expensive products.
   select  * from product 
       order by price desc
       limit 3;
-- Find the 3 products with the highest rating.
select  * from product 
         where rating > 4.5
       order by price desc
       limit 3;
-- Display customers from youngest to oldest.
         select * from customer
         order by customer_name desc;
-- Find the 5 largest orders.
select * from orders
   order by total_amount desc
   limit 5;
   
-- Aggregate Functions
-- Find the total number of products.
       select count(product_id) 
       from product;
-- Find the average product price.
       select avg(price)
       from product;
-- Find the maximum product price.
      select max(price)
      from product;
-- Find the minimum product price.
select min(price)
      from product;
-- Find the total stock of all products.
      select count(stock)
      from product;
-- Find the total order amount.
      select sum(total_amount)
      from orders;
-- Find the average order amount.
select avg(total_amount)
      from orders;
-- Find the total number of customers.
      select count(customer_name)
      from customer;
      
	-- GROUP BY
-- Find the number of products in each category.
      select category_id , count(product_id)
      from product
      group by category_id;
-- Find the average product price for each category.
     select category_id , avg(price)
     from product
     group by category_id;
-- Find the maximum product price in each category.
    select category_id , max(price)
     from product
     group by category_id;
-- Find the total stock available for each category.
        select category_id , sum(stock)
     from product
     group by category_id;
-- Find the number of customers in each city.
   select  city , count(customer_id)
   from customer
   group by city;
-- Find the number of customers by gender.
      select  gender , count(customer_id)
   from customer
   group by gender;
-- Find the number of orders for each payment method.
       select payment_method , count(order_id)
       from orders
       group by payment_method;
-- Find the number of orders for each order status.
      select order_status , count(order_id)
      from orders
      group by order_status;
-- Find total order amount for each payment method.
		select payment_method , sum(total_amount)
       from orders
       group by payment_method;
-- Find total order amount for each shipping city.
  select shipping_city , sum(total_amount)
       from orders
       group by shipping_city;
       
       -- HAVING
-- Find categories having more than 2 products.
      select category_id , count(product_id)
      from product
      group by category_id
      having count(product_id) > 2;
-- Find cities having more than 1 customer.
      select city , count(customer_id)
      from customer
      group by city
      having count(customer_id) > 1;
-- Find payment methods used for more than 2 orders.
          select payment_method , count(order_id)
          from orders
          group by payment_method
          having count(order_id) > 2;
-- Find order statuses having more than 2 orders.
       select order_status , count(order_id)
       from orders
       group by order_status
       having count(order_id) > 2;
-- Find categories whose average product price is greater than ₹5,000.
       select  category_id , avg(price)
       from product
       group by category_id
       having avg(price) > 5000;
-- Find cities where total order amount is greater than ₹10,000.
	
	select shipping_city , sum(total_amount)
    from orders
    group by shipping_city
    having sum(total_amount) < 10000;
    
    
    -- INNER JOIN
-- Display product name and category name.
       select  product.product_name , 
               category.category_name
         from product 
		inner join category ON
        category.category_id = product.category_id;
-- Display customer name and order amount.
     select customer_name , orders.total_amount
     from customer
     inner join orders ON
     orders.customer_id = customer.customer_id;
-- Display customer name, order date, and order status.
        select customer.customer_name , 
                orders.order_date,
				orders.order_status
		from customer
        inner join orders on
		orders.customer_id = customer.customer_id;

-- Display product name, quantity, and unit price from order_item.
      select  product.product_name,
				order_item.quantity,
			  order_item.unit_price
	 from product
     inner join order_item ON 
       order_item.product_id = product.product_id;
                
-- Display order ID, customer name, and total amount.
     select  orders.order_id,
             customer.customer_name,
             orders.total_amount
	from orders
    inner join customer ON 
     customer.customer_id = orders.customer_id;
-- LEFT JOIN
-- Display all customers, including customers who have never placed an order.
          
         select customer.customer_name,
                orders.order_date,
                orders.order_status
		from customer
        left join orders ON 
        customer.customer_id = orders.customer_id;
  
-- Display all categories and their products.
    
      select  category.category_id,
              category.category_name,
              product.product_name
      from category
      left join product ON
	  product.category_id = category.category_id;
-- Display all products, including products that have never been ordered.
      select * from product;
         select  product.product_id,
                 product.product_name,
                 orders.order_status
		from product 
        left join orders on 
        orders.product_id = product.product_id;
        

-- JOIN + GROUP BY + HAVING
-- Find the number of orders placed by each customer.
       select 
             customer.customer_name, count(orders.order_id)
       from orders
       inner join customer ON 
       customer.customer_id = orders.customer_id
       group by
        customer.customer_id , customer.customer_name;
-- Find customers who placed more than 1 order.
        select customer.customer_name , count(orders.order_id)
        from orders
        inner join customer On
        customer.customer_id = orders.customer_id
        group by
		 customer.customer_id , customer.customer_name
         having 
         count(orders.order_id) > 1;

-- Find total amount spent by each customer.
        select customer.customer_name, sum(orders.total_amount)
        from orders
        inner join customer on 
        orders.customer_id = customer.customer_id
        group by
        customer.customer_id , customer.customer_name;
	
-- Find customers whose total spending is greater than ₹10,000.
           select customer.customer_name, sum(orders.total_amount)
        from orders
        inner join customer on 
        orders.customer_id = customer.customer_id
        group by
        customer.customer_id , customer.customer_name
        having
        sum(orders.total_amount) > 10000;
-- Find the number of products sold in each category.
         select * from product;
         select * from category;
          select  category.category_name , count(DISTINCT product.product_id)
          from category
          inner join product On 
          product.category_id = category.category_id
          group by
           category.category_id  , category.category_name;
           
-- Find categories whose total quantity sold is greater than 3.
        select * from product;
         select * from category;
         select * from order_item;
         select  category.category_name , sum(DISTINCT product.product_id)
          from category
          inner join product On 
          product.category_id = category.category_id
          inner join order_item on 
          order_item.product_id = product.product_id
          group by
           category.category_id  , category.category_name
           having 
		count(DISTINCT product.product_id) >3;
           
-- Find each product's total quantity sold.
       select * from product;
	   select * from order_item;
       select * from orders;
       select product.product_name , sum(order_item.quantity)
       from product
       inner join order_item On 
       product.product_id = order_item.product_id
       group by 
        product.product_id , product.product_name;
        
-- Find products that have been ordered more than once.
	select * from product;
	   select * from order_item;
       select * from orders;
	select  product.product_name  , count(order_item.order_id)
    from product 
    inner join order_item on 
      product.product_id = order_item.product_id
	inner join orders on 
    orders.order_id = order_item.order_id
    group by 
			product.product_id, product.product_name 
	having 
    count(order_item.order_id) > 1;
    
    -- Subqueries
-- Find products whose price is greater than the average product price.
        select  product_name , price
        from product
        where price < (
             select avg(price)
             from product
        );
-- Find the most expensive product.
     
     select product_name  , price
     from product
     where  price = (
     select max(price)
     from product
     );
     
-- Find the second-highest product price.
   
   select  product_name  , price
   from product
   where price = (
     select max(price )
     from product
     where price < (
        select max(price)
        from product
     )
   );
      
-- Find products whose price is greater than the price of Boat Headphones.
    
    select product_name , price
    from product
    where price > (
       
       select price
       from product
       where product_name = 'Boat Headphones'
    );
    select * from product;
-- Find orders greater than the average order amount.
     select * from orders;
     select order_id  , total_amount
     from orders
     where total_amount > (
        select avg(total_amount) 
        from orders
     );
    
-- Find customers who placed an order greater than ₹50,000.
      select * from customer;
      select * from orders;
      
      select customer_name  
      from customer 
      where customer_id in (
       select customer_id
       from orders
       where total_amount > 50000
      );
      
-- Find the product with the highest rating.
     select product_name  , rating
     from  product
     where rating = (
       select   max(rating)
       from product
     );
-- Find products whose price is greater than the average price of Electronics products.
     
     select * from product ;
     select * from category;
     SELECT p.product_name, p.price
FROM product p
WHERE p.price > (
    SELECT AVG(p2.price)
    FROM product p2
    JOIN category c
        ON p2.category_id = c.category_id
    WHERE c.category_name = 'Electronics'
);