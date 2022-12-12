/*USE myFictionalBusiness;
SELECT MIN(ProductPrice) AS 'Minimum Unit Price'
FROM Product;

USE myFictionalBusiness;
SELECT COUNT(CompanyID) AS 'Clients from California'
FROM Location
WHERE State = 'California';

USE myFictionalBusiness;
SELECT MIN(QuotePrice) AS 'Minimum amount due for not cancelled orders'
FROM InvoiceLineItems
WHERE IsCancelled = 'No';

USE myFictionalBusiness;
SELECT SUM(QuotePrice) AS 'All amount due from all clients'
FROM InvoiceLineItems
WHERE IsCancelled = 'No';*/