-- 5. 데일리 리텐션 쿼리(N Day 클래식)
WITH user_date AS ( 
  SELECT DISTINCT
    user_pseudo_id,
    event_date
  FROM advanced.app_logs
  WHERE event_date BETWEEN '2022-08-01' AND '2022-08-18'
),
first_table AS ( 
  SELECT
    user_pseudo_id,
    event_date,
    MIN(event_date) OVER (PARTITION BY user_pseudo_id) AS first_date
  FROM user_date
),
diff_table AS (
  SELECT
    user_pseudo_id,
    first_date,
    DATE_DIFF(event_date, first_date, DAY) AS diff
  FROM first_table
)
SELECT
  first_date,
  diff,
  COUNT(DISTINCT user_pseudo_id) AS retain_user
FROM
  diff_table
GROUP BY
  first_date,
  diff
ORDER BY
  first_date