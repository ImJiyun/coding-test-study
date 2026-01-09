WITH BASE AS (
    SELECT
        product_id,
        min(year) as first_year
    FROM SALES
    GROUP BY
        product_id
)

SELECT
    product_id,
    first_year,
    quantity,
    price
FROM SALES AS S
LEFT JOIN BASE B
USING (product_id)
WHERE year=first_year