--All question are attempted on Assignment 6 Tables

--1. Display each employee's name and their corresponding department name.
SELECT e.Ename, d.Dname FROM employee_info e
INNER JOIN department_info d
ON e.DID = d.DID

--2. List all projects along with the name of the employee assigned to them.
SELECT p.PID, p.Pname, e.Ename FROM project p
LEFT JOIN employee_info e
ON p.EID = e.EID

--3. Show the names of employees and the names of their managers.
SELECT e.Ename, m.Mname FROM employee_info e
INNER JOIN manager m
ON e.MID = m.MID

--4. Display the Project ID and the Department ID for every project.
SELECT p.PID, d.DID FROM project p
INNER JOIN employee_info e
ON e.EID = p.EID
INNER JOIN department_info d
ON e.DID = d.DID

--5. List employees who work in the 'IT' department.
SELECT e.EID, e.Ename, e.Esalary, d.Dname FROM employee_info e
INNER JOIN department_info d
ON e.DID = d.DID
WHERE d.Dname = 'IT'

--6. Display employee names and their manager names for all employees in department 103.
SELECT * FROM department_info d
INNER JOIN employee_info e
ON d.DID = e.EID
WHERE d.DID = 103

--7. Show all projects handled by ‘Vikram’.
SELECT * FROM employee_info e
INNER JOIN project p
ON e.EID = p.EID
WHERE e.Ename like 'Vikram%'

--8. Find the department name associated with Project ID 201.
SELECT d.Dname FROM project p
INNER JOIN employee_info e
ON e.EID = p.EID
INNER JOIN department_info d
ON e.DID = d.DID
WHERE p.PID = 201

--9. List all employees whose manager's name is 'Rajesh'.
SELECT e.Ename, m.Mname FROM employee_info e
INNER JOIN manager m
ON e.MID = m.MID
WHERE m.Mname like 'Rajesh%'

--10.Display the count of employees in each department name.
SELECT d.Dname, COUNT(e.EID) as employee_count FROM employee_info e
INNER JOIN department_info d
ON e.DID = d.DID
GROUP BY d.Dname

--11. List all departments and the employees working in them (including departments with no employees).
SELECT d.Dname, e.Ename FROM department_info d
LEFT JOIN employee_info e
ON d.DID = e.DID

--12.Display all employees and the projects they are assigned to (including those with no projects).
SELECT e.Ename, p.Pname FROM employee_info e
LEFT JOIN project p
ON p.EID = e.EID

--13. Show the names of employees, their department names, and their manager names in one result.
SELECT e.Ename, d.Dname, m.Mname FROM employee_info e
INNER JOIN department_info d
ON e.DID = d.DID
INNER JOIN manager m
ON e.MID = m.MID

--14. Find all projects and the department name they belong to.
SELECT p.Pname, d.Dname FROM project p
LEFT JOIN employee_info e
ON e.EID = p.EID
LEFT JOIN department_info d
ON e.DID = d.DID

--15. List all managers and the names of employees reporting to them (including managers with no reporters).
SELECT m.Mname, e.Ename FROM manager m
LEFT JOIN employee_info e
ON m.MID = e.MID

--16. Find employees who are NOT assigned to any project.
SELECT e.Ename, p.PID, p.Pname FROM employee_info e
LEFT JOIN project p
ON p.EID = e.EID
WHERE p.EID IS NULL

--17.Display the names of all employees and the names of projects, but only for those in the ‘IT’ department.
SELECT e.Ename, p.Pname, d.Dname FROM project p
INNER JOIN employee_info e
ON e.EID = p.EID
INNER JOIN department_info d
ON e.DID = d.DID
WHERE d.Dname = 'IT'

--18. Show the names of managers who are managing employees in the 'Finance' department.
SELECT e.Ename, m.Mname, d.Dname FROM manager m
INNER JOIN employee_info e
ON e.MID = m.MID
INNER JOIN department_info d
ON e.DID = d.DID
WHERE d.Dname = 'Finance'

--19.Display Department Name, Employee Name, and Project Name for all matches.
SELECT d.Dname, e.Ename, p.Pname FROM project p
INNER JOIN employee_info e
ON e.EID = p.EID
INNER JOIN department_info d
ON e.DID = d.DID

--20. List all projects and the manager's name responsible for the employee assigned to that project.
SELECT e.Ename, m.Mname, p.Pname FROM manager m
INNER JOIN employee_info e
ON e.MID = m.MID
INNER JOIN project p
ON e.EID = p.EID