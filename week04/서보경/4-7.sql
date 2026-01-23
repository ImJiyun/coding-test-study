##틀림
SELECT 
    user_id, 
    ROUND(MAX(reaction_count) / SUM(reaction_count), 2) AS reaction_ratio
FROM (
    SELECT 
        user_id, 
        reaction, 
        COUNT(*) AS reaction_count
    FROM Reactions
    GROUP BY user_id, reaction
) AS base
GROUP BY user_id
HAVING SUM(reaction_count) >= 5 
   AND ROUND(MAX(reaction_count) / SUM(reaction_count), 2) >= 0.60
ORDER BY reaction_ratio DESC, user_id ASC;
