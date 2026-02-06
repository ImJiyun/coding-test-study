# https://school.programmers.co.kr/learn/courses/30/lessons/131534

WITH t_user AS (
    SELECT
    COUNT(DISTINCT user_id) AS total_user
FROM user_info
WHERE 
    YEAR(joined) = "2021"
), t_user_id AS (
    SELECT
    user_id
FROM user_info
WHERE 
    YEAR(joined) = "2021"
), t_date AS (
SELECT
    COUNT(DISTINCT o.user_id) AS cnt_buy_user,
    DATE_FORMAT(sales_date, "%Y-%m-01") AS date
FROM ONLINE_SALE AS o
INNER JOIN t_user_id AS u
ON o.user_id = u.user_id
GROUP BY
    DATE_FORMAT(sales_date, "%Y-%m-01")
)

SELECT
    YEAR(t.date) AS year,
    MONTH(t.date) AS month,
    t.cnt_buy_user AS purchased_users,
    ROUND(t.cnt_buy_user / u.total_user, 1) AS purchased_ratio
FROM t_date AS t, t_user AS u
ORDER BY
    year,
    month