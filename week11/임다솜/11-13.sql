-- https://leetcode.com/problems/find-students-who-improved/

WITH score AS (
SELECT
    student_id,
    subject,
    FIRST_VALUE(score) OVER (partition by student_id, subject order by exam_date) AS first_s,
    LAST_VALUE(score) OVER (partition by student_id, subject order by exam_date) AS last_s
FROM Scores
), base AS (
SELECT
    s.student_id,
    s.subject,
    first_s,
    last_s
FROM Scores AS s
LEFT JOIN score AS b
USING (student_id)
GROUP BY
    s.student_id,
    s.subject,
    first_s,
    last_s
HAVING
    COUNT(DISTINCT exam_date) >= 2
)

SELECT
    student_id,
    subject,
    first_s AS first_score,
    last_s AS latest_score
FROM base
WHERE
    first_s < last_s
ORDER BY
    student_id,
    subject