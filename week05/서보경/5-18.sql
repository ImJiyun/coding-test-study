-- ## **7. 각 도시별 인기 제품 TOP 3 조회**
-- - 도시별로 가장 많이 판매된 상위 3개 제품을 조회할 수 있는 쿼리를 작성해주세요

SELECT 
    city,
    product_name,
    total_quantity
FROM (
    SELECT
      u.city,
      p.product_name,
      SUM(oi.quantity) AS total_quantity,
      RANK() OVER (PARTITION BY u.city ORDER BY SUM(oi.quantity) DESC) AS rnk
    FROM ecommerce_advanced.orders AS o
    LEFT JOIN ecommerce_advanced.users AS u 
    ON o.user_id = u.user_id
    LEFT JOIN ecommerce_advanced.order_items AS oi 
    ON o.order_id = oi.order_id
    LEFT JOIN ecommerce_advanced.products AS p 
    ON oi.product_id = p.product_id
    GROUP BY u.city, p.product_name
) AS base
WHERE rnk <= 3
ORDER BY city, rnk;