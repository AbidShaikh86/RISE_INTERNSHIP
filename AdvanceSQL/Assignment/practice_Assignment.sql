1. Create a stored procedure named that returns all columns for employees whose City is
'Vadodara'
2. Create a stored procedure to return all employees belonging to that department.
3. Create a stored procedure that takes to inserts a new row into the Employees table.
4. Create a stored procedure to increase the salary of the given employee by the specified
percentage. (Eg. EID =1 salary by 10%)
5. Create a stored procedure to return the average salary of a given department.
6. Create an AFTER INSERT trigger named trg_AfterInsertEmployee on the Employees table
that automatically prints the text 'A new employee has been successfully added to the
system.' whenever a row is added. Write a test INSERT query to verify it.
7. Create a trigger such that, If an employee's salary is updated, insert a record into
SalaryAuditLog using the magic tables.
8. Create a trigger table that captures deleted records and logs EmpID and EmpName into
EmployeeDeletionLog.
9. Create a Trigger to prevent an unauthorized person from dropping an Existing Table.	