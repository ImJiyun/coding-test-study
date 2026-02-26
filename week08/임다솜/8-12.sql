# https://school.programmers.co.kr/learn/courses/30/lessons/157339

-- 코드를 입력하세요
# 자동차 종류가 '세단' 또는 'SUV' 
# 2022년 11월 1일부터 2022년 11월 30일까지 대여 가능
# 30일간의 대여 금액이 50만원 이상 200만원 미만인 자동차
# 자동차 ID, 자동차 종류, 대여 금액 (car: daily_fee, history: start-end_date, discount: discount_rate)

# 세단, suv
WITH car_list AS (
SELECT
    car_id,
    car_type,
    daily_fee
FROM CAR_RENTAL_COMPANY_CAR
WHERE 
    car_type IN ('세단', 'SUV')
), car_rented AS (
# 2022-11-01 ~ 2022-11-30 사이 대여기록이 있는 차
SELECT
    car_id,
    start_date,
    end_date
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE 
    end_date >= '2022-11-01' AND start_date <= '2022-11-30'
), car_discount AS (
SELECT
    car_type,
    discount_rate
FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
WHERE
    DURATION_TYPE = '30일 이상'
)

SELECT
    c.car_id,
    c.car_type,
    ROUND((c.daily_fee * 30) * (100 - d.discount_rate) / 100, 0) AS fee
FROM car_list AS c
LEFT JOIN car_discount AS d
ON c.car_type = d.car_type
HAVING
    c.car_id NOT IN (SELECT car_id FROM car_rented)
    AND
    (fee >= 500000 AND fee <= 2000000)
ORDER BY
    fee DESC,
    car_type,
    car_id DESC

    
