CREATE DATABASE window_practice;
USE window_practice;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    category VARCHAR(50),
    product VARCHAR(50),
    amount INT,
    order_date DATE,
    status VARCHAR(20)
);

INSERT INTO orders
(order_id, customer_name, category, product, amount, order_date, status)
VALUES
(101, 'Rahul', 'Electronics', 'Laptop', 60000, '2026-01-05', 'Delivered'),
(102, 'Priya', 'Electronics', 'Mobile', 30000, '2026-01-08', 'Delivered'),
(103, 'Amit', 'Furniture', 'Chair', 5000, '2026-01-10', 'Pending'),
(104, 'Sneha', 'Furniture', 'Table', 12000, '2026-01-12', 'Delivered'),
(105, 'Rahul', 'Electronics', 'Tablet', 20000, '2026-01-15', 'Delivered'),
(106, 'Neha', 'Clothing', 'Jacket', 4000, '2026-01-18', 'Delivered'),
(107, 'Priya', 'Clothing', 'Shoes', 6000, '2026-01-20', 'Pending'),
(108, 'Amit', 'Electronics', 'Headphones', 3000, '2026-01-22', 'Delivered'),
(109, 'Sneha', 'Furniture', 'Sofa', 25000, '2026-01-25', 'Delivered'),
(110, 'Neha', 'Clothing', 'Shirt', 2000, '2026-01-28', 'Delivered'),
(111, 'Karan', 'Electronics', 'Laptop', 60000, '2026-02-02', 'Delivered'),
(112, 'Karan', 'Furniture', 'Chair', 5000, '2026-02-05', 'Pending');


SELECT * FROM orders;

-- Using your existing orders table, find the average order amount for each category.
-- Display these columns:
-- - order_id
-- - category
-- - amount
-- - avg_amount 

select  customer_name,
        order_id,
      category,
       amount,
       avg(amount) over(
         partition by category
       ) as avg_amount
from orders;


-- AVG() OVER() — Question 2
-- Using the same orders table, display each order's:
-- - order_id
-- - category
-- - amount
-- - avg_amount
-- New task: Show only orders where the order amount is greater than the average amount of that order's category.

  with order_amount as (
  select customer_name ,
         order_id,
         category,
         amount,
         avg(amount) over(
             partition by category
         ) as  avg_amount
    from orders
  ) 
  
  select * from order_amount
  where amount > avg_amount;
  
 --  AVG() OVER() — Question 3
-- Let's continue with the same function.
-- Task: Display each order's order_id, category, amount, and the difference between its amount and its category's average amount.
-- For example, if an order amount is ₹60,000 and the category average is ₹34,500, the difference is ₹25,500.
-- Use AVG() OVER (PARTITION BY category) and calculate:

with order_amount as (
  select customer_name ,
         order_id,
         category,
         amount,
         avg(amount) over(
             partition by category
         ) as  avg_amount
    from orders
  ) 
  
  select * from order_amount
  where amount > avg_amount;
  
  -- Display each order's order_id, category, amount, and avg_amount, but show only orders from 
--   the Electronics category whose amount is greater than their category's average.

     with orders_amount as(
       select customer_name ,
            order_id,
            category,
            amount,
            avg(amount) over(
              partition by category 
            ) as avg_amount
            
	from orders
    )
    select * from orders_amount
    where category = 'Electronics'
           and amount > avg_amount;
    
   
-- AVG() OVER() — Question 7
-- Find orders where the amount is less than the average amount of their own category.
-- Display:
-- - order_id
-- - category
-- - amount
-- - avg_amount

with orders_amount as(
       select customer_name ,
            order_id,
            category,
            amount,
            avg(amount) over(
              partition by category 
            ) as avg_amount
            
	from orders
    )
    select * from orders_amount
    where amount < avg_amount;

-- AVG() OVER() — Question 8
-- Find orders where the amount is equal to the average amount of their own category.
-- Display order_id, category, amount, and avg_amount.

       with order_amount as (
         select customer_name , 
                order_id,
                category,
                amount,
                avg(amount) over(
                 
                 partition by category
                 
                ) as avg_amount
		from orders
       )
       
       select * from order_amount
       where amount = avg_amount;
       
-- AVG() OVER() — Question 9
-- Find orders where the amount is greater than the overall average amount of all orders, regardless of category.
-- Display:
-- - order_id
-- - category
-- - amount
-- - overall_avg

     WITH order_amount AS (
    SELECT
        order_id,
        category,
        amount,
        AVG(amount) OVER () AS overall_avg
    FROM orders
)
     
SELECT order_id, category, amount, overall_avg
FROM order_amount
WHERE amount > overall_avg;

-- AVG() OVER() — Question 10
-- Find orders where the amount is less than the overall average amount of all orders.
-- Display order_id, category, amount, and overall_avg. 

     with order_amount as (
         select
                order_id,
                category,
                amount,
                avg(amount )  over() as overall_avg
      from orders
     )
     
     select  order_id , category, amount , overall_avg
     from order_amount
     where amount < overall_avg;
     
-- AVG() OVER() — Question 11
-- Find orders where the amount is greater than the overall average, but show only orders with status 'Delivered'.
-- Display:
-- - order_id
-- - category
-- - amount
-- - status
-- - overall_avg

 with order_amount as (
         select
                order_id,
                category,
                status,
                amount,
                avg(amount )  over() as overall_avg
      from orders
     )
     
     select  order_id , category, status ,amount , overall_avg
     from order_amount
     where amount > overall_avg  and status = 'Delivered';
     
-- AVG() OVER() — Question 12
-- Find the Delivered orders whose amount is below their own category's average.
-- Display:
-- - order_id
-- - category
-- - amount
-- - status
-- - avg_amount 

      with order_amount as (
         select
                order_id,
                category,
                status,
                amount,
                avg(amount )  over(
                 partition by category 
                ) as overall_avg
      from orders
     )
     
     select  order_id , category, status ,amount , overall_avg
     from order_amount
     where amount < overall_avg  and status = 'Delivered';
     
     
     with order_amount as (
         select
                order_id,
                category,
                status,
                amount,
                avg(amount )  over() as overall_avg
      from orders
     )
     
     select  order_id , category, status ,amount , overall_avg
     from order_amount
     where amount > overall_avg  and status = 'Delivered';
     
-- AVG() OVER() — Question 14
-- Find Pending orders whose amount is above the average amount of all Pending orders.
-- Display these columns:
-- - order_id
-- - category
-- - amount
-- - status
-- - avg_amount
 with order_amount as (
  select 
         order_id,
         category,
         status ,
         amount ,
         avg(amount ) over () as avg_amount
	from orders
   where  status = 'Pending'
 )
 select  order_id , category, status ,amount , avg_amount
     from order_amount
     where amount > avg_amount ;
     
-- AVG() OVER() — Question 15
-- Find Delivered orders whose amount is below the average amount of all Delivered orders.
-- Display:
-- - order_id
-- - category
-- - amount
-- - status
-- - avg_amount
--  

with order_amount as (
  select 
         order_id,
         category,
         status ,
         amount ,
         avg(amount ) over () as avg_amount
	from orders
   where  status = 'Delivered'
 )
 select  order_id , category, status ,amount , avg_amount
     from order_amount
     where amount = avg_amount ;
     
-- AVG() OVER() — Question 17
-- Find orders whose amount is greater than the overall average of all orders, 
-- and show only orders with status 'Pending'. 
with order_amount as (
         select
                order_id,
                category,
                status,
                amount,
                avg(amount )  over() as overall_avg
      from orders
    
     )
     
     select  order_id , category, status ,amount , overall_avg
     from order_amount
     where amount = overall_avg   and status = 'Pending' ;
     
     
-- AVG() OVER() — Question 20
-- Find orders whose amount is above the overall average of all orders, and show only orders in the Electronics category.
-- Display:
-- - order_id
-- - category
-- - amount
-- - overall_avg g

 with order_amount as (
         select order_id,
         category,
         status,
         amount,
         avg(amount) over() as overall_avg
         from orders
 )
 
 select order_id , category , status  , amount  , overall_avg
 from order_amount
 where amount > overall_avg and category = 'Electronics';
 
 
 with order_amount as (
  select 
         order_id,
         category,
         status ,
         amount ,
         avg(amount ) over (
         partition by category
         ) as avg_amount
	from orders
  
 )
 select  *
     from order_amount
     where amount = avg_amount  and status = 'Pending';
     
     
    --  ROW_NUMBER()
    
-- Using your existing orders table, assign a unique row number to every order, ordered by amount from highest to lowest.
-- Display:
-- - order_id
-- - category
-- - amount
-- - row_num
 
 select customer_name , 
       order_id,
       category,
       amount,
       row_number() over (
           partition by category
           order by amount desc
       ) as row_num
	from orders;
       
-- ROW_NUMBER() — Question 3
-- Find the highest-amount order in each category.
-- Display:
-- - order_id
-- - category
-- - amount
-- - row_num 

    with highest_amount as (
    
      select  order_id,
              category,
               amount,
               row_number() over (
                   partition by category
                   order by amount desc
               ) as row_num 
               
               from orders
    )
    
    select * from highest_amount
    where row_num  <= 2;
    
    -- ROW_NUMBER() — Question 4
-- Find the top 2 highest-amount orders in each category.
-- Display:
-- - order_id
-- - category
-- - amount
-- - row_num
--     

with highest_amount as (
    
      select  order_id,
              category,
               amount,
               row_number() over (
                   partition by category
                   order by amount desc
               ) as row_num 
               
               from orders
    )
    
    select * from highest_amount
    where row_num  = 2; 
   --  
--     ROW_NUMBER() — Question 6
-- Find the lowest-amount order in each category.
-- Display:
-- - order_id
-- - category
-- - amount
-- - row_num

select customer_name , 
       order_id,
       category,
       amount,
       row_number() over (
           partition by category
           order by amount asc
       ) as row_num
	from orders;
    
   --  ROW_NUMBER() — Question 7
-- Find the top 3 highest-amount orders overall (not separately by category).
-- Display:
-- - order_id
-- - customer_name
-- - amount
-- - row_num
with highest_amount as (
    
      select  order_id,
              category,
               amount,
               row_number() over (
                   
                   order by amount desc
               ) as row_num 
               
               from orders
    )
    
    select * from highest_amount
    where row_num  <= 3; 
    
    -- ROW_NUMBER() — Question 8
-- Find the latest order for each customer based on order_date.
-- Display:
-- - customer_name
-- - order_id
-- - order_date
-- - row_num

 with highest_order as (
    
      select  customer_name,
               order_id,
              order_date,
              
               row_number() over (
                   partition by customer_name
                   order by order_date desc
                   
               ) as row_num 
               
               from orders
    )
    
    select * from highest_order;
    
   --  ROW_NUMBER() — Question 9
-- Find the first order for each customer based on order_date.
-- Display:
-- - customer_name
-- - order_id
-- - order_date
-- - row_num

with highest_order as (
    
      select  customer_name,
               order_id,
              order_date,
              amount,
              
               row_number() over (
                   partition by customer_name
                   order by amount desc
                   
               ) as row_num 
               
               from orders
    )
    
    select * from highest_order
    where  row_num <= 2;
    
    -- Question 11: Highest-value Delivered order in each category
-- Display:
-- - order_id
-- - category
-- - amount
-- - row_num

with Highest_value as (
  select order_id,
         category,
         amount,
         row_number() over(
          partition by category
          order by amount desc
         ) as row_num
   from orders
   where status = 'Delivered' 
)
select * from Highest_value
where row_num = 1;

-- ROW_NUMBER() — Question 12
-- Find the top 2 highest-value Delivered orders for each customer.
-- Display:
-- - customer_name
-- - order_id
-- - amount
-- - row_num

with Highest_value as (
    select customer_name,
            order_id,
            amount,
            row_number() over(
              partition by customer_name
              order by amount desc
              
            ) as row_num
     from orders
     where status = 'Delivered'
)

select * from Highest_value
where row_num <=2;

-- ROW_NUMBER() — Question 13
-- Find the third-highest-value order overall, considering only Delivered orders.
-- Display:
-- - order_id
-- - customer_name
-- - amount
-- - row_num
  
with Highest_value as (
 select order_id,
        customer_name,
        amount,
        row_number() over(
            order by amount desc
        ) as row_num
        from orders
        where status = 'Delivered'

)

select * from Highest_value
where row_num = 3;

-- ROW_NUMBER() — Question 14 (Last Question)
-- Find the top 2 highest-value orders in each category, considering only Delivered orders.
-- Display:
-- - order_id
-- - category
-- - amount
-- - row_num

with Highest_value as (
 select order_id,
        category,
        amount ,
        row_number () over(
        partition by category
        order by amount desc
        
        ) as row_num
        from orders
        where  status = 'Delivered'
)

select * from Highest_value
where row_num <= 2;

-- RANK() — Question 1
-- Using your orders table, rank all orders by amount from highest to lowest.
-- Display:
-- - order_id
-- - customer_name
-- - amount
-- - rank_num 

select order_id,
      customer_name,
      amount,
      rank() over(
       order by amount desc
      ) as rank_num
      
      from orders;
      
      
	-- RANK() — Question 2
-- Find the rank of each order separately within each category, based on amount from highest to lowest.
-- Display:
-- - order_id
-- - category
-- - amount
-- - rank_num 
  select order_id,
          category,
          amount,
          rank() over(
             partition by category
             order by amount desc
          ) as rank_num
          from orders;
          
	-- RANK() — Question 3
-- Find the highest-value order in each category using RANK().
-- Display:
-- - order_id
-- - category
-- - amount
-- - rank_num

with highest_value as (
select order_id,
category,
amount,
rank() over(
 partition by category
 order by amount desc
) as rank_num
 from orders
)

select * from highest_value
where rank_num = 1;

-- RANK() — Question 4
-- Find the top 2 ranks of orders in each category, including ties.
-- Display:
-- - order_id
-- - category
-- - amount
-- - rank_num
with highest_value as (
select order_id,
   category,
   amount,
   rank() over(
   partition by category
   order by  amount desc 
   ) as rank_num
   
   from orders
)
 select * from highest_value
   where rank_num <=2;
   
   -- RANK() — Question 5
-- Find the second-highest amount rank in each category, including ties.
-- Display:
-- - order_id
-- - category
-- - amount
-- - rank_num

with highest_value as (
 select order_id,
        category,
        amount,
        rank() over (
            partition by category
            order by amount desc
        ) as rank_num
 from orders
 
)

select * from highest_value
where rank_num = 2;

-- DENSE_RANK() — Question 1
-- Rank all orders by amount from highest to lowest.
-- Display:
-- - order_id
-- - customer_name
-- - amount
-- - dense_rank_num 

 select order_id,
        customer_name,
        amount,
        dense_rank() over(
         order by amount desc
        ) as dense_rank_num
from orders;

-- DENSE_RANK() — Question 2
-- Find the rank of each order separately within each category, based on amount from highest to lowest.
-- Display:
-- - order_id
-- - category
-- - amount
-- - dense_rank_num

with highest as (
 select order_id,
        customer_name,
        category,
        amount,
        dense_rank() over(
        partition by category
         order by amount desc
        ) as dense_rank_num
from orders
)

select * from highest;

-- DENSE_RANK() — Question 3
-- Find the second-highest distinct amount in each category, including all orders tied at that amount.
-- Display:
-- - order_id
-- - category
-- - amount
-- - dense_rank_num 
with highest as (
   select order_id,
           category,
           amount,
           dense_rank() over(
            partition by category
            order by amount desc
           ) as dense_rank_num
        from orders
)

select * from highest 
where dense_rank_num = 2;


-- DENSE_RANK() — Question 4
-- Find the top 2 distinct amount ranks in each category, including ties.
-- Display:
-- - order_id
-- - category
-- - amount
-- - dense_rank_num 

   with  highest as (
     select order_id,
             category,
             amount,
             dense_rank() over(
             partition by category
             order by amount desc
             ) as dense_rank_num
     from orders
   )
   
   select * from highest 
   where dense_rank_num <=2;
   
   
  --  DENSE_RANK() — Question 5 (Last Question)
-- Find the second-highest distinct order amount overall, considering only Delivered orders.
-- Display:
-- - order_id
-- - customer_name
-- - amount
-- - dense_rank_num 
  with  highest as (
  select order_id,
         customer_name,
         amount,
         dense_rank() over(
          order by amount desc
         )as dense_rank_num
  from orders
  where status = 'Delivered'
  
  )
  select * from highest
  where dense_rank_num = 2;
  
  
 --  LAG() — Question 1
-- Using your orders table, display:
-- - order_id
-- - customer_name
-- - order_date
-- - amount
-- - previous_amount 
select order_id,
customer_name,
order_date,
amount,
 lag(amount) over (
    order by order_date desc
 ) as previous_amount
 
 from orders;
 
 -- LAG() — Question 2
-- Find the previous order amount for each customer.
-- Display:
-- - customer_name
-- - order_id
-- - order_date
-- - amount
-- - previous_amount

select order_id,
customer_name,
order_date,
amount,
 lag(amount) over (
     partition by customer_name
    order by order_date asc
 ) as previous_amount
 
 from orders;
 
 -- LAG() — Question 3
-- Find the difference between the current order amount and the previous order amount for each customer.
-- Display:
-- - customer_name
-- - order_id
-- - amount
-- - previous_amount
-- - amount_difference 

  WITH order_changes AS (
    SELECT
        customer_name,
        order_id,
        amount,
        LAG(amount) OVER (
            PARTITION BY customer_name
            ORDER BY order_date ASC
        ) AS previous_amount
    FROM orders
)
SELECT
    customer_name,
    order_id,
    amount,
    previous_amount,
    amount - previous_amount AS amount_difference
FROM order_changes;

-- LAG() — Question 4
-- Find the previous order date for each customer.
-- Display:
-- - customer_name
-- - order_id
-- - order_date
-- - previous_order_date 

 with  previous as (
  select customer_name,
         order_id,
         order_date,
         lag(order_date) over(
          partition by customer_name
          order by order_date asc
         ) as previous_order_date
         from orders
 ) 
 
 select * from previous;
 
 -- LAG() — Question 5 (Last Question)
-- Find the previous order amount for each customer, considering only Delivered orders.
-- Display:
-- - customer_name
-- - order_id
-- - amount
-- - previous_amount

with previous as (
    select customer_name,
     order_id,
     amount,
     lag(amount) over(
      partition by customer_name
      order by order_date asc
     ) as previous_amount
     
     from orders
     where status = 'Delivered'
)

select * from previous;
 
 
 -- LEAD() — Question 1
-- Using your orders table, display:
-- - order_id
-- - customer_name
-- - order_date
-- - amount
-- - next_amount 

  select order_id,
         customer_name,
         order_date,
         amount,
         lead(amount) over(
            order by order_date asc
         ) as next_amount
         from orders;
         
         -- LEAD() — Question 2
-- Find the next order amount for each customer.
-- Display:
-- - customer_name
-- - order_id
-- - order_date
-- - amount
-- - next_amount
select order_id,
         customer_name,
         order_date,
         amount,
         lead(amount) over(
         partition by customer_name
            order by order_date asc
         ) as next_amount
         from orders;
         
-- LEAD() — Question 3
-- Find the difference between the next order amount and the current order amount for each customer.
-- Display:
-- - customer_name
-- - order_id
-- - amount
-- - next_amount
-- - amount_difference
 
 with orders_changes as (
 select order_id,
         customer_name,
         order_date,
         amount,
         lead(amount) over(
         partition by customer_name
            order by order_date asc
         ) as next_amount
         from orders
 )
 
 SELECT
    customer_name,
    order_id,
    amount,
    next_amount,
    next_amount - amount AS amount_difference
FROM orders_changes;

-- LEAD() — Question 4
-- Find the next order date for each customer.
-- Display:
-- - customer_name
-- - order_id
-- - order_date
-- - next_order_date 
with  next_orders as (

  select customer_name,
         order_id,
         order_date,
         lead(order_date) over(
         partition by customer_name
         order by order_date asc 
         )  as next_order_date
         
         from orders
)
select * from next_orders ;

-- LEAD() — Question 5 (Last Question)
-- Find the next order amount for each customer, considering only Delivered orders.
-- Display:
-- - customer_name
-- - order_id
-- - amount
-- - next_amount-- -- 

 with  next_orders as (
 select  customer_name,
    order_id,
    amount,
    lead(amount) over(
     partition by customer_name
     order by order_date asc
    
    ) as next_amount
   from orders
   where status = 'Delivered'
 )
 
 select * from next_orders;
 
 -- Question 1
-- Using your orders table, calculate a running total of amount in order-date sequence.
-- Display:
-- - order_id
-- - order_date
-- - amount
-- - running_total 

select customer_name,
order_id,
order_date,
amount,
sum(amount)  over(
  
   order by order_date asc
) as running_total
from orders
where status = 'Delivered';


-- SUM() OVER() — Question 4
-- Calculate the running total separately for each category, considering only Delivered orders.
-- Display:
-- - order_id
-- - category
-- - order_date
-- - amount
-- - running_total

 with total_separately as (
  select order_id,
     category,
     order_date,
	 amount,
     sum(amount) over(
       partition by  category
       order by order_date asc
     ) as running_total
 from orders
where status = 'Delivered'
 )
 
 select * from total_separately;


-- SUM() OVER() — Question 5
-- Calculate the running total separately for each customer, considering only Delivered orders. 
-- Show the results from the earliest to the latest order.
-- Display:
-- - customer_name
-- - order_id
-- - order_date
-- - amount 
-- running_total

with total_separately as (

select customer_name,
order_id,
order_date,
amount,
sum(amount) over(
 partition by customer_name
  order by order_date asc
) as running_total
 from  orders
 where status  = 'Delivered'
)

select * from total_separately