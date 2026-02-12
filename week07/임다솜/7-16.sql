-- https://leetcode.com/problems/tree-node/submissions/1916412563/

SELECT
    r.id,
    CASE
        WHEN r.p_id IS NULL THEN "Root"
        WHEN r.c_id > 0 THEN "Inner"
        ELSE "Leaf" END AS type
FROM (SELECT
    t.id, 
    t.p_id,
    COUNT(DISTINCT b.id) AS c_id
FROM Tree AS t
LEFT JOIN Tree AS b
ON t.id = b.p_id
GROUP BY
    t.id,
    t.p_id
) AS r