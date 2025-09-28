
CREATE DATABASE University
USE University

CREATE TABLE Departments
(
Id INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(40) NOT NULL,
DepartmentId INT
)

CREATE TABLE DepartmentManagements
(
Id INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(20) NOT NULL,
DependOnId INT,
DepartmentId INT FOREIGN KEY REFERENCES Departments(Id)
)

CREATE TABLE Teachers
(
Id INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(20) NOT NULL,
Surname NVARCHAR(20),
Email NVARCHAR(30),
DepartmentId INT FOREIGN KEY REFERENCES Departments(Id)
)

ALTER TABLE Teachers ADD AdmissionDate DATE
ALTER TABLE Teachers ADD CurrentDate DATE
UPDATE Teachers SET CurrentDate = NULL
ALTER TABLE Teachers DROP COLUMN CurrentDate

CREATE TABLE Groups
(
Id INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(20)
)

CREATE TABLE TeacherGroups
(
TeacherId INT FOREIGN KEY REFERENCES Teachers(Id),
GroupId INT FOREIGN KEY REFERENCES Groups(Id),
PRIMARY KEY (TeacherId, GroupId)
)

CREATE TABLE Students
(
Id INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(20),
Surname NVARCHAR(20),
Email NVARCHAR(40),
GroupId INT FOREIGN KEY REFERENCES Groups(Id)
)

ALTER TABLE Students ADD AdmissionDate DATE
ALTER TABLE Students ADD CurrentDate DATE
ALTER TABLE Students ADD GraduationDate DATE

CREATE TABLE Subjects
(
Id INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(20)
)

CREATE TABLE SubjectStudents
(
SubjectId INT FOREIGN KEY REFERENCES Subjects(Id),
StudentId INT FOREIGN KEY REFERENCES Students(Id),
PRIMARY KEY (SubjectId, StudentId)
)

ALTER TABLE Departments DROP COLUMN DepartmentId
ALTER TABLE Subjects ADD Credits INT
ALTER TABLE Students ADD Points DECIMAL(4, 2)

-- INSERT

-- SELECT FORMAT(GETDATE(), 'yyyy-MM-dd') AS FormattedDate
-- SELECT CONVERT(varchar, GETDATE(), 23) AS ConvertedDate

SELECT CAST(GETDATE() AS date) AS DateOnly

SELECT * FROM Students
SELECT * FROM Subjects

--QUESTION 1 
INSERT INTO Students 
([Name], Surname, Email, GroupId, AdmissionDate, CurrentDate, GraduationDate)  VALUES
('Nicat', 'Ceferzade', 'cfrzd@gmail.com', 4, (SELECT CAST(GETDATE() AS date) AS DateOnly),'2023-04-15', '2025-10-30')

--QUESTION 2
SELECT AVG(Credits) FROM Subjects
INSERT INTO Subjects VALUES
('Felsefe', 50)

--QUESTION 3
SELECT * FROM Students
SELECT * FROM Students WHERE Points  > 50
UPDATE Students SET Points = Points + 20 
WHERE Points > 60  AND Surname LIKE '%t%'

--QUESTION 4
SELECT * FROM Teachers WHERE DATEDIFF(YEAR, AdmissionDate, GETDATE()) > 5
UPDATE Teachers SET Surname = 'Surname1' WHERE DATEDIFF(YEAR, AdmissionDate, GETDATE()) > 5

--QUESTION 5
SELECT * FROM Students WHERE DATEDIFF(YEAR, AdmissionDate, GETDATE()) > 4

--QUESTION 6
SELECT * FROM Students
DELETE FROM Students WHERE Points < 4

--QUESTION 7
SELECT DAY(AdmissionDate) FROM Students
SELECT [Name] FROM Students WHERE LEN([Name]) < DAY(AdmissionDate)

--QUESTION 8
SELECT MAX(Credits) FROM Subjects

--QUESTION 9 
SELECT AVG(Points) FROM Students

--QUESTION 10
SELECT s.[Name], sb.[Name] FROM Students s
JOIN SubjectStudents ss
ON ss.StudentId = s.Id
JOIN Subjects sb
ON sb.Id = ss.SubjectId

--QUESTION 11
SELECT * FROM Students WHERE [Name] LIKE 'A%'

--QUESTION 12
SELECT MAX(Points) AS MaksimumPoint, MIN(Points) AS MinimumPoint FROM Students

--QUESTION 13
SELECT s.[Name], COUNT(b.Id) AS RelationCount FROM Students s
JOIN SubjectStudents ss 
ON s.Id = ss.StudentId
JOIN Subjects b
ON b.Id = ss.SubjectId
GROUP BY s.Id, s.[Name]

--QUESTION 14
SELECT CONCAT([Name], ' ' , Surname) FROM Students

--QUESTION 15 
SELECT REPLACE([Name], 'B', 'TT') FROM Students

--QUESTION 16
SELECT DATEDIFF(DAY, AdmissionDate, GETDATE()) FROM Students
SELECT DATEDIFF(YEAR, AdmissionDate, GETDATE()) FROM Students
SELECT DATEDIFF(MONTH, AdmissionDate, GETDATE()) FROM Students

--QUESTION 17
SELECT d.Id, d.[Name], d.DependOnId, dm.DependOnId FROM DepartmentManagements d
JOIN DepartmentManagements dm
ON d.Id = dm.DependOnId



	

