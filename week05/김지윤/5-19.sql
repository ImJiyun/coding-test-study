-- COALESCE는 NULL 여부를 기준으로 값을 대체하는 함수
WITH review_per_product AS (
  SELECT
    product_id,
    COUNT(product_id) AS review_cnt,
    ROUND(AVG(rating), 2) AS avg_rating
  FROM
    `ecommerce_advanced.reviews`
  GROUP BY
    product_id
), order_per_product AS (
  SELECT
    product_id,
    COUNT(order_id) AS order_cnt,
    SUM(quantity) AS total_quantity
  FROM
    `ecommerce_advanced.order_items` AS oi
  GROUP BY
    product_id
)

SELECT
  p.product_id,
  p.product_name,
  COALESCE(rpp.avg_rating, 0) AS avg_rating,
  COALESCE(rpp.review_cnt, 0) AS review_cnt,
  COALESCE(opp.order_cnt, 0) AS order_cnt,
  COALESCE(opp.total_quantity, 0) AS total_quantity
FROM
  ecommerce_advanced.products AS p
LEFT JOIN
  review_per_product AS rpp
ON
  p.product_id = rpp.product_id
LEFT JOIN
  order_per_product AS opp
ON
  rpp.product_id = opp.product_id
ORDER BY
  product_id