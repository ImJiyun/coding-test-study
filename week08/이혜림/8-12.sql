-- 문제 : 자동차 종류가 '세단' 또는 'SUV' 인 자동차 중 2022년 11월 1일부터 2022년 11월 30일까지 대여 가능하고 30일간의 대여 금액이 50만원 이상 200만원 미만인 자동차에 대해서 자동차 ID, 자동차 종류, 대여 금액(컬럼명: FEE) 리스트를 출력
-- 조건
-- 1.자동차 종류가 '세단' 또는 'SUV'
-- 2.2022년 11월 1일부터 2022년 11월 30일까지 대여 가능
-- 3.대여 금액이 50만원 이상 200만원 미만
-- 정렬 : 대여금액 기준 내림차순, 자동차 종류 기준 오름차순, 자동차 ID 기준 내림차순

-- 1차 시도
-- SELECT 
--     CAR_ID,
--     CAR_TYPE,
--     ROUND(
--         CASE
--             WHEN 
--         END AS 
--     ) AS FEE
-- FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN P
-- JOIN (
--     SELECT
--         CAR_ID,
--         CAR_TYPE
--     FROM CAR_RENTAL_COMPANY_CAR C
--     WHERE CAR_TYPE IN ('세단','SUV')
-- ) C
-- ON P.CAR_ID = C.CAR_ID
-- JOIN (
--     SELECT DISTINCT
--         CAR_ID
--     FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY 
--     WHERE START_DATE <= '2022-11-01' AND END_DATE <= '2022-11-01'
-- ) H
-- ON P.CAR_ID = H.CAR_ID
-- GROUP BY CAR_ID
-- HAVING FEE BETWEEN 500000 AND 2000000
-- ORDER BY FEE DESC, CAR_TYPE ASC, CAR_ID DESC


-- 2차 시도
SELECT
    CAR_ID,
    CAR_TYPE,
    ROUND((DAILY_FEE * 30 * (1 - DISCOUNT_RATE/100)),0)AS FEE
FROM (
    SELECT
        *
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    JOIN(
        SELECT
            *
        FROM CAR_RENTAL_COMPANY_CAR 
        WHERE CAR_TYPE IN ('세단','SUV')
    ) C
    USING (CAR_ID)
    GROUP BY CAR_ID
    WHERE START_DATE <= '2022-11-30'
    AND END_DATE >= '2022-11-01'
) b
ORDER BY FEE DESC, CAR_TYPE ASC, CAR_ID DESC