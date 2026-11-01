SELECT * FROM SubQuery.employee;


USE SubQuery;

CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employee
(employee_id, name, department, salary)
VALUES
(1, 'Omkar', 'IT', 60000),
(2, 'Ved', 'HR', 45000),
(3, 'Sagar', 'IT', 75000),
(4, 'Rahul', 'Sales', 50000),
(5, 'Priya', 'HR', 55000),
(6, 'Amit', 'Sales', 65000),
(7, 'Sneha', 'IT', 50000),
(8, 'Kiran', 'HR', 40000),
(9, 'Neha', 'Finance', 70000),
(10, 'Rohan', 'Finance', 48000);

select * from employee;

-- Find the employee(s) whose salary is greater than the average salary.
select name , salary 
from employee
where salary > (
    select avg(salary)
    from employee
);

-- Find the employee(s) who have the highest salary.
    select name , salary
    from employee
    where salary = (
        select max(salary)
        from employee
    );
    
    -- Find the employee(s) who have the lowest salary.
    select name , salary
    from employee
    where salary = (
        select min(salary)
        from employee
    );
    
   --  Find all employees whose salary is LESS than the average salary.
         select name , salary
         from employee
         where salary < (
            select avg(salary)
            from employee
         );
         
         -- Find all employees whose salary is greater than Rahul's salary.
         select name , salary
         from employee
         where salary > (
               select  max(salary)
               from employee
               where name = 'rahul' 
         );
         
         -- Find all employees whose salary is less than Priya's salary.
         
          select name , salary
         from employee
         where salary < (
               select  min(salary)
               from employee
               where name = 'priya ' 
         );
         
         select name , salary
         from employee
         where salary > (
             select salary
             from employee
             where name = 'amit'
         );
		
        -- Find all employees who work in the same departments as Rahul.
        select name , department
        from employee
        where department  not in (
           select department
           from employee
           where name = 'rahul'
        );
        
        -- Find employees whose salary is greater than the average salary of the IT department.
        select name , salary , department
        from employee
        where salary > (
           select avg(salary)
           from employee
           where department = 'IT'
        );
        
        select name , salary , department
        from employee
        where salary > (
           select avg(salary)
           from employee
           where department = 'sales'
        );
        
        select name , salary, department
        from employee
        where salary > all(
             select salary
             from employee
             where department = 'IT'
        );
        
	SELECT name, salary, department
FROM employee
WHERE department IN (
    SELECT department
    FROM employee
    WHERE name = 'priya'
)
AND salary < (
    SELECT salary
    FROM employee
    WHERE name = 'priya'
);

-- Find employees whose salary is greater than the average salary of all employees.
      select name , salary
      from employee
      where salary > (
           select avg(salary)
           from employee
      );
      
      select name , salary
      from employee
      where salary = (
           select max(salary)
           from employee
           order by salary desc
           limit 1
      );
      
     --  Q3: Find employees whose salary is lower than the average salary of all employees.
           
           select name , salary 
           from employee
           where salary < (
               select avg(salary)
               from employee
           );
           
          -- Find employees whose salary is greater than the salary of Rahul. 
           select name , salary
           from employee
           where salary > (
            select salary
            from employee
            where name = 'rahul'
           );
          --  Find employees who work in the same department as Rahul.
                 select name , department
                 from employee
                 where department in (
                    select department
                    from employee
                    where name = 'rahul'
                 );
                 
select * from employee
 where department = 'IT' or department = 'sales';
 
		-- 	Find employees whose salary is greater than the average salary of the IT department.
            select name , salary , department
            from employee
            where salary > (
               select avg(salary)
               from employee
               where department = 'IT'
            );
            
           --  Find employees whose salary is greater than the highest salary in the Sales department.
           select name , salary , department
            from employee
            where salary > (
               select max(salary)
               from employee
               where department = 'sales'
            );
            
           -- Find employees who are NOT working in the same department as Rahul.
             select name , salary , department
            from employee
            where department  in (
               select department
               from employee
               where name = 'rahul'
               
		     and salary > (
                 select salary
                 from employee
			
             )
            );
            
            select name , salary , department
            from employee
            where department  in (
               select department
               from employee
               where name = 'priya'
               
		     and salary <  (
                 select salary
                 from employee
                 where name = 'priya'
			
             )
            );
            
            select name , salary , department
            from employee
            where department  in (
               select department
               from employee
               where name = 'rahul'
               
		     and salary > (
                 select avg(salary)
                 from employee
                 where name = 'rahul'
			
             )
            );
            
            -- Find employees whose salary is greater than the maximum salary of the IT department 
--             AND who are NOT working in the IT department.

                 select name , salary , department
                 from employee
                 where salary >(
                     select max(salary )
                     from employee
                     where department = 'IT'
                  )   
				and  department not in (
                      select department
                      from employee
                      where department = 'IT'
                
                 );
 
            
            -- Find employees whose salary is lower than the average salary of the Sales department 
--             AND who work in the same department as Rahul.
             select name , salary , department
             from employee
             where salary < (
                  select avg(salary)
                  from employee
                  where department ='sales'
             )     
			and department in (
               select department
               from employee
               where name = 'rahul'
            
             );
             
             -- Find employees whose salary is greater than the average salary of the IT department 
--              AND whose department is NOT the IT department.
--               
                     select name , salary , department
                     from employee
                     where salary > (
                             select avg(salary) 
                             from employee
                             where department = 'IT'
					)
                      And department not in (
                        select department
                        from employee
                        where department = 'IT'
                      
                     );
                     
                     -- Find employees whose salary is greater than the highest salary in the Sales department 
--                      AND who work in the same department as Rahul.
                         
                         select name, salary , department 
                         from employee
                         where salary > (
                            select max(salary)
                            from employee
                            where department = 'sales'
						 )
                         and department in (
                          
                          select department
                          from employee
                          where name = 'Rahul'
                         
                        
                         );
                         


update employee 
set  salary = '80000'
where employee_id = 1;

select * from employee;
select * from employee
 where department = 'IT' or department = 'sales';
 
 select department , avg(salary) 
 from employee
 group by department
 having avg(salary) > 10000;
 
 select * from 
 employee 
 order by salary desc
 limit 3 ; 
 
  select department , avg(salary) 
 from employee
 group by department;
 
 select  max(salary)
 from employee;

select department , sum(salary) 
 from employee
 group by department;
 
 select *
 from employee
 where salary > 50000;
 
 
 
 
 
 
 


