-- 문제) 사용자별 총 주문 금액 계산
-- 각 사용자의 총 주문 횟수와 총 지출 금액을 확인할 수 있는 쿼리를 작성해주세요

-- 컬럼 : user_id, 총 주문 횟수(u_cnt), 총 지출 금액(u_total)
-- 테이블 : orders
-- 그룹 : user_id
-- 정렬 : user_id

SELECT
  user_id,
  COUNT(*) AS u_cnt,
  SUM(total_amount) AS u_total
FROM ecommerce_advanced.orders
GROUP BY
    user_id
ORDER BY
    user_id