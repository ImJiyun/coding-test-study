-- https://leetcode.com/problems/seasonal-sales-analysis/

# Write your MySQL query statement below
WITH base AS (
SELECT 
    product_id,
    CASE
        WHEN MONTH(sale_date) = 12 OR MONTH(sale_date) = 1 OR MONTH(sale_date) = 2 THEN 'Winter'
        WHEN MONTH(sale_date) = 3 OR MONTH(sale_date) = 4 OR MONTH(sale_date) = 5 THEN 'Spring'
        WHEN MONTH(sale_date) = 6 OR MONTH(sale_date) = 7 OR MONTH(sale_date) = 8 THEN 'Summer'
        ELSE 'Fall'
    END AS season,
    quantity,
    price
FROM sales
), b2 AS (
SELECT
    season,
    category,
    SUM(quantity) AS total_quantity,
    SUM(quantity * price) AS total_revenue,
    ROW_NUMBER() OVER (PARTITION BY season, category) AS rn
FROM base AS b
LEFT JOIN products AS p
USING (product_id)
GROUP BY
    season,
    category
ORDER BY
    season,
    category,
    total_revenue
)

SELECT
    season,
    category,
    total_quantity,
    total_revenue
FROM b2
WHERE rn = 1
