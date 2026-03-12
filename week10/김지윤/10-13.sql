# Write your MySQL query statement below
WITH seasons AS (
    SELECT
        *,
        CASE 
            WHEN MONTH(sale_date) IN (12, 1, 2) THEN 'Winter'
            WHEN MONTH(sale_date) IN (3, 4, 5) THEN 'Spring'
            WHEN MONTH(sale_date) IN (6, 7, 8) THEN 'Summer'
            ELSE 'Fall'
        END AS season
    FROM
        sales
), revenues AS (
    SELECT
        s.season,
        p.category,
        SUM(s.quantity) AS total_quantity,
        SUM(s.quantity * s.price) AS total_revenue
    FROM
        seasons AS s
    LEFT JOIN
        products AS p
    ON
        s.product_id = p.product_id
    GROUP BY
        s.season,
        p.category
)

SELECT
    season,
    category,
    total_quantity,
    total_revenue
FROM (
    SELECT
        *,
        ROW_NUMBER() OVER (PARTITION BY season ORDER BY total_quantity DESC, total_revenue DESC, category ASC) AS rn
    FROM
        revenues
) AS t
WHERE
    rn = 1
ORDER BY
    season