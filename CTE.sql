
CREATE DATABASE CTE_DB;
USE CTE_DB;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer VARCHAR(50) Not null,
    product VARCHAR(50)null,
    category VARCHAR(50)unique,
    amount INT,
    status VARCHAR(20)
);

INSERT INTO orders VALUES
(101, 'Omkar', 'Laptop', 'Electronics', 65000, 'Delivered'),
(102, 'Rahul', 'Mouse', 'Electronics', 1500, 'Delivered'),
(103, 'Priya', 'Shoes', 'Fashion', 4000, 'Delivered'),
(104, 'Sneha', 'Mobile', 'Electronics', 30000, 'Cancelled'),
(105, 'Amit', 'Shirt', 'Fashion', 2500, 'Delivered'),
(106, 'Neha', 'Headphones', 'Electronics', 5000, 'Delivered'),
(107, 'Rohit', 'Watch', 'Fashion', 7000, 'Delivered'),
(108, 'Pooja', 'Keyboard', 'Electronics', 3000, 'Pending'),
(109, 'Karan', 'Jeans', 'Fashion', 3500, 'Delivered'),
(110, 'Anjali', 'Tablet', 'Electronics', 25000, 'Delivered');

SELECT * FROM orders;

-- Find all Delivered orders where amount > 5000 using a CTE.
    with high_amount as(
       select order_id , customer , product , amount
       from orders
    )
    select * from high_amount;
    
   --  Find the total sales amount for Delivered orders using a CTE.
     with total_sales as(
         select sum(amount)
         from orders
         where status = 'Delivered'
     )
     select * from total_sales;
     
   --   Find the average order amount for each category using a CTE.
       
       with avg_amount as(
         select avg(amount) 
         from orders
         where  category = 'Electronics' 
               and category = 'Fashion'
       )
       select * from avg_amount;
       
       -- Using a CTE, find the total sales amount for each category, 
--        but show only categories where total sales is greater than ₹30,000.
          
          with total_sales AS(
            select category , sum(amount) as total_sales
            from orders
            group by category
            
          )
          select * from total_sales
          where total_sales > 30000;
          
          -- Using a CTE, find the category with the highest total sales.
             
            with total_sales AS(
               select category , sum(amount) AS total_sales
               from orders
               group by category
            )
            select * from total_sales
            where total_sales = (
                select max(total_sales)
                from total_sales
            );
   -- Find the average order amount for each category and show only categories whose average is greater than ₹10,000.
         
         with avg_amount AS(
            select category , avg(amount) as avg_amount
            from orders
            group by category
         )
         select * from avg_amount
         where avg_amount > 10000;
         
         -- Find the category with the lowest total sales amount.
          with total_sales as (
              select category , sum(amount) as total_sales
              from orders
              group by category
          )
          select * from total_sales
          where total_sales = (
              select min(total_sales)
              from total_sales
          );
          
         --  Find the category with the highest average order amount.
         
         with total_sales AS (
              
              select category , avg(amount) as total_sales
              from orders
              group by category
         )
         
         select * from total_sales
         where total_sales = (
          select max(total_sales)
          from total_sales
          
         );
         
        --  Find the category with the highest total sales among only Delivered orders.
            with total_sales as(
            select category , sum(amount) as total_sales
            from orders
            where status = 'Delivered'
            group by category
            
            )
            
            select * from total_sales 
                where total_sales =(
               select max(total_sales)
               from total_sales
               
            );
            
          --   Find the category with the highest average order amount among only Delivered orders.
                   with  avg_amount as(
                     select category, avg(amount) as avg_amount
                     from orders
                      where status = 'Delivered' 
                     group by category
                   )
                   
                   select * from avg_amount
                      where avg_amount = (
                      
                      select max(avg_amount) 
                      from avg_amount
                   );
                   
			-- Find the customer who placed the highest-value Delivered order in each category.
               WITH highest_value AS (
    SELECT category, MAX(amount) AS highest_value
    FROM orders
    WHERE status = 'Delivered'
    GROUP BY category
)

SELECT o.amount, o.customer, o.category
FROM orders o
JOIN highest_value h
    ON o.amount = h.highest_value
   AND o.category = h.category
WHERE o.status = 'Delivered';

-- Find the customer who has the highest total spending among Delivered orders.
    with total_spending as (
        select customer , sum(amount) as total_spending
        from orders
        WHERE status = 'Delivered'
        group by customer
    )
    
     select * from total_spending
    where  total_spending = (
    select max(total_spending)
    from total_spending 
    );
    
   --  Find customers whose total Delivered spending is greater than ₹30,000.
   
       with total_spending as (
           select customer , sum(amount) as total_spending
           from orders
           where status = 'Delivered'
           group by customer 
           
       )
       select * from total_spending
       where total_spending > 30000;
       
       select * from orders;
       
       -- Find the category whose Delivered sales are greater 
--        than the average Delivered sales across all categories.

    with total_sales as (
     select category , sum(amount) as total_sales
     from orders
      where status = 'Delivered'
      group by category
      
	
      
    )
    
    select * from total_sales
    where total_sales > (
     select avg(total_sales)
     from total_sales
     
    );

-- Find the customer with the highest number of Delivered orders.
  with total_orders  as(
   select customer , count(order_id) as total_orders
   from orders
   where status = 'Delivered'
   group by customer
  )
  
  select * from total_orders
  where total_orders = (
     select max(total_orders)
     from total_orders
  );
  
 --  Find the category with the highest number of Delivered orders.
 
 with total_orders  as(
   select category , count(order_id) as total_orders
   from orders
   where status = 'Delivered'
   group by category
  )
  
  select * from total_orders
  where total_orders = (
     select max(total_orders)
     from total_orders
  );
  
 --  Find the customer who has spent the highest total amount on Delivered orders.
 
        with total_amount as (
            
           select customer , sum(order_id) as total_amount
           from orders
           where status = 'Delivered'
           group by customer
        )
        
        select * from total_amount
        where total_amount =(
        
         select max(total_amount)
         from total_amount
        );
        
        -- Find the category with the lowest total Delivered sales
         with lowest_total as (
         
           select category , sum(amount) as lowest_total
           from orders
           where status = 'Delivered'
           group by category
         )
         
         select * from lowest_total
         where lowest_total = (
          select min(lowest_total) 
          from lowest_total
         );
         
        --  Find the customer who has the highest average order amount among Delivered orders.
        
              with avg_amount as (
                  select customer , avg(amount) as avg_amount
                  from orders
                  where status = 'Delivered' 
                  group by customer
              )
              
              select  * from avg_amount
              where avg_amount = (
               
              select max(avg_amount)
              from avg_amount
              );
              
            --   Find the customer with the lowest average order amount among Delivered orders
            
             with avg_amount as (
                  select customer , avg(amount) as avg_amount
                  from orders
                  where status = 'Delivered' 
                  group by customer
              )
              
              select  * from avg_amount
              where avg_amount = (
              select min(avg_amount)
              from avg_amount
              );
              
		 -- Find the category whose average Delivered order amount 
         -- is higher than the overall average Delivered order amount.
         with order_amount as (
              select category , avg(amount) as  order_amount
              from orders
              where status = 'Delivered' 
              group by category
          )
          select * from order_amount
          where order_amount > (
             select avg(order_amount) 
             from order_amount
           );
           
           -- Find the customer whose total Delivered spending 
           -- is higher than the average total Delivered spending of all customers.
           
            with order_amount as (
              select customer , sum(amount) as  order_amount
              from orders
              where status = 'Delivered' 
              group by customer
          )
          select * from order_amount
          where order_amount > (
             select avg(order_amount) 
             from order_amount
           );
           
          --  Find the category whose total Delivered sales are 
--            lower than the average total Delivered sales of all categories.
        
               with order_amount as (
              select category , sum(amount) as  order_amount
              from orders
              where status = 'Delivered' 
              group by category
          )
          select * from order_amount
          where order_amount < (
             select avg(order_amount) 
             from order_amount
           );
                  
-- CTE + JOIN 🔥

-- Find the highest-value Delivered order in each category and show:
-- customer
-- category
-- amount 
    with  highest_value as (
       select category , max(amount) as highest_value
       from orders 
       where status = 'Delivered'
       group by category
       
    ) 
    
    select o.customer , o.category , o.amount 
    from orders  o 
    join highest_value  on 
    o.amount = highest_value.highest_value and
    o.category = highest_value.category
    where  o.status = 'Delivered';
    
-- Find the customer who placed the highest-value Delivered order overall and show:

-- customer
-- product
-- amount

  with highest_value as  (
   select max(amount) as highest_value
   from orders
   where status = 'delivered'
  
  )
  
  select o.customer , o.product , o.amount 
  from orders o
  join highest_value  h on 
  
  o.amount = h.highest_value
  where o.status = 'delivered';
  

--     Find the lowest-value Delivered order overall and show:

-- customer
-- product
-- amount

 with lowest_value as (
     
     select  min(amount) as lowest_value
     from orders
     where status = 'delivered'
     
 )
    select o.customer , o.product , o.amount 
    from orders o
    join lowest_value on 
    o.amount = lowest_value.lowest_value
    where o.status = 'delivered';
    
    
-- Find the category with the highest total Delivered sales and show:
-- category
-- total_sales

 with  total_sales as(
  select category , sum(amount) as total_sales
  from orders
  where status = 'Delivered'
  group by category
  
 )
 
 select * from total_sales
 where total_sales =(
   select max(total_sales)
   from total_sales
 );
 
 -- Find the customer with the highest total Delivered spending, 
--  and also show the number of Delivered orders they placed. 

   with  total_spending as (
    select customer , sum(amount) as total_spending,
           COUNT(order_id) AS total_orders

    from orders
    where status = 'delivered'
    group by customer
    
     
   )
   
   select * from total_spending
   where total_spending = (
    select max(total_spending)
    from total_spending
   );
   
--    Find the category with the highest total Delivered sales, and show:
-- category
-- total_sales
-- number of Delivered orders 
 
 with  total_sales as (
 
   select category , sum(amount) as total_sales ,
          count(order_id) as total_orders
    from orders
    where status = 'Delivered'
    group by category
 )
 
 select * from total_sales
 where total_sales = (
  
 select max(total_sales) 
 from total_sales
 );
 
 -- Find the customer who has the highest total Delivered spending, 
--  but only consider customers who placed at least 2 Delivered orders. Show:
-- customer
-- total_spending
-- total_orders 
    
     with  total_spending as (
     
      select customer , sum(amount) as total_spending,
              count(order_id) as total_orders
		from orders
        where status = 'Delivered'
        group by customer
        having count(order_id) >= 2
     )
     
     select * from total_spending
     where total_spending = (
      
     select max(total_spending)
     from total_spending
   
     );
     
     -- Find the category with the highest average Delivered order amount, 
--      but only consider categories having at least 2 Delivered orders. Show
-- category
-- avg_amount
-- total_orders 
   
                with  avg_amount as(
                select category , avg(amount)as avg_amount,
                       count(order_id)  as total_orders
                       
				from orders
                where status = 'Delivered'
                group by category 
                having count(order_id) > 2
                
                )
                
                select * from avg_amount 
                where avg_amount = (
                select max(avg_amount)
                from avg_amount
                );
                
-- Find the customer with the highest total Delivered spending among 
-- customers whose average Delivered order amount is greater than ₹10,000. Show:
-- customer
-- total_spending
-- avg_amount 
   with  total_spending as (
   select customer , sum(amount) as total_spending,
          avg(amount) as avg_amount
	from orders
    where status = 'delivered'
    group by customer
    having avg(amount) > 10000
   
   )
   
   select * from total_spending
   where total_spending = (
    select max(total_spending)
    from total_spending
   );
   
   
   -- Find the highest-value Delivered order in each category and show:

-- category
-- customer
-- product
-- amount 

 
 with  highest_value as (
   select category , max(amount) as highest_value
   from orders
   where status = 'delivered'
   group by category
 )
 
 select o.customer , o.category  ,o.product, o.amount 
    from orders  o 
    join highest_value  on 
    o.amount = highest_value.highest_value and
    o.category = highest_value.category
    where  o.status = 'Delivered';
    
    select distinct customer from orders;
    
    