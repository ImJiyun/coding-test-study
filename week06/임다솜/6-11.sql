# https://school.programmers.co.kr/learn/courses/30/lessons/77487

WITH base AS (
SELECT
    COUNT(DISTINCT ID) AS cnt,
    HOST_ID
FROM PLACES
GROUP BY HOST_ID
HAVING cnt >= 2
)

SELECT
    p.ID,
    p.NAME,
    p.HOST_ID
FROM PLACES AS p
INNER JOIN base AS b
USING (HOST_ID)
ORDER BY
    p.ID

