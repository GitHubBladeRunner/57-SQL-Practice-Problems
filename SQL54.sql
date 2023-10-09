WITH countries AS
(SELECT DISTINCT Country FROM Suppliers
UNION
SELECT DISTINCT Country FROM Customers),

S AS
(SELECT DISTINCT Country, COUNT(SupplierID) AS 'Total Suppliers'
FROM Suppliers
GROUP BY Country),

C AS
(SELECT DISTINCT Country, COUNT(CustomerID) AS 'Total Customers'
FROM Customers
GROUP BY Country)

SELECT ISNULL(S.Country, C.Country) AS 'Country', ISNULL(S.[Total Suppliers], 0) AS 'Total Suppliers', ISNULL(C.[Total Customers], 0) AS 'Total Customers'
FROM countries
FULL OUTER JOIN S ON countries.Country = S.Country
FULL OUTER JOIN C ON countries.Country = C.Country
ORDER BY countries.Country ASC
