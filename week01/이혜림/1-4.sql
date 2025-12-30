-- 문제 : 연속된 두 학생마다 좌석 ID를 바꾸는 솔루션을 작성하세요. 학생 수가 홀수인 경우 마지막 학생의 ID는 교환되지 않습니다. id를 기준으로 오름차순으로 정렬된 결과 테이블을 반환합니다.
-- 컬럼 : id, student
-- 테이블 : Seat
-- 정렬 : id기준 오름차순
SELECT
    CASE
        WHEN id % 2 = 1 AND id < (SELECT MAX(id) FROM Seat) THEN id + 1
        WHEN id % 2 = 0 THEN id - 1
        ELSE id
    END AS id,
    student
FROM Seat
ORDER BY id