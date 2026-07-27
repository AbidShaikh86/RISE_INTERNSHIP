

CREATE TABLE Student
(
	RollNo INT PRIMARY KEY IDENTITY(1,1),
	StudentName VARCHAR(30),
	Course VARCHAR(20),
	Marks INT,
	City VARCHAR(20),
	Gender CHAR,
	Age INT,
	AdmissionDate DATE,
	Fee INT,
	DepartmentID INT REFERENCES Department,
	CONSTRAINT Gender_chk CHECK(Gender IN ('M','F'))
)


--1. Create a database for the college records.
CREATE DATABASE CollegeDB

USE CollegeDB

--2. Create the Department table.
CREATE TABLE Department
(
	DepartmentID INT PRIMARY KEY,
	DepartmentName VARCHAR(30)
)

--3. Create the Student table with all required columns.
CREATE TABLE Student
(
	RollNo INT PRIMARY KEY,
	StudentName VARCHAR(30),
	Course VARCHAR(20),
	Marks INT,
	City VARCHAR(20),
	Gender CHAR,
	Age INT,
	AdmissionDate DATE,
	Fee INT,
	DepartmentID INT REFERENCES Department,
	CONSTRAINT Gender_chk CHECK(Gender IN ('M','F'))
)

--4. Add a new column to the Student table to store the student's email address.
ALTER TABLE Student 
ADD Email VARCHAR(30)

--5. Modify the data type/size of the email column you just added.
ALTER TABLE Student
ALTER COLUMN Email VARCHAR(40)

--6. Rename the newly added email column to something more suitable.
sp_rename 'Student.Email','Student_Email'

--7. Drop the email column from the Student table.
ALTER TABLE Student 
DROP COLUMN Student_Email

--8. Rename the Student table to StudentRecords and then rename it back to Student.
sp_rename 'Student','StudentRecords'
sp_rename 'StudentRecords','Student'

--9. Write a query to view the complete structure of the Student table.
sp_help 'Student'

--10. Write a query to view the complete structure of the Department table.
sp_help 'Department'

--Could not drop object 'Department' because it is referenced by a FOREIGN KEY constraint.
ALTER TABLE Student
DROP CONSTRAINT FK__Student__Departm__5EBF139D

--12.Drop the Department table and create it again with the same structure.
DROP TABLE Department

CREATE TABLE Department
(
	DepartmentID INT PRIMARY KEY,
	DepartmentName VARCHAR(30)
)

--13. Set the primary key on the Department table.
ALTER TABLE Department
ADD CONSTRAINT PK_Depart PRIMARY KEY (DepartmentID)

--14. Set the primary key on the Student table.
ALTER TABLE Student
ADD CONSTRAINT PK_Depart PRIMARY KEY (StudentID)

--15. Add a foreign key on the Student table that references the Department table.
ALTER TABLE Student 
ADD CONSTRAINT fk_student FOREIGN KEY (DepartmentID) REFERENCES Department 

--16. Try inserting a student record with a department value that does not exist in the Department table and observe the result.
INSERT INTO Student VALUES 
('Aarav Sharma', 'B.Tech', 85, 'Delhi', 'M', 20, '2023-08-01', 50000, 1)

--17. Apply a NOT NULL constraint on the student's name column.
ALTER TABLE Student 
ALTER COLUMN StudentName VARCHAR(30) NOT NULL

--18. Apply a NOT NULL constraint on the course column.
ALTER TABLE Student 
ALTER COLUMN Course VARCHAR(30) NOT NULL

--19. Apply a UNIQUE constraint on a column that stores each student's roll number.
ALTER TABLE Student 
ADD CONSTRAINT unique_rno UNIQUE(RollNo)

--20. Apply a UNIQUE constraint on the email column (add the column again if you had dropped it earlier).
ALTER TABLE Student 
ADD Email VARCHAR(30) UNIQUE

ALTER TABLE Student 
ADD CONSTRAINT unique_email UNIQUE(Email)

--21. Apply a DEFAULT constraint on the city column with a default value of your choice.
ALTER TABLE Student 
ADD CONSTRAINT default_city DEFAULT 'Vadodara' FOR City

--22. Apply a DEFAULT constraint on the fee column with a default value.
ALTER TABLE Student 
ADD CONSTRAINT default_fees DEFAULT 19000 FOR Fee

--23. Apply a CHECK constraint on the marks column so that marks cannot be negative or greater than 100.
ALTER TABLE Student 
ADD CONSTRAINT chk_marks CHECK(Marks > 0 AND Marks <= 100)

--24. Apply a CHECK constraint on the age column so that age must be greater than or equal to 15.
ALTER TABLE Student 
ADD CONSTRAINT chk_age CHECK(Age >= 15)

--25. Apply a CHECK constraint on the gender column so that only 'M' or 'F' can be entered.
ALTER TABLE Student 
ADD CONSTRAINT chk_gender CHECK(Age IN ('M','F'))

--27. Remove the UNIQUE constraint applied on the roll number column.
ALTER TABLE Student
DROP CONSTRAINT unique_rno

--28. Remove the DEFAULT constraint applied on the fee column.
ALTER TABLE Student 
DROP CONSTRAINT default_fees

--29. Remove the foreign key constraint from the Student table.
ALTER TABLE Student 
DROP CONSTRAINT FK_Student__7886D5A0E3807DD8

--30. Add the foreign key constraint back to the Student table.
ALTER TABLE Student 
ADD CONSTRAINT fk_student_department FOREIGN KEY (DepartmentID) REFERENCES Department

--31. Remove the primary key from the Department table and then reapply it.
ALTER TABLE Department
DROP CONSTRAINT PK__Departme__B2079BCD948F149D

ALTER TABLE Department
ADD CONSTRAINT pk_deparment PRIMARY KEY(DepartmentID)

--32. Try deleting a department from the Department table that is still referenced by a student and observe the result.
DELETE FROM Department
WHERE DepartmentID = 101

--33. Insert 5 records into the Department table.
INSERT INTO Department VALUES 
(100, 'Computer Science'),
(101, 'Commerce'),
(102, 'Arts'),
(103, 'Management'),
(104, 'Engineering')

--34. Insert 20 records into the Student table with varied courses, cities, marks, and fees.
INSERT INTO Student VALUES 
(1,'Aarav Sharma', 'B.Tech', 85, 'Delhi', 'M', 20, '2023-08-01', 50000, 100),
(2,'Priya Patel', 'B.Com', 92, 'Mumbai', 'F', 21, '2023-08-01', 42000, 101),
(3,'Rohan Verma', 'B.A.', 78, 'Pune', 'M', 22, '2022-07-15', 35000, 102),
(4,'Ananya Iyer', 'BBA', 88, 'Bangalore', 'F', 20, '2023-08-05', 48000, 103),
(5,'Kabir Singh', 'B.Tech', 65, 'Delhi', 'M', 21, '2022-07-20', 52000, 104),
(6,'Sneha Reddy', 'B.Tech', 95, 'Hyderabad', 'F', 19, '2024-07-10', 50000, 100),
(7,'Vikram Joshi', 'B.Com', 62, 'Ahmedabad', 'M', 22, '2022-08-12', 42000, 101),
(8,'Meera Kapoor', 'B.A.', 81, 'Jaipur', 'F', 20, '2023-07-18', 35000, 102),
(9,'Aditya Nair', 'BBA', 73, 'Chennai', 'M', 21, '2023-08-02', 48000, 103),
(10,'Diya Sengupta', 'B.Tech', 89, 'Kolkata', 'F', 20, '2023-07-25', 52000, 104),
(11,'Arjun Mehta', 'B.Tech', 91, 'Delhi', 'M', 19, '2024-08-01', 50000, 100),
(12,'Kavya Rao', 'B.Com', 84, 'Bangalore', 'F', 20, '2023-08-01', 42000, 101),
(13,'Siddharth Malo', 'B.A.', 70, 'Lucknow', 'M', 21, '2022-07-30', 35000, 102),
(14,'Ishita Bhatia', 'BBA', 90, 'Chandigarh', 'F', 20, '2023-08-04', 48000, 103),
(15,'Rishabh Deol', 'B.Tech', 58, 'Ludhiana', 'M', 22, '2022-08-10', 52000, 104),
(16,'Pooja Saxena', 'B.Tech', 86, 'Delhi', 'F', 19, '2024-07-15', 50000, 100),
(17,'Devendra Kumar', 'B.Com', 76, 'Patna', 'M', 21, '2023-08-08', 42000, 101),
(18,'Riya Sen', 'B.A.', 83, 'Kolkata', 'F', 20, '2023-07-20', 35000, 102),
(19,'Karan Malhotra', 'BBA', 69, 'Mumbai', 'M', 22, '2022-07-11', 48000, 103),
(20,'Tanya Das', 'B.Tech', 94, 'Guwahati', 'F', 19, '2024-08-02', 52000, 104)

--35. Insert a record into the Student table without providing a value for the city column, to check the DEFAULT constraint.
INSERT INTO Student (StudentName, Course, Marks, Gender, Age, AdmissionDate, Fee, DepartmentID) VALUES 
('Abid Shaikh', 'B.Tech', 99, 'M', 20, '2023-08-01', 90000, 100)
SELECT * FROM Student

--36. Insert a record into the Student table without providing a value for the fee column, to check the DEFAULT constraint.
INSERT INTO Student (StudentName, Course, Marks, City, Gender, Age, AdmissionDate, DepartmentID) VALUES 
('Aamir Saiyed', 'B.COM', 69, 'Vadodara', 'M', 23, '2023-08-01', 103)

--37.Update the marks of a student whose roll number is a specific value, increasing it by 5.
UPDATE Student
SET RollNo = RollNo + 5
WHERE RollNo =20

--38.Update the fee amount of all students belonging to a particular course.
UPDATE Student
SET Fee = Fee + 1000
WHERE DepartmentID = 101

--39.Update the city of a student from one city to another.
UPDATE Student
SET City = 'Vadodara'
WHERE City = 'Delhi'

--40.Update the department of a student to a different valid department.
UPDATE Student
SET DepartmentID = 104
WHERE RollNo = 13

--41.Delete the record of a student with a specific roll number.
DELETE FROM Student
WHERE RollNo = 13

--42.Delete all students whose marks are less than 35.
DELETE FROM Student
WHERE marks <= 35

--43.Delete all students belonging to a particular city.
DELETE FROM Student
WHERE City = 'Hyderabad'

--44. Insert a record leaving the student name blank and check whether the NOT NULL constraint blocks it.
INSERT INTO Student (Course, Marks, City, Gender, Age, AdmissionDate, DepartmentID) VALUES 
('B.COM', 69, 'Vadodara', 'M', 23, '2023-08-01', 103)

--45. Insert a record with a duplicate roll number and check whether the UNIQUE constraint blocks it.
INSERT INTO Student VALUES 
(1,'Aarav Sharma', 'B.Tech', 85, 'Delhi', 'M', 20, '2023-08-01', 50000, 100),
(2,'Priya Patel', 'B.Com', 92, 'Mumbai', 'F', 21, '2023-08-01', 42000, 101),
(3,'Rohan Verma', 'B.A.', 78, 'Pune', 'M', 22, '2022-07-15', 35000, 102)

--46. Insert a record with age less than the allowed minimum and check whether the CHECK constraint blocks it.
INSERT INTO Student VALUES 
(23,'Aarav Sharma', 'B.Tech', 85, 'Delhi', 'M', 10, '2023-08-01', 50000, 100)

--47.Update the marks of a student to a value greater than 100 and check whether the CHECK constraint blocks it.
INSERT INTO Student VALUES 
(23,'Aarav Sharma', 'B.Tech', 85, 'Delhi', 'M', 20, '2023-08-01', 50000, 105)

--48.Display all students whose marks are greater than 75.
SELECT * FROM Student 
WHERE Marks > 75

--49.Display all students whose fee is less than or equal to 20,000.
SELECT * FROM Student 
WHERE Fee <= 20000

--50.Display all students whose age is not equal to 18.
SELECT * FROM Student 
WHERE Age <> 18

--51.Display all students belonging to the 'Computer Science' course AND having marks greater than 60.
SELECT * FROM Student
WHERE DepartmentID = 100 AND Marks > 60

--52.Display all students belonging to the 'Computer Science' course OR the 'Commerce' course.
SELECT * FROM Student
WHERE DepartmentID = 101 AND Marks BETWEEN 50 AND 90

SELECT * FROM Department

--53.Display all students whose marks are BETWEEN 50 and 90.
SELECT * FROM Student
WHERE Marks BETWEEN 50 AND 90

--54.Display all students whose fee is BETWEEN 10,000 and 30,000.
SELECT * FROM Student
WHERE Fee BETWEEN 10000 AND 30000

--55.Display all students whose city is IN ('Delhi', 'Jaipur', 'Ahmedabad').
SELECT * FROM Student
WHERE City IN ('Delhi', 'Jaipur', 'Ahmedabad')

--56.Display all students whose course is NOT IN ('Arts', 'Commerce').
SELECT * FROM Student
WHERE DepartmentID NOT IN (101, 102)

--57.Display all students whose name starts with the letter 'S' using the LIKE operator.
SELECT * FROM Student 
WHERE StudentName LIKE 'S%'

--58.Display all students whose name ends with the letter 'n' using the LIKE operator.
SELECT * FROM Student 
WHERE StudentName LIKE '%N'

--59.Display all students whose name contains the substring 'an' anywhere in it.
SELECT * FROM Student 
WHERE StudentName LIKE '%an%'

--60.Display all students whose gender is 'F' and marks are greater than 80.
SELECT * FROM Student
WHERE Gender = 'F' AND Marks > 80

--61.Display all students whose department value IS NULL (if any).
SELECT * FROM Student
WHERE DepartmentID IS NULL

SELECT * FROM Department
WHERE DepartmentID IS NULL

--62.Display all students whose department value IS NOT NULL.
SELECT * FROM Student
WHERE DepartmentID IS NOT NULL

--63. Find the total number of students using COUNT.
SELECT COUNT(RollNo) AS total_student FROM Student

--64. Find the total number of students who belong to the 'Computer Science' course.
SELECT COUNT(RollNo) AS total_cs_student FROM Student
WHERE DepartmentID = 100

SELECT * FROM Department

--65. Find the total fee collected from all students using SUM.
SELECT SUM(Fee) AS total_fees FROM Student

--66. Find the total fee collected from students of a specific course.
SELECT SUM(Fee) AS total_fees FROM Student
WHERE DepartmentID = 100

--67. Find the average marks of all students using AVG.
SELECT AVG(Marks) AS avg_marks FROM Student

--68. Find the average fee paid by students belonging to a specific city.
SELECT AVG(Fee) AS total_fees FROM Student
WHERE City = 'Vadodara'

--69. Find the highest marks scored by any student using MAX.
SELECT MAX(Marks) AS highest_marks FROM Student

--70. Find the lowest marks scored by any student using MIN.
SELECT MIN(Marks) AS Lowest_marks FROM Student

--71. Find the highest fee paid by any student.
SELECT MAX(Fee) AS highest_Fees FROM Student

--72. Find the lowest fee paid by any student.
SELECT MIN(Fee) AS Lowest_Fees FROM Student

--73. Find the average age of all students.
SELECT AVG(Age) AS average_age FROM Student

--74. Find the total number of distinct courses offered, using COUNT with DISTINCT.
SELECT COUNT(DISTINCT Course) AS courses FROM Student

--75. Find the total number of distinct cities the students belong to.
SELECT COUNT(DISTINCT City) AS Cities FROM Student

--76. Find the maximum age among all students.
SELECT MAX(Age) AS Oldest FROM Student

--77. Find the minimum age among all students.
SELECT MAX(Age) AS Eldest FROM Student

--78. Find the sum of marks of all students combined.
SELECT SUM(marks) AS Total_Marks FROM Student

--79. Find the average marks of only the female students.
SELECT SUM(marks) AS Total_Female_Marks FROM Student
WHERE Gender = 'F'

--80. Find the count of students who scored more than 90 marks.
SELECT MAX(marks) AS more_than_90 FROM Student

--81.Display the total number of students in each course, using GROUP BY.
SELECT Course, COUNT(RollNo) AS total_student FROM Student
GROUP BY Course

--82.Display the average marks of students, grouped by course.
SELECT Course, AVG(Marks) AS average_marks FROM Student
GROUP BY Course

--83.Display the total fee collected, grouped by department.
SELECT DepartmentID, SUM(Fee) AS Total_Fees FROM Student
GROUP BY DepartmentID

--84.Display the maximum marks scored, grouped by city.
SELECT City, MAX(Marks) AS max_marks FROM Student
GROUP BY City

--85.Display the minimum age, grouped by gender.
SELECT Gender, MIN(Age) AS min_age FROM Student
GROUP BY Gender

--86.Display the count of students, grouped by city.
SELECT City, COUNT(RollNo) AS Total_student FROM Student
GROUP BY City

--87.Display the average fee, grouped by course and city together.
SELECT City, AVG(Fee) AS average_fees FROM Student
GROUP BY City

--88.Display the sum of marks, grouped by department.
SELECT DepartmentID, SUM(Marks) AS Total_Marks FROM Student
GROUP BY DepartmentID

--89.Display courses having more than 5 students enrolled, using HAVING.
SELECT Course, COUNT(RollNo) AS Total_student FROM Student
GROUP BY Course
HAVING COUNT(RollNo) >= 5

--90.Display cities having an average fee greater than 15,000, using HAVING.
SELECT City, AVG(Fee) AS Total_student FROM Student
GROUP BY City
HAVING AVG(Fee) >= 15000

--91.Display departments having a total student count greater than 3, using HAVING.
SELECT DepartmentID, COUNT(RollNo) AS Total_student FROM Student
GROUP BY DepartmentID
HAVING COUNT(RollNo) >= 3

--92.Display courses having an average marks greater than 70, using HAVING.
SELECT Course, AVG(Marks) AS average_marks FROM Student
GROUP BY Course
HAVING AVG(Marks) >= 70

--93.Display genders having a maximum marks value greater than 95, using HAVING.
SELECT Gender, MAX(Marks) AS average_marks FROM Student
GROUP BY Gender
HAVING MAX(Marks) >= 95

--94.Display all student records sorted by marks in descending order, using ORDER BY.
SELECT * FROM Student
ORDER BY Marks DESC

--95.Display all student records sorted by fee in ascending order.
SELECT * FROM Student
ORDER BY Fee

--96.Display all student records sorted by course (ascending) and then marks (descending).
SELECT * FROM Student
ORDER BY Course, Marks DESC

--97.Display all student records sorted by admission date, showing the most recently admitted students first.
SELECT * FROM Student
ORDER BY AdmissionDate DESC

--98.Display the top 10 students with the highest marks, using ORDER BY along with a row-limiting clause.
SELECT TOP 10 * FROM Student
ORDER BY Marks DESC

--99.Display all distinct courses sorted alphabetically.
SELECT DISTINCT Course FROM Student
ORDER BY Course

--100. Display department-wise student count sorted from highest to lowest count, combining GROUP BY and ORDER BY.
SELECT DepartmentID, COUNT(RollNo) AS Total_student FROM Student
GROUP BY DepartmentID
ORDER BY DepartmentID DESC