WITH BASE AS (
    SELECT
        NUM,
        COUNT(ID) AS CNT
    FROM LOGS
    GROUP BY
        NUM
    ORDER BY 
        NUM
)
SELECT
    NUM AS ConsecutiveNums
FROM BASE
WHERE 
    CNT > 3