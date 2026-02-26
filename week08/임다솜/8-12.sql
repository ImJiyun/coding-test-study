-- https://leetcode.com/problems/last-person-to-fit-in-the-bus/

SELECT
person_name
FROM (
SELECT
person_id,
person_name,
weight,
turn,
SUM(weight) OVER (ORDER BY turn ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS total_weight
FROM Queue
) AS b
WHERE
    total_weight <= 1000
ORDER BY
    turn DESC
LIMIT 1
