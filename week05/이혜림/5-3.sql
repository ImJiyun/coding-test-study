-- 3. orders 테이블에서 사용자(user_id)별, 날짜(order_date)별로 주문이 있다면 1, 없다면 0으로 PIVOT 해주세요. 
-- user_id를 행(Row)으로, order_date를 열(Column)로 만들고 주문을 많이 해도 1로 처리합니다
SELECT
  user_id,
  MAX(IF(order_date='2023-05-01',1,0)) AS `2023-05-01`,
  MAX(IF(order_date='2023-05-02',1,0)) AS `2023-05-02`,
  MAX(IF(order_date='2023-05-03',1,0)) AS `2023-05-03`,
  MAX(IF(order_date='2023-05-04',1,0)) AS `2023-05-04`,
  MAX(IF(order_date='2023-05-05',1,0)) AS `2023-05-05`
FROM advanced.orders
GROUP BY user_id
ORDER BY user_id