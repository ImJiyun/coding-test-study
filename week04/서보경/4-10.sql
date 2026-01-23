##틀림
WITH base1 AS (
    SELECT 
        u.name,
        RANK() OVER (ORDER BY COUNT(*) DESC, u.name ASC) as rnk
    FROM MovieRating AS mr
    JOIN Users AS u 
    ON mr.user_id = u.user_id
    GROUP BY u.user_id
)
