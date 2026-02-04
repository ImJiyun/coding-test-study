SELECT
  user_id,
  p.category_id,
  COUNT(o.order_id) AS cnt,
  SUM(oi.quantity * oi.price_per_unit - oi.discount) AS total_sales
FROM
  `ecommerce_advanced.orders` AS o
LEFT JOIN
  `ecommerce_advanced.order_items` AS oi
ON
  o.order_id = oi.order_id
LEFT JOIN
  `ecommerce_advanced.products` AS p
ON
  oi.product_id = p.product_id
GROUP BY
  user_id,
  p.category_id
ORDER BY
  user_id,
  p.category_id