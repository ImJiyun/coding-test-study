-- https://school.programmers.co.kr/learn/courses/30/lessons/284528


WITH grade AS (
SELECT 
    emp_no, 
    AVG(SCORE) AS score
FROM hr_grade
GROUP BY 
    emp_no
)

SELECT
    g.EMP_NO,
    e.EMP_NAME,
    CASE
        WHEN g.score >= 96 THEN 'S'
        WHEN g.score >= 90 THEN 'A'
        WHEN g.score >= 80 THEN 'B'
        ELSE 'C'
    END AS GRADE,
    CASE
        WHEN g.score >= 96 THEN e.SAL * 0.2
        WHEN g.score >= 90 THEN e.SAL * 0.15
        WHEN g.score >= 80 THEN e.SAL * 0.1
        ELSE 0
    END AS BONUS
FROM grade AS g
LEFT JOIN HR_EMPLOYEES AS e
USING (emp_no)
ORDER BY
    emp_no
