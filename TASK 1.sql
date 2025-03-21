SELECT current.Branch,current.Year,current.Month,current.Total_Sales AS Current_Month_Sales,
    previous.Total_Sales AS Previous_Month_Sales,
    ((current.Total_Sales - previous.Total_Sales) / previous.Total_Sales) * 100 AS Growth_Percentage
FROM(SELECT Branch,
        EXTRACT(YEAR FROM Date) AS Year,
        EXTRACT(MONTH FROM Date) AS Month,
        SUM(Total) AS Total_Sales
    FROM Walmart
    GROUP BY Branch, EXTRACT(YEAR FROM Date), EXTRACT(MONTH FROM Date)) current
JOIN
    (SELECT Branch,
        EXTRACT(YEAR FROM Date) AS Year,
        EXTRACT(MONTH FROM Date) AS Month,
        SUM(Total) AS Total_Sales
    FROM Walmart
    GROUP BY Branch, EXTRACT(YEAR FROM Date), EXTRACT(MONTH FROM Date)) previous
ON current.Branch = previous.Branch AND (current.Year = previous.Year AND current.Month = previous.Month + 1
         OR (current.Year = previous.Year + 1 AND current.Month = 1 AND previous.Month = 12))
ORDER BY Growth_Percentage DESC
LIMIT 1;