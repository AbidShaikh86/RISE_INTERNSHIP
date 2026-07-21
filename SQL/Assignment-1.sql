--Literal SELECT Statement Practice Problems

--1) Execute a literal select statement that returns your name.
SELECT 'Gulamabid' + ' ' + 'Shaikh'

--2) Write the literal select statement that evaluates the product of 7 and 4.
SELECT 7 * 4 as 'product'

--3) Write the literal select statement that takes the difference of 7 and 4 then multiplies that difference by 8.
SELECT (7-4) * 8

--4) Write a literal select statement that returns the phrase “Brewster’s SQL Training Class”. (Hint: note the single apostrophe in the string).
SELECT '“Brewster’s SQL Training Class”'

--5) Execute a literal SELECT statement that returns the phrase “Day 1 of Training” in one column and the result of 5*3 in another column.
SELECT '"Day 1 of Training"', 5*3

--Insert/Update/Delete

-- for this i have to create table 
CREATE TABLE employee
(EID INT,
Ename VARCHAR(30),
Eage INT,
Esalary Money,
depart varchar(15))

--1. Insert a new employee record with all details provided directly.
INSERT INTO employee
VALUES(101, 'Shailesh', 21, 80000, 'AI')

INSERT INTO employee
VALUES(102, 'Mahesh', 24, 50000, 'Cloud'),
(103, 'Ramesh', 24, 20000, 'HR'),
(104, 'Chatur', 24, 25000, 'HR'),
(105, 'Jignesh', 24, 17000, 'AI'),
(106, 'Raja', 24, 37000, 'Cloud')

--2. Add multiple new team members to the HR department at once.
INSERT INTO employee
VALUES(107, 'Jaymin', 24, 25000, 'HR'),
(108, 'Ketan', 24, 37000, 'HR')

--3. Register an employee who hasn't been assigned a salary yet.
INSERT INTO employee (EID, Ename, Eage, depart) VALUES
(109, 'kartik', 19, 'AI')

--4. Update the salary to 85,000 for everyone working in the 'Cloud' department.
UPDATE employee
SET Esalary = 85000
WHERE depart = 'Cloud'

--5. Change both the department and salary for a specific employee by name
UPDATE employee
SET Esalary = 40000,  depart = 'Cloud'
where Ename = 'Ketan'

--6. Give a flat 10% appraisal boost to employee working in AI department.
UPDATE employee
SET Esalary = Esalary * 1.10
WHERE depart = 'AI'

--7. Assign an initial entry-level salary of 30,000 to anyone whose salary column is completely blank (NULL).
UPDATE employee
SET Esalary = 30000
WHERE Esalary is NULL

--8. Remove a specific employee from the system using their unique ID.
DELETE FROM employee
where EID = 109

--9. Remove all records belonging to a department that has been completely shut down.
DELETE FROM employee
WHERE depart = 'AI'

--10.Drop records of any employee earning less than 20,000 in the Finance division.
DELETE FROM employee 
WHERE depart = 'Finance' AND Esalary < 20000


select * from employee