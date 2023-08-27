SELECT C.CustomerID, O.CustomerID, C.ContactName, O.EmployeeID FROM Customers AS C
LEFT JOIN Orders AS O ON C.CustomerID = O.CustomerID AND O.EmployeeID = 4
WHERE O.CustomerID IS NULL 
ORDER BY O.OrderID
