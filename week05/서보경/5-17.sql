-- ## **6. 사용자별 구매한 제품의 카테고리 분포 분석**
-- - 각 사용자가 구매한 제품의 카테고리 분포와 카테고리별 지출 금액을 확인할 수 있는 쿼리를 작성해주세요

SELECT
  category_name,
  COUNT(DISTINCT o.order_id) AS order_cnt,
  SUM(quantity) AS total_quan,
  SUM(quantity * price_per_unit) AS total_amount  
FROM ecommerce_advanced.users AS u
LEFT JOIN ecommerce_advanced.orders AS o
ON u.user_id = o.user_id
LEFT JOIN ecommerce_advanced.order_items AS oi
ON o.order_id = oi.order_id
LEFT JOIN ecommerce_advanced.products AS p
ON oi.product_id = p.product_id
LEFT JOIN ecommerce_advanced.categories AS c
ON p.category_id = c.category_id
GROUP BY
  category_name
ORDER BY
  total_amount DESC;