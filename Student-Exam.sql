use assignment1;

-- Students Table
CREATE TABLE Students (
    SID INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50)
);

-- Subjects Table
CREATE TABLE Subjects (
    SubId INT PRIMARY KEY,
    SubName VARCHAR(50),
    MaxMarks INT,
    Passing INT
);

-- Exam Table
CREATE TABLE Exam (
    SID INT,
    SubId INT,
    Marks INT,
    FOREIGN KEY (SID) REFERENCES Students(SID),
    FOREIGN KEY (SubId) REFERENCES Subjects(SubId)
);


-- Students
INSERT INTO Students (SID, Name, City) VALUES
(1, 'Ram', 'Pune'),
(2, 'Sham', 'Mumbai'),
(3, 'Sita', 'Pune'),
(4, 'Gita', 'Nashik');

-- Subjects
INSERT INTO Subjects (SubId, SubName, MaxMarks, Passing) VALUES
(1, 'Maths', 100, 40),
(2, 'English', 100, 40),
(3, 'Marathi', 100, 40),
(4, 'Hindi', 50, 15);

-- Exam
INSERT INTO Exam (SID, SubId, Marks) VALUES
(1, 1, 100),
(1, 2, 85),
(1, 3, 40),
(1, 4, 45),
(2, 1, 35),
(2, 3, 25),
(2, 4, 15),
(3, 2, 87),
(3, 3, 45),
(3, 4, 42);

-- Insert a new student
INSERT INTO Students (SID, Name, City) VALUES (5, 'Ramesh', 'Hyderabad');

-- Update Gita's city to Sangli
UPDATE Students SET City = 'Sangli' WHERE SID = 4;


-- List of all students
SELECT SID, Name, City FROM Students;

-- Student exam details with percentage
SELECT s.SID, s.Name, sub.SubName, e.Marks, sub.MaxMarks,
       ROUND((e.Marks * 100.0 / sub.MaxMarks), 2) AS Percentage
FROM Students s
JOIN Exam e ON s.SID = e.SID
JOIN Subjects sub ON e.SubId = sub.SubId;

 -- Add Pass/Fail column
 SELECT s.SID, s.Name, sub.SubName, e.Marks, sub.MaxMarks,
       CASE WHEN e.Marks >= sub.Passing THEN 'P' ELSE 'F' END AS Status
FROM Students s
JOIN Exam e ON s.SID = e.SID
JOIN Subjects sub ON e.SubId = sub.SubId;


--  Students who were absent for any subject

SELECT s.SID, s.Name, sub.SubName
FROM Students s
CROSS JOIN Subjects sub
WHERE NOT EXISTS (
    SELECT 1 FROM Exam e
    WHERE e.SID = s.SID AND e.SubId = sub.SubId
);

-- Topper in each subject
SELECT sub.SubId, sub.SubName, s.Name, e.Marks, sub.MaxMarks
FROM Exam e
JOIN Subjects sub ON e.SubId = sub.SubId
JOIN Students s ON e.SID = s.SID
WHERE (e.SubId, e.Marks) IN (
    SELECT SubId, MAX(Marks) FROM Exam GROUP BY SubId
);

-- Count of attempts and passes per subject
SELECT sub.SubId, sub.SubName,
       COUNT(e.Marks) AS AttemptCount,
       SUM(CASE WHEN e.Marks >= sub.Passing THEN 1 ELSE 0 END) AS PassCount
FROM Subjects sub
LEFT JOIN Exam e ON sub.SubId = e.SubId
GROUP BY sub.SubId, sub.SubName;


-- Total Percentage of each student
SELECT s.SID, s.Name,
       SUM(e.Marks) AS TotalMarks,
       SUM(sub.MaxMarks) AS TotalMaxMarks,
       ROUND((SUM(e.Marks) * 100.0 / SUM(sub.MaxMarks)), 2) AS Percentage
FROM Students s
JOIN Exam e ON s.SID = e.SID
JOIN Subjects sub ON e.SubId = sub.SubId
GROUP BY s.SID, s.Name;

-- Pivot Table of Student vs Subjects
SELECT s.Name AS StudentName,
       MAX(CASE WHEN e.SubId = 1 THEN e.Marks END) AS Maths,
       MAX(CASE WHEN e.SubId = 2 THEN e.Marks END) AS English,
       MAX(CASE WHEN e.SubId = 3 THEN e.Marks END) AS Marathi,
       MAX(CASE WHEN e.SubId = 4 THEN e.Marks END) AS Hindi
FROM Students s
LEFT JOIN Exam e ON s.SID = e.SID
GROUP BY s.Name;
