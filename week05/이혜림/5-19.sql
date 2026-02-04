-- 문제) 제품별 평균 평점과 리뷰 수, 주문 수 조회
-- 각 제품의 평균 평점, 리뷰 수, 주문 수, 총 판매량을 조회하는 쿼리를 작성해주세요

-- 컬럼 : 제품(product_id), 평균 평점(avg_rate), 리뷰 수(rv_cnt), 주문 수(order_cnt), 총 판매량(total_cnt)
-- 테이블 : orders, order_items, reviews
-- key : order_id, product_id
-- 그룹 : product_id
-- 정렬 : product_id

SELECT DISTINCT
  product_id,
  ROUND(AVG(rating) OVER(PARTITION BY product_id),2) AS avg_rate,
  COUNT(review_id) OVER(PARTITION BY product_id) AS rv_cnt,
  COUNT(order_id) OVER(PARTITION BY product_id) AS order_cnt,
  SUM(quantity) OVER(PARTITION BY product_id) AS total_cnt
FROM ecommerce_advanced.orders
LEFT JOIN ecommerce_advanced.order_items
USING(order_id)
LEFT JOIN ecommerce_advanced.reviews
USING(product_id)
ORDER BY
  product_id