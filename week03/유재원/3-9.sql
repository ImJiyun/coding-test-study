
-- ¿À´ä

SELECT
    o.buyer_id,
    u.join_date,
    CASE
        WHEN EXTRACT(YEAR FROM o.order_date)=2019 THEN COUNT(o.buyer_id)
        ELSE 0
    END
 FROM orders AS o
 LEFT JOIN users AS u
 ON o.buyer_id = u.user_id
 GROUP BY
    o.buyer_id,
    u.join_date,
    o.order_date
