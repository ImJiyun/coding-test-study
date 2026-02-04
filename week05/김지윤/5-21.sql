WITH sales_per_month AS (
  SELECT
    FORMAT_DATE('%Y-%m', order_date) AS year_month,
    SUM(total_amount) AS total_sales
  FROM
    `ecommerce_advanced.orders`
  GROUP BY
    year_month 
  ORDER BY
    year_month
), add_prev_sales AS (
  SELECT
    *,
    LAG(total_sales, 1) OVER (ORDER BY year_month) AS prev_sales
  FROM
    sales_per_month
)

SELECT
  year_month,
  total_sales,
  IFNULL(prev_sales, 0) AS prev_sales,
  IFNULL(ROUND((total_sales - prev_sales) / prev_sales * 100, 2), 0) AS growth_rate
FROM
  add_prev_sales