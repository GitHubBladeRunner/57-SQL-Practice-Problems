SELECT E.EmployeeID, E.LastName, O.OrderID, OD.Quantity, P.ProductName FROM Employees AS E
JOIN Orders AS O on E.employeeid = O.employeeid
JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID
JOIN Products AS P ON OD.ProductID = P.productid
ORDER BY E.EmployeeID, O.OrderID DESC
