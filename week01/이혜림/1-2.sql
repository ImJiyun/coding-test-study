--컬럼 : CAR_ID, AVAILABILITY
--테이블 : CAR_RENTAL_COMPANY_RENTAL_HISTORY
--조건 : START_DATE <= '2022-10-16' AND END_DATE >= '2022-10-16'
--정렬 : CAR_ID 내림차순
SELECT
    CAR_ID,
    CASE
        WHEN MAX(
            CASE
                WHEN START_DATE <= '2022-10-16'
                 AND END_DATE   >= '2022-10-16'
                THEN 1
                ELSE 0
            END
        ) = 1
        THEN '대여중'
        ELSE '대여 가능'
    END AS AVAILABILITY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY
    CAR_ID
ORDER BY CAR_ID DESC