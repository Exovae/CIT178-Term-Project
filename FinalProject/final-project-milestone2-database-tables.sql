
CREATE DATABASE myFictionalBusiness;

GO

USE myFictionalBusiness;
	CREATE TABLE Customer(
	CustomerID int NOT NULL,
	FirstName varchar(30),
	LastName varchar(30),
	LocationID int NOT NULL,
	PRIMARY KEY (CustomerID)
);

GO
CREATE TABLE Location(
	LocationID int NOT NULL,
	ADDRESS varchar(30),
	City varchar(40),
	State varchar (40),
	CompanyID int NOT NULL,
	Number varchar(30),
	PRIMARY KEY (LocationID)
);

GO
CREATE TABLE Company(
	ID int NOT NULL,
	Company varchar(200),
	PRIMARY KEY (ID)
);

GO
CREATE TABLE Invoice(
	InvoiceID int NOT NULL,
	CustomerID int NOT NULL,
	OrderDate Date,
	ShipDate Date,
	IsPaid varchar(50),
	PRIMARY KEY (InvoiceID)
);

GO
CREATE TABLE InvoiceLineItems(
	LineItemID int NOT NULL,
	InvoiceID int NOT NULL,
	ProductID int NOT NULL,
	Quantity int,
	QuotePrice money,
	IsCancelled varchar(10),
	PRIMARY KEY (LineItemID)
);

GO
CREATE TABLE Product(
	ProductID int NOT NULL,
	ProductName varchar(90),
	ProductPrice money,
	PRIMARY KEY (ProductID)
); 