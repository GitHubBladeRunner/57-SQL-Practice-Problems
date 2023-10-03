SELECT E.EmployeeID, E.LastName, COUNT(O.OrderID) AS 'TotalLateOrders' FROM Orders AS O
JOIN Employees AS E ON O.EmployeeID = E.EmployeeID
WHERE O.RequiredDate < O.ShippedDate
GROUP BY E.EmployeeID, E.LastName
ORDER BY TotalLateOrders DESC
