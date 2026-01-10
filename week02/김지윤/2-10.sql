-- 코드를 입력하세요   
WITH time_diff_table AS (
    SELECT
        t2.HISTORY_ID,
        t1.CAR_TYPE,
        t1.DAILY_FEE,
        DATEDIFF(t2.END_DATE, t2.START_DATE) + 1 AS days
    FROM
        CAR_RENTAL_COMPANY_CAR AS t1
    JOIN
        CAR_RENTAL_COMPANY_RENTAL_HISTORY AS t2
        ON t1.CAR_ID = t2.CAR_ID
    WHERE
        t1.CAR_TYPE = '트럭'
), discount_table AS (
    SELECT
        CAR_TYPE,
        DISCOUNT_RATE,
        CASE
            WHEN DURATION_TYPE = '7일 이상'  THEN 7
            WHEN DURATION_TYPE = '30일 이상' THEN 30
            WHEN DURATION_TYPE = '90일 이상' THEN 90
        END AS min_days
    FROM
        CAR_RENTAL_COMPANY_DISCOUNT_PLAN
    WHERE
        CAR_TYPE = '트럭'
)

SELECT
    td.HISTORY_ID,
    ROUND(
        td.days * td.DAILY_FEE * (100 - IFNULL(MAX(dt.DISCOUNT_RATE), 0)) / 100
    ) AS FEE
FROM
    time_diff_table AS td
LEFT JOIN
    discount_table AS dt
ON
    td.CAR_TYPE = dt.CAR_TYPE
    AND td.days >= dt.min_days       
GROUP BY
    td.HISTORY_ID,
    td.days,
    td.DAILY_FEE
ORDER BY
    FEE DESC,
    td.HISTORY_ID DESC
