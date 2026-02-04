-- 문제) 카테고리별 제품 판매량 및 매출액 분석
-- 각 카테고리별 판매된 제품의 총 수량과 총 매출액을 확인할 수 있는 쿼리를 작성해주세요

-- 컬럼 : 카테고리(category_id) 총 수량(c_cnt) 총 매출액(c_total)
-- 조건 : 매출액 계산) 개당 가격 * 수량 - 할인가격
-- 테이블 : order_items, orders, products
-- key : order_id, product_id
-- 그룹 : category_id
-- 정렬 : category_id

SELECT
  category_id,
  SUM(quantity) AS c_cnt,
  SUM(quantity*price_per_unit - discount) AS c_total
FROM ecommerce_advanced.order_items
LEFT JOIN ecommerce_advanced.orders
USING(order_id)
LEFT JOIN ecommerce_advanced.products
USING(product_id)
GROUP BY
    category_id
ORDER BY
    category_id