-- https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/description/

WITH base AS (
SELECT
    requester_id,
    accepter_id
FROM RequestAccepted
UNION ALL
SELECT
    accepter_id AS requester_id,
    requester_id AS accepter_id
FROM RequestAccepted
)

SELECT
    requester_id AS id,
    COUNT(DISTINCT accepter_id) AS num
FROM base
GROUP BY
    requester_id
ORDER BY
    num DESC
LIMIT 1