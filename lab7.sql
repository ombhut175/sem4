-- Lab-7 (Exception Handling)
-- Create the Customers table
CREATE TABLE Customers
(
    Customer_id INT PRIMARY KEY,
    Customer_Name VARCHAR(250) NOT NULL,
    Email VARCHAR(50) UNIQUE
);
-- Create the Orders table
CREATE TABLE Orders
(
    Order_id INT PRIMARY KEY,
    Customer_id INT,
    Order_date DATE NOT NULL,
    FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id)
);


-- From the above given tables perform the following queries:
-- Part – A
-- 1. Handle Divide by Zero Error and Print message like: Error occurs that is - Divide by zero error.
BEGIN TRY
    Print (1/0)
END TRY

BEGIN CATCH
    Print ERROR_MESSAGE()
END CATCH
-- 2. Try to convert string to integer and handle the error using try…catch block.
BEGIN TRY
    DECLARE @INTEGER1 INT = CAST('ABC123' AS INT)
END TRY
BEGIN CATCH
    Print ERROR_MESSAGE()
END CATCH
-- 3. Create a procedure that prints the sum of two numbers: take both numbers as integer & handle
-- exception with all error functions if any one enters string value in numbers otherwise print result.
CREATE OR ALTER PROCEDURE PR_BOTH_INTEGER
    @NUM1 VARCHAR(50) ,
    @NUM2 VARCHAR(50)
AS
BEGIN
    BEGIN TRY
        DECLARE @NUM1_CONVERTED INT = CAST(@NUM1 AS INT)
        DECLARE @NUM2_CONVERTED INT= CAST(@NUM2 AS INT)
        SELECT @NUM1_CONVERTED,@NUM2_CONVERTED
    END TRY

    BEGIN CATCH
        SELECT 
        ERROR_MESSAGE() AS ERROR_MESSAGE, 
        ERROR_LINE() AS ERROR_LINE, 
        ERROR_NUMBER() AS ERROR_NUMBER,
        ERROR_PROCEDURE() AS ERROR_PROCEDURE, 
        ERROR_SEVERITY() AS ERROR_SEVERITY, 
        ERROR_STATE() AS ERROR_SEVERITY
    END CATCH
END

PR_BOTH_INTEGER '123','234'
PR_BOTH_INTEGER 'ABC123','234'
-- 4. Handle a Primary Key Violation while inserting data into customers table and print the error details
-- such as the error message, error number, severity, and state.
BEGIN TRY
    INSERT INTO Customers VALUES
    (NULL,'YASH PATOLIYA','YASHPATOLIYA@GMAIL.COM')
END TRY
BEGIN CATCH
        SELECT 
        ERROR_MESSAGE() AS ERROR_MESSAGE, 
        ERROR_LINE() AS ERROR_LINE, 
        ERROR_NUMBER() AS ERROR_NUMBER,
        ERROR_PROCEDURE() AS ERROR_PROCEDURE, 
        ERROR_SEVERITY() AS ERROR_SEVERITY, 
        ERROR_STATE() AS ERROR_SEVERITY
END CATCH

-- 5. Throw custom exception using stored procedure which accepts Customer_id as input & that throws
-- Error like no Customer_id is available in database.

CREATE OR ALTER PROCEDURE PR_NO_CUSTOMER_ID_CHECK
    @CUSTOMER_ID INT
AS
BEGIN
    -- THROW error_number, message, state;
    BEGIN TRY
    IF NOT EXISTS (SELECT Customer_id FROM Customers WHERE Customer_id = @CUSTOMER_ID)
        THROW 50000,'PRIMARY KEY NOT FOUND',0
    END TRY

    BEGIN CATCH 
        SELECT ERROR_MESSAGE(),ERROR_NUMBER(),ERROR_STATE()
    END CATCH
END

PR_NO_CUSTOMER_ID_CHECK 3

-- Part – B
-- 6. Handle a Foreign Key Violation while inserting data into Orders table and print appropriate error
-- message.

BEGIN TRY
    INSERT INTO Orders VALUES
    (1,2,GETDATE())
END TRY
BEGIN CATCH
        SELECT 
        ERROR_MESSAGE() AS ERROR_MESSAGE, 
        ERROR_LINE() AS ERROR_LINE, 
        ERROR_NUMBER() AS ERROR_NUMBER,
        ERROR_PROCEDURE() AS ERROR_PROCEDURE, 
        ERROR_SEVERITY() AS ERROR_SEVERITY, 
        ERROR_STATE() AS ERROR_SEVERITY
END CATCH    

-- 7. Throw custom exception that throws error if the data is invalid.
CREATE OR ALTER PROCEDURE PR_CUSTOM_EXCEPTION
    @AGE INT
AS
BEGIN

    BEGIN TRY
        -- THROW error_number, message, state;
        IF (@AGE < 18) THROW 50000,'AGE BELOW 18 NOT ALLOWED',0
        PRINT @AGE
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE(),ERROR_NUMBER(),ERROR_STATE()
    END CATCH
END

PR_CUSTOM_EXCEPTION 15
-- 8. Create a Procedure to Update Customer’s Email with Error Handling
CREATE OR ALTER PROCEDURE PR_UPDATE_EMAIL
    @CUSTOMER_ID INT,@EMAIL VARCHAR(50)
AS
BEGIN
    BEGIN TRY
        -- THROW error_number, message, state;
        IF NOT EXISTS (SELECT Customer_id FROM Customers WHERE Customer_id = @CUSTOMER_ID)
        BEGIN
            DECLARE @MESSAGE VARCHAR(50) = 'NO CUSTOMER ID ' + CAST(@CUSTOMER_ID AS VARCHAR);
            THROW 50001,@MESSAGE,16;
        END
        IF EXISTS (SELECT EMAIL FROM Customers WHERE Email = @EMAIL)
            THROW 50001,'EMAIL ALREADY EXISTS',16;

        UPDATE Customers
        SET Email = @EMAIL
        WHERE Customer_id = @CUSTOMER_ID
    END TRY
    BEGIN CATCH
        SELECT 
        ERROR_MESSAGE() AS ERROR_MESSAGE, 
        ERROR_LINE() AS ERROR_LINE, 
        ERROR_NUMBER() AS ERROR_NUMBER,
        ERROR_PROCEDURE() AS ERROR_PROCEDURE, 
        ERROR_SEVERITY() AS ERROR_SEVERITY, 
        ERROR_STATE() AS ERROR_SEVERITY
    END CATCH
END

PR_UPDATE_EMAIL 2,'HELLO'

-- Part – C
-- 9. Create a procedure which prints the error message that “The Customer_id is already taken. Try another
-- one”.
CREATE OR ALTER PROCEDURE PR_CHECK_CUSTOMER_ID
    @CUSTOMER_ID INT
AS
BEGIN
    BEGIN TRY
        -- THROW error_number, message, state;
        IF EXISTS (SELECT Customer_id FROM Customers WHERE Customer_id = @CUSTOMER_ID)
        BEGIN
            DECLARE @MESSAGE VARCHAR(50) = 'CUSTOMER ID ' + CAST(@CUSTOMER_ID AS VARCHAR) + ' EXISTS';
            THROW 50001,@MESSAGE,16;
        END

        PRINT 'COMMAND EXECUTED SUCCESFULLY'
    END TRY
    BEGIN CATCH
        SELECT 
        ERROR_MESSAGE() AS ERROR_MESSAGE, 
        ERROR_LINE() AS ERROR_LINE, 
        ERROR_NUMBER() AS ERROR_NUMBER,
        ERROR_PROCEDURE() AS ERROR_PROCEDURE, 
        ERROR_SEVERITY() AS ERROR_SEVERITY, 
        ERROR_STATE() AS ERROR_SEVERITY
    END CATCH
END

INSERT INTO Customers
VALUES
(2,'YASH','YASH@GMAIL.COM')
PR_CHECK_CUSTOMER_ID 2
-- 10. Handle Duplicate Email Insertion in Customers Table.


CREATE OR ALTER PROCEDURE PR_CHECK_EMAIL
    @EMAIL VARCHAR(50)
AS
BEGIN
    BEGIN TRY
        -- THROW error_number, message, state;
        
        IF EXISTS (SELECT EMAIL FROM Customers WHERE Email = @EMAIL)
            THROW 50001,'EMAIL ALREADY EXISTS',16;

    END TRY
    BEGIN CATCH
        SELECT 
        ERROR_MESSAGE() AS ERROR_MESSAGE, 
        ERROR_LINE() AS ERROR_LINE, 
        ERROR_NUMBER() AS ERROR_NUMBER,
        ERROR_PROCEDURE() AS ERROR_PROCEDURE, 
        ERROR_SEVERITY() AS ERROR_SEVERITY, 
        ERROR_STATE() AS ERROR_SEVERITY
    END CATCH
END

PR_CHECK_EMAIL 'YASH@GMAIL.COM'