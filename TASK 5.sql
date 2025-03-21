SELECT
    City,
    Payment,
    COUNT(*) AS Payment_Count
FROM
    Walmart
GROUP BY
    City, Payment;
    SELECT
    City,
    Payment,
    Payment_Count,
    RANK() OVER (PARTITION BY City ORDER BY Payment_Count DESC) AS Payment_Rank
FROM
    Payment_Stats;