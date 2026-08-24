CREATE DATABASE Gulamabid_Int1171

USE Gulamabid_Int1171

--Create the following four tables using appropriate constraints:
--1. Specializations Table
-- SpecializationID , SpecializationName
CREATE TABLE Specializations
(
	SpecializationID INT PRIMARY KEY IDENTITY(1,1),
	SpecializationName VARCHAR(50) NOT NULL
)

INSERT INTO Specializations VALUES
('Full Stack'),
('DE'),
('QA'),
('Cloud Eng.'),
('DevOps'),
('MAD')

--2. Students Table
-- StudentID , FirstName, LastName, Age, SpecializationID
CREATE TABLE Students
(
	StudentID INT PRIMARY KEY IDENTITY(1,1),
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	Age INT,
	SpecializationID INT REFERENCES Specializations
)

INSERT INTO Students VALUES
(1,'Abid','Shaikh',20,1),
(2,'Gulamabid','Shaikh',21,1),
(3,'Gulam','Shaikh',22,1),
(4,'Abid','Faruque',23,3),
(5,'Gulamabid','Pathan',24,5),
(6,'Abid','Saiyed',25,2),
(7,'Gulam','Khan',24,6),
(8,'Suresh','Patel',21,1)

--3. Courses Table
--o CourseID , CourseName, Credits (e.g., 1,2,3)
CREATE TABLE Courses
(
	CourseID INT PRIMARY KEY IDENTITY(1,1),
	CourseName VARCHAR(50),
	Credits INT 
	CONSTRAINT chk_credit CHECK(Credits IN (1,2,3))
)

INSERT INTO Courses VALUES
(1,'Java Full Stack',3),
(2,'.NET Full Stack',2),
(3,'MERN Full Stack',1),
(4,'Data Analytics',2),
(5,'Data Engineering',3),
(6,'Software Testing',2),
(7,'BA',3)

--4. Enrollments Table
-- EnrollmentID , StudentID , CourseID, Grade (e.g., A, B, C)
CREATE TABLE Enrollments
(
	EnrollmentID INT PRIMARY KEY IDENTITY(1,1),
	StudentID INT REFERENCES Students,
	CourseID INT REFERENCES Courses,
	Grade CHAR(3)
	CONSTRAINT chk_grade CHECK(Grade IN ('A','B','C'))
)

INSERT INTO Enrollments VALUES
(1,1,3,'A'),
(2,5,1,'B'),
(3,8,5,'B'),
(4,7,6,'A'),
(5,7,4,'C'),
(6,4,6,'A'),
(7,6,3,'C')

--1. Retrieve a list of Students and their Specialization names.
SELECT ST.FirstName, ST.LastName, S.SpecializationName FROM Specializations S
JOIN Students ST
ON S.SpecializationID = ST.SpecializationID

--2. List all Course names that 'Suresh Patel' is enrolled in.
SELECT C.CourseName, CONCAT(S.FirstName, ' ', S.LastName) AS full_name FROM Students S
INNER JOIN Enrollments E
ON S.StudentID = E.StudentID
INNER JOIN Courses C
ON C.CourseID = E.CourseID
WHERE CONCAT(S.FirstName, ' ', S.LastName) = 'Suresh Patel'

--3. Display Student names along with the Grade they received in 'Full Stack'.
SELECT CONCAT(S.FirstName, ' ', S.LastName) AS full_name, C.SpecializationName, E.Grade FROM Students S
INNER JOIN Enrollments E
ON S.StudentID = E.StudentID
INNER JOIN Specializations C
ON C.SpecializationID = S.SpecializationID
WHERE C.SpecializationName = 'Full Stack'

--4. Show all Specializations that currently have no students assigned.
SELECT ST.FirstName, ST.LastName, S.SpecializationName FROM Specializations S
LEFT JOIN Students ST
ON S.SpecializationID = ST.SpecializationID
WHERE ST.SpecializationID IS NULL

--5. List every Enrollment ID with the corresponding Student's Full Name and the Course Credits.
SELECT E.EnrollmentID, S.FirstName, S.LastName, C.Credits FROM Students S
INNER JOIN Enrollments E
ON S.StudentID = E.StudentID
INNER JOIN Courses C
ON C.CourseID = E.CourseID

--6. Count how many students are in each specialization, but only show specializations with more than 5 students.
SELECT  sp.SpecializationName, COUNT(st.SpecializationID) AS total_student FROM Specializations sp
INNER JOIN Students st
ON sp.SpecializationID = st.SpecializationID
GROUP BY sp.SpecializationName
HAVING COUNT(st.SpecializationID) >= 5

--7. Find students who are enrolled in 3 or more courses.
SELECT CONCAT(S.FirstName, S.LastName) AS full_name, COUNT(E.StudentID) AS total_enrolled FROM Students S
INNER JOIN Enrollments E
ON S.StudentID = E.StudentID
INNER JOIN Courses C
ON C.CourseID = E.CourseID
GROUP BY CONCAT(S.FirstName, S.LastName)
HAVING COUNT(E.StudentID) >= 3


--8. Calculate the total number of credits assigned to Student ID 1.
SELECT S.StudentID, SUM(C.Credits) AS total_number_credit FROM Students S
INNER JOIN Enrollments E
ON S.StudentID = E.StudentID
INNER JOIN Courses C
ON C.CourseID = E.CourseID
GROUP BY S.StudentID
HAVING S.StudentID = 1

--9. Select all students whose age is between 18 and 22 (inclusive).
SELECT * FROM Students
WHERE age BETWEEN 18 AND 22

--10. Find the names of students who have enrolled in the course named 'Data Analytics’.
SELECT CONCAT(S.FirstName, ' ', S.LastName) AS full_name, C.CourseName FROM Students S
INNER JOIN Enrollments E
ON S.StudentID = E.StudentID
INNER JOIN Courses C
ON C.CourseID = E.CourseID
WHERE C.CourseName = 'Data Analytics'