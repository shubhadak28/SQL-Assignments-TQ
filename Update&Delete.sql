# Update and Delete
use assignment1;

# 1. Increase the salary of all employees by 10%
UPDATE Employees SET salary = salary * 1.10;

# 2. Increase the salary of employees by 1000 who works in department 60
UPDATE Employees SET salary = salary + 1000
WHERE dept_id = 60;

# 3. Delete the employees working in 60 department -- Ensure to rollback this
START TRANSACTION;
DELETE FROM Employees WHERE dept_id = 60;
-- ROLLBACK; -- run this to undo
-- COMMIT;   -- run this to confirm deletion
