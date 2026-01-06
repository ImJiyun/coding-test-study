-- https://school.programmers.co.kr/learn/courses/30/lessons/144856

SELECT
    r.AUTHOR_ID,
    r.AUTHOR_NAME,
    r.CATEGORY,
    SUM(TOTAL) AS TOTAL_SALES
FROM(
SELECT
    base.AUTHOR_ID,
    base.AUTHOR_NAME,
    base.CATEGORY,
    SUM(bs.SALES) * base.PRICE AS TOTAL,
    base.BOOK_ID
FROM (
SELECT
    a.AUTHOR_ID,
    a.AUTHOR_NAME,
    b.CATEGORY,
    b.BOOK_ID,
    b.PRICE
FROM BOOK AS b
LEFT JOIN AUTHOR AS a
ON b.AUTHOR_ID = a.AUTHOR_ID
) AS base
RIGHT JOIN BOOK_SALES AS bs
ON bs.BOOK_ID = base.BOOK_ID
WHERE
    DATE_FORMAT(bs.SALES_DATE, '%Y-%m') = '2022-01'
GROUP BY
    base.AUTHOR_ID,
    base.AUTHOR_NAME,
    base.CATEGORY,
    base.BOOK_ID
) AS r
GROUP BY
    r.AUTHOR_ID,
    r.AUTHOR_NAME,
    r.CATEGORY
ORDER BY
    r.AUTHOR_ID,
    r.CATEGORY DESC
