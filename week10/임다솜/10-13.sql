-- https://leetcode.com/problems/seasonal-sales-analysis/



WITH base AS (
SELECT 
    CASE
        WHEN MONTH(sale_date) IN (12, 1, 2) THEN 'Winter'
        WHEN MONTH(sale_date) IN (3,4,5) THEN 'Spring'
        WHEN MONTH(sale_date) IN (6,7,8) THEN 'Summer'
        ELSE 'Fall'
    END AS season,
    category,
    SUM(quantity) AS total_quantity,
    SUM(price * quantity) AS total_revenue
FROM sales AS s
LEFT JOIN products AS p
USING (product_id)
GROUP BY
    season,
    category
), b2 AS (
SELECT
    season,
    category,
    ROW_NUMBER() OVER (PARTITION BY season ORDER BY total_quantity DESC, total_revenue DESC, category ASC) AS rn,
    total_quantity,
    total_revenue
FROM base
)

SELECT
    season,
    category,
    total_quantity,
    total_revenue
FROM b2
WHERE rn = 1

