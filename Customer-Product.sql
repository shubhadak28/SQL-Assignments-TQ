create database homework;
use homework;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50),
    PostalCode VARCHAR(10),
    Country VARCHAR(50)
);


CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2)
);

-- Insert sample data into Customers
INSERT INTO Customers VALUES 
(1, 'Alice', 'London', '10001', 'UK'),
(2, 'Bob', 'Berlin', '121110', 'Germany'),
(3, 'Charlie', 'Oslo', NULL, 'Norway'),
(4, 'David', 'Amsterdam', '1012', 'Netherlands'),
(5, 'Eve', 'Madrid', '28001', 'Spain'),
(6, 'Frank', 'Berlin', NULL, 'Germany'),
(7, 'Grace', 'London', '10002', 'UK'),
(8, 'Heidi', 'Cairo', '11311', 'Egypt'),
(9, 'Ivan', 'Athens', '10434', 'Greece'),
(10, 'Judy', 'Paris', NULL, 'France'),
(11, 'Kevin', 'Vienna', '1010', 'Austria'),
(12, 'Laura', 'Stockholm', '11120', 'Sweden');


-- Insert sample data into Products
INSERT INTO Products VALUES
(1, 'Chocolade', 10.50),
(2, 'Geitost', 15.00),
(3, 'Pavlova', 25.00),
(4, 'Tofu', 20.00),
(5, 'Cheddar', 30.00),
(6, 'Mozzarella', 20.00),
(7, 'Camembert', 12.00);


-- 1. Select the City column from Customers
SELECT City FROM Customers;


-- 2. Select all distinct Country values
SELECT DISTINCT Country FROM Customers;

-- 3. Records where City is 'London'
SELECT * FROM Customers WHERE City = 'London';

-- 4. Records where City is NOT 'Berlin'
SELECT * FROM Customers WHERE City != 'Berlin';

-- 5. CustomerID = 23
SELECT * FROM Customers WHERE CustomerID = 23;

-- 6. City = 'Berlin' AND PostalCode = 121110
SELECT * FROM Customers WHERE City = 'Berlin' AND PostalCode = '121110';

-- 7. City = 'Berlin' OR City = 'London'
SELECT * FROM Customers WHERE City IN ('Berlin', 'London');

-- 8. Sort by City alphabetically
SELECT * FROM Customers ORDER BY City ASC;

-- 9. Sort by City in reverse
SELECT * FROM Customers ORDER BY City DESC;

-- 10. Sort by Country, then City
SELECT * FROM Customers ORDER BY Country, City;

-- 11. PostalCode is empty (NULL)
SELECT * FROM Customers WHERE PostalCode IS NULL;

-- 12. PostalCode is NOT empty
SELECT * FROM Customers WHERE PostalCode IS NOT NULL;

-- 13. Set City to 'Oslo' where Country is 'Norway'
UPDATE Customers SET City = 'Oslo' WHERE Country = 'Norway';

-- 14. Delete all where Country = 'Norway'
DELETE FROM Customers WHERE Country = 'Norway';

-- 15. MIN Price
SELECT * FROM Products WHERE Price = (SELECT MIN(Price) FROM Products);

-- 16. MAX Price
SELECT * FROM Products WHERE Price = (SELECT MAX(Price) FROM Products);

-- 17. Count records where Price = 20
SELECT COUNT(*) FROM Products WHERE Price = 20;

-- 18. Average Price
SELECT AVG(Price) FROM Products;

-- 19. Sum of Prices
SELECT SUM(Price) FROM Products;

-- 20. City starts with 'a'
SELECT * FROM Customers WHERE City LIKE 'a%';

-- 21. City ends with 'a'
SELECT * FROM Customers WHERE City LIKE '%a';

-- 22. City contains 'a'
SELECT * FROM Customers WHERE City LIKE '%a%';

-- 23. City starts with 'a' and ends with 'b'
SELECT * FROM Customers WHERE City LIKE 'a%b';

-- 24. City NOT starting with 'a'
SELECT * FROM Customers WHERE City NOT LIKE 'a%';

-- 25. Second letter is 'a'
SELECT * FROM Customers WHERE City LIKE '_a%';

-- 26. First letter 'a', 'c', or 's'
SELECT * FROM Customers WHERE City LIKE 'a%' OR City LIKE 'c%' OR City LIKE 's%';

-- 27. First letter from 'a' to 'f'
SELECT * FROM Customers WHERE City >= 'a' AND City < 'g';

-- 28. First letter NOT in 'a', 'c', 'f'
SELECT * FROM Customers WHERE City NOT LIKE 'a%' AND City NOT LIKE 'c%' AND City NOT LIKE 'f%';

-- 29. Country IN Norway or France
SELECT * FROM Customers WHERE Country IN ('Norway', 'France');

-- 30. Country NOT IN Norway or France
SELECT * FROM Customers WHERE Country NOT IN ('Norway', 'France');

-- 31. Price BETWEEN 10 AND 20
SELECT * FROM Products WHERE Price BETWEEN 10 AND 20;

-- 32. Price NOT BETWEEN 10 AND 20
SELECT * FROM Products WHERE Price NOT BETWEEN 10 AND 20;

-- 33. ProductName BETWEEN 'Geitost' AND 'Pavlova'
SELECT * FROM Products WHERE ProductName BETWEEN 'Geitost' AND 'Pavlova';

-- 34. ALIAS for PostalCode
SELECT CustomerID, City, PostalCode AS Pno FROM Customers;

-- 35. Alias for table
SELECT * FROM Customers AS Consumers;

-- 36. Count customers per country
SELECT Country, COUNT(*) AS TotalCustomers FROM Customers GROUP BY Country;

-- 37. Count customers per country DESC
SELECT Country, COUNT(*) AS TotalCustomers FROM Customers GROUP BY Country ORDER BY TotalCustomers DESC;

-- 38. Create database
CREATE DATABASE testDB;

-- 39. Delete database
DROP DATABASE testDB;


CREATE TABLE Persons (
    PersonID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    City VARCHAR(50)
);

-- 40. Add DATE column
ALTER TABLE Persons ADD Birthday DATE;

-- 41. Delete column
ALTER TABLE Persons DROP COLUMN Birthday;
