# SUBSTRING(STRING, start_point, extract_num) : STRING에서 start_point 위치에서 extract_num만큼 추출 
SELECT
    USER_ID,
    NICKNAME,
    CONCAT(CITY, ' ', STREET_ADDRESS1, ' ', STREET_ADDRESS2) AS '전체주소',
    CONCAT(
        SUBSTRING(TLNO, 1, 3), '-',
        SUBSTRING(TLNO, 4, 4), '-',
        SUBSTRING(TLNO, 8, 4)
    ) AS '전화번호'
FROM
    USED_GOODS_USER 
WHERE
    USER_ID IN (
        SELECT
            WRITER_ID
        FROM
            order_more_than_3
)
ORDER BY
    USER_ID DESC