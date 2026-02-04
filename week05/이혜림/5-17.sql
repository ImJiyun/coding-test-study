-- 문제) 사용자별 구매한 제품의 카테고리 분포 분석
-- 각 사용자가 구매한 제품의 카테고리 분포와 카테고리별 지출 금액을 확인할 수 있는 쿼리를 작성해주세요

-- 컬럼 : 사용자(user_id), 카테고리(category_id), 분포=주문횟수(uc_cnt), 지출금액(uc_total)
-- 테이블 : orders, order_items, products
-- key : order_id, product_id
-- 그룹 : user_id, category_id
-- 정렬 : user_id, category_id

SELECT
  user_id,
  category_id,
  COUNT(*) AS uc_cnt,
  SUM(total_amount) AS uc_total
FROM ecommerce_advanced.orders
LEFT JOIN ecommerce_advanced.order_items
USING(order_id)
LEFT JOIN ecommerce_advanced.products
USING(product_id)
GROUP BY
  user_id, 
  category_id
ORDER BY
  user_id,
  category_id