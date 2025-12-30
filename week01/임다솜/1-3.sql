-- https://leetcode.com/problems/managers-with-at-least-5-direct-reports/?envType=study-plan-v2&envId=top-sql-50

SELECT
    e.name AS name
FROM (
SELECT
    managerId,
    COUNT(id) AS cnt
FROM Employee
GROUP BY
    managerID
HAVING
    COUNT(id) >= 5
) AS base
LEFT JOIN Employee AS e
ON base.managerId = e.id
WHERE
    e.id IS NOT NULL