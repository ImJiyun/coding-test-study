
WITH base AS (
  SELECT
    u.city,
    oi.product_id,
    p.product_name,
    SUM(oi.quantity) AS total_quantity
  FROM
    `ecommerce_advanced.users` AS u
  LEFT JOIN
    `ecommerce_advanced.orders` AS o
  ON
    u.user_id = o.user_id
  LEFT JOIN
    `ecommerce_advanced.order_items` AS oi
  ON
    o.order_id = oi.order_id
  LEFT JOIN
    `ecommerce_advanced.products` AS p
  ON
    oi.product_id = p.product_id
  GROUP BY
    ALL
  ORDER BY
    u.city,
    oi.product_id
), add_rank AS (
  SELECT
    *,
    DENSE_RANK() OVER (PARTITION BY city ORDER BY total_quantity DESC) AS rank
  FROM
    base
)

SELECT
  city,
  product_id,
  product_name,
  total_quantity
FROM
  add_rank
WHERE
  rank <= 3