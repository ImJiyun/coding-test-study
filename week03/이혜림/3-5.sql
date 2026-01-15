-- 문제 : 처음에는 모든 제품의 가격이 10입니다. 2019-08-16일에 모든 제품의 가격을 찾기 위한 해결책을 작성하세요.
-- 컬럼 : product_id, price
-- 테이블 : Products
-- 조건 : change_date = '2019-08-16'

SELECT
    *
    
FROM(
    SELECT
        *,
        LAST_VALUE(change_date) OVER(PARTITION BY product_id ORDER BY change_date) AS last_date
    FROM Products
)
-- GROUP BY product_id
WHERE last_date<='2019-08-16'