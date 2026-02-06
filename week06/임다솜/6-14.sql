# https://school.programmers.co.kr/learn/courses/30/lessons/62284
 
SELECT 
    CART_ID
FROM (
    SELECT
        CART_ID,
        NAME
    FROM CART_PRODUCTS
    GROUP BY
        CART_ID,
        NAME
    HAVING
        NAME IN ('Milk', 'Yogurt')
) AS base
GROUP BY 
    CART_ID
HAVING 
    COUNT(DISTINCT NAME) = 2
