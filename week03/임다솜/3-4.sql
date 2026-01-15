-- https://leetcode.com/problems/consecutive-numbers/?envType=problem-list-v2&envId=database

SELECT
    b.c AS ConsecutiveNums
FROM (SELECT
    IF(IF(LEAD(num) OVER (ORDER BY id) = num, num, NULL) = LAG(num) OVER (ORDER BY id), num, NULL) AS c
FROM Logs
) AS b
WHERE b.c IS NOT NULL
GROUP BY
    b.c