SELECT
    Gender,
    MONTH(STR_TO_DATE(Date, '%d-%m-%Y')) AS Month,
    SUM(Total) AS Total_Sales
FROM
    Walmart
GROUP BY
    Gender, Month
ORDER BY
Month, Gender;


