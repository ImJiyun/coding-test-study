-- 문제 : 각 제품별 첫 해에 발생한 모든 판매항목, 가격
-- 컬럼 : product_id, first_year, quantity, price
-- 테이블 : sales
WITH base AS(
    SELECT
        *,
        FIRST_VALUE(year) OVER(PARTITION BY product_id) AS first_year
    FROM sales
)
SELECT 
    product_id, 
    first_year, 
    quantity, 
    price
FROM base
WHERE year=first_year
GROUP BY
    product_id, 
    first_year, 
    quantity, 
    price
    