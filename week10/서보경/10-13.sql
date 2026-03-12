With season_ AS (
    SELECT
        p.category,
        CASE
            WHEN MONTH(s.sale_date) IN (3, 4, 5) THEN 'Spring'
            WHEN MONTH(s.sale_date) IN (6, 7, 8) THEN 'Summer'
            WHEN MONTH(s.sale_date) IN (9, 10, 11) THEN 'Fall'
            WHEN MONTH(s.sale_date) IN (12, 1, 2) THEN 'Winter'
        END AS season,
        SUM(s.quantity) AS total_quantity,
        SUM(s.quantity * s.price) AS total_revenue
    FROM sales AS s
    JOIN products AS p
    ON s.product_id = p.product_id
    GROUP BY season, p.category
),

ranking AS (
    SELECT 
        season,
        category,
        RANK() OVER (PARTITION BY season ORDER BY total_quantity DESC, total_revenue DESC, category ASC) AS rnk,
        total_quantity,
        total_revenue
    FROM season_
)

SELECT 
    season,
    category,
    total_quantity,
    total_revenue
FROM ranking
WHERE rnk = 1;