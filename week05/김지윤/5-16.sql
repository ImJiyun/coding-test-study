SELECT
  u.user_type,
  ROUND(AVG(o.total_amount), 0) AS avg_amount,
  COUNT(o.order_id) AS total_cnt
FROM
  `ecommerce_advanced.users` AS u
LEFT JOIN
  `ecommerce_advanced.orders` AS o
ON
  u.user_id = o.user_id
GROUP BY
  u.user_type