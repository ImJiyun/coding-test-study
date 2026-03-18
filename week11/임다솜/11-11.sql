-- https://school.programmers.co.kr/learn/courses/30/lessons/59413

WITH hour_list AS (
SELECT
    (b.n * 10) + a.n AS hour
FROM (
    SELECT 0 AS n UNION ALL SELECT 1 AS n UNION ALL SELECT 2 AS n UNION ALL SELECT 3 AS n UNION ALL SELECT 4 AS n UNION ALL SELECT 5 AS n UNION ALL SELECT 6 AS n UNION ALL SELECT 7 AS n UNION ALL SELECT 8 AS n UNION ALL SELECT 9 AS n 
) AS a
CROSS JOIN (
    SELECT 0 AS n UNION ALL SELECT 1 AS n UNION ALL SELECT 2
) AS b
WHERE
    (b.n * 10) + a.n < 24
), base AS (
SELECT
    HOUR(datetime) AS hour,
    COUNT(DISTINCT animal_id) AS count
FROM animal_outs
GROUP BY
    hour
)
    
SELECT
    h.hour,
    IFNULL(count, 0) AS count
FROM hour_list AS h
LEFT JOIN base AS b
USING (hour)
GROUP BY
    h.hour
ORDER BY
    h.hour