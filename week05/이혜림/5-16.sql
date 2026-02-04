-- 문제) 고객 세그먼트별 구매 패턴 분석
-- 회원 유형(일반/프리미엄)별 평균 주문 금액과 주문 빈도를 확인하는 쿼리를 작성해주세요

-- 컬럼 : 회원 유형(user_type) 평균 주문 금액(avg_total) 주문 빈도=횟수?(cnt)
-- 테이블 : orders, users
-- using key : user_id
-- 그룹 : user_type
-- 정렬 : user_type

SELECT
  user_type,
  ROUND(AVG(total_amount),0) AS avg_total,
  COUNT(*) AS cnt
FROM ecommerce_advanced.orders
LEFT JOIN ecommerce_advanced.users
USING(user_id)
GROUP BY
  user_type
ORDER BY
  user_type