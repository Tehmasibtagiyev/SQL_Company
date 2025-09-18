

CREATE DATABASE Company
USE Company

CREATE TABLE Department
(
Id INT,
[Name] NVARCHAR(20),
Email NVARCHAR(20),
Age INT,
Point DECIMAL(4,2)
)

ALTER TABLE Department ADD Scor Decimal(2,1)
ALTER TABLE Department ALTER COLUMN Point DECIMAL(3,2)
ALTER TABLE Department ALTER COLUMN Point DECIMAL(4,2)
ALTER TABLE Department DROP COLUMN Point
TRUNCATE TABLE Department
DROP TABLE Department

SELECT * FROM Department
SELECT SUM(Age) AS AgeSum FROM Department
SELECT AVG(Age) AS AverageAge FROM Department
SELECT COUNT(*) AS CountAge FROM Department
SELECT LEN([Name]) AS LengthName FROM Department
SELECT Id, [Name] FROM Department
SELECT Id AS MyIdentities, [Name] AS Adlar FROM Department
SELECT SUBSTRING([Name], 3, 2) AS Extracting FROM Department
SELECT * FROM Department WHERE [Name] LIKE '%of%'
SELECT CHARINDEX('@' , Email)-1 FROM Department
SELECT CHARINDEX('L' , Email) FROM Department
SELECT CONCAT([Name] , '--' , Email , '--' , Age , '--' , Point) AS FullUserName FROM Department
SELECT REPLACE([Name], 'L' , 'p') AS CutEmail FROM Department
SELECT SUBSTRING(Email, 1, CHARINDEX('@' , Email)+3) AS CutStringEmail FROM Department
SELECT SUBSTRING(Email, CHARINDEX('@', Email), CHARINDEX('l', Email)) FROM Department
SELECT SUBSTRING(Email, CHARINDEX('@' , Email)+1, LEN(Email)) AS CutEmail FROM Department

SELECT Age FROM Department
SELECT AVG(Age) FROM Department
SELECT * FROM Department WHERE Age>(SELECT AVG(Age) FROM Department)





