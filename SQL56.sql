WITH FirstOrder AS
(SELECT CustomerID, OrderID, OrderDate FROM Orders),
NextOrder AS
(SELECT CustomerID, OrderID, OrderDate FROM Orders)
SELECT FirstOrder.CustomerID, FirstOrder.OrderID, FirstOrder.OrderDate, NextOrder.OrderID, NextOrder.OrderDate, DaysBetweenOrders = DATEDIFF(day, FirstOrder.OrderDate, NextOrder.OrderDate)
FROM FirstOrder
JOIN NextOrder ON FirstOrder.CustomerID = NextOrder.CustomerID
WHERE DATEDIFF(day, FirstOrder.OrderDate, NextOrder.OrderDate) < 5 AND FirstOrder.OrderID < NextOrder.OrderID 
ORDER BY FirstOrder.CustomerID, FirstOrder.OrderID
