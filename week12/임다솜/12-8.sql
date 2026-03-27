-- https://leetcode.com/problems/find-product-recommendation-pairs/submissions/1960443219/

WITH pair AS (
    SELECT
    p.product_id AS product1_id,
    i.product_id AS product2_id,
    p.category AS product1_category,
    i.category AS product2_category
FROM ProductInfo AS p
JOIN ProductInfo AS i
    ON p.product_id < i.product_id
)

SELECT
    product1_id,
    product2_id,
    product1_category,
    product2_category,
    COUNT(DISTINCT a.user_id) AS customer_count
FROM pair AS p
JOIN ProductPurchases AS a
ON p.product1_id = a.product_id
JOIN ProductPurchases AS b
ON a.user_id = b.user_id AND p.product2_id = b.product_id
GROUP BY 
    product1_id,
    product2_id,
    product1_category,
    product2_category
HAVING
    customer_count >= 3
ORDER BY
    customer_count DESC,
    product1_id,
    product2_id