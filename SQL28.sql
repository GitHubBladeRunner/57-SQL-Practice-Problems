SELECT TOP (3) ShipCountry, AVG(Freight) AS AverageFreight FROM Orders
WHERE OrderDate BETWEEN (SELECT DATEADD(YEAR, -1, MAX(OrderDate)) FROM Orders) AND (SELECT MAX(OrderDate) FROM Orders)
GROUP BY ShipCountry
ORDER BY AverageFreight DESC
