--1. Create a stored procedure that accepts a DeptID and a MinSalary as input parameters and returns all employees belonging to that department who earn more than the specified salary.
CREATE PROC sp_getEmployeeByDidAndSalary
@DID INT,
@MinSalary MONEY
AS 
BEGIN
	SELECT * FROM Employee
	WHERE department_id = @DID AND salary > @MinSalary
END

EXEC sp_getEmployeeByDidAndSalary @DID = 40, @MinSalary = 50000.00

--2. Create a stored procedure that takes a DeptID as an input parameter and uses an OUTPUT parameter to return the total employee count for that department.
CREATE PROC sp_empCountBasedOnDept
@DepartmentID VARCHAR(30),
@TotalEmployee INT OUTPUT
AS 
BEGIN
	SELECT @TotalEmployee = COUNT(e.EID) FROM department_info d
	INNER JOIN employee_info e
	ON d.DID = e.DID
	WHERE d.DID = @DepartmentID
END

DECLARE @EmployeeCount INT
EXEC sp_empCountBasedOnDept @DepartmentID = 101, @TotalEmployee = @EmployeeCount
SELECT @EmployeeCount AS [Total_Employee]

--3. Create a stored procedure to update an employee's salary given their EID and a percentage increase (e.g., 10 for 10%).
CREATE PROC sp_Update_byEid_PercentInc
@EID INT,
@Percentage DECIMAL(5,2)
AS
BEGIN
UPDATE employee_info 
SET Esalary = Esalary + (Esalary * @Percentage) / 100 
WHERE Ename = @EID
END

--4. Create a stored procedure to insert a new department record into the Department table by passing DeptID, DeptName, and Location as parameters.
CREATE PROC sp_InsertDepartmentbyId
@DeptID INT,
@DeptName VARCHAR(30)
AS
BEGIN
INSERT INTO department_info(DID, Dname) VALUES (@DeptID, @DeptName)
end

--5. Create a stored procedure that takes an EID and a NewSalary as parameters to update an employee's salary in the Employee table.
CREATE PROC sp_UpdateSalaryByPer
@EmployeeID INT,
@NewSalary DECIMAL(12,2)
AS
BEGIN
UPDATE employee_info 
SET Esalary = @NewSalary 
WHERE EID = @EmployeeID
END

--6. Create a stored procedure that takes a search string parameter (e.g., 'a') and returns all employees whose names start with that letter.
CREATE PROC sp_SearchString
@String VARCHAR(20)
AS
BEGIN
SELECT * FROM employee_info 
WHERE EName like @string + '%'
END

--7. Create a stored procedure that calculates and returns the average salary of all employees in the Employee table.
CREATE PROC sp_averageSalary
AS
BEGIN
SELECT Avg(Esalary) AS AverageSalary FROM employee_info
END

--8. Create a stored procedure that takes two input parameters, MinSalary and MaxSalary, and returns all employees whose salary falls within that range.
CREATE PROC sp_maxSalary_minSalary
@MinSalary INT,
@MaxSalary INT
AS
BEGIN
SELECT * FROM employee_info
WHERE Esalary between @MinSalary and @MaxSalary 
END

--9. Create a stored procedure that takes a ProjectID and a new Status string (e.g., 'Completed') as input parameters and updates the status of that project in the Project table.
CREATE PROC sp_updateProjectStatus
@ProjectID INT,
@Status VARCHAR(50)
as
begin
UPDATE project 
SET status = @Status 
WHERE PID = @ProjectID
end

--10.Create a stored procedure that takes a City / Location name as an input parameter and displays the total number of departments located in that city.
CREATE PROC sp_departmentByCity
@City VARCHAR(30)
AS
BEGIN
SELECT count(*) AS TotalDepartments FROM department_info 
WHERE location = @city
END