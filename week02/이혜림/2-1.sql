-- 문제 : ID는 이 테이블의 기본 키입니다. 테이블에는 들어오는 거래에 대한 정보가 있습니다. 상태 열은 ["승인됨", "거부됨"] 유형의 열거형입니다.
-- 월별 및 국가별로 SQL 쿼리를 작성하여 거래 수와 총액, 승인된 거래 수와 총액을 찾습니다. 결과 테이블을 순서에 상관없이 반환하세요
-- 컬럼 : 월, 국가, 거래수, 총액, 승인된 거래수, 총액
-- 테이블 : Transactions
-- 그룹 : month, country
SELECT
    TO_CHAR(trans_date, 'YYYY-MM') AS month,
    country,
    COUNT(id) AS trans_count,
    SUM(
        CASE
            WHEN state = 'approved' THEN 1
        ELSE 0
        END
    ) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(
        CASE 
            WHEN state = 'approved' THEN amount
        ELSE 0
        END
    ) AS approved_total_amount 
FROM Transactions
GROUP BY 
    month,
    country
