-- Write your PostgreSQL query statement below
-- 연속하는 숫자는 id를 바꿔주기  
-- 2로 나누었을 때 홀수 : 뒷 자리로
-- 2로 나누었을 때 짝수 : 앞 자리로

WITH changed AS (
    SELECT
        CASE 
            WHEN MOD(id, 2) = 1 AND id != (SELECT MAX(id) FROM Seat) THEN id + 1
            WHEN MOD(id, 2) = 0 THEN id - 1 
            ELSE id
        END AS id,
        student
    FROM 
        Seat
)

SELECT
    *
FROM
    changed
ORDER BY
    id ASC