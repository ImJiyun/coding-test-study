# https://school.programmers.co.kr/learn/courses/30/lessons/131118

WITH base AS (
    SELECT
        rest_id,
        ROUND(AVG(REVIEW_SCORE),2) AS avg_review
    FROM rest_review
    GROUP BY
        rest_id
)

SELECT
    i.rest_id,
    i.rest_name,
    i.food_type,
    i.favorites,
    i.address,
    b.avg_review AS score
FROM rest_info AS i
JOIN base as b
USING (rest_id)
WHERE
    i.address LIKE "서울특별시%" OR i.address LIKE "서울시%"
ORDER BY
    b.avg_review DESC,
    i.favorites DESC