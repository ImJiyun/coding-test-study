-- https://school.programmers.co.kr/learn/courses/30/lessons/293261

WITH b AS (
SELECT
    f.ID,
    f.FISH_TYPE,
    n.FISH_NAME,
    f.LENGTH,
    RANK() OVER (PARTITION BY f.FISH_TYPE ORDER BY f.LENGTH DESC) AS rk
FROM FISH_INFO AS f
JOIN FISH_NAME_INFO AS n
ON f.FISH_TYPE = n.FISH_TYPE
)

SELECT
    ID,
    FISH_NAME,
    LENGTH
FROM b
WHERE rk = 1
ORDER BY
    ID