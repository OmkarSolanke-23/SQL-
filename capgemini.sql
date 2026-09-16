SELECT * FROM capgemini_DB.employee;

-- Assignment 1 --------
-- 1. As a user I want only those employee names who has salary more than 20K.
SELECT name
FROM employee
WHERE salary > 20000;
-- 2. As a user I want all the employee information who has salary 51K.
SELECT *
FROM employee
WHERE salary = 51000;
-- 3. As a user I want only name and experience who has age more that 35.
SELECT name, experience
FROM employee
WHERE age > 35;
-- 4. As a user, I want only those employees who’s belongs to dev profile.
SELECT *
FROM employee
WHERE profile = 'dev';
-- 5. As a user, I want those employee names who has profile test .
SELECT name
FROM employee
WHERE profile = 'test';
-- 6. As a user I want record of employee who has saSELECT *
SELECT *
FROM employee
WHERE salary >= 25000;

-- 7. As a user I want to those employee name and email those are not havings alary 51K.
SELECT name, email
FROM employee
WHERE salary <> 51000;

-- 8. As a user I want to update the employee salary by 10K who is having
UPDATE employee
SET salary = salary + 10000
WHERE experience < 20;
-- 9. As a user I want to remove employee record who is having 21 years of
-- experience as he/she left the job.
DELETE FROM employee
WHERE experience = 21;
-- 10. As a user I want to decrease the salary of john by 21K as company want to
-- perform cost cutting.

UPDATE employee
SET salary = salary - 21000
WHERE name = 'john';

-- -- Assignment 2 --------

-- 1. As a user, I want to add an column branch_location so I can
-- efficiently search the branch wise record.
    ALTER TABLE employee
ADD branch_location VARCHAR(100);

-- 2. As a user, I want to check the total salary expenses on employees.
SELECT SUM(salary) AS total_salary_expense
FROM employee;
-- 3. As a user, I want to see the max salary of employee from test
-- profile.
SELECT MAX(salary) AS max_salary
FROM employee
WHERE profile = 'test';
-- 4. As a user I want to get the average experience level of employees. 
SELECT AVG(experience) AS average_experience
FROM employee;
-- 5. As a user I want to see the name of highest paid employee.
SELECT name
FROM employee
WHERE salary = (
    SELECT MAX(salary)
    FROM employee
);
-- 6. As a user, I want to see the name and experience of lowest paid
-- employee.
SELECT name, experience
FROM employee
WHERE salary = (
    SELECT MIN(salary)
    FROM employee
);
-- 7. As a user I want check how many employees are working in
-- company.
SELECT COUNT(*) AS total_employees
FROM employee;
-- 8. As a user I want to see those employee names who are from test
-- profile and having salary more than 25K.
SELECT name
FROM employee
WHERE profile = 'test'
AND salary > 25000;
-- 9. As a user, I want to shift Radha on support profile.
UPDATE employee
SET profile = 'support'
WHERE name = 'Radha';
-- 10. As a user, I want to get the second highest salary of employee.
SELECT MAX(salary) AS second_highest_salary
FROM employee
WHERE salary < (
    SELECT MAX(salary)
    FROM employee
);
-- 11. As a user I want to get the second lowest salary of employee.
SELECT MIN(salary) AS second_lowest_salary
FROM employee
WHERE salary > (
    SELECT MIN(salary)
    FROM employee
);
-- 12. As a user, I want to calculate the average salary of employees
-- those are belongs to dev profile.
SELECT AVG(salary) AS average_salary
FROM employee
WHERE profile = 'dev';
-- 13. As a user, I want to see the employee’s name and salary who is
-- having lowest experience.
SELECT name, salary
FROM employee
WHERE experience = (
    SELECT MIN(experience)
    FROM employee
);
-- 14. As a user, I want to see the employee name who is having lowest
-- age with max salary.
SELECT name
FROM employee
WHERE age = (
    SELECT MIN(age)
    FROM employee
)
AND salary = (
    SELECT MAX(salary)
    FROM employee
    WHERE age = (
        SELECT MIN(age)
        FROM employee
    )
);
-- 15. As a user, I want to remove all the employee from company.
DROP TABLE employee;