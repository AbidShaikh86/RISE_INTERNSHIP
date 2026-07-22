CREATE TABLE Employee
(
	EID INT,
	Ename VARCHAR(30),
	Department VARCHAR(15),
	Salary Money
)

INSERT INTO Employee VALUES 
(1, 'Alice Smith', 'AI', 95000),
(2, 'Bob Jones', 'Cloud', 112000),
(3, 'Charlie Brown', 'QA', 75000),
(4, 'Diana Prince', 'Finance', 98500),
(5, 'Evan Wright', 'Legal', 125000),
(6, 'Fiona Gallagher', 'AI', 91000),
(7, 'George Michael', 'Cloud', 108000),
(8, 'Hannah Abbott', 'QA', 72000),
(9, 'Ian Somerhalder', 'Finance', 94000),
(10, 'Julia Roberts', 'Legal', 130000)

INSERT INTO Employee VALUES 
(12, 'Abid Shaikh', 'DevOps', 80000)

--1. Write a query to display each Department and the total number of employees working in that department from the Employee table.
SELECT Department, COUNT(EID) AS Total_Number_of_Employee FROM Employee
GROUP BY Department

--2. Write a query to find the Department, the highest salary (MAX), and the average salary (AVG) for each department.
SELECT Department, MAX(Salary) AS Highest_Salary, AVG(Salary) AS Average_Salary FROM Employee
GROUP BY Department

--3. Write a query to count how many employees are in each Department.
SELECT Department, COUNT(EID) AS Employees FROM Employee
GROUP BY Department

--4. Write a query to find the minimum salary in each Department
SELECT Department, MIN(Salary) AS Minimum_Salary FROM Employee
GROUP BY Department

--5. Write a query to show departments that have more than 2 employees
SELECT Department, COUNT(EID) as Employee_Count FROM Employee
GROUP BY Department
HAVING COUNT(EID) > 2

--6. Write a query to show departments where the total salary payout is greater than 100,000
SELECT Department, SUM(Salary) as Total_Salary FROM Employee
GROUP BY Department
HAVING SUM(Salary) > 100000

--7. Write a query to find departments where the average salary is above 60,000
SELECT Department, AVG(Salary) as Average_Salary FROM Employee
GROUP BY Department
HAVING AVG(Salary) > 60000

--8. Write a query to show departments that have exactly 1 employee
SELECT Department, COUNT(EID) as Employee_Count FROM Employee
GROUP BY Department
HAVING COUNT(EID) = 1

--9. Write a query to list all employees sorted by Salary from highest to lowest
SELECT * FROM Employee
ORDER BY Salary DESC

--10.Write a query to list all employees sorted by Ename in alphabetical order
SELECT * FROM Employee
ORDER BY Ename 

--11.Write a query to list all employees sorted by Department alphabetically, and then by Ename alphabetically.
SELECT * FROM Employee
ORDER BY Department, Ename 