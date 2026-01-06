-- 코드를 입력하세요
# 저자 별 카테고리 별 매출액 집계하기
# 조건: 2022년 1월의 도서 판매 데이터
SELECT
    a.AUTHOR_ID,
    a.AUTHOR_NAME,
    b.CATEGORY,
    SUM(b.PRICE * bs.SALES) AS TOTAL_SALES
FROM
    BOOK AS b
LEFT JOIN 
    AUTHOR AS a
    ON b.AUTHOR_ID = a.AUTHOR_ID
LEFT JOIN
    BOOK_SALES AS bs
    ON b.BOOK_ID = bs.BOOK_ID
WHERE
    DATE_FORMAT(SALES_DATE, '%Y-%m') = '2022-01'
GROUP BY 
    a.AUTHOR_ID,
    a.AUTHOR_NAME,
    b.CATEGORY
ORDER BY
    AUTHOR_ID,
    CATEGORY DESC