CREATE TABLE Employee
(
	emp_id INT,
	emp_name VARCHAR(30),
	department_id INT,
	designation VARCHAR(20),
	salary MONEY,
	join_date DATE,
	manager_id INT,
)

INSERT INTO Employee VALUES
(101, 'Rajesh Sharma', 10, 'Director', 250000, '2015-03-15', NULL),
(102, 'Priya Patel', 20, 'HR Head', 180000, '2016-06-01', NULL),
(103, 'Amitabh Verma', 30, 'Finance Director', 220000, '2014-01-10', NULL),
(104, 'Vikram Malhotra', 10, 'Engineering Manager', 150000, '2018-08-20', 101),
(105, 'Sangeeta Iyer', 40, 'Marketing Lead', 130000, '2019-11-05', 101),
(106, 'Ananya Chatterjee', 50, 'R&D Lead', 140000, '2017-04-12', 101),
(107, 'Rohan Kulkarni', 10, 'Senior Developer', 95000, '2020-02-15', 104),
(108, 'Neha Joshi', 10, 'Software Engineer', 70000, '2021-07-01', 104),
(109, 'Deepak Reddy', 20, 'HR Executive', 55000, '2022-09-10', 102),
(110, 'Kavita Sundaram', 30, 'Senior Accountant', 80000, '2019-05-18', 103),
(111, 'Arjun Nair', 40, 'Sales Executive', 60000, '2022-01-20', 105),
(112, 'Pooja Singh', 50, 'Research Analyst', 75000, '2021-11-15', 106)

CREATE TABLE Departments
(
	department_id INT,
	department_name VARCHAR(30),
	location VARCHAR(20),
	budget MONEY
)

INSERT INTO Departments VALUES
(10, 'Information Tech', 'Bengaluru', 5000000),
(20, 'Human Resources', 'Mumbai', 1500000),
(30, 'Finance & Accounts', 'Delhi', 2500000),
(40, 'Sales & Marketing', 'Pune', 3500000),
(50, 'Research & Dev', 'Hyderabad', 4000000)

--1. Display the employee name along with the name of the department they belong to.
SELECT E.emp_name, D.department_name FROM Employee E
left JOIN Departments D
ON E.department_id = D.department_id

--2. List all employees along with their department, including employees who are not currently assigned to any department.
SELECT E.emp_name, E.join_date, E.salary, D.department_name, D.budget FROM Employee E
LEFT JOIN Departments D
ON E.department_id = D.department_id

--3. Show all department names along with the names of employees working in them, including departments that currently have no employees.
SELECT D.department_name, E.emp_name as working_employee FROM Departments D
LEFT JOIN Employee E
ON D.department_id = E.department_id

--4. Display emp_name, designation, and department_name for employees who are assigned to a valid department.
SELECT E.emp_name, E.designation, D.department_name FROM Departments D
INNER JOIN Employee E
ON D.department_id = E.department_id

--5. Show the department_name, location, and emp_name for every department, even if no employee currently works there.
SELECT D.department_name, D.location, E.emp_name FROM Employee E
RIGHT JOIN Departments D
ON D.department_id = E.department_id

--6. Display emp_name and department_name for every employee, even those without a department (show department as blank/null in that case).
SELECT E.emp_name, D.department_name FROM Employee E
LEFT JOIN Departments D
ON D.department_id = E.department_id

--7. List emp_name, salary, and department_name only for employees whose department actually exists in the Departments table.
SELECT E.emp_name, E.salary,D.department_name FROM Employee E
INNER JOIN Departments D
ON D.department_id = E.department_id

--8. Show department_name and budget along with emp_name and salary, ensuring all departments are shown even the ones without staff.
SELECT D.department_name, D.budget, E.emp_name, E.salary FROM Employee E
RIGHT JOIN Departments D
ON D.department_id = E.department_id

--9. Display the full list of employees with their department_name, making sure no employee is left out of the result even without a department.
SELECT E.emp_name, D.department_name FROM Employee E
FULL JOIN Departments D
ON D.department_id = E.department_id

--10. List emp_name, designation, and location of the department for employees who have a department assigned.
SELECT E.emp_name, E.designation, D.location, D.department_name FROM Employee E
INNER JOIN Departments D
ON D.department_id = E.department_id

--11. Show all departments and the count-relevant employee names in them, keeping every department visible even if empty.
SELECT D.department_name, STRING_AGG(E.emp_name, ', ') AS employee_name, COUNT(E.emp_id) as Total_employee FROM Departments D
LEFT JOIN Employee E
ON D.department_id = E.department_id
GROUP BY D.department_id, D.department_name

--12. Display emp_name, join_date, and department_name for employees who joined a department.
SELECT E.emp_name, E.join_date, D.department_name FROM Employee E
INNER JOIN Departments D
ON E.department_id = D.department_id

--13. List every department along with emp_name and salary, ensuring departments with zero employees still appear with blank employee details.
SELECT D.department_name, E.emp_name, E.salary FROM Departments D
LEFT JOIN Employee E
ON E.department_id = D.department_id

--14. Show emp_name and department_name for employees, and make sure every employee appears in the output regardless of department status.
SELECT E.emp_name, D.department_name FROM Employee E
LEFT JOIN Departments D
ON E.department_id = D.department_id

--15. Display emp_name, department_name, and budget for employees working in departments with a budget greater than 2,000,000.
SELECT E.emp_name, D.department_name, D.budget FROM Employee E
LEFT JOIN Departments D
ON E.department_id = D.department_id
WHERE D.budget > 2000000

--16. List department_name and location for every department, along with emp_name of employees there, keeping all departments visible.
SELECT D.department_name, D.location, E.emp_name FROM Departments D
LEFT JOIN Employee E
ON E.department_id = D.department_id

--17. Show emp_name, designation, and department_name for employees, excluding those without an assigned department.
SELECT E.emp_name, E.designation, D.department_name FROM Departments D
RIGHT JOIN Employee E
ON E.department_id = D.department_id

--18. Display all employees and their respective department location, including employees without a department.
SELECT E.emp_name, D.department_name, D.location FROM Departments D
RIGHT JOIN Employee E
ON E.department_id = D.department_id

--19. List department_name for all departments and emp_name of employees, ensuring unmatched departments (no staff) are still shown.
SELECT D.department_name, E.emp_name FROM Departments D
LEFT JOIN Employee E
ON E.department_id = D.department_id

--20. Show emp_name and salary for employees along with their department_name, only where a genuine department match exists.
SELECT E.emp_name, E.salary, D.department_name FROM Employee E
INNER JOIN Departments D
ON E.department_id = D.department_id

--21. Display emp_name, manager_id, and department_name for employees who belong to some department.
SELECT E.emp_name, E.manager_id, D.department_name FROM Employee E
INNER JOIN Departments D
ON E.department_id = D.department_id

--22. List all departments with their budget and emp_name of any employees, keeping departments with no staff visible in the result.
SELECT D.department_name, D.budget,E.emp_name FROM Employee E
FULL JOIN Departments D
ON E.department_id = D.department_id

--23. Show emp_name for every employee together with department_name, ensuring the full employee list is retained even without a department match.
SELECT E.emp_name, D.department_name FROM Employee E
LEFT JOIN Departments D
ON E.department_id = D.department_id

--24. Display department_name, location, and emp_name only where the employee record is properly linked to a department.
SELECT D.department_name, D.location,E.emp_name FROM Employee E
INNER JOIN Departments D
ON E.department_id = D.department_id

--25. List every department along with emp_name and designation, so that departments without employees still show up with empty employee fields.
SELECT D.department_name, E.emp_name, E.designation FROM Employee E
RIGHT JOIN Departments D
ON E.department_id = D.department_id

--26. Show emp_name, department_name, and join_date only for employees who have valid department information.
SELECT E.emp_name, D.department_name, E.join_date FROM Employee E
INNER JOIN Departments D
ON E.department_id = D.department_id

--27. Display all employees with department_name, and ensure employees having a NULL department are still part of the result.
SELECT E.emp_name, D.department_name FROM Employee E
FULL OUTER JOIN Departments D
ON E.department_id = D.department_id

--28. List department_name and budget for all departments and the emp_name working there, making sure departments without employees are not excluded.
SELECT D.department_name, D.budget, E.emp_name FROM Employee E
RIGHT JOIN Departments D
ON E.department_id = D.department_id

--29. Show emp_name and salary for employees who are linked to a department that has a budget above 3,000,000.
SELECT E.emp_name, E.salary, D.department_name, D.budget FROM Employee E
INNER JOIN Departments D
ON E.department_id = D.department_id
WHERE D.budget > 3000000

--30. Display the full employee list along with department_name, location, so no employee is missing from the output.
SELECT E.emp_name, E.salary, D.department_name, D.location FROM Employee E
LEFT JOIN Departments D
ON E.department_id = D.department_id

--31. List all departments and emp_name of staff, ensuring departments like ones with no current employees still show in the result.
SELECT D.department_name, E.emp_name FROM Employee E
RIGHT JOIN Departments D
ON E.department_id = D.department_id

--32. Show emp_name, designation, and department_name where the department information genuinely matches between both tables.
SELECT E.emp_name, E.designation, D.department_name FROM Employee E
INNER JOIN Departments D
ON E.department_id = D.department_id

--33. Display department_name, budget, and emp_name for departments, keeping every department in the output even without matching employees.
SELECT D.department_name, D.budget, E.emp_name FROM Employee E
FULL JOIN Departments D
ON E.department_id = D.department_id

--34. List emp_name and department_name for employees, retaining every single employee row even if their department is missing.
SELECT E.emp_name, D.department_name FROM Employee E
LEFT JOIN Departments D
ON E.department_id = D.department_id

--35. Show emp_name, salary, and department_name only for employees whose department_id correctly matches a department record.
SELECT E.emp_name, E.salary, D.department_name FROM Employee E
INNER JOIN Departments D
ON E.department_id = D.department_id

--36. Display all department details along with any assigned employees, so unmatched departments (no employees) still appear.
SELECT E.emp_name, E.salary, D.department_name FROM Employee E
FULL OUTER JOIN Departments D
ON E.department_id = D.department_id

--37. List emp_name and department_name for employees who have a proper, existing department assigned to them.
SELECT E.emp_name, D.department_name FROM Employee E
INNER JOIN Departments D
ON E.department_id = D.department_id

--38. Show every employee's emp_name and department_name, ensuring the complete employee list shows up regardless of department availability.
SELECT E.emp_name, D.department_name FROM Employee E
LEFT JOIN Departments D
ON E.department_id = D.department_id

--39. Display department_name, location, and emp_name, keeping all departments in the result even those without any employee.
SELECT D.department_name, D.location, E.emp_name FROM Employee E
RIGHT JOIN Departments D
ON E.department_id = D.department_id

--40. List emp_name, designation, and department_name for employees, only including cases with a genuine department match.
SELECT E.emp_name, E.designation, D.department_name FROM Employee E
INNER JOIN Departments D
ON E.department_id = D.department_id

--41. Show all employees with emp_name and department_name, including those employees whose department_id is missing.
SELECT E.emp_name, D.department_name FROM Employee E
LEFT JOIN Departments D
ON E.department_id = D.department_id

--42. Display department_name and emp_name for all departments, retaining every department row even if there's no employee to match.
SELECT D.department_name, E.emp_name FROM Employee E
RIGHT JOIN Departments D
ON E.department_id = D.department_id

--43. List emp_name, salary, and department_name for employees, only when both employee and department data align.
SELECT E.emp_name, E.salary, D.department_name FROM Employee E
INNER JOIN Departments D
ON E.department_id = D.department_id

--44. Show the complete list of employees along with department_name, so that unmatched employees (no department) are not dropped.
SELECT E.emp_name, E.salary, D.department_name FROM Employee E
LEFT JOIN Departments D
ON E.department_id = D.department_id

--45. Display all departments along with emp_name, location, and budget, ensuring departments with no employees are still listed.
SELECT D.department_name, E.emp_name, D.budget, D.location FROM Employee E
RIGHT JOIN Departments D
ON E.department_id = D.department_id

--46. List emp_name and department_name only for employees who are properly linked to an existing department record.
SELECT E.emp_name, D.department_name FROM Employee E
INNER JOIN Departments D
ON E.department_id = D.department_id

--47. Show emp_name, designation, and department_name for every employee, keeping the full employee list intact even without department data.
SELECT E.emp_name, E.designation, D.department_name FROM Employee E
LEFT JOIN Departments D
ON E.department_id = D.department_id

--48. Display department_name, budget, and emp_name for every department, making sure departments without any employee still appear in the output.
SELECT D.department_name, D.budget, E.emp_name FROM Employee E
RIGHT JOIN Departments D
ON E.department_id = D.department_id

--49. List emp_name and department_name for employees where the department match is valid on both sides.
SELECT E.emp_name, D.department_name FROM Employee E
INNER JOIN Departments D
ON E.department_id = D.department_id

--50. Show all employees and all departments together with emp_name and department_name, keeping every department visible even without staff, and every employee visible even without a department (attempt this with two separate queries: one keeping all employees, another keeping all departments).
SELECT E.emp_name, D.department_name FROM Employee E
FULL OUTER JOIN Departments D
ON E.department_id = D.department_id

SELECT D.department_name, E.emp_name FROM Departments D 
LEFT JOIN Employee E
ON E.department_id = D.department_id

SELECT E.emp_name, D.department_name FROM Employee E
RIGHT JOIN Departments D
ON E.department_id = D.department_id