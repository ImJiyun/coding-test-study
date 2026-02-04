-- ## **3. 베스트셀러 제품 TOP 5 조회**
-- - 판매 수량 기준으로 인기 있는 상위 5개 제품을 조회할 수 있는 쿼리를 작성해주세요

SELECT
  p.product_id,
  p.product_name,
  SUM(quantity) AS total_quan
FROM ecommerce_advanced.products AS p
LEFT JOIN ecommerce_advanced.order_items AS oi
ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quan DESC
LIMIT 5;