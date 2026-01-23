# Write your MySQL query statement below
WITH rating_count AS (
    SELECT
        u.user_id,
        u.name,
        COUNT(mr.user_id) AS rate_cnt
    FROM
        Users AS u
    LEFT JOIN 
        MovieRating AS mr
    ON
        u.user_id = mr.user_id
    GROUP BY
        u.user_id,
        u.name
), table1 AS (
    SELECT
        name
    FROM (
        SELECT
            *,
            RANK() OVER (ORDER BY rate_cnt DESC) AS cnt_rank
        FROM
            rating_count
    ) AS t
    WHERE
        cnt_rank = 1
    ORDER BY
        name
    LIMIT 
        1
), movie_rate AS (
    SELECT
        m.movie_id,
        m.title,
        AVG(rating) AS rate
    FROM
        Movies AS m
    LEFT JOIN 
        MovieRating AS mr
    ON
        m.movie_id = mr.movie_id
    WHERE
        DATE_FORMAT(created_at, '%Y-%m') = '2020-02'  
    GROUP BY
        m.movie_id,
        m.title  
), table2 AS (
    SELECT
        title
    FROM (
        SELECT
            *,
            RANK() OVER (ORDER BY rate DESC) AS rate_rank
        FROM
            movie_rate
    ) AS t
    WHERE
        rate_rank = 1
    ORDER BY
        title 
    LIMIT 
        1
)

SELECT
    name AS results
FROM
    table1
UNION ALL
SELECT
    title AS results
FROM
    table2