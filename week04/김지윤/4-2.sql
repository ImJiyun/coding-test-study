# 한 유저의 로그인 횟수를 구하기 (login_cnt)
# LAG로 한 유저의 지난 로그인 날짜 구하기 (previous_date)
WITH add_previous_date AS (
    SELECT
        *,
        DENSE_RANK() OVER (PARTITION BY player_id ORDER BY event_date) AS login_cnt,
        LAG(event_date, 1) OVER (PARTITION BY player_id ORDER BY event_date) AS previous_date
    FROM
        Activity 
)

# 구해야 하는 것 : logged back in after the first day
# 조건 : login_cnt = 2 AND DATEDIFF(event_date, previous_date) = 1
# 해당 조건을 만족하는 player_id의 개수 세기 
SELECT
    ROUND(
        COUNT(
            DISTINCT CASE 
                WHEN login_cnt = 2 AND DATEDIFF(event_date, previous_date) = 1 THEN player_id 
        END) 
        / (SELECT COUNT(DISTINCT player_id) FROM Activity),
    2) AS fraction
FROM add_previous_date;