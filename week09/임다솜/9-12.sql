-- https://leetcode.com/problems/movie-rating/

SELECT results FROM(SELECT
    name AS results
FROM MovieRating AS r
LEFT JOIN Users AS u
USING (user_id)
GROUP BY
    r.user_id
ORDER BY
    COUNT(movie_id) DESC,
    name
LIMIT 1) a
UNION ALL
SELECT results FROM(
SELECT
    title AS results
FROM MovieRating AS r
LEFT JOIN Movies AS m
USING (movie_id)
WHERE
    created_at >= '2020-02-01' AND created_at < '2020-03-01'
GROUP BY
    r.movie_id
ORDER BY
    AVG(rating) DESC,
    title
LIMIT 1) b