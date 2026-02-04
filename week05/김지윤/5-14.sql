SELECT
  oi.product_id,
  p.product_name,
  SUM(oi.quantity) AS total_quantity
FROM
  `ecommerce_advanced.order_items` AS oi
LEFT JOIN 
  `ecommerce_advanced.products` AS p
ON
  oi.product_id = p.product_id
GROUP BY
  oi.product_id,
  p.product_name
ORDER BY
  total_quantity DESC
LIMIT 
  5