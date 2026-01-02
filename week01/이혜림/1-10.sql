-- 컬럼 : 분류, 가격, 이름
-- 테이블 : FOOD_PRODUCT
-- 조건 : 
-- 그룹 : 식품분류(CATEGORY) -> '과자', '국', '김치', '식용유'
-- 정렬 : 식품 가격 내림차순
SELECT
    CATEGORY,
    MAX(PRICE) OVER (PARTITION BY CATEGORY) AS MAX_PRICE,
    PRODUCT_NAME
FROM FOOD_PRODUCT
WHERE CATEGORY IN ('과자', '국', '김치', '식용유')
GROUP BY CATEGORY
ORDER BY PRICE DESC

-- # SELECT
-- #     CATEGORY,
-- #     MAX(PRICE) AS MAX_PRICE,
-- #     PRODUCT_NAME
-- # FROM (
-- #     SELECT
-- #         CATEGORY
-- #     FROM FOOD_PRODUCT
-- #     WHERE CATEGORY IN ('과자', '국', '김치', '식용유')
-- # )
-- # GROUP BY CATEGORY
-- # ORDER BY PRICE DESC