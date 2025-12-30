-- 문제 : 5명 이상의 직속 부하 직원이 있는 관리자를 찾는 솔루션을 작성하세요. 어떤 순서로든 결과 테이블을 반환합니다.
-- 컬럼 : name
-- 테이블 : Employee
SELECT
    name
FROM Employee
WHERE id IN (
    SELECT managerId
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(id) >= 5
)