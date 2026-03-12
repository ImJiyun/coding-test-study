With daily AS(
    SELECT
        visited_on, 
        SUM(amount) AS day_amount
    FROM Customer
    GROUP BY visited_on
)