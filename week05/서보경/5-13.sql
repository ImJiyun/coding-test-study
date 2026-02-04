-- ## **2. 카테고리별 제품 판매량 및 매출액 분석**
-- - 각 카테고리별 판매된 제품의 총 수량과 총 매출액을 확인할 수 있는 쿼리를 작성해주세요
SELECT
  c.category_id,
  c.category_name,
  COALESCE(SUM(oi.quantity), 0) AS total_quan,
  COALESCE(SUM(oi.quantity * oi.price_per_unit), 0) AS revenue
FROM ecommerce_advanced.categories AS c
LEFT JOIN ecommerce_advanced.products AS p
ON c.category_id = p.category_id
LEFT JOIN ecommerce_advanced.order_items AS oi
ON p.product_id = oi.product_id
GROUP BY c.category_id, c.category_name
ORDER BY revenue ASC;