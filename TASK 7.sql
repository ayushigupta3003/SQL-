SELECT `Customer type`, `Product Line`,
SUM(Total) AS Total_Sales
FROM Walmart
GROUP BY `Customer type`, `Product Line`
ORDER BY `Customer type`, Total_Sales DESC;