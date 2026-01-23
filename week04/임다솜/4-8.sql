-- https://school.programmers.co.kr/learn/courses/30/lessons/301649

WITH base AS (
    SELECT
        ID,
        RANK() OVER (ORDER BY SIZE_OF_COLONY DESC) AS rk,
        COUNT(*) OVER () AS total
    FROM ECOLI_DATA
)

SELECT
    ID,
    CASE
        WHEN rk / total * 100 > 75 THEN "LOW"
        WHEN rk / total * 100 > 50 THEN "MEDIUM"
        WHEN rk / total * 100 > 25 THEN "HIGH"
        ELSE "CRITICAL"
    END AS COLONY_NAME
FROM ECOLI_DATA
LEFT JOIN base
USING (ID)