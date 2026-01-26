-- 2. 위 데일리 리텐션 쿼리를 위클리 리텐션으로 변경해보세요

WITH base1 AS (
  SELECT
    event_date,
    DATETIME(TIMESTAMP_MICROS(event_timestamp), "Asia/Seoul") AS event_datetime, 
    event_name,
    user_pseudo_id,
    platform,
    MAX(IF(param.key = "firebase_screen", param.value.string_value, NULL)) AS firebase_screen,
    MAX(IF(param.key = "food_id", param.value.int_value, NULL)) AS food_id,
    MAX(IF(param.key = "session_id", param.value.string_value, NULL)) AS session_id,
    MAX(IF(param.key = "is_meet_min_order_price", param.value.int_value, NULL)) AS is_meet_min_order_price,
    MAX(IF(param.key = "banner_id", param.value.int_value, NULL)) AS banner_id,
    MAX(IF(param.key = "restaurant_id", param.value.int_value, NULL)) AS restaurant_id,
    MAX(IF(param.key = "food_category", param.value.string_value, NULL)) AS food_category,
    MAX(IF(param.key = "search_keyword", param.value.string_value, NULL)) AS search_keyword,
    MAX(IF(param.key = "payment_type", param.value.string_value, NULL)) AS payment_type,
    MAX(IF(param.key = "use_recommend_food", param.value.string_value, NULL)) AS use_recommend_food
  FROM advanced.app_logs
  CROSS JOIN UNNEST(event_params) AS param 
  WHERE event_date BETWEEN "2022-08-01" AND "2022-10-08" 
  GROUP BY ALL
), base2 AS (
  SELECT
    *,
    FIRST_VALUE(event_week) OVER(PARTITION BY user_pseudo_id ORDER BY event_week) AS first_week
  FROM (
    SELECT
      DISTINCT
        user_pseudo_id,
        event_date,
        DATE_TRUNC(event_date, WEEK) AS event_week
    FROM base1

  )
), base3 AS (
  SELECT
    first_week,
    week_diff,
    COUNT(DISTINCT user_pseudo_id) AS cnt 
  FROM (
    SELECT
      user_pseudo_id,
      first_week,
      event_date,
      DATE_DIFF(event_date, first_week, WEEK) AS week_diff
    FROM base2
  )
  GROUP BY
    first_week,
    week_diff
  ORDER BY
    first_week, week_diff
)

SELECT
  *
FROM base3
ORDER BY first_week, week_diff