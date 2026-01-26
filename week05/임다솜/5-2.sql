-- 2. orders 테이블에서 날짜(order_date)별로 유저들의 주문 금액(amount)의 합계를 PIVOT 해주세요. user_id를 행(Row)으로, order_date를 열(Column)으로 만들어야 합니다. `2023-05-01`(백틱) 쓰면 컬럼 이름 가능

SELECT
  user_id,
  SUM(CASE WHEN order_date = "2023-05-01" THEN amount ELSE 0 END) AS `2023-05-01`,
  SUM(CASE WHEN order_date = "2023-05-02" THEN amount ELSE 0 END) AS `2023-05-02`,
  SUM(CASE WHEN order_date = "2023-05-03" THEN amount ELSE 0 END) AS `2023-05-03`,
  SUM(CASE WHEN order_date = "2023-05-04" THEN amount ELSE 0 END) AS `2023-05-04`,
  SUM(CASE WHEN order_date = "2023-05-05" THEN amount ELSE 0 END) AS `2023-05-05`
FROM advanced.orders
GROUP BY
  user_id
ORDER BY
  user_id