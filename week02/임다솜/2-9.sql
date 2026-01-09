-- https://leetcode.com/problems/product-sales-analysis-iii/

WITH rk AS (
SELECT
    sale_id,
    product_id,
    year,
    quantity,
    price,
    RANK() OVER (PARTITION BY product_id ORDER BY year ASC) AS rk_year
FROM Sales
)

SELECT
    product_id,
    year AS first_year,
    quantity,
    price
FROM rk
WHERE
    rk_year = 1