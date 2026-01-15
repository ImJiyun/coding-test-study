# Write your MySQL query statement below
WITH base AS (
    SELECT
        *,
        ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS rn
    FROM
        Products 
    WHERE
        change_date <= '2019-08-16'
)

SELECT
    t.product_id,
    IF(b.new_price IS NULL, 10, b.new_price) AS price
FROM
    (
        SELECT
            DISTINCT product_id
        FROM
            Products 
    ) AS t
LEFT JOIN
    base AS b
ON 
    t.product_id = b.product_id 
    AND
    b.rn = 1