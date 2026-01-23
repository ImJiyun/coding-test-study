-- https://leetcode.com/problems/count-salary-categories/

SELECT
    SUM(CASE WHEN lv = "High Salary" THEN 1 ELSE 0 END) AS "High Salary",
    SUM(CASE WHEN lv = "Low Salary" THEN 1 ELSE 0 END) AS "Low Salary",
    SUM(CASE WHEN lv = "Average Salary" THEN 1 ELSE 0 END) AS "Average Salary"
FROM (
SELECT
    account_id,
    CASE   
        WHEN income > 50000 THEN "High Salary"
        WHEN income > 20000 THEN "Average Salary"
        ELSE "Low Salary"
    END AS lv
FROM Accounts
) AS base

SELECT 
    "High Salary" AS category,
    AS accounts_count