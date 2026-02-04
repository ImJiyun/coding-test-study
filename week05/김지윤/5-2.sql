SELECT
  user_id,
  MAX(IF(order_date = '2023-05-01', amount, 0)) AS `2023-05-01`,
  MAX(IF(order_date = '2023-05-02', amount, 0)) AS `2023-05-02`,
  MAX(IF(order_date = '2023-05-03', amount, 0)) AS `2023-05-03`,
  MAX(IF(order_date = '2023-05-04', amount, 0)) AS `2023-05-04`,
  MAX(IF(order_date = '2023-05-05', amount, 0)) AS `2023-05-05`
FROM  
  `advanced.orders`
GROUP BY
  user_id
ORDER BY
  user_id