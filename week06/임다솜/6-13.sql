-- https://leetcode.com/problems/capital-gainloss/submissions/1909697999/

WITH base AS (SELECT
    stock_name,
    operation,
    SUM(price) AS total
FROM Stocks
GROUP BY
    stock_name,
    operation
)

SELECT
    stock_name,
    SUM(
        CASE
            WHEN operation = "Buy" THEN -total
            ELSE total
        END) AS capital_gain_loss
FROM base
GROUP BY 
    stock_name