CREATE TABLE Employee
(
	EmployeeID INT,
	Name VARCHAR(30),
	Department VARCHAR(15),
	Salary Money,
	Bonus Money,
	Experience INT,
	City VARCHAR(15)
)

INSERT INTO Employee VALUES
(100,'Abid Shaikh','IT',45000,3000,3,'Vadodara'),
(101,'Rajib Mansuri','AI',20000,5000,7,'Mumbai'),
(102,'Saif Pathan','Finance',25000,5600,5,'Delhi'),
(103,'Aamir Vahora','IT',67000,8000,9,'Delhi'),
(104,'Uvesh Malek','Cloud',34000,12500,3,'Anand'),
(105,'Aamir Saiyed','Finance',25000,3800,12,'Mumbai'),
(106,'Mustakim Diwan','Legal',75000,1800,13,'Delhi'),
(107,'Sizen Diwan','IT',37000,10000,5,'vadodara'),
(108,'Mukim Diwan','IT',28000,13500,1,'Vadodara')


--1. Write a query to display all employees whose salary is greater than 50,000.
SELECT * FROM Employee
WHERE Salary > 50000

--2. Retrieve employees who work in the IT department and have more than 5 years of experience.
SELECT * FROM Employee
WHERE Department = 'IT' AND Experience > 5

--3. Write a query to display employees whose salary is between 45,000 and 60,000.
SELECT * FROM Employee 
WHERE Salary BETWEEN 45000 AND 60000

--4. Display employees whose city is either Mumbai or Delhi.
SELECT * FROM Employee
WHERE City IN ('Mumbai', 'Delhi')

--5. Write a query to display employee name along with their annual income
SELECT Name, (Salary + Bonus) as Annual_Income FROM Employee

--6. Find employees whose name starts with the letter 'A'.
SELECT * FROM Employee
WHERE Name LIKE 'A%'

--7. Find the highest salary among all employees.
SELECT MAX(Salary) FROM Employee

--8. Find the total bonus paid to employees in the IT department.
SELECT SUM(Bonus) as Total_Bonus FROM Employee
WHERE Department = 'IT'

--9. Display the minimum and maximum experience of employees.
SELECT MAX(Experience) as mostExperinced, MIN(Experience) as leastExperince FROM Employee

--10.Count the number of employees in each department.
SELECT Department,COUNT(*) FROM Employee
GROUP BY Department

--11. Find the total bonus paid to employees in the IT department.
SELECT SUM(Bonus) as Total_IT_Bonus FROM Employee
WHERE Department = 'IT'

--12. Write an SQL statement to add a new column named Email of type VARCHAR(100) to the Employees table.
ALTER TABLE Employee
ADD Email VARCHAR(100)

--13. Write an SQL statement to modify the Salary column so that it becomes DECIMAL(10,2).
ALTER TABLE Employee
ALTER COLUMN Salary DECIMAL(10, 2)

sp_help 'Employee'

--14. Write an SQL statement to drop the Bonus column from the Employees table.
ALTER TABLE Employee
DROP COLUMN Bonus