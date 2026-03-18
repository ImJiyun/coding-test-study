# 1번째 쿼리 - beats 52.87%
WITH t1 AS (
    SELECT
        customer_id, 
        COUNT(*) AS order_cnt,
        SUM(CASE WHEN transaction_type = 'refund' THEN 1 END) / COUNT(*) AS refund_rate
    FROM
        customer_transactions
    GROUP BY
        customer_id
    HAVING
        order_cnt >= 3 
        AND
        (refund_rate IS NULL OR refund_rate < 0.2)
), rn_date AS(
    SELECT
        *,
        RANK() OVER (PARTITION BY customer_id ORDER BY transaction_date) AS first_date,
        RANK() OVER (PARTITION BY customer_id ORDER BY transaction_date DESC) AS last_date
    FROM
        customer_transactions
), t2 AS (
    SELECT
        customer_id,
        DATEDIFF(MAX(CASE WHEN last_date = 1 THEN transaction_date END), MAX(CASE WHEN first_date = 1 THEN transaction_date END)) AS active_days
    FROM
        rn_date
    WHERE
        first_date = 1 OR last_date = 1
    GROUP BY
        customer_id
    HAVING
        active_days >= 30
)

SELECT
    t1.customer_id
FROM
    t1
JOIN
    t2
ON
    t1.customer_id = t2.customer_id
ORDER BY
    customer_id

# 2번째 쿼리 - beats 42.07%
WITH loyal_cstmrs AS (
    SELECT
        customer_id,
        COUNT(*) AS order_cnt,
        SUM(CASE WHEN transaction_type = 'refund' THEN 1 ELSE 0 END) / COUNT(*) AS refund_rate,
        DATEDIFF(MAX(transaction_date), MIN(transaction_date)) AS active_days
    FROM
        customer_transactions
    GROUP BY
        customer_id
    HAVING
        order_cnt >= 3
        AND
        active_days >= 30
        AND
        refund_rate < 0.2
)

SELECT
    customer_id
FROM
    loyal_cstmrs
ORDER BY
    customer_id