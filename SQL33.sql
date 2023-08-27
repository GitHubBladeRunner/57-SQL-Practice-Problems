SELECT C.CustomerID, C.CompanyName, OD.UnitPrice * OD.Quantity AS TotalOrderAmount FROM Customers AS C
JOIN Orders AS O ON C.CustomerID = O.Customerid
JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID
WHERE YEAR(O.OrderDate) = '1997' AND OD.UnitPrice * OD.Quantity >= '10000'
GROUP BY C.CustomerID, C.CompanyName, OD.UnitPrice * OD.Quantity
ORDER BY TotalOrderAmount DESC
