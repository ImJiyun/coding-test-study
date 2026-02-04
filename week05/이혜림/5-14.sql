-- 문제) 베스트셀러 제품 TOP 5 조회
-- 판매 수량 기준으로 인기 있는 상위 5개 제품을 조회할 수 있는 쿼리를 작성해주세요

-- 컬럼 : 제품(product_id), 판매수량(p_cnt)
-- 테이블 : orders, order_items, 
-- using key : order_id
-- 그룹 : product_id
-- 정렬 : p_cnt DESC LIMIT 5

SELECT
  product_id,
  SUM(quantity) AS p_cnt
FROM ecommerce_advanced.orders
LEFT JOIN ecommerce_advanced.order_items
USING(order_id)
GROUP BY 
  product_id
ORDER BY
  p_cnt DESC 
LIMIT 5