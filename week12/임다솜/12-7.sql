-- https://school.programmers.co.kr/learn/courses/30/lessons/301650

WITH base AS (
SELECT
    user_id,
    activity_type,
    ROUND(AVG(activity_duration),2) AS avg_duration
FROM UserActivity
GROUP BY
    user_id,
    activity_type
HAVING
    user_id IN (
        SELECT user_id
        FROM UserActivity
        WHERE
            activity_type = "paid"
    )
)

SELECT
    user_id,
    MAX(IF(activity_type = "free_trial", avg_duration, NULL)) AS trial_avg_duration,
    MAX(IF(activity_type = "paid", avg_duration, NULL)) AS paid_avg_duration
FROM base
GROUP BY
    user_id
ORDER BY
    user_id
    


