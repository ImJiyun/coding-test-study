### **1. 사용자별 총 주문 금액 계산**
-- - 각 사용자의 총 주문 횟수와 총 지출 금액을 확인할 수 있는 쿼리를 작성해주세요

SELECT
  user_id,
  SUM(total_amount) AS amount,
  COUNT(user_id) AS order_cnt
FROM ecommerce_advanced.orders
GROUP BY
  user_id
ORDER BY
  user_id ASC;