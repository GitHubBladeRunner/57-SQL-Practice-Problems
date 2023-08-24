SELECT C.CategoryName, COUNT(P.QuantityPerUnit) AS TotalNumber FROM Categories AS C
JOIN Products AS P ON C.CategoryID = P.CategoryID 
GROUP BY C.CategoryName
ORDER BY TotalNumber DESC
