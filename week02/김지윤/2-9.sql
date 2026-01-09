-- Write your PostgreSQL query statement below
-- 첫 시도 
-- WITH rn_table AS (
--     SELECT
--         *,
--         ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY year) AS rn
--     FROM
--         Sales 
-- )

-- SELECT
--     product_id,
--     year AS first_year,
--     quantity,
--     price
-- FROM
--     rn_table
-- WHERE
--     rn = 1


-- 두 번째 시도
-- 처음 문제를 풀 때 놓친 조건: A product may have multiple sales entries in the same year.
-- Note that the per-unit price.
-- 따라서 GROUP BY를 사용하여 price를 더해줘야 함
-- ROW_NUMBER()를 사용해서 풀었더니 오답
-- RANK()를 사용하여 풀었더니 정답
WITH rn_table AS (
    SELECT
        *,
        RANK() OVER (PARTITION BY product_id ORDER BY year) AS rn
    FROM (
        SELECT
            product_id,
            year,
            SUM(quantity) AS quantity,
            price 
        FROM
            Sales
    GROUP BY
        product_id,
        year,
        price 
    ) 
)

SELECT
    product_id,
    year AS first_year,
    quantity,
    price
FROM
    rn_table
WHERE
    rn = 1