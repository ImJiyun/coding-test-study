-- ## **5. 고객 세그먼트별 구매 패턴 분석**
-- - 회원 유형(일반/프리미엄)별 평균 주문 금액과 주문 빈도를 확인하는 쿼리를 작성해주세요

SELECT
  user_type,
  ROUND(SAFE_DIVIDE(SUM(total_amount), COUNT(order_id)), 2) AS avg_amount,
  ROUND(SAFE_DIVIDE(COUNT(order_id), COUNT(DISTINCT o.user_id)), 2) AS order_freq
FROM ecommerce_advanced.orders AS o
LEFT JOIN ecommerce_advanced.users AS u
ON o.user_id = u.user_id
GROUP BY user_type