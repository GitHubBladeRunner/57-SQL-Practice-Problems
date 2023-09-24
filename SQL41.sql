SELECT OrderID, OrderDate, RequiredDate, ShippedDate FROM Orders
WHERE RequiredDate < ShippedDate
GROUP BY OrderID, OrderDate, RequiredDate, ShippedDate
