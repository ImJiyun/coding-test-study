# base: 2019년 주문 수만 따로 집계 테이블 만들기
# 최종 출력은 모든 유저 기준으로 해야 함
# 전체 유저에 base를 붙여서 주문 없는 사람을 살리기 (LEFT JOIN)
    # 2019년 주문이 있는 유저는 base가 붙고, 없는 유저는 base 쪽 컬럼이 NULL로 남는다
# NULL 처리로 결과 형태 맞추기 
WITH base AS (
    SELECT
        buyer_id,
        join_date,
        COUNT(user_id) AS orders_in_2019 
    FROM
        Users AS u 
    LEFT JOIN
        Orders AS o
    ON 
        u.user_id = o.buyer_id 
    WHERE
        DATE_FORMAT(order_date, '%Y') = '2019'
    GROUP BY
        buyer_id 
)

SELECT
    IF(buyer_id IS NULL, user_id, buyer_id) AS buyer_id,
    IF(b.join_date IS NULL, t.join_date, b.join_date) AS join_date,
    IF(orders_in_2019 IS NULL, 0, orders_in_2019) AS orders_in_2019  
FROM (
    SELECT
        *
    FROM
        Users
) AS t
LEFT JOIN
    base AS b
ON 
    t.user_id = b.buyer_id