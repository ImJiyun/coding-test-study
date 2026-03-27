SELECT
    pp1.product_id AS product1_id,
    pp2.product_id As product2_id,
    pi1.category AS product1_category,
    pi2.category AS product2_category,
    COUNT(pp1.user_id) AS customer_count
FROM ProductPurchases AS pp1
LEFT JOIN ProductPurchases AS pp2
ON pp1.user_id = pp2.user_id
LEFT JOIN ProductInfo AS pi1
ON pp1.product_id = pi1.product_id
LEFT JOIN ProductInfo AS pi2
ON pp2.product_id = pi2.product_id
WHERE
    pp1.product_id < pp2.product_id
GROUP BY
    pp1.product_id, pp2.product_id, pi1.category, pi2.category
HAVING
    customer_count >= 3
ORDER BY customer_count DESC, product1_ID ASC, product2_id ASC;