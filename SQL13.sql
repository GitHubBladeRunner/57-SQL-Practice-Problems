SELECT OrderId, ProductID, UnitPrice, Quantity, UnitPrice * Quantity AS TotalPrice FROM [Order Details]
ORDER BY OrderID, ProductID
