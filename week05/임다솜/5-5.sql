-- 1. 데일리 리텐션 쿼리(N Day 클래식)
-- # 우리가 뽑을 것 : first_date(언제 처음 접속했는가), diff(몇 일이 지났는가), retain_user(다시 들어온 유저 수)
--   # (1) user | event_date => 구성이 되어야 함
--   # (2) user | event_date | first_date
--   # (3) user | event_date | first_date | diff
--   # (4) first_date, diff, COUNT(DISTINCT user) AS retain_user

WITH base AS (SELECT
  user_pseudo_id,
  event_date,
  MIN(event_date) OVER(PARTITION BY user_pseudo_id) AS first_date,
  DATE_DIFF(event_date, MIN(event_date) OVER(PARTITION BY user_pseudo_id), DAY) AS diff
FROM advanced.app_logs
WHERE
  event_date BETWEEN '2022-08-01' AND '2022-08-15'
)
SELECT
  first_date,
  diff,
  COUNT(DISTINCT user_pseudo_id) AS retain_user,
FROM base
GROUP BY
  first_date,
  diff
ORDER BY
  first_date,
  diff
