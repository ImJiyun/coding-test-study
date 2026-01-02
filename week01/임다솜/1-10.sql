-- https://school.programmers.co.kr/learn/courses/30/lessons/131116

WITH base AS (
SELECT
    CATEGORY,
    PRICE,
    PRODUCT_NAME,
    RANK() OVER(PARTITION BY CATEGORY ORDER BY PRICE DESC) AS rk
FROM FOOD_PRODUCT
)

SELECT
    base.CATEGORY,
    PRICE AS MAX_PRICE,
    PRODUCT_NAME
FROM base
WHERE
    rk = 1 AND CATEGORY IN ('과자', '국', '김치', '식용유')
ORDER BY
    MAX_PRICE DESC