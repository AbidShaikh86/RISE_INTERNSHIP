CREATE DATABASE Gulamabid_Shaikh

USE Gulamabid_Shaikh

CREATE TABLE Employee
(
	EID INT, 
	EmpName VARCHAR(40), 
	DeptID INT, 
	Salary DECIMAL(10,2) CHECK(Salary > 0), 
	DOJ DATE
)
CREATE TABLE Department
(
	DeptID INT, 
	Deptname VARCHAR(30), 
	location VARCHAR(30)
)
CREATE TABLE Manager
(
	ManagerID INT, 
	EID INT, 
	DeptID INT
)
CREATE TABLE Project
(
	ProjectID INT, 
	Pname VARCHAR(30), 
	DeptID INT, 
	Status VARCHAR(30) CHECK (Status IN('Pending','Active','Completed'))
)

SET DATEFORMAT dmy


INSERT INTO Employee VALUES
(1,'Abid Shaikh',101,65000.00,'05-01-2027'),
(2,'Aezan Shaikh',103,24000.00,'15-02-2024'),
(3,'Gulamabid Shaikh',101,35000.00,'16-05-2021'),
(4,'Aasif Shaikh',102,26000.00,'26-02-2024'),
(5,'Aamir Saiyed',104,27000.00,'12-07-2023'),
(6,'Aatif Saiyed',105,36000.00,'24-09-2022'),
(7,'Juber Chauhan',102,60000.00,'08-03-2020'),
(8,'Irfan Shaikh',NULL,60000.00,'27-06-2020'),
(9,'naseem Malek',NULL,60000.00,'15-03-2020')

INSERT INTO Department VALUES
(101,'IT','Vadodara'),
(102,'Cloud','Ahemdabad'),
(103,'QA','Vadodara'),
(104,'BA','Surat'),
(105,'Engineering','Anand')

INSERT INTO Manager VALUES
(1001,2,103),
(1002,2,NULL),
(1003,3,101),
(1004,1,NULL),
(1001,5,105)

INSERT INTO Project VALUES
(10001,'Agro Connect',103,'Pending'),
(10002,'Data Allocation',NULL,'Active'),
(10003,'Data Migration',103,'Completed')

SELECT * FROM Project

--1. Retrieve every employee's name along with their department name.
SELECT E.EmpName, D.Deptname FROM Employee E
LEFT JOIN Department D
ON E.DeptID = D.DeptID

--2. Display the EmpName, Salary, and Location of all employees whose department is located in 'Vadodara'.
SELECT E.EmpName, E.Salary, D.location FROM Employee E
INNER JOIN Department D
ON E.DeptID = D.DeptID
WHERE D.location = 'Vadodara'

--3. Find employees who are not working on any Projects.
SELECT * FROM Employee E
INNER JOIN Department D
ON E.DeptID = D.DeptID
INNER JOIN Project p
ON P.DeptID = D.DeptID
WHERE P.DeptID IS NULL

--4. Retrieve the employee name (EmpName) of each manager and the department(DeptName) they manage.
SELECT E.EmpName, M.ManagerID, D.Deptname FROM Employee E
INNER JOIN Department D
ON E.DeptID = D.DeptID
INNER JOIN Manager M
ON M.DeptID = D.DeptID

--5. Display the ProjectName, Status, and department location (Location) for all projects with a status of 'Active'.
SELECT P.Pname, P.Status, D.location FROM Department D
INNER JOIN Project p
ON P.DeptID = D.DeptID
WHERE P.Status = 'Active'

--6. Display each department name (DeptName) and the total number of employees working in it.
SELECT D.Deptname, COUNT(E.EID) AS total_number_of_employee FROM Employee E
INNER JOIN Department D
ON E.DeptID = D.DeptID
GROUP BY D.Deptname

--7. Display all department names (DeptName) that do not have any projects assigned to them.
SELECT P.Pname, P.Status, D.location FROM Department D
INNER JOIN Project p
ON P.DeptID = D.DeptID
WHERE P.DeptID IS NULL

--8. Display the employee name (EmpName), their department name (DeptName), and the name of the project (ProjectName) assigned to that department.
SELECT E.EmpName, D.Deptname, P.Pname FROM Employee E
INNER JOIN Department D
ON E.DeptID = D.DeptID
INNER JOIN Project p
ON P.DeptID = D.DeptID

--9. List the EmpName, Salary, and DeptName for employees earning a salary greater than ₹50,000. Sort the results by salary from highest to lowest.
SELECT E.EmpName, E.Salary, D.Deptname FROM Employee E
INNER JOIN Department D
ON E.DeptID = D.DeptID
WHERE E.Salary > 50000
ORDER BY E.Salary DESC