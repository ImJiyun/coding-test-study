# DENSE_RANK : 동일 순위 있을 시 다음 순위 건너 뛰지 않음
SELECT
    score,
    DENSE_RANK() OVER (ORDER BY score DESC) AS rank
FROM 
    Scores