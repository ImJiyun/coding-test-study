-- 코드를 입력하세요
# 2022년 10월 16일에 대여 중인 자동차
# 대여 가능하려면 2022년 10월 16일에 사용하지 않아야 함.

# 대여 중인 자동차 : START_DATE <= '2022-10-16', END_DATE >= '2022-10-16' (2022년 10월 16일 포함)
WITH using_cars AS (
    SELECT
        CAR_ID
    FROM 
        CAR_RENTAL_COMPANY_RENTAL_HISTORY 
    WHERE
        START_DATE <= '2022-10-16' AND END_DATE >= '2022-10-16'
)

SELECT
    DISTINCT t1.CAR_ID,
    IF(t2.CAR_ID IS NULL, '대여 가능', '대여중') AS AVAILABILITY
FROM
    CAR_RENTAL_COMPANY_RENTAL_HISTORY AS t1
    LEFT JOIN
        using_cars AS t2
        ON t1.CAR_ID = t2.CAR_ID
ORDER BY
    t1.CAR_ID DESC
    