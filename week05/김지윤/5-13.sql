SELECT
  category_id,
  COUNT(oi.quantity) AS product_count,
  SUM(oi.quantity * p.price - discount) AS total_sales
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
  category_id
ORDER BY
  category_id,
  total_sales DESC