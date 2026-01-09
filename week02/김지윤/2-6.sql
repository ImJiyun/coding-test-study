-- 코드를 입력하세요
-- 각각 FIRST_HALF와 JULY 테이블에서 FLAVOR별로 TOTAL_ORDER를 GROUP BY하여 total_one과 total_half로 저장
-- JOIN을 사용하여 두 테이블을 연결하여 total_one과 total_half를 더한 값을 기준으로 내림차순 정렬
-- LIMIT을 사용하여 상위 3개를 선택
WITH first_total AS (
    SELECT
        FLAVOR,
        SUM(TOTAL_ORDER) AS total_one
    FROM
        FIRST_HALF 
    GROUP BY
        FLAVOR
), half_total AS (
    SELECT
        FLAVOR,
        SUM(TOTAL_ORDER) AS total_half
    FROM
        JULY 
    GROUP BY
        FLAVOR
)

SELECT
    f.FLAVOR
FROM
    first_total AS f
JOIN
    half_total AS h
ON
    f.FLAVOR = h.FLAVOR
ORDER BY
    total_one + total_half DESC
LIMIT 
    3
    