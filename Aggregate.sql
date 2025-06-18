# Aggregate:

use assignment1;

#  Find the total department in employee table
-- Total departments in Employees table
SELECT COUNT(DISTINCT dept_id) AS total_departments FROM Employees;

-- Max salary
SELECT MAX(salary) FROM Employees;

-- Min salary
SELECT MIN(salary) FROM Employees;

-- Total salary
SELECT SUM(salary) FROM Employees;

-- Avg salary
SELECT AVG(salary) FROM Employees;

