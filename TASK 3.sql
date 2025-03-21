WITH Customer_Spending AS (
    SELECT
        `Customer ID`,
        SUM(Total) AS Total_Spending
    FROM
        Walmart
    GROUP BY
        `Customer ID`
)
SELECT
    `Customer ID`,
    Total_Spending,
    CASE 
        WHEN NTILE(3) OVER (ORDER BY Total_Spending DESC) = 1 THEN 'High Spender'
        WHEN NTILE(3) OVER (ORDER BY Total_Spending DESC) = 2 THEN 'Medium Spender'
        WHEN NTILE(3) OVER (ORDER BY Total_Spending DESC) = 3 THEN 'Low Spender'
    END AS Spending_Tier
FROM
    Customer_Spending;
