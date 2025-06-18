# Like Clause
use assignment1;

# show the employee names starting with vowels
SELECT first_name FROM Employees 
WHERE first_name REGEXP '^[aeiouAEIOU]';

# show the employee names ending with vowels
SELECT first_name FROM Employees 
WHERE first_name REGEXP '[aeiouAEIOU]$';

# show the department names having exactly 5 characters
SELECT dept_name FROM Departments
WHERE LENGTH(dept_name) = 5;

# show the employee names starting with a and having min 2 characters
SELECT first_name FROM Employees
WHERE first_name LIKE 'a_%%';

# show the employees names that start with a and end with r
SELECT first_name FROM Employees
WHERE first_name LIKE 'a%r';

