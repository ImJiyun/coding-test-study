-- Window ORDER BY is required for analytic function first_value at [212:64]
WITH base AS (
  SELECT
    DISTINCT 
      user_pseudo_id,
      event_date
  FROM
    `advanced.app_logs`
  WHERE
    event_date BETWEEN '2022-08-01' AND '2022-08-31'
), add_event_week AS (
  SELECT
    user_pseudo_id,
    DATE_TRUNC(event_date, WEEK(MONDAY)) AS event_week
  FROM
    base
), add_first_week AS (
  SELECT
    *,
    MIN(event_week) OVER (PARTITION BY user_pseudo_id) AS first_week
  FROM
    add_event_week
), add_diff AS (
  SELECT
    *,
    DATE_DIFF(event_week, first_week, WEEK) AS diff
  FROM
    add_first_week
), add_retain_user AS (
  SELECT
    first_week,
    diff,
    COUNT(DISTINCT user_pseudo_id) AS retain_user
  FROM
    add_diff
  GROUP BY
    ALL
  ORDER BY
    first_week,
    diff
)

SELECT
  *,
  ROUND(SAFE_DIVIDE(retain_user, FIRST_VALUE(retain_user) OVER (PARTITION BY first_week ORDER BY diff)), 2) AS retention_rate
FROM
  add_retain_user