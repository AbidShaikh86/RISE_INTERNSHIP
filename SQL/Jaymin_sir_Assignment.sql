--1. Create a database named CompanyDB.
CREATE DATABASE CompanyDB

--2. Use the CompanyDB database and create the Employee table with all the columns mentioned above.
USE CompanyDB

CREATE TABLE Employee
(
	EmpID INT UNIQUE,
	FirstName VARCHAR(15),
	LastName VARCHAR(15),
	Department VARCHAR(25),
	Designation VARCHAR(30),
	Salary Money,
	City VARCHAR(20),
	Gender CHAR(2) DEFAULT 'M',
	JoiningDate DATE,
	Age INT,
	CONSTRAINT gender_check CHECK(Gender IN ('M','F'))
)

INSERT INTO Employee VALUES
(101, 'Aarav', 'Sharma', 'IT', 'Manager', 95000, 'Vadodara', 'M', '2019-03-15', 22),
(102, 'Priya', 'Patel', 'HR', 'Executive', 45000, 'Ahmedabad', 'F', '2021-06-01', 26),
(103, 'Rohan', 'Verma', 'Finance', 'Analyst', 60000, 'Surat', 'M', '2020-11-10', 21),
(104, 'Ananya', 'Iyer', 'Sales', 'Manager', 88000, 'Gandhi-nagar', 'F', '2018-01-22', 30),
(105, 'Vikram', 'Singh', 'IT', 'Analyst', 55000, 'Vadodara', 'M', '2022-02-14', 23),
(106, 'Sanya', 'Deshmukh', 'Sales', 'Executive', 42000, 'Ahmedabad', 'F', '2023-08-01', 24),
(107, 'Karan', 'Mehta', 'Finance', 'Manager', 92000, 'Vadodara', 'M', '2017-09-05', 23),
(108, 'Neha', 'Gupta', 'HR', 'Manager', 85000, 'Gandhi-nagar', 'F', '2019-12-18', 20),
(109, 'Aditya', 'Rao', 'IT', 'Executive', 48000, 'Gandhi-nagar', 'M', '2022-07-11', 25),
(110, 'Kavya', 'Nair', 'Sales', 'Analyst', 52000, 'Ahmedabad', 'F', '2021-04-19', 26)

SELECT * FROM Employee

--3. Add a new column Email to the Employee table.
ALTER TABLE Employee 
ADD Email VARCHAR(20)

--4. Modify the Email column to increase its size.
ALTER TABLE Employee
ALTER COLUMN Email VARCHAR(30)

--5. Rename the column City to Location.
sp_rename 'Employee.City','Location'

--6. Rename the table Employee to EmployeeDetails and then rename it back to Employee.
sp_rename 'Employee','EmployeeDetails'

--7. Drop the Email column from the Employee table.
ALTER TABLE EmployeeDetails
DROP COLUMN Email

--8. Write a query to check the structure (columns and data types) of the Employee table.
sp_help 'EmployeeDetails'

--9. Make EmpID column the Primary Key of the Employee table.
ALTER TABLE EmployeeDetails
DROP CONSTRAINT UQ__Employee__AF2DBA78A720EAA1

ALTER TABLE EmployeeDetails
ALTER COLUMN EmpID INT NOT NULL

ALTER TABLE EmployeeDetails
ADD CONSTRAINT PRIMARY_KEY PRIMARY KEY(EmpID)

--10. Add a NOT NULL constraint on the FirstName column.
ALTER TABLE EmployeeDetails
ALTER COLUMN FirstName VARCHAR(25) NOT NULL

--11. Add a UNIQUE constraint on the column to ensure no two employees have the same email (create a new column Email and apply the constraint).
ALTER TABLE EmployeeDetails
ADD Email VARCHAR(30)

ALTER TABLE EmployeeDetails
ADD CONSTRAINT unique_email UNIQUE(Email)

sp_help 'EmployeeDetails'

--12. Add a DEFAULT constraint on the Department column so that if no value is provided, it should be set as 'General'.
ALTER TABLE EmployeeDetails
ADD CONSTRAINT default_department DEFAULT 'GENERAL' FOR Department;

--13. Add a CHECK constraint on the Salary column so that salary cannot be less than 10,000.
ALTER TABLE EmployeeDetails
ADD CONSTRAINT salary_constraint CHECK(Salary > 10000)

--14. Add a CHECK constraint on the Age column so that age must be between 18 and 60.
ALTER TABLE EmployeeDetails
ADD CONSTRAINT age_check CHECK(Age >= 18 AND Age < 60)

--15. Remove the CHECK constraint applied on the Salary column.
ALTER TABLE EmployeeDetails
DROP CONSTRAINT salary_constraint

--16. Add a FOREIGN KEY unrelated simple self-constraint task: add a Manager_EmpID column and apply a CHECK constraint so it cannot be equal to EmpID itself.
ALTER TABLE EmployeeDetails
ADD Manager_EmpID INT

ALTER TABLE EmployeeDetails
ADD CONSTRAINT manager_id_chk CHECK (EmpID != Manager_EmpID)

--17. Insert 15 records into the Employee table with different departments, cities, and salaries.
INSERT INTO EmployeeDetails VALUES
(111, 'Harsh', 'Patel', 'IT', 'Manager', 98000.00, 'Ahmedabad', 'M', '2018-05-10', 37, 'harsh.patel@company.com', NULL),
(112, 'Drashti', 'Shah', 'Sales', 'Manager', 91000.00, 'Surat', 'F', '2019-02-18', 35, 'drashti.shah@company.com', NULL),
(113, 'Chirag', 'Prajapati', 'Finance', 'Manager', 94000.00, 'Vadodara', 'M', '2017-11-01', 39, 'chirag.prajapati@company.com', NULL),
(114, 'Nidhi', 'Joshi', 'IT', 'Analyst', 58000.00, 'Gandhinagar', 'F', '2021-08-15', 27, 'nidhi.joshi@company.com', 111),
(115, 'Siddharth', 'Solanki', 'IT', 'Executive', 46000.00, 'Anand', 'M', '2023-01-10', 25, 'siddharth.solanki@company.com', 111),
(116, 'Kinjal', 'Vora', 'Sales', 'Executive', 44000.00, 'Surat', 'F', '2022-04-05', 26, 'kinjal.vora@company.com', 112),
(117, 'Parth', 'Desai', 'Sales', 'Analyst', 53000.00, 'Vadodara', 'M', '2020-09-20', 29, 'parth.desai@company.com', 112),
(118, 'Rucha', 'Trivedi', 'Finance', 'Analyst', 62000.00, 'Ahmedabad', 'F', '2021-03-12', 30, 'rucha.trivedi@company.com', 113),
(119, 'Jigar', 'Pandya', 'HR', 'Executive', 43000.00, 'Anand', 'M', '2023-05-22', 24, 'jigar.pandya@company.com', 102),
(120, 'Pooja', 'Chavda', 'HR', 'Analyst', 51000.00, 'Gandhinagar', 'F', '2022-10-14', 28, 'pooja.chavda@company.com', 102)

--18. Insert a new employee record without specifying the Department (to check the DEFAULT constraint).
INSERT INTO EmployeeDetails (EmpID, FirstName, LastName, Designation, Salary, Location, Gender, JoiningDate, Age, Email, Manager_EmpID) VALUES
(121, 'Abid', 'Shaikh','Executive',75000, 'Vadodara', 'M', '2027-01-07', 21,'abid@rise.com', 113)

--19.Update the salary of all employees working in the IT department by increasing it by 10%.
UPDATE EmployeeDetails
SET Salary = Salary * 1.10
WHERE Department = 'IT'

SELECT * FROM EmployeeDetails
--20.Update the Designation of an employee whose EmpID is 105 to 'Senior Executive'.
UPDATE EmployeeDetails
SET Designation = 'Senior Executive'
WHERE EmpID = 105

--21.Delete the record of an employee whose EmpID is 110.
DELETE FROM EmployeeDetails
WHERE EmpID = 110

--22.Delete all employees whose Salary is less than 15,000.
DELETE FROM EmployeeDetails
WHERE Salary < 15000

--23.Update the City of all employees from 'Mumbai' to 'Pune'.
UPDATE EmployeeDetails
SET Location = 'Pune'
WHERE Location = 'Mumbai'

--24. Insert a record and intentionally leave FirstName blank to check if the NOT NULL constraint blocks it.
INSERT INTO EmployeeDetails (EmpID, LastName, Designation, Salary, Location, Gender, JoiningDate, Age, Email, Manager_EmpID) VALUES
(121, 'Shaikh','Executive',75000, 'Vadodara', 'M', '2027-01-07', 21,'abid@rise.com', 113)

--25. Write a query to display all the records from the Employee table.
SELECT * FROM EmployeeDetails

--26. Write a query to display FirstName, LastName, and Salary of all employees.
SELECT FirstName, LastName, Salary FROM EmployeeDetails

--27. Write a query to display the details of employees working in the 'HR' department.
SELECT * FROM EmployeeDetails
WHERE Department = 'HR'

--28. Write a query to display all distinct Department names from the table.
SELECT DISTINCT Department FROM EmployeeDetails

--29. Write a query to display the total number of employees in the table.
SELECT COUNT(EmpID) AS Total_Employee FROM EmployeeDetails

--30. Write a query to display FirstName and Salary and rename the Salary column as MonthlySalary using an alias.
SELECT FirstName, Salary as MonthlySalary FROM EmployeeDetails

--31. Write a query to display all employee details whose Gender is 'F'.
SELECT * FROM EmployeeDetails
WHERE gender = 'F'

--32. Write a query to display the top 5 highest paid employees.
SELECT TOP 5 * FROM EmployeeDetails

--33.Display all employees whose Salary is greater than 30,000 (comparison operator).
SELECT * FROM EmployeeDetails
WHERE Salary > 30000

--34.Display all employees whose Department is 'IT' AND Salary is greater than 25,000 (logical operator).
SELECT * FROM EmployeeDetails
WHERE Department = 'IT' AND Salary > 30000

--35.Display all employees whose Department is 'HR' OR 'Finance'.
SELECT * FROM EmployeeDetails
WHERE Department IN ('HR','Finance')

--36.Display all employees whose Salary is BETWEEN 20,000 and 40,000.
SELECT * FROM EmployeeDetails
WHERE Salary BETWEEN 20000 AND 40000

--37.Display all employees whose City IN ('Delhi', 'Mumbai', 'Pune').
SELECT * FROM EmployeeDetails
WHERE Location IN ('Delhi','Mumbai','Pune')

--38.Display all employees whose FirstName LIKE starts with 'A'.
SELECT * FROM EmployeeDetails
WHERE FirstName LIKE 'A%'

--39.Display all employees whose FirstName LIKE ends with 'a'.
SELECT * FROM EmployeeDetails
WHERE FirstName LIKE '%a'

--40.Display all employees whose Department is NOT 'Sales' (NOT operator).
SELECT * FROM EmployeeDetails
WHERE Department <> 'Sales'

--41.Display the total number of employees in each department.
SELECT Department, COUNT(EmpID) as Total_Emp FROM EmployeeDetails
GROUP BY Department

--42.Display the average salary of employees department-wise.
SELECT Department, AVG(Salary) as Average_Salary FROM EmployeeDetails
GROUP BY Department

--43.Display the maximum salary in each department.
SELECT Department, MAX(Salary) as Average_Salary FROM EmployeeDetails
GROUP BY Department

--44.Display the minimum salary city-wise.
SELECT Location, MIN(Salary) as Average_Salary FROM EmployeeDetails
GROUP BY Location

--45.Display the total salary paid, grouped by Designation.
SELECT Designation, SUM(Salary) as Average_Salary FROM EmployeeDetails
GROUP BY Designation

--46.Display departments having more than 3 employees.
SELECT Department, COUNT(EmpID) as Emp FROM EmployeeDetails
GROUP BY Department
HAVING COUNT(EmpID) > 3

--47.Display departments whose average salary is greater than 30,000.
SELECT Department, AVG(Salary) as Average_Salary FROM EmployeeDetails
GROUP BY Department
HAVING AVG(Salary) > 30000

--48.Display cities having a total employee count greater than 2.
SELECT Location, COUNT(EmpID) as Total_emp FROM EmployeeDetails
GROUP BY Location
HAVING COUNT(EmpID) > 2

--49.Display all employee records sorted by Salary in descending order.
SELECT * FROM EmployeeDetails
ORDER BY Salary DESC

--50.Display all emp
SELECT * FROM EmployeeDetails