-- 문제 : 고객 테이블에서 모든 제품을 구매한 고객 ID를 보고하는 솔루션을 작성하세요
-- 컬럼 : customer_id
-- 조건 : 모든 제품을 구매한 고객
-- 각 고객이 구매한 서로 다른 상품 개수(여러번 구매 중복 제거) = 전체 상품 개수
SELECT 
    customer_id
FROM Customer
GROUP BY
    customer_id
HAVING 
    COUNT(DISTINCT product_key) = (
        SELECT 
            COUNT(*) 
        FROM Product
)