SELECT
    ROUND(COUNT(player_id)/3, 2) AS fraction
FROM Activity
WHERE
