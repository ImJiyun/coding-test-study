# union_table : 친구 관계 양방향으로 만들기
    # 1, 2가 친구면 1도 1명, 2도 1명으로 카운트
    # requester_id, accepter_id을 뒤집은 테이블을 UNION ALL로 합치기
# friend_cnts : 사람별 친구 수 집계
    # requester_id를 기준 사용자로 보고 requester_id가 등장한 횟수 카운트
# 최대 친구 수 찾기
    # friend_cnts에서 num이 큰 순으로 순위 매기기
WITH union_table AS (
    SELECT
        *
    FROM
        RequestAccepted
    UNION ALL
    SELECT
        accepter_id,
        requester_id,
        accept_date 
    FROM
        RequestAccepted
), friend_cnts AS (
    SELECT
        requester_id AS id,
        COUNT(requester_id) AS num
    FROM
        union_table
    GROUP BY
        requester_id 
)

SELECT
    id,
    num
FROM (
    SELECT
        *,
        RANK() OVER (ORDER BY num DESC) AS rn
    FROM
        friend_cnts
) AS t
WHERE
    rn = 1