WITH late_orders AS
(SELECT O.EmployeeID, COUNT(O.EmployeeID) AS 'TotalLate' FROM Orders AS O
WHERE O.RequiredDate < O.ShippedDate
GROUP BY O.EmployeeID),
all_orders AS
(SELECT O.EmployeeID, count(O.OrderID) as 'TotalAll'
FROM Orders AS O
GROUP BY O.EmployeeID)
SELECT E.EmployeeID, E.LastName, ao.TotalAll, lo.TotalLate
FROM Employees AS E
JOIN late_orders AS lo ON E.EmployeeID = lo.EmployeeID
JOIN all_orders AS ao ON lo.EmployeeID = ao.EmployeeID
ORDER BY ao.TotalAll DESC
