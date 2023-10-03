WITH CTE AS
(SELECT C.CustomerID, C.CompanyName, SUM(OD.Quantity * OD.UnitPrice) AS 'TotalOrderAmount' FROM Customers AS C
JOIN Orders AS O ON C.CustomerID = O.CustomerID 
JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID
WHERE YEAR(O.OrderDate) = '1998'
GROUP BY C.CustomerID, C.CompanyName)

SELECT CTE.CustomerID, CTE.CompanyName, CTE.TotalOrderAmount, CustomerGroup = 
CASE
WHEN CTE.TotalOrderAmount < 1000 THEN 'LOW'
WHEN (CTE.TotalOrderAmount > 1000 AND CTE.TotalOrderAmount < 5000) THEN 'MEDIUM'
WHEN (CTE.TotalOrderAmount > 5000 AND CTE.TotalOrderAmount < 10000) THEN 'HIGH'
ELSE 'VERY HIGH'
END
FROM CTE
ORDER BY CTE.CustomerID
