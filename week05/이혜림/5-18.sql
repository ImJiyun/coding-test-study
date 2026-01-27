-- 문제) 각 도시별 인기 제품 TOP 3 조회
-- 도시별로 가장 많이 판매된 상위 3개 제품을 조회할 수 있는 쿼리를 작성해주세요

-- 컬럼 : 도시(city), 제품(product_id), 판매수(cnt)
-- 테이블 : orders, order_items, users
-- key : order_id, user_id
-- 그룹 : city, product_id

SELECT
  city,
  product_id,
  cp_cnt,
  rk
FROM(
  SELECT DISTINCT
    city,
    product_id,
    SUM(quantity) AS cp_cnt,
    DENSE_RANK() OVER (PARTITION BY city ORDER BY SUM(quantity) DESC) AS rk
  FROM ecommerce_advanced.orders
  LEFT JOIN ecommerce_advanced.order_items
  USING(order_id)
  LEFT JOIN ecommerce_advanced.users
  USING(user_id)
  GROUP BY
    city,
    product_id
)
WHERE rk <= 3