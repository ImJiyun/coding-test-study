-- https://leetcode.com/problems/exchange-seats/?envType=study-plan-v2&envId=top-sql-50

WITH base AS (SELECT
    id,
    student,
    CASE
        WHEN id % 2 = 1 THEN LEAD(student) OVER (ORDER BY id)
        ELSE LAG(student) OVER (ORDER BY id)
        END AS new
FROM Seat
ORDER BY
    id
)
SELECT
    id,
    IF(new IS NULL, student, new) AS student
FROM base