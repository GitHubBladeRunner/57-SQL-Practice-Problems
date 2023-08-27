SELECT C.CustomerID, C.ContactName, C.CompanyName, O.OrderID, OD.UnitPrice * OD.Quantity AS TotalAmount FROM Customers AS C
JOIN Orders AS O ON C.CustomerID = O.CustomerID
JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID
WHERE YEAR(O.OrderDate) = '1997' AND OD.UnitPrice * OD.Quantity >= '10000'
GROUP BY C.CustomerID, C.ContactName, C.CompanyName, O.OrderID, OD.UnitPrice * OD.Quantity
ORDER BY TotalAmount DESC
