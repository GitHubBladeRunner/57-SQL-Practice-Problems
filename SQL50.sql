WITH TOA AS
(SELECT C.CustomerID, C.CompanyName, SUM(OD.Quantity * OD.UnitPrice) AS 'TotalOrderAmount' FROM Customers AS C
JOIN Orders AS O ON C.CustomerID = O.CustomerID 
JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID
WHERE YEAR(O.OrderDate) = '1998'
GROUP BY C.CustomerID, C.CompanyName),

GROUPS AS 
(SELECT TOA.CustomerID, TOA.CompanyName, TOA.TotalOrderAmount, CustomerGroup = 
CASE
WHEN TOA.TotalOrderAmount < 1000 THEN 'LOW'
WHEN (TOA.TotalOrderAmount > 1000 AND TOA.TotalOrderAmount < 5000) THEN 'MEDIUM'
WHEN (TOA.TotalOrderAmount > 5000 AND TOA.TotalOrderAmount < 10000) THEN 'HIGH'
WHEN TOA.TotalOrderAmount > 10000 THEN 'VERY HIGH'
END 
FROM TOA),

GROUPS_COUNT AS 
(SELECT GROUPS.CustomerGroup, COUNT(GROUPS.CustomerGroup) AS 'AllGroups'
FROM GROUPS
GROUP BY GROUPS.CustomerGroup)

SELECT GROUPS_COUNT.CustomerGroup, GROUPS_COUNT.AllGroups AS 'TotalInGroup', CONVERT(DECIMAL(5,2),100*GROUPS_COUNT.AllGroups/(SELECT SUM(GROUPS_COUNT.AllGroups) FROM GROUPS_COUNT))AS 'PercentageInGroup' 
FROM GROUPS_COUNT
GROUP BY GROUPS_COUNT.CustomerGroup, GROUPS_COUNT.AllGroups
ORDER BY TotalInGroup DESC
