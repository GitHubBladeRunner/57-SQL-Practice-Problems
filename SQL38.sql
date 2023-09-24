SELECT OD.OrderID FROM Employees AS E
JOIN Orders AS O ON E.EmployeeID = O.EmployeeID
JOIN [ORDER Details] AS OD ON O.OrderID = OD.OrderID
WHERE E.LastName = 'Leverling' AND OD.Quantity >=60
GROUP BY OD.OrderID
HAVING COUNT(OD.OrderID) =2 AND COUNT(OD.Quantity) >1
ORDER BY OD.OrderID DESC
