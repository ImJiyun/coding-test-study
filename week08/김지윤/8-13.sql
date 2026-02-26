# Write your MySQL query statement below
WITH prefix_sum AS (
    SELECT
        *,
        SUM(weight) OVER (ORDER BY turn) AS sum_weight
    FROM 
        Queue
)

SELECT
    person_name 
FROM
    prefix_sum
WHERE
    sum_weight <= 1000
ORDER BY 
    sum_weight DESC
LIMIT 1