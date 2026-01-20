--문제 : 2019년 구매자로서 각 사용자, 가입 날짜 및 주문 수를 찾기 위한 솔루션을 작성하세요. 결과 테이블을 순서에 상관없이 반환하세요.
--컬럼 : buyer_id, join_date, orders_in_2019

SELECT
    buyer_id,
    join_date,
    cnt AS orders_in_2019
FROM(
    SELECT
        buyer_id,
        COUNT(*) AS cnt
    FROM Orders
    WHERE order_date>='2019-01-01'
        AND order_date<'2020-01-01'
    GROUP BY 
        buyer_id
) bc
LEFT JOIN Users u
ON bc.buyer_id = u.user_id