WITH oi_agg AS (
  SELECT
    product_id,
    SUM(quantity) AS total_quantity,
    SUM(quantity * price_per_unit - discount) AS total_sales
  FROM
    ecommerce_advanced.order_items AS oi
  GROUP BY
    product_id  
), r_agg AS(
  SELECT
    product_id,
    ROUND(AVG(rating), 2) AS avg_rating
  FROM
    ecommerce_advanced.reviews
  GROUP BY
    product_id
)

SELECT
  s.supplier_id,
  s.supplier_name,
  COALESCE(SUM(oi.total_quantity), 0) AS total_quantity,
  COALESCE(SUM(oi.total_sales), 0) AS total_sales
FROM
  ecommerce_advanced.suppliers AS s
LEFT JOIN 
  `ecommerce_advanced.products` AS p
ON
  s.supplier_id = p.supplier_id
LEFT JOIN
  oi_agg AS oi
ON
  p.product_id = oi.product_id
LEFT JOIN
  r_agg AS r
ON
  oi.product_id = r.product_id
GROUP BY
  s.supplier_id,
  s.supplier_name
ORDER BY
  supplier_id