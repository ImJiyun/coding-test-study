# https://school.programmers.co.kr/learn/courses/30/lessons/131537

SELECT *
FROM (
SELECT 
    sales_date,
    product_id,
    user_id,
    sales_amount
FROM online_sale
WHERE YEAR(sales_date) = 2022 AND MONTH(sales_date) = 3
UNION ALL
SELECT 
    sales_date,
    product_id,
    NULL AS user_id,
    sales_amount
FROM offline_sale
WHERE YEAR(sales_date) = 2022 AND MONTH(sales_date) = 3
) AS n
ORDER BY
    sales_date,
    product_id,
    user_id