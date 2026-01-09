-- 코드를 입력하세요
-- DENSE_RANK() 함수를 사용하여 review_cnt를 기준으로 순위를 매김
-- 서브쿼리를 이용해 가장 리뷰를 많이 남긴 회원의 ID를 찾음
-- WHERE 절을 사용하여 리뷰 테이블과 회원 테이블의 리뷰를 많이 남긴 회원의 ID를 찾음
-- LEFT JOIN을 사용하여 리뷰 테이블과 회원 테이블을 연결
WITH rank_table AS (
    SELECT 
        *,
        DENSE_RANK() OVER (ORDER BY review_cnt DESC) AS review_rank
    FROM (
        SELECT
            MEMBER_ID,
            COUNT(MEMBER_ID) AS review_cnt
        FROM
            REST_REVIEW 
        GROUP BY
            MEMBER_ID
    ) AS tmp
)

SELECT 
    mp.MEMBER_NAME,
    r.REVIEW_TEXT,
    DATE_FORMAT(r.REVIEW_DATE, '%Y-%m-%d') AS REVIEW_DATE
FROM
    MEMBER_PROFILE AS mp
LEFT JOIN 
    REST_REVIEW  AS r
ON 
    mp.MEMBER_ID = r.MEMBER_ID
WHERE
    mp.MEMBER_ID IN (
        SELECT
            MEMBER_ID
        FROM
            rank_table
        WHERE
            review_rank = 1
    )
ORDER BY
    REVIEW_DATE,
    REVIEW_TEXT