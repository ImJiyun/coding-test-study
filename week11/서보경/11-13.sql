SELECT 
    student_id, 
    subject, 
    first_score, 
    latest_score
FROM (
    SELECT 
        student_id, 
        subject,
        FIRST_VALUE(score) OVER (PARTITION BY student_id, subject ORDER BY exam_date ASC) AS first_score,
        FIRST_VALUE(score) OVER (PARTITION BY student_id, subject ORDER BY exam_date DESC) AS latest_score,
        MIN(exam_date) OVER (PARTITION BY student_id, subject) AS first_date,
        MAX(exam_date) OVER (PARTITION BY student_id, subject) AS latest_date,
        ROW_NUMBER() OVER (PARTITION BY student_id, subject ORDER BY exam_date DESC) AS rnk
    FROM Scores
) AS base
WHERE rnk = 1
  AND latest_date > first_date
  AND latest_score > first_score
ORDER BY student_id ASC, subject ASC;