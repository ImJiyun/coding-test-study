-- GROUP BY u.user_id → user_id별로 묶어서 중복 제거 효과 포함
-- 따라서 DISTINCT 불필요 
SELECT
  u.user_id,
  COUNT(o.order_id) AS order_count,
  SUM(total_amount) AS total_amount
FROM
  `ecommerce_advanced.users` AS u
LEFT JOIN
  `ecommerce_advanced.orders` AS o
ON
  u.user_id = o.user_id
GROUP BY
  u.user_id
ORDER BY
  u.user_id