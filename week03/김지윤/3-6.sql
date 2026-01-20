# CASE WHEN을 이용한 조건 처리
# OUT_DATE가 NULL일 경우 출고 미정
# OUT_DATE가 2022-05-01보다 이전일 경우 출고 완료
# 이후일 경우 출고 대기
SELECT
    ORDER_ID,
    PRODUCT_ID,
    DATE_FORMAT(OUT_DATE, '%Y-%m-%d') AS OUT_DATE,
    CASE 
        WHEN OUT_DATE IS NULL THEN '출고미정'
        WHEN OUT_DATE <= '2022-05-01' THEN '출고완료'
        ELSE '출고대기'
    END AS 출고여부
FROM
    FOOD_ORDER 
ORDER BY
    ORDER_ID