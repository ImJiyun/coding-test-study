-- https://school.programmers.co.kr/learn/courses/30/lessons/151141

WITH d AS (SELECT
    h.HISTORY_ID,
    h.CAR_ID,
    (h.END_DATE - h.START_DATE + 1) AS duration,
    # h.START_DATE,
    # h.END_DATE,
    c.CAR_TYPE,
    c.DAILY_FEE
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY AS h
LEFT JOIN CAR_RENTAL_COMPANY_CAR AS c
ON h.CAR_ID = c.CAR_ID
WHERE
    c.CAR_TYPE = '트럭'
)

SELECT 
    d.HISTORY_ID,
    ROUND(IF(DISCOUNT_RATE IS NULL, (d.duration * d.DAILY_FEE), (d.duration * d.DAILY_FEE) * ((100 - p.DISCOUNT_RATE) / 100))) AS FEE
    # d.CAR_ID,
    # d.duration,
    # d.CAR_TYPE,
    # d.DAILY_FEE,
    # p.DISCOUNT_RATE
FROM d
LEFT JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN AS p
ON d.CAR_TYPE = p.CAR_TYPE
AND (
    (d.duration >= 90 AND p.DURATION_TYPE = '90일 이상') OR
    (d.duration >= 30 AND d.duration < 90 AND p.DURATION_TYPE = '30일 이상') OR
    (d.duration >= 7 AND d.duration < 30 AND p.DURATION_TYPE = '7일 이상')
)
ORDER BY
    FEE DESC,
    d.HISTORY_ID DESC