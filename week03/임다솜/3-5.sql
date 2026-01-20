-- https://leetcode.com/problems/product-price-at-a-given-date/submissions/1885707337/

WITH b AS (SELECT 
    product_id,
    MAX(change_date) AS change_date
FROM Products
WHERE
    change_date <= '2019-08-16'
GROUP BY
    product_id
)

SELECT
    p.product_id,
    MAX(CASE
        WHEN b.change_date < p.change_date THEN 10
        WHEN b.change_date = p.change_date THEN p.new_price
        WHEN b.change_date IS NULL THEN 10
        END
    ) AS price
FROM Products AS p
LEFT JOIN b AS b
ON p.product_id = b.product_id
GROUP BY
    p.product_id
