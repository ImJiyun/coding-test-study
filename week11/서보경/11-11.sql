WITH RECURSIVE base AS (
    SELECT 0 AS hour
    UNION ALL
    SELECT hour + 1
    FROM base
    WHERE hour < 23
)

SELECT
    b.hour AS HOUR,
    COUNT(ao.ANIMAL_ID) AS COUNT
FROM base AS b
LEFT JOIN ANIMAL_OUTS AS ao
ON b.hour = HOUR(ao.DATETIME)
GROUP BY b.hour
ORDER BY b.hour;