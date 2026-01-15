-- 문제 : 세 번 이상 연속으로 나타나는 모든 숫자를 찾아보세요. 순서상관없이 반환
-- 컬럼 : ConsecutiveNums 
-- 테이블 : Logs

SELECT DISTINCT 
    num AS ConsecutiveNums
FROM(
    SELECT
        *,
        LEAD(num,1) OVER(ORDER BY id) AS n1,
        LEAD(num,2) OVER(ORDER BY id) AS n2
    FROM Logs
)
WHERE num=n1
    AND num=n2