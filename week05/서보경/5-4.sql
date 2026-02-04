-- 4. 앱 로그 데이터를 PIVOT하는 쿼리를 작성해보세요
-- event_params의 key : 여러가지가 있음
-- event_parmas의 key의 distinct 값을 찾아서, 피벗을 해주세요
-- 댓글에 있는 쿼리를 참고하셔도 되는데 key에 어떤 것이 있는지 살펴보세요

WITH base AS (
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
  WHERE 
    event_date BETWEEN "2022-08-01" AND "2022-10-08" 
  GROUP BY ALL
)

SELECT * FROM base;