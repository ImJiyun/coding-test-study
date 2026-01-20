-- 컬럼 : ID, FISH_NAME, LENGTH
-- 테이블 : FISH_INFO, FISH_NAME_INFO
-- USING KEY : FISH_TYPE
-- 그룹 : FISH_TYPE
-- 조건 : 종류별로 가장 큰 물고기
-- 정렬 : ID 오름차순

SELECT
    ID,
    FISH_NAME,
    LENGTH
FROM (
    SELECT
        *,
        DENSE_RANK() OVER (
            PARTITION BY FISH_TYPE
            ORDER BY LENGTH DESC
        ) AS rk
    FROM FISH_INFO
) FT
JOIN FISH_NAME_INFO FN
USING(FISH_TYPE)
WHERE rk=1
ORDER BY ID