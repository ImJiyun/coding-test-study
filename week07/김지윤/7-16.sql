# t1을 부모로, t2를 자식으로 두기 위해 t1.id = t2.p_id로 연결 
# t2.id : 자식 id
SELECT
    DISTINCT t1.id,
    -- t1.p_id,
    -- t2.id AS c_id,
    CASE 
        WHEN t1.p_id IS NULL THEN 'Root'
        WHEN t1.p_id IS NOT NULL AND t2.id IS NOT NULL THEN 'Inner'
        WHEN t1.p_id IS NOT NULL AND t2.id IS NULL THEN 'Leaf'
    END AS type
FROM
    Tree AS t1
LEFT JOIN
    Tree AS t2
ON 
    t1.id = t2.p_id