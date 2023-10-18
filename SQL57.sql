WITH CTE AS
(SELECT CustomerID, OrderDate = CONVERT(DATE, OrderDate), NextOrderDate = CONVERT(DATE, LEAD(ORDERDATE,1)
OVER (PARTITION BY CustomerID ORDER BY CustomerID, OrderDate))
FROM Orders)
SELECT CustomerID, OrderDate, NextOrderDate, DaysBetween = DATEDIFF(day, OrderDate, NextOrderDate)
FROM CTE
WHERE DATEDIFF (day, OrderDate, NextOrderDate) < 5
