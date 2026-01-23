-- 문제 : 가장 많은 친구와 가장 많은 친구 수를 가진 사람들을 찾기 위한 해결책을 작성하세요. 테스트 케이스는 한 사람만이 가장 많은 친구를 가질 수 있도록 생성됩니다.
-- 컬럼 : id, num
-- 테이블 : RequestAccepted

    SELECT
        A.requester_id AS id,
        COUNT(B.accepter_id)+1 AS num
    FROM RequestAccepted A
    LEFT JOIN RequestAccepted B
    ON A.requester_id = B.accepter_id
    GROUP BY
        A.requester_id
    ORDER BY num DESC 
    LIMIT 1