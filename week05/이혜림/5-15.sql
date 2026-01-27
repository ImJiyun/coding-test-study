-- 문제) 특정 기간 동안의 매출 추이 분석
-- 월별 총 매출액과 주문 건수를 조회할 수 있는 쿼리를 작성해주세요

-- 컬럼 : 월(month), 총 매출액(m_total) 주문 건수(m_cnt)
-- 테이블 : orders
-- 그룹 : month
-- 정렬 : month

SELECT
  FORMAT_DATE('%Y-%m', order_date) AS month,
  SUM(total_amount) AS m_total,
  COUNT(order_id) AS m_cnt
FROM ecommerce_advanced.orders
GROUP BY
  month
ORDER BY 
  month