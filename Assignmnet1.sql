create database Assignment1;
use Assignment1;

-- Create Departments table
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50),
    manager_id INT
);

-- Create Employees table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    job VARCHAR(50),
    hire_date DATE,
    salary DECIMAL(10,2),
    dept_id INT,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);


-- Insert Departments
INSERT INTO Departments VALUES
(10, 'Sales', 'New York', 101),
(20, 'Admin', 'Dallas', 102),
(30, 'IT', 'Chicago', 103),
(60, 'HR', 'Boston', NULL),
(80, 'Dev', 'Boston', 105),
(100, 'Finance', 'LA', 104),
(110, 'Logistics', 'Dallas', 0);


-- Insert Employees
INSERT INTO Employees VALUES
(1, 'Alice', 'Brown', 'Programmer', '1987-03-15', 12000, 30, 103),
(2, 'Bob', 'Carter', 'Shipping Clerk', '1987-07-19', 8000, 100, 104),
(3, 'Carol', 'Smith', 'Programmer', '1990-11-11', 4500, 60, NULL),
(4, 'David', 'Clark', 'Salesman', '1992-01-22', 16000, 10, 101),
(5, 'Eve', 'Jones', 'Accountant', '1985-09-01', 10000, 20, 102),
(6, 'Frank', 'White', 'Programmer', '1987-12-31', 11000, 30, 103),
(7, 'Grace', 'Black', 'Manager', '1999-05-20', 9000, 80, 105),
(8, 'Harry', 'Green', 'Shipping Clerk', '1995-08-10', 15000, 100, 104),
(9, 'Ivy', 'Stone', 'Programmer', '2000-06-01', 20000, 80, 105),
(10, 'John', 'Echo', 'Programmer', '1986-04-05', 9500, 110, 0);

-- 1.Salary NOT between 10000 and 15000
SELECT first_name, last_name, salary FROM Employees
WHERE salary NOT BETWEEN 10000 AND 15000;

-- 2.Employees in dept 30 or 100, order by dept
SELECT first_name, last_name, dept_id FROM Employees
WHERE dept_id IN (30, 100)
ORDER BY dept_id;

-- 3 Salary NOT between 10k-15k AND in dept 30 or 100
SELECT first_name, last_name, salary FROM Employees
WHERE salary NOT BETWEEN 10000 AND 15000 AND dept_id IN (30, 100);

-- 4.Employees hired in 1987
SELECT first_name, last_name, hire_date FROM Employees
WHERE YEAR(hire_date) = 1987;

-- 5.First name contains both 'b' and 'c'
SELECT first_name FROM Employees
WHERE first_name LIKE '%b%' AND first_name LIKE '%c%';

-- 6 Job is Programmer or Shipping Clerk, salary ≠ 4500, 10000, 15000
SELECT last_name, job, salary FROM Employees
WHERE job IN ('Programmer', 'Shipping Clerk') 
AND salary NOT IN (4500, 10000, 15000);

-- 7. Last names with exactly 6 characters
SELECT last_name FROM Employees
WHERE LENGTH(last_name) = 6;

-- 8 'e' as third character
SELECT last_name FROM Employees
WHERE last_name LIKE '__e%';

-- 9 All job types
SELECT DISTINCT job FROM Employees;

-- 10 Names with PF = 15% of salary




