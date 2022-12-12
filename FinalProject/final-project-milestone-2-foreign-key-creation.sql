USE myFictionalBusiness;
GO
ALTER TABLE Customer WITH CHECK
ADD CONSTRAINT FK_LocationID FOREIGN KEY(LocationID) REFERENCES Location(LocationID)
ON UPDATE CASCADE
GO
ALTER TABLE Location WITH CHECK
ADD CONSTRAINT FK_CompanyID FOREIGN KEY(CompanyID) REFERENCES Company(CompanyID)
ON UPDATE CASCADE
GO
ALTER TABLE Invoice WITH CHECK
ADD CONSTRAINT FK_CustomerID FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID)
ON UPDATE CASCADE
GO
ALTER TABLE InvoiceLineItems WITH CHECK
ADD CONSTRAINT FK_InvoiceID FOREIGN KEY(InvoiceID) REFERENCES Invoice(InvoiceID)
ON UPDATE CASCADE
GO
ALTER TABLE InvoiceLineItems WITH CHECK
ADD CONSTRAINT FK_ProductID FOREIGN KEY(ProductID) REFERENCES Product(ProductID)
ON UPDATE CASCADE
GO