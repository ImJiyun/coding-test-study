-- 컬럼 : ORDER_ID, PRODUCT_ID, OUT_DATE, 출고여부
--      조건(출고여부) : 출고완료<='2022-05-01'/ 출고미정 / 출고대기>'2022-05-01'
-- 테이블 : FOOD_ORDER
-- 정렬 : ORDER_ID 오름차순
SELECT
    ORDER_ID,
    PRODUCT_ID,
    DATE_FORMAT(OUT_DATE,'%Y-%m-%d') AS OUT_DATE,
    CASE 
        WHEN OUT_DATE IS NULL THEN "출고미정"
        WHEN OUT_DATE<='2022-05-01' THEN "출고완료"
        ELSE "출고대기"
    END AS 출고여부
FROM FOOD_ORDER
ORDER BY ORDER_ID ASC