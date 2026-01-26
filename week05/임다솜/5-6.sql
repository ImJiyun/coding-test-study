-- 2. 위 데일리 리텐션 쿼리를 위클리 리텐션으로 변경해보세요

WITH week AS (
  SELECT
    user_pseudo_id,
    DATE_TRUNC(event_date, WEEK) AS event_week
  FROM advanced.app_logs
  WHERE
    event_date BETWEEN '2022-08-01' AND '2022-08-15'
), first AS (
  SELECT
    user_pseudo_id,
    event_week,
    FIRST_VALUE(event_week) OVER(PARTITION BY user_pseudo_id ORDER BY event_week) AS first_week
  FROM week
), diff AS (
  SELECT
    user_pseudo_id,
    event_week,
    first_week,
    DATE_DIFF(event_week, first_week, WEEK) AS diff_week
  FROM first
)
SELECT
  first_week,
  diff_week,
  COUNT(DISTINCT user_pseudo_id) AS retain_user,
FROM diff
GROUP BY
  first_week,
  diff_week
ORDER BY
  first_week,
  diff_week