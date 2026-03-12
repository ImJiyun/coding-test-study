-- https://leetcode.com/problems/restaurant-growth/

WITH date AS (
    SELECT
        visited_on,
        SUM(amount) AS amount
    FROM Customer
    GROUP BY
        visited_on
)
SELECT *
FROM 
(
    SELECT
    visited_on,
    SUM(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
    ROUND(AVG(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW),2) AS average_amount
FROM date
) AS b
WHERE
    visited_on - 6 >= (
        SELECT 
            MIN(visited_on)
        FROM Customer
    )
