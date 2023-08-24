SELECT DISTINCT ContactTitle, count(ContactTitle) AS TotalAmount FROM Customers
GROUP BY ContactTitle
ORDER BY TotalAmount DESC
