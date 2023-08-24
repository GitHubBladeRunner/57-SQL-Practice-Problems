SELECT O.OrderID, CONVERT(DATE, O.OrderDate) AS 'Date Of Order', CompanyName FROM Orders AS O
JOIN Shippers AS S ON O.ShipVia = S.ShipperID
WHERE O.OrderID < 10300
ORDER BY OrderID
