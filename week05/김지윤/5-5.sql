WITH base AS (
  SELECT
    DISTINCT 
      user_pseudo_id,
      event_date
  FROM
    `advanced.app_logs`
  WHERE
    event_date BETWEEN '2022-08-01' AND '2022-08-31'
), first_date_table AS (
  SELECT
    *,
    MIN(event_date) OVER (PARTITION BY user_pseudo_id) AS first_date
  FROM
    base
  ORDER BY
    user_pseudo_id
), diff_table AS (
  SELECT
    *,
    DATE_DIFF(event_date, first_date, DAY) AS diff
  FROM
    first_date_table
)


SELECT
  first_date,
  diff,
  COUNT(DISTINCT user_pseudo_id) AS retain_user
FROM
  diff_table
GROUP BY
  ALL
ORDER BY
  first_date,
  diff
