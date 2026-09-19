--1. Write an INNER JOIN between Employees and Departments.
SELECT * FROM Employee E
INNER JOIN Departments D
ON E.department_id = D.department_id

--2. Write a LEFT JOIN to include employees without departments.
SELECT * FROM Employee E
LEFT JOIN Departments D
ON E.department_id = D.department_id

--3. Write a RIGHT JOIN to include departments without employees.
SELECT * FROM Employee E
RIGHT JOIN Departments D
ON E.department_id = D.department_id

--4. Write a FULL OUTER JOIN example.
SELECT * FROM Employee E
FULL OUTER JOIN Departments D
ON E.department_id = D.department_id

--5. Demonstrate a CROSS JOIN with two tables.
SELECT * FROM Employee E
CROSS JOIN Departments D

--6. Write a SELF JOIN to show employees and managers.
SELECT * FROM Employee e1
JOIN Employee e2
ON e1.emp_id = e2.manager_id

--7. Identify difference between INNER and OUTER JOIN.


--8. Explain result set of LEFT JOIN with NULL values.
SELECT * FROM Employee E
LEFT JOIN Departments D
ON E.department_id = D.department_id

--9. Optimize a JOIN query using indexes.


--10. Choose appropriate join type for a given business scenario.