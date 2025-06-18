use assignment1;

-- 1 Find the empid, firstname, lastname and salary of employee
SELECT emp_id, first_name, last_name, salary
FROM Employees;

-- 2 Find the employees in deptid 60
SELECT * FROM Employees WHERE dept_id = 60;

-- 3  Find the employees with salary greater than 1000
SELECT * 
FROM Employees
WHERE salary > 1000;

#4. Find the employees whose manager id is not given
SELECT * FROM Employees WHERE manager_id IS NULL;

#5. find the department whose manaer_id is 0
SELECT *
FROM Departments
WHERE manager_id = 0;

#6. Find the employees with salary in range 5000 to 10000
SELECT * FROM Employees WHERE salary BETWEEN 5000 AND 10000;

#7. Find the employees who works in deparment 10,20 or50
SELECT *
FROM Employees
WHERE dept_id IN (10, 20, 50);

# 8.Find the employees who work in department 80 and 60  and has salary above 15000
SELECT * FROM Employees 
WHERE dept_id IN (60, 80) AND salary > 15000;