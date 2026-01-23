# Write your MySQL query statement below
WITH total_reviews AS (
    SELECT
        user_id ,
        COUNT(user_id) AS total_review_cnts
    FROM
        reactions 
    GROUP BY
        user_id 
), reaction_cnts AS (
    SELECT
        user_id,
        reaction,
        COUNT(reaction) AS total_reaction_cnt
    FROM
        reactions 
    GROUP BY
        user_id,
        reaction
)  

SELECT
    tr.user_id,
    reaction AS dominant_reaction,
    ROUND(total_reaction_cnt/total_review_cnts, 2) AS reaction_ratio 
FROM
    total_reviews AS tr
LEFT JOIN
    reaction_cnts AS rc
ON
    tr.user_id = rc.user_id 
WHERE
    total_review_cnts >= 5
    AND
    ROUND(total_reaction_cnt/total_review_cnts, 2) >= 0.6
ORDER BY
    reaction_ratio DESC,
    tr.user_id 
