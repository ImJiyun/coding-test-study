-- 문제) 공급업체별 제품 판매 성과 분석
-- 각 공급업체의 제품 판매 성과(총 판매량, 총 매출액, 평균 평점)를 분석하세요.

-- 컬럼 : 공급업체(supplier_id), 총 판매량(order_cnt), 총 매출액(order_total), 평균 평점(avg_rate)
-- * 매출? 판매량*개당가격-할인금액
-- 테이블 : orders, order_items, suppliers, reviews
-- 그룹 : supplier_id
-- 정렬 : supplier_id