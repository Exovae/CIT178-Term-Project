/* Final Project Procedures

USE myFictionalBusiness;
GO
CREATE PROC spCustomers
AS
SELECT * FROM Customer
ORDER BY LastName;
GO

EXEC spCustomers;

USE myFictionalBusiness;
Go
CREATE PROC spGetCustomer
	@CustomerID int
AS
BEGIN
	SELECT * FROM Customer
	WHERE CustomerID = @CustomerID;
END
GO
EXEC spGETCustomer 4

USE myFictionalBusiness;
GO
CREATE PROC spCustomerContact
	@CustomerID int,
	@FirstName nvarchar(30) OUTPUT,
	@LastName nvarchar(50) OUTPUT,
	@LocationID nvarchar(50) OUTPUT 
AS
SELECT @FirstName = FirstName, @LastName = LastName, @LocationID = LocationID
FROM Customer 
WHERE CustomerID = @CustomerID;
GO
DECLARE @FirstName nvarchar(30);
DECLARE @LastName nvarchar(50);
DECLARE @Location nvarchar(30);
EXEC spCustomerContact 3, @FirstName OUTPUT, @LastName OUTPUT, @Location OUTPUT;
SELECT @FirstName AS 'First Name', @LastName AS 'Last Name', @Location AS 'LocationID';

USE myFictionalBusiness;
GO
CREATE PROC spCustomerCount
AS
DECLARE @CustomerCount int;
SELECT @CustomerCount = COUNT(*)
FROM Customer
RETURN @CustomerCount;
GO

DECLARE @CustomerCount int;
EXEC @CustomerCount = spCustomerCount;
PRINT 'There are ' + CONVERT(varchar, @CustomerCount) + ' customers in your database';
GO

 Final Project User Defined Functions 

USE myFictionalBusiness;
GO
CREATE FUNCTION fnProducts
	(@ProductName nvarchar(50) = '%')
	RETURNS int
BEGIN
	RETURN(SELECT ProductID FROM Product WHERE ProductName LIKE @ProductName);
END;
GO
SELECT ProductID FROM Product
WHERE ProductID = dbo.fnProducts('HDMI');

USE myFictionalBusiness;
GO
CREATE FUNCTION fnGetProduct
    (@ProductName varchar(50) = '%')
    RETURNS table
RETURN
    (SELECT * FROM Product WHERE ProductName Like @ProductName);
GO
SELECT * FROM dbo.fnProducts('%H%');


Final Project Triggers 

 USE myFictionalBusiness;
 GO
 SELECT * INTO CustomerTransaction
 FROM Customer
 WHERE 1=0;

 ALTER TABLE CustomerTransaction
 ADD Status varchar(50);
 GO

  CREATE TRIGGER CustomerTransaction_INSERT ON Customer
    AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @CustomerID int
	DECLARE @FirstName nvarchar(30)
	DECLARE @LastName nvarchar(50)

    SELECT @CustomerID =INSERTED.CustomerID, @FirstName = INSERTED.FirstName, @LastName = INSERTED.LastName
	FROM INSERTED

    INSERT INTO CustomerTransaction_INSERT VALUES(@CustomerID, @FirstName, @LastName)
END
GO
INSERT INTO CustomerTransaction VALUES(8, 'Elliot', 'Richards', 'Inserted');
GO

SELECT * FROM CustomerTransaction;
GO

 CREATE TRIGGER CustomerTransaction_Delete ON Customer
    AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @CustomerID int
	DECLARE @FirstName nvarchar(30)
	DECLARE @LastName nvarchar(50)


    SELECT @CustomerID =DELETED.CustomerID, @FirstName = DELETED.FirstName, @LastName = DELETED.LastName
	FROM DELETED

    INSERT INTO CustomerTransaction VALUES(@CustomerID,@FirstName, @LastName, 'Deleted')
END
GO
DELETE FROM Customer WHERE CustomerID = 8;
GO
SELECT * FROM CustomerTransaction;

 CREATE TRIGGER CustomerTransaction_Update ON Customer
    AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @CustomerID int
	DECLARE @FirstName nvarchar(30)
	DECLARE @LastName nvarchar(50)

    SELECT @CustomerID =INSERTED.CustomerID, @FirstName = INSERTED.FirstName, @LastName = INSERTED.LastName
	FROM INSERTED

    INSERT INTO CustomerTransaction VALUES(@CustomerID,@FirstName, @LastName, 'Updated')
END
GO
INSERT INTO Customer VALUES(10,'Elliot','Richards');
GO
UPDATE Customer 
SET FirstName = 'Elliot'
WHERE CustomerID = 10;
GO
SELECT * FROM CustomerTransaction;*/