--Table -> Employee (EID, Ename, Department, City, Salary, Bonus, DOJ)\
CREATE DATABASE Gulamabid

use Gulamabid

CREATE TABLE Employee
(
	EID INT, 
	Ename VARCHAR(30), 
	Department VARCHAR(30), 
	City VARCHAR(30), 
	Salary MONEY, 
	Bonus MONEY, 
	DOJ DATE
)

INSERT INTO Employee VALUES
(1,'Abid Shaikh','IT','Vadodara',53000,5000,'05-01-2024'),
(2,'Aamir Saiyed','Finance','Ahemdabad',65000,8000,'04-07-2026'),
(3,'Mukim Diwan','QA','Anand',34000,3400,'03-06-2025'),
(4,'Alfaiz Pathan','Cloud','Vadodara',64000,2000,'12-03-2023'),
(5,'Avez Pathan','IT','Gandhinagar',26000,1000,'09-07-2026'),
(6,'Hasnain Saiyed','QA','Ahemdabad',74000,5500,'03-02-2024'),
(7,'Mustakim Diwan','IT','Vadodara',55000,1200,'06-08-2023'),
(8,'Juber Chauhan','Finance','Vadodara',23500,6500,'05-01-2026'),
(9,'Aezan Shaikh','QA','Anand',75000,3400,'05-06-2021'),
(10,'Gulamabid Shaikh','Cloud','Gandhinagar',25000,7500,'08-03-2023')

INSERT INTO Employee VALUES
(11,'Irfan Shaikh','sales','Vadodara',53000,5000,'05-01-2024'),
(12,'Naseem Malek','marketing','Ahemdabad',65000,8000,'04-07-2026'),
(13,'Heena Shaikh','QA','Anand',34000,3400,'03-06-2025'),
(14,'Jabir Pathan','sales','Vadodara',64000,2000,'12-03-2023'),
(15,'Aasif Shaikh','marketing','Gandhinagar',26000,1000,'09-07-2026')

--Question 1:
--Write an UPDATE statement to give a 10% salary raise to all employees in the 'IT' department
UPDATE Employee
SET Salary = Salary * 1.10
WHERE Department = 'IT'

--Question 2:
--Retrieve the EmpName, Department, and Salary of all employees whose current salary falls between ₹50,000 and ₹90,000 (inclusive)
SELECT Ename,Department, Salary FROM Employee
WHERE Salary BETWEEN 50000 AND 90000

--Question 3:
--Calculate the total salary expenditure and average bonus for each Department, considering only employees located in 'Vadodara', or 'Ahmedabad'. Sort the output by total salary expenditure in descending order.
SELECT Department, SUM(Salary) AS total_salary_expenditure, AVG(Bonus) AS average_bonus FROM Employee
WHERE City IN('Vadodara','Ahmedabad')
GROUP BY Department
Order BY SUM(Salary) DESC

--Question 4:
--Find all departments that employ more than 2 employees and have an average bonus of at least ₹5,000. Display the Department, total employee count, and average bonus.
SELECT Department, COUNT(EID) AS total_employee_count, AVG(Bonus) AS average_bonus FROM Employee
GROUP BY Department
HAVING AVG(Bonus) >= 5000

--Question 5:
--Write a DELETE query to remove all records of employees from the 'Sales' or 'Marketing' departments who have a Salary less than ₹35,000.
DELETE FROM Employee
WHERE Department IN('sales','marketing') AND Salary < 35000

--Question 6:
--Find the highest salary, lowest salary, and average salary across the entire company,
SELECT MAX(Salary) AS highest_salary, MIN(Salary) AS lowest_salary, AVG(Salary) AS average_salary FROM Employee

--Question 7:
--Display the EmpName, Department, and HireDate of all employees who were hired before 31-03-2025, ordered by HireDate from earliest to latest.
SELECT Ename, Department, DOJ FROM Employee
WHERE DOJ > '31-03-2025'
ORDER BY DOJ 

--Question 8:
--Write an UPDATE statement to add ₹3,000 to the Bonus of any employee whose current salary is below 20000
UPDATE Employee
SET Salary = Salary + 3000
WHERE Salary < 20000

--Question 9:
--Write a query to count the total number of employees in each City
SELECT City, COUNT(EID) AS total_employee FROM Employee
GROUP BY City