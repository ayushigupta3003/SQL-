WITH Sales_Stats AS (
    SELECT
        `Product Line`,
        AVG(Total) AS Avg_Sales,
        STDDEV(Total) AS StdDev_Sales
    FROM
        Walmart
    GROUP BY
        `Product Line`
)
SELECT
    w.`Invoice ID`,
    w.`Product Line`,
    w.Total,
    s.Avg_Sales,
    s.StdDev_Sales,
    CASE 
        WHEN w.Total > s.Avg_Sales + 2 * s.StdDev_Sales THEN 'High Anomaly'
        WHEN w.Total < s.Avg_Sales - 2 * s.StdDev_Sales THEN 'Low Anomaly'
        ELSE 'Normal'
    END AS Anomaly_Type
FROM
    Walmart w
JOIN
    Sales_Stats s ON w.`Product Line` = s.`Product Line`
WHERE
    w.Total > s.Avg_Sales + 2 * s.StdDev_Sales  -- High anomaly
    OR w.Total < s.Avg_Sales - 2 * s.StdDev_Sales; -- Low anomaly