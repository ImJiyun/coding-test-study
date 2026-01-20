-- ¿À´ä

WITH BASE AS (
    SELECT
        player_id,
        event_date,
        LAG(event_date) OVER (PARTITION BY player_id order by player_id) AS lag_date
    FROM Activity
    
), BASE2 AS (
    SELECT
        COUNT(DISTINCT player_id) AS cnt
    FROM Activity
    
)
SELECT
    ROUND(cnt2 * 1.0 / cnt * 1.0, 2) AS fraction
FROM (
    SELECT
        player_id,
        cnt,
        COUNT(player_id) OVER () AS cnt2
    FROM BASE AS B
    CROSS JOIN BASE2 AS B2
    WHERE 
        event_date -1 = lag_date
)