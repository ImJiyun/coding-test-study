-- Write your PostgreSQL query statement below
# Customers Who Bought All Products
# Product 테이블에서 unique한 product_key의 개수 구하기 (서브쿼리)
# customer_id로 group by 후 각 아이디별 product_key의 개수 구하기
# 이 두 값을 비교
SELECT
    customer_id
FROM
    Customer
GROUP BY
    customer_id 
HAVING
    COUNT(DISTINCT product_key) = (
        SELECT
            COUNT(DISTINCT product_key)
        FROM
            Product
    )