-- Write your PostgreSQL query statement below
# Monthly Transactions I
# PostgreSQL에서는 DATE_FORMAT이 없다..
# 검색해서 TO_CHAR을 사용하는 방법을 찾았다.
# approved_count : CASE WHEN 사용해서 approved의 개수 세기
# approved_total_amount : CASE WHEN 사용해서 approved인 것만 amount의 총합 구하기
SELECT
    TO_CHAR(trans_date, 'YYYY-MM') AS month,
    country,
    COUNT(*) AS trans_count,
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
FROM
    Transactions 
GROUP BY
    month,
    country