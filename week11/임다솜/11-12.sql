-- https://leetcode.com/problems/find-loyal-customers/

# Write your MySQL query statement below
WITH purchase AS (
    SELECT
        COUNT(transaction_id) AS cnt_p,
        SUM(transaction_type = 'refund') AS cnt_r,
        customer_id
    FROM
        customer_transactions
    GROUP BY
        customer_id
    HAVING
        cnt_p >= 3
), active AS (
    SELECT
        customer_id,
        cur_trans
    FROM (
        SELECT
            customer_id,
            MAX(transaction_date) AS cur_trans,
            MIN(transaction_date) AS first_trans
        FROM customer_transactions
        GROUP BY 
            customer_id
    ) AS b
    WHERE
        DATEDIFF(cur_trans, first_trans) >= 30
), refund AS (
    SELECT
        cnt_r / NULLIF(cnt_p, 0) * 100 AS refund_rate,
        customer_id
    FROM purchase
)

SELECT
    customer_id
FROM active AS a
LEFT JOIN refund AS r
USING (customer_id)
WHERE refund_rate < 20
ORDER BY
    customer_id
