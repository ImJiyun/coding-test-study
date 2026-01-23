-- https://leetcode.com/problems/find-emotionally-consistent-users/

-- WITH base AS(
    SELECT
        user_id,
        reaction AS reaction_type,
        COUNT(*) AS cnt
    FROM reactions
    GROUP BY 
        user_id,
        reaction
-- )


-- SELECT
--     user_id,
--     COUNT(DISTINCT content_id) AS content_count,
--     COUNT(DISTINCT reaction) AS reaction_count,
-- FROM reactions
-- GROUP BY
--     user_id