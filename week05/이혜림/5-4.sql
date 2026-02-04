-- 4. 앱 로그 데이터를 PIVOT하는 쿼리를 작성해보세요
-- event_params의 key : 여러가지가 있음
-- event_parmas의 key의 distinct 값을 찾아서, 피벗을 해주세요
WITH base AS (
  SELECT
    user_id,
    user_pseudo_id,
    event_date,
    event_name,
    DATETIME(TIMESTAMP_MICROS(event_timestamp), "Asia/Seoul") AS event_datetime,
    param.key,
    param.value.string_value,
    param.value.int_value
  FROM advanced.app_logs
  CROSS JOIN UNNEST(event_params) AS param
  WHERE event_date BETWEEN '2022-08-01' AND '2022-08-18'
)
SELECT
  event_datetime,
  event_name,
  user_id,
  user_pseudo_id,
  MAX(IF(key = "firebase_screen", string_value, NULL)) AS firebase_screen,
  MAX(IF(key = "food_id", int_value, NULL)) AS food_id,
  MAX(IF(key = "session_id", string_value, NULL)) AS session_id
FROM base
GROUP BY ALL