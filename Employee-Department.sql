
-- Countries Table
CREATE TABLE Countries (
  country_id CHAR(2) PRIMARY KEY,
  country_name VARCHAR(50)
);

INSERT INTO Countries VALUES
('US', 'United States'),
('UK', 'United Kingdom'),
('IN', 'India');

-- Locations Table
CREATE TABLE Locations (
  location_id INT PRIMARY KEY,
  street_address VARCHAR(100),
  city VARCHAR(50),
  state_province VARCHAR(50),
  country_id CHAR(2),
  FOREIGN KEY (country_id) REFERENCES Countries(country_id)
);

INSERT INTO Locations VALUES
(1000, '1st Street', 'London', 'England', 'UK'),
(1001, '2nd Street', 'New York', 'NY', 'US'),
(1002, 'MG Road', 'Mumbai', 'Maharashtra', 'IN');

-- Departments Table
CREATE TABLE Departments (
  department_id INT PRIMARY KEY,
  department_name VARCHAR(50),
  manager_id INT,
  location_id INT,
  FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);

INSERT INTO Departments VALUES
(10, 'Administration', 101, 1000),
(20, 'IT', 102, 1001),
(30, 'HR', 103, 1002);

-- Jobs Table
CREATE TABLE Jobs (
  job_id VARCHAR(10) PRIMARY KEY,
  job_title VARCHAR(50),
  min_salary INT,
  max_salary INT
);

INSERT INTO Jobs VALUES
('AD_PRES', 'President', 15000, 30000),
('IT_PROG', 'Programmer', 4000, 10000),
('HR_REP', 'HR Representative', 3000, 9000);

-- Employees Table
CREATE TABLE Employees (
  employee_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  job_id VARCHAR(10),
  manager_id INT,
  hire_date DATE,
  salary INT,
  department_id INT,
  FOREIGN KEY (job_id) REFERENCES Jobs(job_id),
  FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO Employees VALUES
(101, 'John', 'Smith', 'AD_PRES', NULL, '2000-01-01', 24000, 10),
(102, 'Sara', 'Lee', 'IT_PROG', 101, '2005-03-15', 9000, 20),
(103, 'Michael', 'Brown', 'HR_REP', 101, '2002-06-20', 6000, 30),
(104, 'Robert', 'Jones', 'IT_PROG', 102, '1987-06-10', 9500, 20),
(105, 'Emily', 'Clark', 'HR_REP', 103, '1990-09-12', 7000, 30);

-- Job History Table
CREATE TABLE Job_History (
  employee_id INT,
  start_date DATE,
  end_date DATE,
  job_id VARCHAR(10),
  department_id INT,
  FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
  FOREIGN KEY (job_id) REFERENCES Jobs(job_id),
  FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO Departments VALUES (90, 'Finance', NULL, 1001);


INSERT INTO Job_History VALUES 
(104, '2000-01-01', '2005-01-01', 'IT_PROG', 90), 
(105, '1989-01-01', '1991-01-01', 'HR_REP', 90);



-- 1.Write a query to find the addresses (location_id, street_address, city,state_province, country_name) of all the departments.
SELECT d.location_id, l.street_address, l.city, l.state_province, c.country_name
FROM Departments d
JOIN Locations l ON d.location_id = l.location_id
JOIN Countries c ON l.country_id = c.country_id;

-- 2. Write a query to find the names (first_name, last name), department ID and name of all the employees.
SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id;

-- 3. Find the names (first_name, last_name), job, department number, and department name of the employees who work in London.
SELECT e.first_name, e.last_name, j.job_title, d.department_id, d.department_name
FROM Employees e
JOIN Jobs j ON e.job_id = j.job_id
JOIN Departments d ON e.department_id = d.department_id
JOIN Locations l ON d.location_id = l.location_id
WHERE l.city = 'London';

-- 4. Write a query to find the employee id, name (last_name) along with their manager_id, manager name (last_name).
SELECT e.employee_id, e.last_name, e.manager_id, m.last_name AS manager_last_name
FROM Employees e
LEFT JOIN Employees m ON e.manager_id = m.employee_id;

-- 5. Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'.
SELECT first_name, last_name, hire_date
FROM Employees
WHERE hire_date > (
  SELECT hire_date
  FROM Employees
  WHERE last_name = 'Jones'
);

-- 6. Write a query to get the department name and number of employees in thdepartment.
SELECT d.department_name, COUNT(e.employee_id) AS num_employees
FROM Departments d
LEFT JOIN Employees e ON d.department_id = e.department_id
GROUP BY d.department_name;

-- 7. Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.
SELECT employee_id, job_id,
  DATEDIFF(end_date, start_date) AS days_worked
FROM Job_History
WHERE department_id = 90;


-- 8. Write a query to display the department ID, department name and manager first name.
SELECT d.department_id, d.department_name, e.first_name AS manager_first_name
FROM Departments d
LEFT JOIN Employees e ON d.manager_id = e.employee_id;

-- 9. Write a query to display the department name, manager name, and city.
SELECT d.department_name,
       CONCAT(e.first_name, ' ', e.last_name) AS manager_name,
       l.city
FROM Departments d
LEFT JOIN Employees e ON d.manager_id = e.employee_id
JOIN Locations l ON d.location_id = l.location_id;

-- 10. Write a query to display the job title and average salary of employees.
SELECT j.job_title, AVG(e.salary) AS avg_salary
FROM Employees e
JOIN Jobs j ON e.job_id = j.job_id
GROUP BY j.job_title;


-- 11. Display job title, employee name, and the difference between salary of the employee and minimum salary for the job.
SELECT j.job_title,
       CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
       e.salary - j.min_salary AS salary_diff
FROM Employees e
JOIN Jobs j ON e.job_id = j.job_id;


-- 12. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary
SELECT jh.*
FROM Job_History jh
JOIN Employees e ON jh.employee_id = e.employee_id
WHERE e.salary > 10000;
