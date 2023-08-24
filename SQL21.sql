SELECT DISTINCT Country, City, COUNT(ContactName) AS TotalCustomers FROM Customers
GROUP BY Country, City
ORDER BY TotalCustomers DESC
