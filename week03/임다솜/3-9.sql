-- https://leetcode.com/problems/market-analysis-i/

WITH base AS (
SELECT
    buyer_id,
    COUNT(order_id) AS cnt
FROM Orders
WHERE YEAR(order_date) = '2019'
GROUP BY
    buyer_id
)

SELECT
    u.user_id AS buyer_id,
    u.join_date,
    IF(b.cnt IS NULL, 0, b.cnt) AS orders_in_2019
FROM Users AS u
LEFT JOIN base AS b
ON u.user_id = b.buyer_id