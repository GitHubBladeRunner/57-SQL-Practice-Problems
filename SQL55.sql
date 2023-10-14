WITH Orders_CTE
AS
(SELECT ShipCountry, CustomerID, OrderID, CONVERT(DATE, OrderDate) AS 'OrderDate',
ROW_NUMBER() OVER(PARTITION BY ShipCountry ORDER BY ShipCountry, OrderID) AS 'RowNumberPerCountry'
FROM Orders)
SELECT ShipCountry, CustomerID, OrderID, OrderDate
FROM Orders_CTE
WHERE RowNumberPerCountry = 1
