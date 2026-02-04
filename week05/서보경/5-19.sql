-- ## **8. 제품별 평균 평점과 리뷰 수, 주문 수 조회**
-- - 각 제품의 평균 평점, 리뷰 수, 주문 수, 총 판매량을 조회하는 쿼리를 작성해주세요

WITH base1 AS (
    SELECT
        product_id,
        COUNT(DISTINCT order_id) AS order_cnt,
        SUM(quantity) AS total_quan
    FROM ecommerce_advanced.order_items
    GROUP BY product_id
), base2 AS (
    SELECT
        product_id,
        COUNT(review_id) AS review_cnt,
        AVG(rating) AS avg_rating
    FROM ecommerce_advanced.reviews
    GROUP BY product_id
)

SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    COALESCE(s.order_cnt, 0) AS order_cnt,
    COALESCE(s.total_quan, 0) AS total_quan,
    COALESCE(r.review_cnt, 0) AS review_cnt,
    COALESCE(ROUND(r.avg_rating, 2), 0) AS avg_rating
FROM ecommerce_advanced.products AS p
LEFT JOIN ecommerce_advanced.categories AS c ON p.category_id = c.category_id
LEFT JOIN base1 AS s ON p.product_id = s.product_id
LEFT JOIN base2 AS r ON p.product_id = r.product_id
ORDER BY total_quan DESC, avg_rating DESC;