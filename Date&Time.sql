use  assignment1;

-- 1. Write a query to display the first day of the month (in datetime format) three months before the current month. 
SELECT DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 3 MONTH) - INTERVAL DAY(DATE_SUB(CURDATE(), INTERVAL 3 MONTH)) - 1 DAY, '%Y-%m-%d') AS first_day;

-- 2. Write a query to display the last day of the month (in datetime format) three months before the current month. 
SELECT LAST_DAY(DATE_SUB(CURDATE(), INTERVAL 3 MONTH)) AS last_day;

-- 3. Write a query to get the distinct Mondays from hire_date in employees tables.  

SELECT DISTINCT hire_date
FROM Employees
WHERE DAYOFWEEK(hire_date) = 2; -- 2 = Monday


-- 4. Write a query to get the first day of the current year.
SELECT MAKEDATE(YEAR(CURDATE()), 1) AS first_day_of_year;
  
-- 5. Write a query to get the last day of the current year.
SELECT LAST_DAY(MAKEDATE(YEAR(CURDATE()), 365)) AS last_day_of_year;
  
-- 6. Write a query to calculate the age in year 
SELECT first_name, last_name, FLOOR(DATEDIFF(CURDATE(), birth_date) / 365) AS age
FROM Employees;

-- 7. Write a query to get the current date in the following format.  Sample date : 2014-09-04 Output : September 4, 2014 
SELECT DATE_FORMAT(CURDATE(), '%M %e, %Y') AS formatted_date;

-- 8. Write a query to get the current date in the following format.  Thursday September 2014
SELECT DATE_FORMAT(CURDATE(), '%W %M %Y') AS formatted_date;
 
-- 9. Write a query to extract the year from the current date.  
SELECT YEAR(CURDATE()) AS current_year;

-- 10. Write a query to get the DATE value from a given day (number in N).  Sample days : 730677 Output : 2000-07-11 
SELECT ADDDATE('0001-01-01', 730676) AS converted_date;


 -- 11. Write a query to get the first name and hire date from employees table where hire date between '1987-06-01' and '1987-07-30'   Sample table : employees 
SELECT first_name, hire_date
FROM Employees
WHERE hire_date BETWEEN '1987-06-01' AND '1987-07-30';

-- 12. Write a query to display the current date in the following format Sample output : Thursday 4th September 2014 00:00:00 
SELECT DATE_FORMAT(NOW(), '%W %D %M %Y %H:%i:%s') AS formatted_date;

-- 13.Write a query to display the current date in the following format.  Sample output : 05/09/2014 
SELECT DATE_FORMAT(CURDATE(), '%d/%m/%Y') AS formatted_date;

-- 14.Write a query to display the current date in the following format.  Sample output : 12:00 AM Sep 5, 2014 
SELECT DATE_FORMAT(NOW(), '%l:%i %p %b %e, %Y') AS formatted_date;

-- 15. Write a query to get the firstname, lastname who joined in the month of June. Sample table : employees 
SELECT first_name, last_name
FROM Employees
WHERE MONTH(hire_date) = 6;

-- 16. Write a query to get the years in which more than 10 employees joined.  Sample table : employees 
SELECT YEAR(hire_date) AS join_year, COUNT(*) AS total_employees
FROM Employees
GROUP BY YEAR(hire_date)
HAVING COUNT(*) > 10;

-- 17. Write a query to get first name of employees who joined in 1987.  
SELECT first_name
FROM Employees
WHERE YEAR(hire_date) = 1987;
