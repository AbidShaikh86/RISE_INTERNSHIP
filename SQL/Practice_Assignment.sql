CREATE TABLE emp4
(
	EID INT,
	Ename VARCHAR(30),
	Salary DECIMAL(8,2) CHECK(Salary > 0),
	Bonus DECIMAL(6,2) CHECK(Bonus > 0),
	DOJ DATE,
	dept_id INT,
	MID INT
)

CREATE TABLE dept
(
	dept_id INT,
	Dname VARCHAR(30),
	Location VARCHAR(30)
)
CREATE TABLE manager1
(
	MID INT,
	Mname VARCHAR(30)
)

SET DATEFORMAT dmy

INSERT INTO dept VALUES 
(101, 'HR', 'Mumbai'),
(102, 'IT', 'Bangalore'),
(103, 'Finance', 'Delhi'),
(104, 'Marketing', 'Pune')

INSERT INTO manager1 VALUES 
(201, 'Rajesh Sharma'),
(202, 'Priya Verma'),
(203, 'Amit Patel'),
(204, 'Sanjay Gupta')

INSERT INTO emp4 VALUES 
(1, 'Abid Shaikh', 65000.00, 7000.00, '2024-06-11', 101, 201),
(2, 'Gulamabid Shaikh', 57000.00, 8400.00, '2025-03-17', 102, 202),
(3, 'Rahul Mehta', 48000.00, 5000.00, '2023-01-15', 101, 201),
(4, 'Sneha Roy', 72000.00, 9500.00, '2022-08-20', 103, NULL),
(5, 'Vikram Singh', 52000.00, NULL, '2024-11-05', NULL, 203),
(6, 'Neha Kapoor', 61000.00, 6000.00, '2025-02-10', NULL, NULL)

--Question 1
--Write a query to calculate the total compensation paid (BasicSalary + Bonus) across all
--payouts for each department. Display the DeptName, Location, and the total expenditure
--aliased as TotalExpenditure.
SELECT d.Dname, d.Location, (e.Salary + e.Bonus) AS TotalExpenditure FROM emp4 e
INNER JOIN dept d
ON e.dept_id = d.dept_id

--Question 2
--Write a query to display all employee names (EName), their date of joining (DOJ), and their
--DeptName. Ensure that employees who are not assigned to any department are included in
--the result, displaying 'Unassigned' for their department name.
SELECT e.Ename, e.DOJ, d.Dname FROM emp4 e
LEFT JOIN dept d
ON e.dept_id = d.dept_id

--Question 3
--Write a query to display every employee's name (EmployeeName), their assigned
--department's name (DeptName), and their manager's name (ManagerName). Exclude
--employees who do not have a manager.
SELECT * FROM emp4 e
INNER JOIN dept d
ON e.dept_id = d.dept_id
INNER JOIN manager1 m
ON e.MID = m.MID

--Question 4
--Find all departments where the average total compensation (BasicSalary + Bonus) exceeds
--₹60,000. Display DeptName, Location
SELECT d.Dname, d.Location FROM emp4 e
INNER JOIN dept d
ON e.dept_id = d.dept_id
GROUP BY d.Dname, d.Location
HAVING AVG(e.Salary + e.Bonus) > 60000

--Question 5
--Write a query to display the DeptID, DeptName, and Location of all departments that
--currently have no employees assigned to them.
SELECT d.dept_id, d.Dname, d.Location FROM emp4 e
RIGHT JOIN dept d
ON e.dept_id = d.dept_id
WHERE e.dept_id IS NULL

--Question 6
--Retrieve the EName, DeptName, BasicSalary, and Bonus of all employees whose
--department is located in either 'Vadodara' or 'Mumbai' and whose BasicSalary is greater
--than ₹40,000. Sort the results by BasicSalary in descending order.
SELECT e.Ename, d.Dname, e.Salary, e.Bonus FROM emp4 e
RIGHT JOIN dept d
ON e.dept_id = d.dept_id
WHERE d.Location IN ('Vadodara', 'Mumbai') AND e.Salary > 40000
ORDER BY Salary DESC

--Question 7
--Find all pairs of employees who belong to the exact same department. Display DeptName,
--Employee_1, and Employee_2. Ensure an employee is not paired with themselves and
--eliminate duplicate reverse pairs
SELECT d.Dname AS DeptName, e1.Ename AS Employee_1, e2.Ename AS Employee_2 FROM emp4 e1
INNER JOIN emp4 e2
ON e1.dept_id = e2.dept_id AND e1.EID = e2.EID
INNER JOIN dept d
ON e1.dept_id = d.dept_id

--Question 8
--Write a query using a full reconciliation approach to list all EName, DeptName, and
--BasicSalary. The output must include employees without departments, departments
--without employees, and employees without salary records.
SELECT e.Ename, d.Dname, e.Salary FROM emp4 e
FULL OUTER JOIN dept d
ON e.dept_id = d.dept_id

--Question 9
--Write a query to find all employees who earn a higher BasicSalary than the average
--BasicSalary of their own department. Display EName, DeptName, and BasicSalary.
SELECT e1.Ename, d.Dname, e1.Salary FROM emp4 e1
INNER JOIN emp4 e2
ON e1.dept_id = e2.dept_id
INNER JOIN dept d
ON e1.dept_id = d.dept_id
GROUP BY e1.Ename, d.Dname, e1.Salary
HAVING e1.Salary > AVG(e2.Salary)4