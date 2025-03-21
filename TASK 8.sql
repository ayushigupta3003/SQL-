WITH Converted_Walmart AS (
    SELECT
        `Customer ID`,
        STR_TO_DATE(Date, '%d-%m-%Y') AS Converted_Date,
        `Invoice ID`,
        Branch,
        City,
        Total
    FROM
        Walmart
),
Repeat_Purchases AS (
    SELECT
        w1.`Customer ID`,
        w1.`Invoice ID` AS First_Invoice,
        w2.`Invoice ID` AS Repeat_Invoice,
        w1.Converted_Date AS First_Purchase_Date,
        w2.Converted_Date AS Repeat_Purchase_Date,
        DATEDIFF(w2.Converted_Date, w1.Converted_Date) AS Days_Between_Purchases
    FROM
        Converted_Walmart w1
    JOIN
        Converted_Walmart w2 ON w1.`Customer ID` = w2.`Customer ID`
    WHERE
        w1.`Invoice ID` != w2.`Invoice ID`
    AND
        DATEDIFF(w2.Converted_Date, w1.Converted_Date) BETWEEN 1 AND 90
)
SELECT
    `Customer ID`,
    First_Invoice,
    Repeat_Invoice,
    First_Purchase_Date,
    Repeat_Purchase_Date,
    Days_Between_Purchases
FROM
    Repeat_Purchases
ORDER BY
    `Customer ID`, First_Purchase_Date;
