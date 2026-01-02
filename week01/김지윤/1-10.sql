-- 코드를 입력하세요
# WITH구문 : DENSE_RANK로 카테고리별 가격 순위 구하기
# 그 후 WHERE절로 카테고리별 최고가 구하기 (food_rank = 1)
# 카테고리가 과자, 국, 김치, 식용유인 것만 구하기 (IN)
# MAX_PRICE로 내림차순 정렬
WITH food_rank_table AS (
    SELECT 
        CATEGORY,
        PRODUCT_NAME,
        PRICE,
        DENSE_RANK() OVER (PARTITION BY CATEGORY ORDER BY PRICE DESC) AS food_rank
    FROM 
        FOOD_PRODUCT
)

SELECT 
    CATEGORY,
    PRICE AS MAX_PRICE,
    PRODUCT_NAME
FROM
    food_rank_table
WHERE
    food_rank = 1
    AND
    CATEGORY IN ('과자', '국', '김치', '식용유')
ORDER BY
    MAX_PRICE DESC