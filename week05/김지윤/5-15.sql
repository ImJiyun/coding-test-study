SELECT
  FORMAT_DATE('%Y-%m', order_date) AS year_month,
  SUM(total_amount) AS order_total,
  COUNT(order_id) AS order_cnt
FROM
  `ecommerce_advanced.orders` AS o
GROUP BY
  year_month
ORDER BY
  year_month