SELECT P.ProductID, P.ProductName, CompanyName FROM Products AS P
JOIN Suppliers AS S ON P.SupplierID = S.SupplierID
