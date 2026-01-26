SELECT
  order_date,
  MAX(IF(user_id = 1, amount, 0)) AS user1,
  MAX(IF(user_id = 2, amount, 0)) AS user2,
  MAX(IF(user_id = 3, amount, 0)) AS user3
FROM
  `advanced.orders`
GROUP BY
  order_date
ORDER BY
  order_date