SELECT O.CustomerID, C.CustomerID, C.ContactName FROM Customers AS C
LEFT JOIN Orders AS O ON C.CustomerID = O.CustomerID
WHERE O.CustomerID IS NULL
ORDER BY O.OrderID
