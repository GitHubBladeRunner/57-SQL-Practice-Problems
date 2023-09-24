SELECT TOP 10 OD.OrderID, COUNT(OD.OrderID) AS TotalOrderDetails FROM [Order Details] AS OD
GROUP BY OD.OrderID
ORDER BY TotalOrderDetails DESC
