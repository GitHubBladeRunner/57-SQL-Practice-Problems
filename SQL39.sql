WITH cteTable (OrderID, Quantity)
AS (
	SELECT 
		OrderID,
		Quantity
	FROM [Order Details]
	WHERE Quantity >= 60
	GROUP BY 
		OrderID,
		Quantity
	HAVING COUNT(*) > 1
)
SELECT 
	OrderID,
	ProductID,
	UnitPrice,
	Quantity,
	Discount
FROM [Order Details]
WHERE 
	OrderID IN (SELECT OrderID FROM cteTable)
ORDER BY
	OrderID,
	Quantity;
