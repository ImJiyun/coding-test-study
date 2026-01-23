-- 6. [오랜 기간 보호한 동물(2)](https://school.programmers.co.kr/learn/courses/30/lessons/59411)
-- 문제 : 입양을 간 동물 중(입양일=/=null), 보호기간이 가장 길었던 동물(보호시작일~입양일 차이 큰) 2마리 아이디,이름
-- 컬럼 : ANIMAL_ID, NAME
-- 테이블 : ANIMAL_OUTS, ANIMAL_INS
-- KEY : USING(ANIMAL_ID)  
SELECT
    o.ANIMAL_ID,
    o.NAME
FROM ANIMAL_OUTS o
JOIN ANIMAL_INS i
    USING (ANIMAL_ID)
ORDER BY DATEDIFF(o.DATETIME, i.DATETIME) DESC
LIMIT 2