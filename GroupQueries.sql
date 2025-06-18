use assignment1;

-- 1. Total employees in each department
SELECT dept_id, COUNT(*) AS total_employees FROM Employees GROUP BY dept_id;

-- 2. Total departments in each location
SELECT location, COUNT(DISTINCT dept_id) AS total_departments 
FROM Departments GROUP BY location;

-- 3. Avg salary per department
SELECT dept_id, AVG(salary) AS avg_salary 
FROM Employees GROUP BY dept_id;

-- 4. Max salary for each job
SELECT job, MAX(salary) AS max_salary 
FROM Employees GROUP BY job;

-- 5. Total salary by department
SELECT dept_id, SUM(salary) AS total_salary 
FROM Employees GROUP BY dept_id;

-- 6. Departments with more than 5 employees
SELECT dept_id, COUNT(*) AS total_employees 
FROM Employees GROUP BY dept_id 
HAVING COUNT(*) > 5;

-- 7. Departments with managers, by location
SELECT location, COUNT(*) AS total_departments 
FROM Departments WHERE manager_id IS NOT NULL AND manager_id != 0 
GROUP BY location;

-- 8. Departments by location where total departments > 2
SELECT location, COUNT(*) AS total_departments 
FROM Departments GROUP BY location 
HAVING COUNT(*) > 2;

-- 9. Max salary by job where dept IN (60,90,100,110)
SELECT job, MAX(salary) AS max_salary 
FROM Employees WHERE dept_id IN (60,90,100,110) 
GROUP BY job;
