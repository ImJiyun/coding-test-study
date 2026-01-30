WITH sales_per_month AS (
  SELECT 
    FORMAT_DATE('%Y-%m', o.order_date) AS sales_month, 
    c.category_name AS category_name,
    c.category_id,
    SUM(oi.quantity) AS monthly_sales
  FROM 
    `ecommerce_advanced.order_items` AS oi
  LEFT JOIN 
    `ecommerce_advanced.products` AS p 
  ON 
    oi.product_id = p.product_id
  LEFT JOIN 
    `ecommerce_advanced.categories` AS c 
  ON 
    p.category_id = c.category_id
  LEFT JOIN 
    `ecommerce_advanced.orders` AS o 
  ON 
    oi.order_id = o.order_id
  GROUP BY 
    sales_month, 
    c.category_id, 
    c.category_name
)

SELECT
  *,
  SUM(monthly_sales) OVER (PARTITION BY category_id ORDER BY sales_month) AS cumsum_monthly_sales
FROM
  sales_per_month