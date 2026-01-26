-- 1. orders 테이블에서 유저(user_id)별로 주문 금액(amount)의 합계를 PIVOT해주세요. 날짜(order_date)를 행(Row)으로, user_id를 열(Column)으로 만들어야 합니다

SELECT
  order_date,
  SUM(CASE WHEN user_id = 1 THEN amount ELSE 0 END) AS user_1,
  SUM(CASE WHEN user_id = 2 THEN amount ELSE 0 END) AS user_2,
  SUM(CASE wHEN user_id = 3 THEN amount ELSE 0 END) AS user_3
FROM advanced.orders
GROUP BY order_date
ORDER BY order_date;