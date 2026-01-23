# Write your MySQL query statement below
# CASE WHEN으로 조건 처리 (Low, Average, Hight)
# 조건에 따라 3가지 경우가 모두 안 나오는 경우 존재 
# categories: 모든 경우 나오는 테이블 만들기 
# categories 테이블과 add_category 테이블 조인
WITH categories AS (
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
), add_category AS (
    SELECT
        *,
        CASE 
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income <= 50000 THEN 'Average Salary'
            ELSE 'High Salary'
        END AS category
    FROM
        Accounts 
)

SELECT
    c.category,
    COUNT(ac.category) AS accounts_count 
FROM
    categories AS c
LEFT JOIN 
    add_category AS ac
ON
    c.category = ac.category
GROUP BY
    c.category
