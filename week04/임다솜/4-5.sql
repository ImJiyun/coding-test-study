-- https://school.programmers.co.kr/learn/courses/30/lessons/164670

WITH base AS (
SELECT
    WRITER_ID,
    COUNT(BOARD_ID) AS cnt
FROM USED_GOODS_BOARD
GROUP BY
    WRITER_ID
HAVING 
    COUNT(BOARD_ID) >= 3
)

SELECT
    b.WRITER_ID AS USER_ID,
    u.NICKNAME,
    CONCAT(u.CITY, ' ', u.STREET_ADDRESS1, ' ', u.STREET_ADDRESS2) AS "전체주소",
    CONCAT(
    SUBSTRING(u.TLNO, 1, 3), '-',
    SUBSTRING(u.TLNO, 4, 4), '-',
    SUBSTRING(u.TLNO, 8, 4)
  ) AS "전화번호"
FROM base AS b
LEFT JOIN USED_GOODS_USER AS u
ON b.WRITER_ID = u.USER_ID
ORDER BY
    USER_ID DESC