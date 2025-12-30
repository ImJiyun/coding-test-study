-- Write your PostgreSQL query statement below
-- WITH 구문: 5개 리포트 이상 가진 매니저만 남기기 
-- 
WITH five_reports AS (
    SELECT
        e1.id
    FROM
        Employee AS e1
    LEFT JOIN 
        Employee AS e2
        ON e1.id = e2.managerid
    GROUP BY
        e1.id
    HAVING 
        COUNT(*) >= 5
)

SELECT
    name
FROM
    Employee
WHERE
    id IN (
        SELECT
            *
        FROM
            five_reports
    )
