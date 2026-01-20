# 틀림
SELECT 
    base.id,
    (
        (SELECT COUNT(*) FROM RequestAccepted WHERE requester_id = base.id) +
        (SELECT COUNT(*) FROM RequestAccepted WHERE accepter_id = base.id)
) AS num
FROM (
    SELECT requester_id and accepter_id AS id FROM RequestAccepted
) AS base
ORDER BY num DESC
LIMIT 1;