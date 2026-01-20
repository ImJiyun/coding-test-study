
-- ¿À´ä

WITH BASE AS(
    SELECT
        requester_id,
        COUNT(requester_id) as cnt_r
       
    FROM RequestAccepted
    GROUP BY
        requester_id
        
)

WITH BASE_2 AS (
    SELECT
        accepter_id,
        count(accepter_id) as cnt_a
    from
SELECT
*
FROM BASE