use homework;

CREATE TABLE Provinces (
  province_id INT PRIMARY KEY,
  province_name VARCHAR(50)
);

INSERT INTO Provinces VALUES
(1, 'Ontario'),
(2, 'Quebec'),
(3, 'British Columbia');

CREATE TABLE Patients (
  patient_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  gender CHAR(1),
  birth_date DATE,
  allergies VARCHAR(100),
  height INT,
  weight INT,
  city VARCHAR(50),
  province_id INT,
  FOREIGN KEY (province_id) REFERENCES Provinces(province_id)
);

INSERT INTO Patients VALUES
(1, 'John', 'Doe', 'M', '2020-04-15', 'Penicillin', 175, 70, 'Toronto', 1),
(2, 'Jane', 'Smith', 'F', '1990-06-20', NULL, 165, 60, 'Montreal', 2),
(3, 'Chris', 'Evans', 'M', '1987-11-22', 'Morphine', 180, 80, 'Vancouver', 3),
(4, 'Cathy', 'Brown', 'F', '2000-09-13', '', 150, 55, 'Calgary', 3),
(5, 'Alex', 'King', 'M', '1995-03-01', NULL, 190, 85, 'Ottawa', 1);


CREATE TABLE Doctors (
  doctor_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  speciality VARCHAR(100)
);

INSERT INTO Doctors VALUES
(1, 'Emily', 'Stone', 'Cardiologist'),
(2, 'Mark', 'Wilson', 'Neurologist'),
(3, 'Olivia', 'Taylor', 'Orthopedic');


CREATE TABLE Admissions (
  admission_id INT PRIMARY KEY,
  patient_id INT,
  admission_date DATE,
  discharge_date DATE,
  diagnosis VARCHAR(100),
  attending_doctor_id INT,
  FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
  FOREIGN KEY (attending_doctor_id) REFERENCES Doctors(doctor_id)
);

INSERT INTO Admissions VALUES
(1, 1, '2024-01-10', '2024-01-15', 'Flu', 1),
(2, 2, '2023-07-01', '2023-07-05', 'Allergy', 2),
(3, 3, '2022-10-12', '2022-10-18', 'Fracture', 3),
(4, 4, '2021-05-22', '2021-05-25', 'Infection', 1),
(5, 5, '2020-12-01', '2020-12-10', 'Migraine', 2);


-- 1. Patients with gender 'M'
SELECT first_name, last_name, gender
FROM Patients
WHERE gender = 'M';


-- 2. Patients without allergies
SELECT first_name, last_name
FROM Patients
WHERE allergies IS NULL OR allergies = '';

-- 3. Patients whose first name starts with 'C'
SELECT *
FROM Patients
WHERE first_name LIKE 'C%';

-- 4. Patients with height between 100 and 200
SELECT *
FROM Patients
WHERE height BETWEEN 100 AND 200;

-- 5. Update NULL allergies to 'NKA'
UPDATE Patients
SET allergies = 'NKA'
WHERE allergies IS NULL;

-- 6. Patients born in 2020
SELECT COUNT(*) AS birth_2020_count
FROM Patients
WHERE YEAR(birth_date) = 2020;

-- 7. Patients with greatest height
SELECT *
FROM Patients
WHERE height = (SELECT MAX(height) FROM Patients);

-- 8. Total male and female patients
SELECT gender, COUNT(*) AS total
FROM Patients
GROUP BY gender;

-- 9. Patients allergic to Penicillin or Morphine
SELECT first_name, last_name, allergies
FROM Patients
WHERE allergies IN ('Penicillin', 'Morphine')
ORDER BY allergies ASC, first_name ASC, last_name ASC;

-- 10. Number of admissions attended per doctor
SELECT d.first_name, d.last_name, COUNT(a.admission_id) AS total_admissions
FROM Doctors d
JOIN Admissions a ON d.doctor_id = a.attending_doctor_id
GROUP BY d.doctor_id, d.first_name, d.last_name;

-- 11. Admission details: patient name, diagnosis, doctor name
SELECT 
  CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
  a.diagnosis,
  CONCAT(d.first_name, ' ', d.last_name) AS doctor_name
FROM Admissions a
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Doctors d ON a.attending_doctor_id = d.doctor_id;
