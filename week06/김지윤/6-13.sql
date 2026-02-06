WITH base AS (
    SELECT
        *,
        IF(operation = 'Buy', price * -1, price) AS applied_price
    FROM
        Stocks
)

SELECT
    stock_name,
    SUM(applied_price) AS capital_gain_loss
FROM
    base
GROUP BY
    stock_name