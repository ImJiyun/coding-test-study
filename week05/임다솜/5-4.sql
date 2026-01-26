-- 4. 앱 로그 데이터를 PIVOT하는 쿼리를 작성해보세요
-- event_params의 key : 여러가지가 있음
-- event_parmas의 key의 distinct 값을 찾아서, 피벗을 해주세요
-- 댓글에 있는 쿼리를 참고하셔도 되는데 key에 어떤 것이 있는지 살펴보세요

WITH base AS (
  SELECT
    user_id,
    user_pseudo_id,
    event_date,
    event_name,
    event_timestamp,
    param.key,
    param.value.string_value,
    param.value.int_value
  FROM advanced.app_logs
  CROSS JOIN UNNEST(event_params) AS param
  WHERE event_date = "2022-08-01" # 파티션 설정 꼭 하기!
)
SELECT
  user_id,
  user_pseudo_id,
  event_date,
  event_name,
  event_timestamp,
  MAX(IF(key = "firebase_screen", string_value, null)) AS firebase_screen,
  MAX(IF(key = "session_id", int_value, null)) AS session_id,
  MAX(IF(key = "food_category", string_value, null)) AS food_category,
  MAX(IF(key = "restaurant_id", int_value, null)) AS restaurant_id,
  MAX(IF(key = "food_id", int_value, null)) AS food_id,
  MAX(IF(key = "restaurant_id", int_value, null)) AS restaurant_id,
  MAX(IF(key = "banner_id", string_value, null)) AS banner_id,
  MAX(IF(key = "search_keyword", string_value, null)) AS search_keyword,
  MAX(IF(key = "is_meet_min_order_price", int_value, null)) AS is_meet_min_order_price,
  MAX(IF(key = "payment_type", string_value, null)) AS payment_type,
  MAX(IF(key = "use_recommend_food", string_value, null)) AS use_recommend_food,
FROM base
GROUP BY
  all
