-- https://school.programmers.co.kr/learn/courses/30/lessons/157341

SELECT
    DISTINCT
    c.car_id AS CAR_ID
FROM CAR_RENTAL_COMPANY_CAR as c
LEFT JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY as h
ON c.CAR_ID = h.CAR_ID
WHERE c.CAR_TYPE = "세단" AND MONTH(h.start_date) = 10
ORDER BY
    CAR_ID DESC