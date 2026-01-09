WITH base AS (
    SELECT
        *,
        MIN(year) OVER (PARTITION BY product_id) AS first_year
    FROM Sales
)
SELECT
    product_id,
    first_year,
    quantity,
    price
FROM base
GROUP BY product_id;