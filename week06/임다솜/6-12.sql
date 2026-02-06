-- https://school.programmers.co.kr/learn/courses/30/lessons/299305



WITH base AS (SELECT
    COUNT(DISTINCT ID) AS cnt_child,
    PARENT_ID AS id_
FROM ECOLI_DATA
GROUP BY PARENT_ID
)

SELECT
    e.ID,
    IFNULL(b.cnt_child,0) AS CHILD_COUNT
FROM ECOLI_DATA AS e
LEFT JOIN base AS b
ON e.ID = b.id_

