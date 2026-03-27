# Write your MySQL query statement below
WITH base AS (
    SELECT
        p1.user_id,
        p1.product_id AS product1_id,
        p2.product_id AS product2_id
    FROM
        ProductPurchases AS p1
    JOIN
        ProductPurchases AS p2
    ON
        p1.user_id = p2.user_id
    WHERE
        p1.product_id < p2.product_id
)


SELECT
    b.product1_id,
    b.product2_id,
    (SELECT category FROM ProductInfo WHERE product_id = product1_id) AS product1_category,
    (SELECT category FROM ProductInfo WHERE product_id = product2_id) AS product2_category,
    COUNT(b.user_id) AS customer_count
FROM
    base AS b
GROUP BY
    b.product1_id,
    b.product2_id
HAVING 
    customer_count >= 3
ORDER BY
    customer_count DESC,
    product1_id,
    product2_id