-- https://school.programmers.co.kr/learn/courses/30/lessons/157340

WITH base AS (
SELECT
    CAR_ID,
    START_DATE,
    END_DATE,
    IF((START_DATE <= "2022-10-16") AND (END_DATE >= "2022-10-16"), '대여중', '대여 가능') AS avail
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
)

SELECT
    CAR_ID,
    IF(SUM(avail = '대여중') > 0, '대여중', '대여 가능') AS AVAILABILITY
FROM base
GROUP BY
    CAR_ID
ORDER BY
    CAR_ID DESC