USE myFictionalBusiness;
GO
CREATE INDEX idx_LocationID ON Customer(LocationID);
GO
CREATE INDEX idx_CompanyID ON Location(CompanyID);
GO
CREATE INDEX idx_CustomerID ON Invoice(CustomerID);
GO
CREATE INDEX idx_InvoiceID ON InvoiceLineItems(InvoiceID);
GO
CREATE INDEX idx_ProductID ON InvoiceLineItems(ProductID);
