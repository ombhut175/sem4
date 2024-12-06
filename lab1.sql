-- Create Department Table
CREATE TABLE Department (
 DepartmentID INT PRIMARY KEY,
 DepartmentName VARCHAR(100) NOT NULL UNIQUE
);
-- Create Designation Table
CREATE TABLE Designation (
 DesignationID INT PRIMARY KEY,
 DesignationName VARCHAR(100) NOT NULL UNIQUE
);
-- Create Person Table
CREATE TABLE Person (
 PersonID INT PRIMARY KEY IDENTITY(101,1),
 FirstName VARCHAR(100) NOT NULL,
 LastName VARCHAR(100) NOT NULL,
 Salary DECIMAL(8, 2) NOT NULL,
 JoiningDate DATETIME NOT NULL,
 DepartmentID INT NULL,
 DesignationID INT NULL,
 FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
 FOREIGN KEY (DesignationID) REFERENCES Designation(DesignationID)
);


-- From the above given tables create Stored Procedures:
-- Part – A
-- 1. Department, Designation & Person Table’s INSERT, UPDATE & DELETE Procedures.
CREATE OR ALTER PROCEDURE PR_DEPARTMENT_INSERT
@DepartmentID INT,
@DepartmentName VARCHAR(100)
AS
BEGIN
    INSERT INTO Department
    VALUES (@DepartmentID,@DepartmentName)
END

PR_DEPARTMENT_INSERT 1,'ADMIN'
PR_DEPARTMENT_INSERT 2,'IT'
PR_DEPARTMENT_INSERT 3,'HR'
PR_DEPARTMENT_INSERT 4,'ACCOUNT'

CREATE OR ALTER PROCEDURE PR_DEPARTMENT_UPDATE
@DEPARTMENTID INT,
@DepartmentName VARCHAR(100)
AS
BEGIN
    UPDATE Department
    SET DepartmentName = @DepartmentName
    WHERE DepartmentID = @DEPARTMENTID
END

PR_DEPARTMENT_UPDATE 1,'ADMIN2'
SELECT * FROM Department

CREATE OR ALTER PROCEDURE PR_DEPARTMENT_DELETE
@DEPARTMENTID INT
AS
BEGIN
    DELETE FROM Department
    WHERE DepartmentID=@DEPARTMENTID
END

PR_DEPARTMENT_DELETE 4

CREATE OR ALTER PROCEDURE PR_DESIGNATION_INSERT
@DESIGNATIONID INT,
@DesignationName VARCHAR(100)
AS
BEGIN
    INSERT INTO Designation
    VALUES (@DESIGNATIONID,@DesignationName)
END

SELECT * FROM Designation

PR_DESIGNATION_INSERT 11,'Jobber'
PR_DESIGNATION_INSERT 12,'Welder'
PR_DESIGNATION_INSERT 13,'Clerk'
PR_DESIGNATION_INSERT 14,'Manager'
PR_DESIGNATION_INSERT 15,'CEO'

CREATE OR ALTER PROCEDURE PR_DESIGNATION_UPDATE
@DESIGNATIONID INT,
@DesignationName VARCHAR(100)
AS
BEGIN
    UPDATE Designation
    SET DesignationName=@DesignationName
    WHERE DesignationID=@DESIGNATIONID
END

SELECT * FROM Designation

PR_DESIGNATION_UPDATE 11,'JOBBER1'

CREATE OR ALTER PROCEDURE PR_DESIGNATION_DELETE
@DESIGNATIONID INT
AS
BEGIN
    DELETE FROM Designation
    WHERE DesignationID=@DESIGNATIONID
END


PR_DESIGNATION_DELETE 11

CREATE OR ALTER PROCEDURE PR_PERSON_INSERT
@FirstName VARCHAR(100),
@LastName VARCHAR(100),
@Salary Decimal (8,2),
@JoiningDate DATETIME,
@DepartmentID INT,
@DesignationID INT
AS
BEGIN
    INSERT Person
    VALUES(@FirstName,@LastName,@Salary,@JoiningDate,@DepartmentID,@DesignationID)
END

SELECT * FROM Person

PR_PERSON_INSERT 'Rahul','Anshu',56000,'01-01-1990',1,12
PR_PERSON_INSERT 'Hardik','Hinsu',18000,'1990-09-25 ',2,11
PR_PERSON_INSERT 'Bhavin','Kamani',25000,'1991-05-14',NULL,11
PR_PERSON_INSERT 'Bhoomi','Patel',39000,'2014-02-20',1,13
PR_PERSON_INSERT 'Priya','Mehta',25000,'1990-10-18',2,NULL
PR_PERSON_INSERT 'Neha','Trivedi',18000,'2014-02-20',3,15

CREATE OR ALTER PROCEDURE PR_PERSON_UPDATE
@FirstName VARCHAR(100),
@LastName VARCHAR(100),
@PersonID INT
AS
BEGIN
    UPDATE Person
    SET FirstName=@FirstName,
    LastName=@LastName
    WHERE PersonID=@PersonID
END

PR_PERSON_UPDATE 'Rahul','ANSHUJI',101

CREATE OR ALTER PROCEDURE PR_PERSON_DELETE
@PersonID INT
AS
BEGIN
    DELETE FROM Person
    WHERE PersonID=@PersonID
END

PR_PERSON_DELETE 107
TRUNCATE TABLE PERSON


-- 2. Department, Designation & Person Table’s SELECTBYPRIMARYKEY

-- 3. Department, Designation & Person Table’s (If foreign key is available then do write join and take
-- columns on select list)
-- 4. Create a Procedure that shows details of the first 3 persons.
-- Part – B
-- 5. Create a Procedure that takes the department name as input and returns a table with all workers
-- working in that department.
-- 6. Create Procedure that takes department name & designation name as input and returns a table with
-- worker’s first name, salary, joining date & department name.
-- 7. Create a Procedure that takes the first name as an input parameter and display all the details of the
-- worker with their department & designation name.
-- 8. Create Procedure which displays department wise maximum, minimum & total salaries.
-- 9. Create Procedure which displays designation wise average & total salaries.
-- Part – C
-- 10. Create Procedure that Accepts Department Name and Returns Person Count.
-- 11. Create a procedure that takes a salary value as input and returns all workers with a salary greater than
-- input salary value along with their department and designation details.
-- 12. Create a procedure to find the department(s) with the highest total salary among all departments.
-- 13. Create a procedure that takes a designation name as input and returns a list of all workers under that
-- designation who joined within the last 10 years, along with their department.
-- 14. Create a procedure to list the number of workers in each department who do not have a designation
-- assigned.
-- 15. Create a procedure to retrieve the details of workers in departments where the average salary is above
-- 12000.
