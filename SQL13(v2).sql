SELECT OrderId, ProductID, UnitPrice, Quantity, UnitPrice * Quantity AS TotalPrice, Discount, (UnitPrice * Quantity) * (1-Discount) AS PriceWithDiscount FROM [Order Details]
ORDER BY OrderID, ProductID
