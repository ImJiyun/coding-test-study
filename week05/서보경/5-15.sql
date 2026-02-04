-- ## **4. 특정 기간 동안의 매출 추이 분석
-- - 월별 총 매출액과 주문 건수를 조회할 수 있는 쿼리를 작성해주세요

SELECT
  FORMAT_DATE('%y-%m', order_date) AS month,
  COUNT(DISTINCT order_id) AS order_cnt,
  SUM(total_amount) AS total_revenue
FROM ecommerce_advanced.orders
GROUP BY month
ORDER BY month ASC;
