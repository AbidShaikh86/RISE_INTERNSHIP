CREATE TABLE Departments 
(
	DepartmentID INT, 
	DepartmentName VARCHAR(30)
)

CREATE TABLE Employees 
(
	EmployeeID INT, 
	EmployeeName VARCHAR(30),
	DepartmentID INT,
	Salary DECIMAL(9,2),
	JoiningDate DATE,
	City VARCHAR(30)
)

CREATE TABLE Products 
(
	ProductID INT, 
	ProductName VARCHAR(30),
	Price DECIMAL(9,2),
	Stock INT
)

CREATE TABLE Orders 
(
	OrderID INT,
	ProductID INT,
	Quantity INT, 
	OrderDate DATE
)

INSERT INTO Departments VALUES
(1, 'Information Technology'),
(2, 'Finance & Accounts'),
(3, 'Human Resources'),
(4, 'Marketing & Sales'),
(5, 'Supply Chain & Logistics')

INSERT INTO Employees VALUES
(101, 'Aarav Sharma', 1, 95000.00, '2023-03-15', 'Bengaluru'),
(102, 'Priya Patel', 2, 72000.00, '2022-07-01', 'Ahmedabad'),
(103, 'Rohan Deshmukh', 1, 125000.00, '2021-11-10', 'Pune'),
(104, 'Sneha Iyer', 3, 62000.00, '2024-01-16', 'Chennai'),
(105, 'Vikram Singh', 4, 78000.00, '2023-09-05', 'Delhi NCR'),
(106, 'Ananya Chatterjee', 5, 54000.00, '2024-04-12', 'Kolkata')

INSERT INTO Products VALUES
(501, 'Tata Tea Gold 1kg', 640.00, 150),
(502, 'Fortune Sunflower Oil 5L', 890.00, 80),
(503, 'India Gate Basmati Rice 5kg', 620.00, 200),
(504, 'Amul Cow Ghee 1L', 680.00, 95),
(505, 'Aashirvaad Atta 10kg', 485.00, 120),
(506, 'boAt Rockerz 450 Headphone', 1499.00, 45)

INSERT INTO Orders VALUES
(1001, 501, 2, '2026-08-15'),
(1002, 503, 1, '2026-08-18'),
(1003, 502, 3, '2026-08-20'),
(1004, 505, 2, '2026-08-22'),
(1005, 504, 1, '2026-08-25'),
(1006, 506, 1, '2026-08-28')

-- 1. Create a Stored Procedure to Get Employee Details
CREATE PROC sp_getEmpDetails
@EmployeeID INT 
AS 
BEGIN
	SELECT e.EmployeeName, d.DepartmentName, e.Salary, e.JoiningDate FROM Employees e
	INNER JOIN Departments d
	ON e.DepartmentID = d.DepartmentID
	WHERE e.EmployeeID = @EmployeeID
END

EXEC sp_getEmpDetails @EmployeeID = 102

-- 2. Get Employees by Department
CREATE PROC sp_getEmpByDeptID
@DeptID INT
AS 
BEGIN
	SELECT e.EmployeeName, d.DepartmentName, e.Salary, e.JoiningDate FROM Employees e
	INNER JOIN Departments d
	ON e.DepartmentID = d.DepartmentID
	WHERE e.DepartmentID = @DeptID
END

EXEC sp_getEmpByDeptID @DeptID = 1

-- 3. Salary Range Search
CREATE PROC sp_salaryRangeSearch
@MinSalary DECIMAL(9,2),
@MaxSalary DECIMAL(9,2)
AS 
BEGIN
	SELECT * FROM Employees
	WHERE Salary BETWEEN @MinSalary AND @MaxSalary
END

EXEC sp_salaryRangeSearch @MinSalary = 50000.00, @MaxSalary = 70000.00

-- 4. Employee Count by Department
CREATE PROC sp_empCountByDept
@DeptID INT
AS 
BEGIN
	SELECT d.DepartmentName, COUNT(e.EmployeeID) AS total_employee FROM Employees e
	INNER JOIN Departments d
	ON e.DepartmentID = d.DepartmentID
	WHERE e.DepartmentID = @DeptID
	GROUP BY d.DepartmentName
END

EXEC sp_empCountByDept @DeptID = 1

-- 5. Increase Employee Salary
CREATE PROC sp_increaseEmpSalary
@EID INT,
@Percentage DECIMAL(5,2)
AS
BEGIN
	SELECT * FROM Employees
	WHERE EmployeeID = @EID
	
	UPDATE Employees
	SET Salary = Salary * (1 + (@Percentage / 100.0))
	WHERE EmployeeID = @EID

	SELECT * FROM Employees
	WHERE EmployeeID = @EID
END

EXEC sp_increaseEmpSalary @EID = 104, @Percentage = 10

-- 6. Get Employees Joined Between Two Dates
CREATE PROC sp_getEmpByDate
@StartDate DATE,
@EndDate DATE
AS 
BEGIN
	SELECT * FROM Employees
	WHERE JoiningDate BETWEEN @StartDate AND @EndDate
END

EXEC sp_getEmpByDate @StartDate = '2023-03-01',@EndDate = '2023-12-01'

-- 7. Find Employees by Name
CREATE PROC sp_findEmpByName
@Name VARCHAR(30)
AS
BEGIN
	SELECT * FROM Employees
	WHERE EmployeeName = @Name
END

EXEC sp_findEmpByName @Name = 'Aarav Sharma'

-- 8. Employee Salary Update with Validation
CREATE PROC sp_updateSalaryAndValidate
@EmpID INT,
@NewSalary DECIMAL(9,2)
AS
BEGIN
	DECLARE @CurrentSalary DECIMAL(9,2)

	SELECT @CurrentSalary = Salary FROM Employees
	WHERE EmployeeID = @EmpID

	IF @NewSalary < @CurrentSalary
	BEGIN
		RAISERROR('Employee New Salary Cannot be less than Current Employee Salary',16,1)
		RETURN
	END

	UPDATE Employees
	SET Salary = @NewSalary
	WHERE EmployeeID = @EmpID
END

EXEC sp_updateSalaryAndValidate @EmpID = 102, @NewSalary = 20000.00

-- 9. Department Salary Summary
CREATE PROC sp_summaryDetailsForDepartment
@DeptID INT
AS
BEGIN
	SELECT d.DepartmentName, COUNT(e.EmployeeID) AS total_employee, MIN(e.Salary) AS minimum_salary, MAX(e.Salary) AS maximum_salary, AVG(e.Salary) AS average_salary, SUM(e.Salary) AS total_salary FROM Employees e
	INNER JOIN Departments d
	ON e.DepartmentID = d.DepartmentID
	WHERE e.DepartmentID = @DeptID
	GROUP BY d.DepartmentName
END

EXEC sp_summaryDetailsForDepartment @DeptID = 1

-- B. Triggers
