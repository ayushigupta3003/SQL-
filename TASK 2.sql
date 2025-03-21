WITH Profit_Per_Branch AS (
    SELECT
        Branch,
        `Product Line`,
        SUM(`gross income`-`cogs`) AS Total_Profit
    FROM
        Walmart
    GROUP BY
        Branch, `Product Line`
)
SELECT
    Branch,
    `Product Line`,
    Total_Profit
FROM (
    SELECT
        Branch,
        `Product Line`,
        Total_Profit,
        RANK() OVER (PARTITION BY Branch ORDER BY Total_Profit DESC) AS ranked_order
    FROM
        Profit_Per_Branch
) Ranked_Products
WHERE ranked_order = 1;
