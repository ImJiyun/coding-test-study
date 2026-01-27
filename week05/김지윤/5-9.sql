WITH base AS (
  SELECT
    event_date,
    event_name, 
    user_id,
    user_pseudo_id,
    platform,
    params.key,
    params.value.string_value,
    params.value.int_value
  FROM
    `advanced.app_logs`
  CROSS JOIN
    UNNEST(event_params) AS params
  WHERE
    event_date BETWEEN '2022-08-01' AND '2022-08-18'
), add_event_week AS (
  SELECT
    *,
    DATE_TRUNC(event_date, WEEK(MONDAY)) AS event_week
  FROM
    base
  WHERE
    event_name = 'click_payment'
), add_first_week AS (
  SELECT
    DISTINCT 
      user_pseudo_id,
    event_week,
    MIN(event_week) OVER (PARTITION BY user_pseudo_id) AS first_week
  FROM
    add_event_week
), add_diff AS (
  SELECT
    *,
    DATE_DIFF(event_week, first_week, WEEK) AS diff
  FROM
    add_first_week
)

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